#!/bin/bash

# Loop through all .wav files in the 'execute' directory
for initialPath in $(find execute -name "*.wav"); do
    filename=$(basename -- "$initialPath")  # Extract the file name
    dirname=$(dirname -- "$initialPath")  # Extract the directory name

    # Temporary new path for the converted file
    tempPath="$dirname/temp_${filename}"

    # Convert the audio file to mono with specified quality
    afconvert -f WAVE -d LEI16@22050 -c 1 "$initialPath" "$tempPath"
    
    # Print a conversion message
    echo "Converted $filename"

    # Replace the original file with the converted file
    mv "$tempPath" "$initialPath"
done

echo "All .wav files have been converted."
