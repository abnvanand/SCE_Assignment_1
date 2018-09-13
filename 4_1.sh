if [ $# != 1 ]
then
    echo "Invalid usage"
    exit 1
fi

if [ ! -e $1 ]
then
    echo "File not found"
    exit 1
fi

if [ ! -s $1 ]
then
    echo "Error empty file."
    exit 1
fi

case $1 in
    *.tar)
        tar xf $1 
        ;;
    *.tar.gz) 
        tar xzf $1
        ;;
    *.tar.bz2)
        tar xjf $1 
        ;;
    *.bz2)
        bunzip2 $1
        ;;
    *.gz) 
        gunzip $1 
        ;;
    *.zip)
        unzip $1   
        ;;
    *)    
        echo "Invalid file $1 "
        ;;
esac
