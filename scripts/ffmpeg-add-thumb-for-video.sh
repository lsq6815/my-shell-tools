#!/usr/bin/bash
########################################################
# Usage: ffmpeg-add-thumb-for-video.sh <video> <image> #
########################################################

extension=${1##*.}
stem=${1%.*}

ffmpeg \
    -i "$1" \
    -i "$2" \
    -map 1 -map 0 -c copy \
    -disposition:0 attached_pic \
    "${stem}.thumbed.${extension}"
    
