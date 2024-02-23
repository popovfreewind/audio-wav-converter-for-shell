#!/bin/bash

# Loop through all .mp3 files in the 'execute' directory
for initialPath in $(find execute -name "*.mp3"); do
    filename=$(basename -- "$initialPath")
    dirname=$(dirname -- "$initialPath")
    tempPath="$dirname/temp_${filename}"

    # Convert the audio file with specified bitrate, channels, and frequency
    if afconvert -d '.mp3' -b 128000 22050 -c 1 "$initialPath" "$tempPath"; then
        echo "Converted $filename"
        mv "$tempPath" "$initialPath"
    else
        echo "Failed to convert $filename"
    fi
done

echo "All .mp3 files have been converted."
