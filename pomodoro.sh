#!/usr/bin/env bash

function get_pos_int {
    message=$1

    read -p "$message" userinput
    while [[ ! "$userinput" =~ ^[0-9]+$ ]]; do
        read -p "Please input a positive integer: " userinput
    done

    echo $userinput

}

function do_timer {
    duration=$1

    for ((t=$duration; t>-1; t--)); do
        printf "\rTime left: %02d:%02d" $((t/60)) $((t%60))
        sleep 1
    done

}

function notif {
    message=$1
    notify-send "$message"
    paplay /usr/share/sounds/freedesktop/stereo/complete.oga


}

clear

workmins=$(get_pos_int 'Enter work time:')
breakmins=$(get_pos_int 'Enter break time:')

workseconds=$((workmins * 60))
breakseconds=$((breakmins * 60))

clear

while true; do
    echo -e "\033[1;34m    __        _____  ____  _  __\033[0m"
    echo -e "\033[1;34m    \\ \\      / / _ \\|  _ \\| |/ /\033[0m"
    echo -e "\033[1;34m     \\ \\ /\\ / / | | | |_) | ' /\033[0m"
    echo -e "\033[1;34m      \\ V  V /| |_| |  _ <| . \\ \033[0m"
    echo -e "\033[1;34m       \\_/\\_/  \\___/|_| \\_\\_|\\_\\ \033[0m"
    echo


notif 'Work time!'

    do_timer workseconds
    clear
    echo -e "\033[1;34m     ____  ____  _____    _    _  __\033[0m"
    echo -e "\033[1;34m    | __ )|  _ \| ____|  / \  | |/ /\033[0m"
    echo -e "\033[1;34m    |  _ \| |_) |  _|   / _ \ | ' /\033[0m"
    echo -e "\033[1;34m    | |_) |  _ <| |___ / ___ \| . \\ \033[0m"
    echo -e "\033[1;34m    |____/|_| \_\_____/_/   \_\_|\_\\ \033[0m"
    echo

    notif 'Break time!'
    do_timer breakseconds
    clear
    
done


