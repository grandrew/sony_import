#!/bin/bash

VIDEO_OUT_DIR="/media/removable/WD_RED/data/PHOTO"
# with a bash for loop
for f in "$VIDEO_OUT_DIR"/*000000Z*.mov
do echo "file '$f'" >> mylist.txt; done
# or with printf
#printf "file '%s'\n" ./*.wav > mylist.txt
ffmpeg -f concat -safe 0 -i mylist.txt -c copy $VIDEO_OUT_DIR/JOIN.MOV

