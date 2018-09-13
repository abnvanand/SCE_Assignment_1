# topper
awk -v max=0 '{total=$3+$4+$5; if(max < total){ max = total;topper = $1;}} END {print topper}' marks.txt

# students scoring above avg
awk -v total=0 -v count=0 \
'NR>1{
    sum=$3+$4+$5;
    total+=sum;
    st[$1]=sum;
    count+=1;
}
END {
    avg = total/count;
    for(s in st) {
        if(st[s]>avg){
            print s
        }
    }
}' marks.txt

