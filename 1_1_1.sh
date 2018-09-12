# do we need to ignore case when matching?
grep  "\(India\|Africa\)" /usr/share/dict/words

# or use extended regex to get rid of ugly \'s
#grep -E "(India|Africa)" /usr/share/dict/words

