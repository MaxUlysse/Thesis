#!/bin/bash

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

#use : ./UpdateBibliography

#If you use Mendeley, your BibTeX synced file is library.bib (with just 1 file for the whole library)
#I don't know what it does for 1 file per collection or 1 file per document, but it should not be to complicated
#I'm sure you can figure something out
#In my case, ../Biblio/library.bib is where my bibTeX file is compared to this thesis template

grep -v "shorttitle = {" ../Biblio/library.bib |
grep -v "mendeley-tags = {" |
grep -v "institution = {" | grep -v "publisher = {" |
grep -v "pages = {" |
grep -v "month = " |
grep -v "doi = {" |
grep -v "pmid = {" |
grep -v "url = {" |
grep -v "file = {" |
grep -v "abstract = {" |
grep -v "keywords = {" |
grep -v "isbn = {" |
grep -v "issn = {" |
grep -v "editor = {" |
grep -v "address = {" |
grep -v "annote = {" > Bibliography/biblio.bib

sed -i 's/\\o /\{\\o\}/g' Bibliography/biblio.bib