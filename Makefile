.ONESHELL:
SRC=main
CC=latex
CONV=dvipdf
PMK = $(HOME)/Desktop/workInProgress/networkofgraphs/process/pymake/pymake/zymake.py

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

short_figs:
	cp -v img/corpus/homo_mustach_ilfm.png img/corpus/homo_mustach_immsb.png \
	img/corpus/network1_1.png img/corpus/network2_1.png img/corpus/manufacturing_1.png img/corpus/blogs_1.png \
	img/corpus/network1_dd.png img/corpus/network2_dd.png \
	img/corpus/manufacturing_dd.png img/corpus/blogs_dd.png \
	img/corpus/ilfm_blogs_1.png img/corpus/ilfm_manufacturing_1.png \
	img/corpus/ilfm_network1_1.png img/corpus/ilfm_network2_1.png \
	img/corpus/immsb_blogs_1.png img/corpus/immsb_network1_1.png \
	img/corpus/immsb_network2_1.png \
	img/corpus/immsb_manufacturing_1.png \
	img/corpus/testset_max_20.png \
	img/corpus/roc_network1_20.png  img/corpus/roc_network2_20.png \
	short_version/img/corpus

pnas:
	# _dd
	$(PMK) exec -c generator7 generator4 --script zipf source -m ilfm_cgs -n all -k 10 -w
	$(PMK) exec -c blogs manufacturing   --script zipf model  -m ilfm_cgs -n all -k 10 -w
	# burstiness
	$(PMK) exec PNAS2 -c pnas_short --script gennetwork burstiness local -m ilfm_cgs immsb_cgs -n all  -k 10 --testset-ratio 20 --refdir debug111111 --format _null --epoch 10 -w
	# roc
	$(PMK) exec PNAS2 -c generator7 generator4  --script roc -m ilfm_cgs immsb_cgs -n all  -k 10 --testset-ratio 20 --refdir debug111111 --format _null -w
	# roc_evolution
	$(PMK) exec PNAS2 -c pnas_short --script roc_evolution testset max 100 --repeat 2 3 4 5 6 --testset-ratio $(seq 5 5 95) -w
	# mustach
	$(PMK) exec PNAS2 -c pnas_short --script homo_mustach -m ilfm_cgs immsb_cgs -n all -k 10 --testset-ratio 20 --refdir debug111111 --format _null --epoch 2 -w

pnas_fit:
	$(PMK) exec  PNAS2 --script fit -c pnas_short   --repeat 2 3 4 5 6 --testset-ratio $(seq 5 5 95) -m immsb_cgs -w

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



