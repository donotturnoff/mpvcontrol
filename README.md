# mpvcontrol

A script for controlling mpv.

Usage: `mpvcontrol command`

`command` is one of:

 - `toggle`: toggle play/pause for the most recently-opened instance of mpv
 - `toggle_all`: toggle play/pause for all instances of mpv
 - `prev`: go to the previous item in the playlist of the most recently-opened instance of mpv
 - `next`: go to the next item in the playlist of the most recently-opened instance of mpv
 - `get_file`: echo the basename of the file being played by the most-recently opened instance of mpv
 - `is_paused`: echo true if the most-recently opened instance of mpv is paused, false otherwise

If there are no mpv processes running, issuing the toggle command will run the command defined in `$MPVCMD`

## Dependencies

This script depends on https://github.com/wis/mpvSockets for maintaining separate sockets for each instance, the socat utility for performing socket communications, and the jq utility for parsing JSON.
