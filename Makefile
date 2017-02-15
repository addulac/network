.ONESHELL:
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
	cd short_version
	bibtex *.aux
	pdflatex PNAS-main.tex
	cd -

expe:
	pdflatex long_version/expe_dev.tex

bib:
	bibtex *.aux

clean:
	find -name "*.dvi" -delete
	find -name "*.log" -delete
	find -name "*.aux" -delete
	find -name "*.toc" -delete
	find -name "*.out" -delete
	find -name "*.bbl" -delete
	find -name "*.blg" -delete
	find -name "*.nav" -delete
	find -name "*.snm" -delete
	find -name "*.vrb" -delete
	find -name "*.fls" -delete
	find -name "*.fls" -delete
	find -name "*.synctex.gz" -delete
	find -name "*.fdb_latexmk" -delete

