# replace lines not starting with #,{ or } with 4 preceding spaces, and leave the rest as it is
sed -En -e 's/(^[^#{}].*)/    \1/p' -e 's/(^[#{}])/&/p'
