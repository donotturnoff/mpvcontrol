# mpvctl

A script for controlling mpv.

Usage: `mpvctl command`

`command` is one of:

 - `toggle`: toggle play/pause for the most recently-opened instance of mpv. If there are no mpv processes running, run the command defined in `$MPVCMD`
 - `toggle_all`: toggle play/pause for all instances of mpv
 - `prev`: go to the previous item in the playlist of the most recently-opened instance of mpv
 - `next`: go to the next item in the playlist of the most recently-opened instance of mpv
 - `get_file`: echo the basename of the file being played by the most-recently opened instance of mpv
 - `is_paused`: echo true if the most-recently opened instance of mpv is paused, false otherwise
 - `play [pattern]`: play the most-recently opened instance of mpv if `pattern` is not specified, else play files in `$MUSICDIR` matching `pattern` and pause the most-recently opened instance of mpv
 - `pause`: pause the most-recently opened instance of mpv
 - `stop`: kill the most recently-opened instance of mpv and remove its socket

## Dependencies

This script depends on https://github.com/wis/mpvSockets for maintaining separate sockets for each instance, the socat utility for performing socket communications, and the jq utility for parsing JSON.
