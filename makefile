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

########################
###### Disclaimer ######
########################
##  It compiles your  ##
## thesis but it does ##
##  NOT write it ;-P  ##
########################

MAIN	= mythesis

all: pdf

pdf:
	pdflatex ${MAIN}
	@while ( grep "Rerun to get cross-references" \
			${MAIN}.log > /dev/null ); do \
		echo '** Re-running LaTeX **'; \
		bibtex ${MAIN}; \
		pdflatex ${MAIN}; \
	done
	makeindex ${MAIN}; \
	pdflatex ${MAIN}; \
	rm ${MAIN}.aux
	rm ${MAIN}.bbl
	rm ${MAIN}.blg
	rm ${MAIN}.idx
	rm ${MAIN}.ilg
	rm ${MAIN}.ind
	rm ${MAIN}.lof
	rm ${MAIN}.log
	rm ${MAIN}.lot
	rm ${MAIN}.maf
	rm ${MAIN}.mtc*
	rm ${MAIN}.out
	rm ${MAIN}.toc

log:
	pdflatex ${MAIN}
	@while ( grep "Rerun to get cross-references" \
			${MAIN}.log > /dev/null ); do \
		echo '** Re-running LaTeX **'; \
		bibtex ${MAIN}; \
		pdflatex ${MAIN}; \
	done
	makeindex ${MAIN}; \
	pdflatex ${MAIN}; \

clean:
	rm ${MAIN}.pdf