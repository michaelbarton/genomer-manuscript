objects = article.pdf

all: $(objects)

%.pdf: %.tex %.bib
	latexmk $*
	dvipdf $*.dvi
	ls $*.* | grep -v "\.tex\|bib\|bst\|pdf" | xargs rm

article.bib:
	curl 'http://www.citeulike.org/bibtex/user/michaelbarton/tag/mdb-manuscript-5?do_username_prefix=0&key_type=0&incl_amazon=0&clean_urls=1&smart_wrap=1&q=' > $@

clean:
	ls | grep -v "\.tex\|tab\|bib\|bin\|bst\|sty\|eps\|Makefile" | xargs rm
