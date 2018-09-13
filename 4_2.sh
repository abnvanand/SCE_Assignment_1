# TODO: ask can't i use read with flag to hide password being typed
if [ $# != 1 ]
then
    echo "Invalid Usage.";
    echo "Supply password as command-line parameter.";
    exit 1
fi

echo $1
echo ${#1}
if [ ${#1} -lt 8 ]
then
    echo "Minimum length of 8 chars needed."
    exit 1
fi

if [ $(echo $1 | grep -E ".*[0-9].*") ]
then
    if [ $(echo $1 | grep -E ".*[@#$%&*+-=].*") ]
    then
        echo "Strong password."
        exit 0
    else
        echo "Must contain one of @, #, $, %, &, *, +, -, =";
        exit 1
    fi
else
    echo "Must contain atleast one numberic character."
    exit 1
fi
