# TODO: Ask should i write only the regex in this file
# or the entire grep command
# what's the input if I write the grep command?
# FIXME: currently uses a custom file for input
cat 1_2_2.txt | grep  -Ewo "^([[:digit:]]{3}\.){3}[[:digit:]]{3}$"
