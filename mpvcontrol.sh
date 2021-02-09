#!/bin/sh

MPVCMD="mpv $HOME/music --shuffle --loop-playlist"

SOCK=/tmp/mpvSockets/$(ls /tmp/mpvSockets -1v | tail -n 1)


get_file () {
    MPVFILEPATH=$(echo '{ "command": ["get_property", "path"] }' | socat - "$SOCK" | jq -r ".data")
    basename "$MPVFILEPATH"
}

is_paused () {
    echo '{ "command": ["get_property", "pause"] }' | socat - "$SOCK" | jq -r ".data"
}

toggle_all () {
    for i in $(ls /tmp/mpvSockets/*); do
        echo '{ "command": ["cycle", "pause"] }' | socat - "$i";
    done
}

toggle () {
    MPVCOUNT=$(ps -C mpv h -o pid | wc -l)

    if [ $MPVCOUNT -eq 0 ]; then
        $($MPVCMD);
    else
        echo '{ "command": ["cycle", "pause"] }' | socat - "$SOCK";
    fi
}

next () {
    echo 'playlist-next' | socat - "$SOCK";
}

prev () {
    echo 'playlist-prev' | socat - "$SOCK";
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

    is_paused)
        is_paused
        ;;

    get_file)
        get_file
        ;;
esac
