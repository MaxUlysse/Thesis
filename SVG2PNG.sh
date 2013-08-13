#!/bin/bash

#############################################################
#############################################################
###    Maxime U. Garcia, max.u.garcia@gmail.com,  01/2013 ###
###                                                       ###
###          Questions and suggestions WELCOMED!          ###
###                                                       ###
###       This thesis template largely derives from       ###
###            Charles Chapple, Robert Castelo            ###
###         Sergio Mendoza and Sergi Castellano           ###
###             Under GNU/GPL copyleft license            ###
###                                                       ###
###         FEEL FREE TO USE IT AND IMPROVE IT!!!         ###
#############################################################
#############################################################

#use ./SVG2PNG.sh
#Figures is the folder wher all your figures are

for i in `ls -1 Figures | grep svg`
do
  file=$(echo $i | sed 's/\.svg$//g')
	inkscape Figures/$file.svg -e Figures/$file.png -y 255 -d 180
	#-y 255 means background opacity is at 255 (between 0 to 255).
	#-d 180 means 180 dpi
	echo "File : $file"
done;
echo "Done."
