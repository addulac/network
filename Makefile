.ONESHELL:
SRC=main
CC=latex
CONV=dvipdf
PMK = ./zymake.py

all: long short

dvi: ${SRC}.tex
	${CONV} ${SRC}.dvi
	${CC} ${SRC}.tex

long:
	cd long_version
	bibtex ${SRC}.aux
	pdflatex ${SRC}.tex
	cd -

dmkd:
	cd long_version
	bibtex dmkd.aux
	pdflatex dmkd.tex
	cd -

short:
	cd PNAS
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
	img/corpus/roc_network1_75.png  img/corpus/roc_network2_75.png \
	PNAS/img/corpus

pnas_figs:
	# adjacency matrix and empirical degree
	cd $(HOME)/Desktop/workInProgress/networkofgraphs/process/pymake/pymake
	$(PMK) exec -c generator7 generator4 --script zipf source -m ilfm_cgs -n all -k 10 -w -np
	$(PMK) exec -c blogs manufacturing   --script zipf model  -m ilfm_cgs -n all -k 10 -w -np
	# burstiness
	$(PMK) exec PNAS2 -c pnas_short --script gennetwork burstiness local -m ilfm_cgs immsb_cgs -n all  -k 10 --testset-ratio 20 --refdir debug111111 --format _null --epoch 10 -w -np
	# roc
	#$(PMK) exec PNAS2 -c generator7 generator4 --script roc -m ilfm_cgs immsb_cgs -n all  -k 10 --testset-ratio 20 --refdir debug111111 --format _null -w -np 
	$(PMK) exec PNAS2 -c generator7 generator4  --script roc testset 20 -m ilfm_cgs immsb_cgs -n all  -k 10 --testset-ratio 75  --repeat 3 -w  -np
	# roc_evolution
	$(PMK) exec PNAS2 -c pnas_short             --script roc_evolution testset max 20 --repeat $(seq 3 1 9) --testset-ratio $(seq 5 5 80) -w -np
	# mustach
	$(PMK) exec PNAS2 -c pnas_short             --script homo_mustach -m ilfm_cgs immsb_cgs -n all -k 10 --testset-ratio 20 --refdir debug111111 --format _null --epoch 2 -w -np
	cd ..

pnas_model:
	$(PMK) exec  PNAS2 --script fit -c pnas_short   --repeat 2 3 4 5 6 --testset-ratio $(seq 5 5 95) -w

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



