#!/bin/bash
#use ./SVG2PDF

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
	echo "File : $file"
	rm -f figures/$file.pdf
	rm -f figures/$file.pdf_tex
	inkscape -D -z --file=figures/$file.svg --export-pdf=figures/$file.pdf --export-latex
done;
echo "Done."
