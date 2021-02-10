#!/bin/sh

MPVCMD="mpv $HOME/music --shuffle --loop-playlist"
MUSICPATH="$HOME/music"

PID=$(ls /tmp/mpvSockets -1v | tail -n 1)
SOCK=/tmp/mpvSockets/$PID

stop () {
    kill $PID
    rm $SOCK
}

play () {
    if [ "$#" -eq 0 ] ; then
        echo '{ "command": ["set_property", "pause", false] }' | socat - "$SOCK"
    else
        pause
        find $MUSICPATH/ -iname "*$1*" -exec mpv {} +
    fi
}

pause () {
    echo '{ "command": ["set_property", "pause", true] }' | socat - "$SOCK"
}

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

    echo $MPVCOUNT

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

    play)
        play $2
        ;;

    pause)
        pause
        ;;

    stop)
        stop
        ;;
esac
