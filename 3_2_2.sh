awk 'BEGIN {mfile="males.txt";ffile="females.txt"}
{
    if ($2 == "M") {
        print > mfile
    }
    else if($2 == "F") {
        print > ffile   
    }
}' marks.txt

