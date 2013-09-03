myThesis template
===
How to include SVG pictures in your document :
---
Make your SVG, and then, use  
<code>SVG2PDF.sh</code> to convert your SVG to PDF  
<code>SVG2PDF.sh</code> to convert your SVG to PNG  
And in your file :

Include SVG version of Figure
---
<code>\def\svgwidth{\columnwidth}\input{figures/figure.pdf_tex}</code>

Include png version of Figure
---
<code>\includegraphics[width=\columnwidth]{figures/figure.png}</code>
