#!/bin/sh

sock=/tmp/mpvSockets/$(ls /tmp/mpvSockets -1v | tail -n 1)

toggle_all () {
    for i in $(ls /tmp/mpvSockets/*); do
        echo '{ "command": ["cycle", "pause"] }' | socat - "$i";
    done
}

toggle () {
    echo '{ "command": ["cycle", "pause"] }' | socat - "$sock";
}

next () {
    echo 'playlist-next' | socat - "$sock";
}

prev () {
    echo 'playlist-prev' | socat - "$sock";
}

case $1 in
    toggle_all)
        toggle_all
        ;;

    toggle)
        toggle
        ;;

    next)
        next
        ;;

    prev)
        prev
        ;;
esac
