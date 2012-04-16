
FILES=grid-100x100pt grid-100x100bp
FILES=$(subst .tex,,$(wildcard *.tex))
PDFS=$(addsuffix .pdf,${FILES})

AUXFILES=*.aux *.fdb_latexmk *.fls *.log

build: $(addsuffix .pdf,${FILES})

clean:
	${RM} ${AUXFILES} ${PDFS}

distclean:
	${RM} ${AUXFILES}

%.pdf: %.tex
	latexmk -pdf $*

