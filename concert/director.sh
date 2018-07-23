#/bin/bash

# It's showtime

TARGETS=$1

# Make rickfiles
TDIR=`mktemp -d`
cd $TDIR

copy_libs() {
    echo "Finding $1... "
    lib=`find / -name $1 2>/dev/null | head -n1`
    cp $lib $TDIR/lib
}

# Download in background
youtube-dl "https://www.youtube.com/watch?v=dQw4w9WgXcQ" -o rickroll &

cp /usr/bin/mpv .

# Needs libraries that are not present if mpv isn't already installed
# fuck it fetch all the libs
LIBDIR=/usr/lib/x86_64-linux-gnu
mkdir $TDIR/lib
for i in `patchelf --print-needed $TDIR/mpv`; do
    copy_libs $i
done
cp $LIBDIR/libSDL-1.2.so.0 $TDIR/lib

# Check if 
for i in `jobs -p`; do
    wait $i
    if [[ ! $? = 0 ]]; then
        echo "Could not download Astley"
        exit 1
    fi
done

# Distribute materials


# 1. Remote download/push payload
# 2. Remote extract payload
# 3. Remote install payload (might just need to extract to correct location)

# Performance:
# 1. Synchronize playback (maybe call script that takes and epoch timestamp)
# 2. Start
