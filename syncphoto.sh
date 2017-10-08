#!/bin/bash

# This does not work for videos as they are always the same name - need to rename the files to their date
#rsync --ignore-existing --progress /media/removable/SD\ Card/PRIVATE/M4ROOT/CLIP/* /media/removable/WD_RED/data/PHOTO/

VIDEO_IN_DIR="/media/removable/SD Card/PRIVATE/M4ROOT/CLIP"
VIDEO_OUT_DIR="/media/removable/WD_RED/data/PHOTO"

for f in "$VIDEO_IN_DIR"/*.MP4
do
    FN=`basename "$f"`
    DATE=`avprobe -loglevel quiet -show_format "$f" | grep creation_time | cut -d"=" -f2 | head -n1`
    echo "COPY $FN -> $DATE"
    rsync --ignore-existing --progress "$f" "$VIDEO_OUT_DIR"/"$DATE.mov"
done

for f in "$VIDEO_OUT_DIR"/*.MP4
do
    FN=`basename "$f"`
    DATE=`avprobe -loglevel quiet -show_format "$f" | grep creation_time | cut -d"=" -f2 | head -n1`
    echo "RENAME $FN -> $DATE"
    mv -n "$f" "$VIDEO_OUT_DIR"/"$DATE.mov"
done

rsync --ignore-existing --progress /media/removable/SD\ Card/DCIM/*/* /media/removable/WD_RED/data/PHOTO/DCIM/

