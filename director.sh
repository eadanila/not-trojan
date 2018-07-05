#!/bin/bash

# Make rickfiles
TDIR=`mktemp -d`
cd $TDIR

youtube-dl "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -o rickroll &

cp /usr/bin/mpv .

# needs libraries that are not present if it isn't already installed
LIBDIR=/usr/lib/x86_64-linux-gnu
for i in `patchelf --print-needed /usr/bin/mpv`; do
    lib=$LIBDIR/$i
    if [[ -e $lib ]]; then
       cp $lib $TDIR
   fi
done
cp $LIBDIR/libSDL-1.2.so.0 $TDIR

for i in `jobs -p`; do
    wait $i
    if [[ ! $? = 0 ]]; then
        echo "Could not download Astley"
        exit 1
    fi
done

# Set the stage

# 1. Remote download/push payload
# 2. Remote extract payload
# 3. Remote install payload (might just need to extract to correct location)

# Performance:
# 1. Synchronize playback (maybe call script that takes and epoch timestamp)
# 2. Start
