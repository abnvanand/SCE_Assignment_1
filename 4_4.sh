#!/bin/bash

move_all() {
    for file in *
    do
        if [ -f "$file" ]
        then
            dirname=`echo "$file"  | awk '{ match($0, /.*\.(.*)/, grp); print toupper(grp[1])}'`

            if [ "$dirname" = "" ]
            then
                echo "Skipping file: $file"
                continue
            fi

            echo "Moving $file to dir: $dirname"
            mkdir -p ${dirname}
            mv "$file" "$dirname"
        elif [ -d "$file" ]
        then
            echo "Skipping DIR: $file"
        fi
    done
}

move_specific() {
    file_types=("$@")
    for type in ${file_types[*]}
    do
        for file in *.${type}
        do
            if [ -f "$file" ]
            then
                dirname=`echo "${type}" | awk '{print toupper($0)}'`
                echo "Moving $file to dir: $dirname"
                mkdir -p ${dirname}
                mv "$file" "$dirname"
            elif [ -d "$file" ]
            then
                echo "Skipping DIR: $file"
            fi
        done
    done

}

if [ $# -lt 2 ]
then
    echo "Too few arguments: $# supplied; 2 needed"
    echo "Usage : bash 4_4.sh <Source_Directory> <Type_of_Files>"
    exit 1
fi


cd $1
file_types=($2 $3 $4 $5 $6 $7 $8 $9)

if [ $2 = "all" ]
then
    move_all
else
    move_specific "${file_types[*]}"
fi


cd $OLDPWD
