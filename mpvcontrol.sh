#!/bin/sh

mpvcmd="mpv $HOME/music --shuffle"

sock=/tmp/mpvSockets/$(ls /tmp/mpvSockets -1v | tail -n 1)

toggle_all () {
    for i in $(ls /tmp/mpvSockets/*); do
        echo '{ "command": ["cycle", "pause"] }' | socat - "$i";
    done
}

toggle () {
    local count=$(ps -C mpv h -o pid | wc -l)
    if [ $count -eq 0 ]; then
        $($mpvcmd)
    else
        echo '{ "command": ["cycle", "pause"] }' | socat - "$sock";
    fi
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
