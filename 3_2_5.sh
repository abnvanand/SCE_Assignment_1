awk -v total=0 -v count=0 -v high=0 \
'
BEGIN {
    print "*** Grade Report for the ABC course ***";
}
NR==2{
    sum=$3+$4+$5;
    high=sum;
    low=sum;
}
NR>1{
    sum=$3+$4+$5;
    $6=sum; 
    if(high<sum)
        high=sum;

    if(low>sum)
        low=sum;

    total+=sum; 
    st[$0]=sum; 
    count+=1; 
} 
END {
    avg = total/count;
    print "Name Gender Mid1 (25%) Mid2 (25%) Endsem (50%) Total Grade"
    for(i in st) {
        if(st[i]>=95) {
            print i,"A";
        }
        else if(st[i]>=90) {
            print i,"A-";
        }
        else if(st[i]>=85) {
            print i,"B";
        }
        else if(st[i]>=80) {
            print i,"B-";
        }
        else if(st[i]>=75) {
            print i,"C";
        }
        else if(st[i]>=70) {
            print i,"C-";
        }
        else if(st[i]>=60) {
            print i,"D";
        }
        else {
            print i,"F";
        }
    }
    print "Total number of students:", count;
    print "Highest marks:", high;
    print "Lowest marks:", low;
    print "Average marks:", avg;
    print "***End of Grade Report ***";
}' marks.txt
