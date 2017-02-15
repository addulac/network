
# Purpose
We follow an axiomatic approach of social networks within the probabilistic framework. We focus on two Bayesian models that put different priors over networks. Besides, we study and formalize, in this framework, some fundamental topological properties of social networks and show their connections with the models.

This interest is to understand how hierarchical models works, and to
predict for what type of data a model will be more appropriate than
another and why, depending on formal properties on models. Those
properties are accessible in the data under satistical measures...


# Remarks

### Task for long_version
* Global attachment "probleme" -> non-calculability and configuration
of Z/F feature matrix...

### Max assignement and blockmodel

Pour calculer la "puissance" d'interactions entre deux classe, j'utilise une mesure de la moyenne pondéré de la distribution des degrés locales (les deux classes ne sont pas nécessairement égales.)
 
$wmean = \frac{\sum_i c_i d_i}{\sum_i c_i}$

avec $\{d_i\}_{d_{min}}^{d_{max}}$ et  $c_i$ et  respectivement  le nombre de degree différent observé, et $c_i$ le nombre de fois que le degree $d_i$ est observé, le tout au sein du même couple de classe (ou de la même classe).

C'est finalement, l’espérance du dégrée entre deux classes.

Attention, comme j'essayais de te dire, il faut faire la différence dans mes expé, quand je parle de classe pour cette mesure,  les classe sont en fait issue d'un max_assignement du vecteur de features.
Et j'utilise cela pour représenter le liens (pondéré) qu'il existe entre ces classes.

Lorsque je parle de classe pour la représentation du local preferential attchment (la ou on voit le burstiness en log-log), la je ne fais pas de max-assignement. Chaque noeud est une mixtures de class. Seulement pour visualiser le degree dans le cas du local preferential attchment (une courbe pour chaque couple (kk') ), 

 

