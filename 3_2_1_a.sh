# NR > 1 hides Header line
awk 'NR>1{print $1,$2,$5}' marks.txt
