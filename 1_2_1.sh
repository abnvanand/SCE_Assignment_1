# FIXME: does not count hidden dirs
ls -ald */ | grep ".*"

# this will also count hidden dirs
# FIXME: also counts . and ..
#ls -la | grep  -E "^d"
