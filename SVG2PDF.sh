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

for i in `ls -1 Figures | grep svg`
do
	file=$(echo $i | sed 's/\.svg$//g')
	if [[ -e Figures/$file.pdf ]]; then
		rm Figures/$file.pdf
	fi
	if [[ -e Figures/$file.pdf_tex ]]; then
		rm Figures/$file.pdf_tex
	fi
	inkscape -D -z --file=Figures/$file.svg --export-pdf=Figures/$file.pdf --export-latex
	echo "File : $file"
done;
echo "Done."