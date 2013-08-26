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

MAIN = mythesis

all: pdf

pdf: log remove

log:
	pdflatex ${MAIN}
	@while ( grep "Rerun to get cross-references" ${MAIN}.log > /dev/null ); do \
		echo '** Re-running LaTeX **'; \
		bibtex ${MAIN}; \
		pdflatex ${MAIN}; \
	done
	makeindex ${MAIN}; \
	pdflatex ${MAIN}
	@while ( grep "Rerun to get outlines " ${MAIN}.log > /dev/null ); do \
		echo '** Re-running LaTeX **'; \
		pdflatex ${MAIN}; \
	done

clean:
	rm -f ${MAIN}.pdf

remove:
	rm -f \
	${MAIN}.aux \
	${MAIN}.bbl \
	${MAIN}.blg \
	${MAIN}.idx \
	${MAIN}.ilg \
	${MAIN}.ind \
	${MAIN}.lof \
	${MAIN}.log \
	${MAIN}.lot \
	${MAIN}.maf \
	${MAIN}.mtc* \
	${MAIN}.out \
	${MAIN}.toc
