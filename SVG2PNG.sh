#!/bin/bash
#use ./SVG2PNG
#figures is the folder wher all your figures are

#############################################################
#############################################################
###       Maxime Ulysse Garcia, max@ithake.eu, 2013       ###
###                                                       ###
###          Questions and suggestions WELCOMED!          ###
###                                                       ###
###       This thesis template largely derives from       ###
###            Charles Chapple, Robert Castelo            ###
###          Sergio Mendoza and Sergi Castellano          ###
###             Under GNU/GPL copyleft license            ###
###                                                       ###
###         FEEL FREE TO USE IT AND IMPROVE IT!!!         ###
#############################################################
#############################################################

for i in `ls -1 figures | grep svg`
do
	file=$(echo $i | sed 's/\.svg$//g')
	inkscape figures/$file.svg -e figures/$file.png -y 255 -d 180
	#-y 255 means background opacity is at 255 (between 0 to 255).
	#-d 180 means 180 dpi
	echo "File : $file"
done;
echo "Done."