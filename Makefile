############################################################# 
#############################################################
###    Maxime U. Garcia, max.u.garcia@gmail.com,  12/2012 ###
###                                                       ###
###          Questions and suggestions WELCOMED!          ###
###                                                       ###  
###       This thesis template largely derives from       ###
###             Charles Chapple, Robert Castelo           ###
###           Sergio Mendoza and Sergi Castellano         ###
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
##   NOT write it ;P  ##
########################

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
./Clean
