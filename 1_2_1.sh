# FIXME: does not count hidden dirs
ls -l  | grep -c "^d"

# this will count hidden dirs
# FIXME: but also counts . and ..
#ls -la | grep  -c "^d"
