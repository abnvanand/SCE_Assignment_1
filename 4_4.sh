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
    for file in *.${1}
    do
        if [ -f "$file" ]
        then
            dirname=`echo "${1}" | awk '{print toupper($0)}'`
            echo "Moving $file to dir: $dirname"
            mkdir -p ${dirname}
            mv "$file" "$dirname"
        elif [ -d "$file" ]
        then
            echo "Skipping DIR: $file"
        fi
    done
}


cd $1

if [ $2 = "all" ]
then
    move_all
else
    move_specific $2
fi


cd $OLDPWD
