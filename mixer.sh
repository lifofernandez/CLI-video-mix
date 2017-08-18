#!/bin/bash
# mixer -i FRAMES_FOLDER -o MIXED_FOLDER 

while getopts i:o: option
do
 case "${option}"
 in
 i) FRAMES_FOLDER=${OPTARG};;
 o) MIXED_FOLDER=${OPTARG};;
 esac
done


counter=10000 # initialize counter

for f in $FRAMES_FOLDER/A_*.jpg; do # step through frames
	let "counter+=1" # increment counter

	# apply some Imagemagick effects to the 2 images and write a new image
	composite -compose Multiply -gravity center $FRAMES_FOLDER/A_${counter:1}.jpg $FRAMES_FOLDER/B_${counter:1}.jpg $MIXED_FOLDER/AB_${counter:1}.jpg
done

# Use FFMPEG to make frames into a movie again
#ffmpeg -r 30 -i $MIXED_FOLDER/AB_%4d.jpg -qscale 0 -pix_fmt yuv420p ../result/mix.mp4




# RESERVA

# composite -compose Dst_Out -gravity center -alpha Set $FRAMES_FOLDER/A_${counter:1}.jpg $FRAMES_FOLDER/B_${counter:1}.jpg $MIXED_FOLDER/AB_${counter:1}.jpg
