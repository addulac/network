.ONESHELL:
SRC=main
CC=latex
CONV=dvipdf

all: long short

dvi: ${SRC}.tex
	${CONV} ${SRC}.dvi
	${CC} ${SRC}.tex

long:
	cd long_version
	pdflatex ${SRC}.tex
	cd -

short:
	cd short_version
	bibtex *.aux
	pdflatex PNAS-main.tex
	cd -

short_fig:
	cp -v img/corpus/homo_mustach_ilfm.png img/corpus/homo_mustach_immsb.png \
	img/corpus/network1_1.png img/corpus/network4_1.png img/corpus/manufacturing_1.png img/corpus/blogs_1.png \
	img/corpus/network1_dd.png img/corpus/network4_dd.png img/corpus/manufacturing_dd.png img/corpus/blogs_dd.png img/corpus/ilfm_blogs_1.png img/corpus/ilfm_manufacturing_1.png img/corpus/ilfm_network1_1.png img/corpus/ilfm_network4_1.png img/corpus/immsb_blogs_1.png img/corpus/immsb_network1_1.png img/corpus/immsb_network4_1.png img/corpus/immsb_manufacturing_1.png \
	short_version/img/corpus


expe:
	cd long_version
	pdflatex expe_dev.tex
	cd -

pymake:
	# roc evolution
	#echo -e "20\n100" | para --env OMP_NUM_THREADS ./scripts/generate.py roc_evolution testset max {}  PNAS2 -c pnas_short   --repeat 2 3 4 5 6 --testset-ratio 5 10 15 20 25 30 35 40 45 50 55  60 65  70 75  80 85  90 95 -w

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



