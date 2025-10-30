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
    sound=$2
    printf "$message"
    notify-send "$message"
    paplay "$sound"

}


PING_SOUND=~/default_ping.wav
if [ ! -f "$PING_SOUND" ]; then
    curl -L -o "$PING_SOUND" 'https://github.com/srsxnsh/pomodoro/blob/main/sounds/default_ping.mp3'
fi



workmins=$(get_pos_int 'Enter work time:')
breakmins=$(get_pos_int 'Enter break time:')

workseconds=$((workmins * 60))
breakseconds=$((breakmins * 60))

while true; do
    do_timer workseconds
    notif 'Break time!' PING_SOUND
    do_timer breakseconds
    notif 'Work time!' PING_SOUND
done


