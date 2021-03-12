# mpvctl

A script for controlling mpv.

Usage: `mpvctl command [pattern]`

Full documentation at https://donotturnoff.net/projects/mpvctl/

## Dependencies

This script depends on [mpvSockets](https://github.com/wis/mpvSockets) for maintaining separate sockets for each instance, the socat utility for performing socket communications, and [jq](https://stedolan.github.io/jq/) for parsing JSON.
