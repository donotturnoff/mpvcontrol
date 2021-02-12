# mpvctl

A script for controlling mpv.

Usage: `mpvctl command`

`command` is one of:

MR is the most recently-used instance of mpv.

 - `toggle`: toggle play/pause for mR. If there are no mpv processes running, run the command defined in `$MPVCMD`
 - `toggle_all`: toggle play/pause for all instances of mpv
 - `prev`: go to the previous item in the playlist of MR
 - `next`: go to the next item in the playlist of MR
 - `get_file`: echo the basename of the file being played by MR
 - `is_paused`: echo true if MR is paused, false otherwise
 - `play [pattern]`: play MR if `pattern` is not specified, else play files in `$MUSICDIR` matching `pattern` and pause MR
 - `pause`: pause MR
 - `stop`: kill MR and remove its socket

## Dependencies

This script depends on https://github.com/wis/mpvSockets for maintaining separate sockets for each instance, the socat utility for performing socket communications, and the jq utility for parsing JSON.
