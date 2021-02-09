# mpvcontrol

A script for controlling mpv.

Usage: `mpvcontrol command`

`command` is one of:

 - `toggle`: toggle play/pause for the most recently-opened instance of mpv
 - `toggle_all`: toggle play/pause for all instances of mpv
 - `prev`: go to the previous item in the playlist of the most recently-opened instance of mpv
 - `next`: go to the next item in the playlist of the most recently-opened instance of mpv

## Dependencies

This script depends on https://github.com/wis/mpvSockets for maintaining separate sockets for each instance, and the socat utility for performing socket communications.
