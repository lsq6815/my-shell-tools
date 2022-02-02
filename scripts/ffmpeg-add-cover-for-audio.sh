#!/usr/bin/bash
########################################################
# Usage: ffmpeg-add-cover-for-audio.sh <audio> <image> #
########################################################

extension=${1##*.}
stem=${1%.*}

ffmpeg \
    -i "$1" \
    -i "$2" \
    -map 0:a -map 1 -c copy \
    -metadata:s:v title="Album cover" -metadata:s:v comment="Cover (front)" \
    -disposition:v attached_pic \
    "${stem}.covered.${extension}"

