SRC=main
TEST=test
CC=latex
CONV=dvipdf

all: pdf

dvi: ${SRC}.tex
	${CONV} ${SRC}.dvi
	${CC} ${SRC}.tex

bib: pdf
	bibtex ${SRC}
	pdflatex ${SRC}.tex
	pdflatex ${SRC}.tex

pdf:
	pdflatex ${SRC}.tex

dev:
	pdflatex expe_dev.tex

test:
	${CC} ${TEST}.tex
	${CONV} ${TEST}.dvi; 


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
	rm -f *.fdb_latexmk

