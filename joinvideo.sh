#!/bin/bash
FPS="29.97"
VIDEO_OUT_DIR="/media/removable/WD_RED/data/PHOTO"
# with a bash for loop
echo -n "" > /tmp/mylist.txt;
echo -n "" > /tmp/mylist.skip.txt;
for f in "$VIDEO_OUT_DIR"/*000000Z*.mov
do 
if [ `ffmpeg -i $f 2>&1 | sed -n "s/.*, \(.*\) fp.*/\1/p"` == $FPS ]; then
echo "Adding $f";
echo "file '$f'" >> /tmp/mylist.txt;
else
echo "Skipping $f"
echo "file '$f'" >> /tmp/mylist.skip.txt;
fi; done
# or with printf
#printf "file '%s'\n" ./*.wav > mylist.txt
ffmpeg -f concat -safe 0 -i /tmp/mylist.txt -c copy $VIDEO_OUT_DIR/JOIN.MOV

