#!/bin/sh
set -e

if [ "${1: -4}" == ".mkv" ]; then
  filename="${1%.*}"
  echo "Found mkv file, starting convertation"
  ffmpeg -y -i "$1" -map 0:v -map 0:a -map 0:s -c copy -c:s mov_text -strict unofficial "$filename.mp4"
  echo "Done"
else
  echo "No MKV file found"
fi
