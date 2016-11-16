
# Formal Position to Consolidate in the Near Future


## Probabilistic Theorem

* Weak and strong propertie according to expectation of parameters.
* burstinessdefinition.


## Homophily Genralisation

### Linear algebra theorem
How to ensure homophily F > FWF. Constaint on W to have this property.

* Binary case (ILFM)
* Proportion case (IMMSB)

## General Burstiness Theorem

* Reduction of the burstiness definition
* Weak burstiness for exponential family
* @Todo: On the equivalence of IBP and HDP two noramlization (loose of information and sigmoid trick.)


## Normalization
Under what transformation/Normalization ILFM and MMSB are equivalent


---------------------------------

# Remarks

What I need to clarify the ambiguity between blockmodel (ilfm, MMSB) communitie, structural equivalence and homophily.

* a-mmsb no need of such assumpotion, if instead we can recover the communities from the structural block.


###Max assignement and blockmodel

Pour calculer la "puissance" d'interactions entre deux classe, j'utilise une mesure de la moyenne pondéré de la distribution des degrés locales (les deux classes ne sont pas nécessairement égales.)
 
$wmean = \frac{\sum_i c_i d_i}{\sum_i c_i}$

avec $\{d_i\}_{d_{min}}^{d_{max}}$ et  $c_i$ et  respectivement  le nombre de degree différent observé, et $c_i$ le nombre de fois que le degree $d_i$ est observé, le tout au sein du même couple de classe (ou de la même classe).

C'est finalement, l’espérance du dégrée entre deux classes.

Attention, comme j'essayais de te dire, il faut faire la différence dans mes expé, quand je parle de classe pour cette mesure,  les classe sont en fait issue d'un max_assignement du vecteur de features.
Et j'utilise cela pour représenter le liens (pondéré) qu'il existe entre ces classes.

Lorsque je parle de classe pour la représentation du local preferential attchment (la ou on voit le burstiness en log-log), la je ne fais pas de max-assignement. Chaque noeud est une mixtures de class. Seulement pour visualiser le degree dans le cas du local preferential attchment (une courbe pour chaque couple (kk') ), 

 

