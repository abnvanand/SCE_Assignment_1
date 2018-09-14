#!/bin/bash

height=(`tput lines`)
width=(`tput cols`)

begin() {
    clear
    # hide_cursor
    echo -ne "\e[?25l"
    # disable echo
    stty -echo
}

move_and_draw() {
    echo -ne "\e[${1};${2}H$3"
}

draw_snake() {
    pos_r=$((height/2))
    pos_c=$((width/2))
    snake_body="* * * * * * * * *"
    move_and_draw ${pos_r} ${pos_c} "$snake_body>"

}

get_keypress() {
    while true; do
        read -s -n 1 key
        case "$key" in
            A)
                tput cuu1
                ;;
            B)
                tput cud1
                ;;
            C)
                tput cuf1
                ;;
            D)
                tput cub1
                ;;
            [qQ]) 
                return
                ;;
       esac
    done
}


end() {
    # enable echo
    stty echo
    # show_cursor
    echo -e "\e[?25h"
}

begin

draw_snake

get_keypress

end

exit 0
