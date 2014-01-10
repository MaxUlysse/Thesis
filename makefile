#################################################
#################################################
### Maxime Ulysse Garcia, max@ithake.eu, 2013 ###
###                                           ###
###    Questions and suggestions WELCOMED!    ###
###                                           ###
### This thesis template largely derives from ###
###      Charles Chapple, Robert Castelo      ###
###    Sergio Mendoza and Sergi Castellano    ###
###       Under GNU/GPL copyleft license      ###
###                                           ###
###   FEEL FREE TO USE IT AND IMPROVE IT!!!   ###
###                                           ###
#################################################
################## DISCLAIMER  ##################
#################################################
###              It compiles your             ###
###             thesis but it does            ###
###              NOT write it ;-P             ###
#################################################
#################################################

MAIN	= myThesis
LOG		= ${MAIN}.aux ${MAIN}.bbl ${MAIN}.blg ${MAIN}.idx ${MAIN}.ilg ${MAIN}.ind ${MAIN}.lof ${MAIN}.log ${MAIN}.lot ${MAIN}.maf ${MAIN}.mtc* ${MAIN}.out ${MAIN}.toc
PNG		= $(shell  find -type f -iname "*.svg" | sed 's/.svg/.png/g')
VEC		= $(shell  find -type f -iname "*.svg" | sed 's/.svg/.pdf/g')
CONVERT_SVG2PNG = inkscape $< -e $@ -y 255 -d 180
#-y 255 means background opacity is at 255 (between 0 to 255).
#-d 180 means 180 dpi
CONVERT_SVG2PDF = inkscape -D -z --file=$< --export-pdf=$@ --export-latex

all: ${PNG} ${VEC} pdf

pdf: log remove

figures/%.png: figures/%.svg
	$(MSG)
	$(CONVERT_SVG2PNG)

figures/%.pdf: figures/%.svg
	$(MSG)
	$(CONVERT_SVG2PDF)

log:
	pdflatex ${MAIN}
	@while ( grep "Rerun to get cross-references" ${MAIN}.log > /dev/null ); \
	do \
		bibtex ${MAIN}; \
		pdflatex ${MAIN}; \
	done
	makeindex ${MAIN}; \
	pdflatex ${MAIN}
	@while ( grep "Rerun to get outlines " ${MAIN}.log > /dev/null ); \
	do \
		pdflatex ${MAIN}; \
	done

clean:
	rm -f ${MAIN}.pdf ${LOG}

remove:
	rm -f ${LOG}

rebuild:
	clean all