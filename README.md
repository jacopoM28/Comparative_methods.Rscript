README
================

## Set of R scripts useful in philogenetic comparative analyses

> It is necessary to install the following libraries: phytools, geiger
> and ape

  - **Loss.Aquisitions\_range.function.R**

It calculates the number of transition events between a binary character
on the basis of a range of rates in which the probability of
re-acquiring the “complex” character progressively decreases with
respect to the probability of loss it. It allows to consider also a
range of loss rates.

Useful to find the probability treshold value after which there are no
more re-acquisition events.

Since it uses the make.simmap function from the Phytools package it can
also menage a set of trees and/or a user-specified number of
simulations.

**Arguments:**  
1\. **tree** = phylogenetic tree.  
2\. **x** = named vector with character states for each tip of the
tree.  
3\. **Endprob** = maximal improbability of re-aquisition.  
4\. **nsim** = number of simulation makes by make.simmap.  
5\. **interval.prob** = interval for improbabilities.  
6\. **StartProb** = first improbability value.  
7\. **StarRates** = Starting loss rate.  
8\. **EndRates** = Ending loss rate.  
9\. **Interval.rates** = Interval for loss rate.

  - **MultiState\_Sensitivity.R**

It loops the fitDiscrete function from the “geiger” package for a
multi-state character through a set of trees using an ARD model and
summarizing the results.

Usefull to calculates the imapact of topological uncertainty in model
parameters (**transition rates** and **AICc score**)

   - **Branch\_LengthConverter.R**

Script usefull to convert branches of a tree to reflect substitution rates. It requires a reference time tree were branches are proportional to time. 

**MultiState\_Sensitivity.R** and **Loss.Aquisitions\_range.function.R** have been used in :

Giobbe Forni, Jacopo Martelossi, Pablo Valero, Frank H Hennemann, Oskar Conle, Andrea Luchetti, Barbara Mantovani, **Macroevolutionary Analyses Provide New Evidence of Phasmid Wings Evolution as a Reversible Process**, Systematic Biology, 2022;, syac038, [https://doi.org/10.1093/sysbio/syac038](https://academic.oup.com/sysbio/advance-article-abstract/doi/10.1093/sysbio/syac038/6605864)
