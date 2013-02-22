objects = article.pdf

all: $(objects)

%.pdf: %.tex
	latexmk $*
	dvipdf $*.dvi
	ls $*.* | grep -v "\.tex\|bib\|bst\|pdf" | xargs rm

clean:
	ls | grep -v "\.tex\|tab\|bib\|bin\|bst\|sty\|eps\|Makefile" | xargs rm
