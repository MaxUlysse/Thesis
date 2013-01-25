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

########################
###### Disclaimer ######
########################
##  It compiles your  ##
## thesis but it does ##
##  NOT write it ;-P  ##
########################

function clean() {
  while [ -n "$1" ] ; do
    name=$1
    rm $name/*.toc 2>/dev/null
    rm $name/*.glo 2>/dev/null
    rm $name/*.mtc* 2>/dev/null
    rm $name/*.dvi 2>/dev/null
    rm $name/*.dvi 2>/dev/null
    rm $name/*.out 2>/dev/null
    rm $name/*.lof 2>/dev/null
    rm $name/*.lot 2>/dev/null
    rm $name/*.aux 2>/dev/null
    rm $name/*.idx 2>/dev/null
    rm $name/*.ilg 2>/dev/null
    rm $name/*.ind 2>/dev/null
    rm $name/*.maf 2>/dev/null
    rm $name/*.*# 2>/dev/null
    rm $name/*.tex~ 2>/dev/null
    rm $name/*.bbl 2>/dev/null
    rm $name/*.brf 2>/dev/null
    rm $name/*.bmt 2>/dev/null
    rm $name/*.blg 2>/dev/null
    rm $name/*~ 2>/dev/null
    rm $name/.*~ 2>/dev/null
    rm core 2>/dev/null
    echo -e '\E[34m' "Directory $name :" '\E[0m' `ls $name`
    shift
  done
}

#Transform your SVG to PDF for inclusion in your thesis
#./SVG2PDF

#Update your bibliography
#(usefull if you use mendeley, useless if you don't)
#./UpdateBibliography

pdflatex mythesis
if [ "`grep undefined mythesis.log`" != "" ]; then
    bibtex mythesis;
    pdflatex mythesis;
fi
makeindex mythesis
pdflatex mythesis
if [ "`grep Rerun mythesis.log`" != "" ]; then
    pdflatex mythesis;
fi

#Remove all the log files
name=`pwd`
clean $name

if [ "`grep Warning mythesis.log | grep -v minitoc`" = "" ]; then
    rm $name/*.log 2>/dev/null
fi

for i in `ls` ; do
    if [ -d "$i" ] ; then clean $i ; fi
done
