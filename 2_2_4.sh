# first replace punctuations then replace digits
# order of the two expressions is important
sed -e 's/[[:punct:]]/*/g' -e 's/[[:digit:]]/?/g' address-book.csv
