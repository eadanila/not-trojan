#!/bin/bash

# should be good enough for fuckery
# WARNING: do not let this loop; dm-tool will lock over a locked screen!
export XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0
dm-tool lock

