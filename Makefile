objects = article.changes.pdf article.pdf

citeulike = mdb-manuscript-5

previous = d173ad7

all: $(objects)

%.pdf: %.tex article.bib
	latexmk $*
	dvipdf $*.dvi
	ls $*.* | grep -v "\.tex\|.md\|bib\|bst\|pdf" | xargs rm

article.changes.tex: article.tex
	git show $(previous):$< > $<.old
	./bin/latexdiff $<.old $< > $@
	rm $<.old

article.bib:
	curl 'http://www.citeulike.org/bibtex/user/michaelbarton/tag/$(citeulike)?do_username_prefix=0&key_type=0&incl_amazon=0&clean_urls=1&smart_wrap=1&q=' > $@

clean:
	ls | grep -v "\.tex\|\.md\|tab\|bin\|bst\|sty\|eps\|Makefile" | xargs rm
	rm *.changes.*
