


# Remarks

###Max assignement and blockmodel

Pour calculer la "puissance" d'interactions entre deux classe, j'utilise une mesure de la moyenne pondéré de la distribution des degrés locales (les deux classes ne sont pas nécessairement égales.)
 
$wmean = \frac{\sum_i c_i d_i}{\sum_i c_i}$

avec $\{d_i\}_{d_{min}}^{d_{max}}$ et  $c_i$ et  respectivement  le nombre de degree différent observé, et $c_i$ le nombre de fois que le degree $d_i$ est observé, le tout au sein du même couple de classe (ou de la même classe).

C'est finalement, l’espérance du dégrée entre deux classes.

Attention, comme j'essayais de te dire, il faut faire la différence dans mes expé, quand je parle de classe pour cette mesure,  les classe sont en fait issue d'un max_assignement du vecteur de features.
Et j'utilise cela pour représenter le liens (pondéré) qu'il existe entre ces classes.

Lorsque je parle de classe pour la représentation du local preferential attchment (la ou on voit le burstiness en log-log), la je ne fais pas de max-assignement. Chaque noeud est une mixtures de class. Seulement pour visualiser le degree dans le cas du local preferential attchment (une courbe pour chaque couple (kk') ), 

 

