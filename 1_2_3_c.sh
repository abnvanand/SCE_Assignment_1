#ifconfig | grep -o -w -i -E "[0-9a-f]{2}(-|:)[0-9a-f]{2}(-|:)[0-9a-f]{2}(-|:)[0-9a-f]{2}(-|:)[0-9a-f]{2}(-|:)[0-9a-f]{2}"
# we can have grouping inside grouping
ifconfig |grep -o -w -i -E "([0-9a-f]{2}(-|:)){5}[0-9a-f]{2}"
