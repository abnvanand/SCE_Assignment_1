awk '
BEGIN {
    print "[";
} 
{
    printf("\t{\n");
    
    match($1, /[[:digit:]]*/);
    printf("\t\"ID\" : \"%s\" ,\n", substr($1, RSTART, RLENGTH));
    
    match($0, /[[:digit:]]*.(.*)\(/, grp);
    printf("\t\"Name\" : \"%s\" , \n", grp[1]);
    
    match($0, /\(([[:digit:]]*)\)/, grp);
    printf("\t\" Year \" : \"%s\" , \n", grp[1]);
    
    match($0, /([[:digit:]])\.([[:digit:]])/, grp);
    printf("\t\" Rating \" : \"%s . %s\"  \n", grp[1],grp[2]);
}
NR<250 {
    printf("\t},\n");
}
NR==250 {
    printf("\t}\n");
}

END {
    print "]"
}' imdb-top-250.txt > imdb-top-250.json
