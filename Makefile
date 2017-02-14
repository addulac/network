SRC=main
CC=latex
CONV=dvipdf

all: long short

dvi: ${SRC}.tex
	${CONV} ${SRC}.dvi
	${CC} ${SRC}.tex

long:
	pdflatex long_version/${SRC}.tex

short:
	pdflatex short_version/${SRC}.tex

_bib:
	bibtex ${SRC}
bib: _bib long short

clean:
	rm -f *.dvi
	rm -f *.log
	rm -f *.aux
	rm -f *.toc
	rm -f *.out
	rm -f *.bbl
	rm -f *.blg
	rm -f *.nav
	rm -f *.snm
	rm -f *.vrb
	rm -f *.fls
	rm -f *.fls
	rm -f *.synctex.gz
	rm -f *.fdb_latexmk

