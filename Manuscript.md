# Evolution of Neurotrophins

`Updated on 3.9.2021`

## Summary

A comparative molecular sequence evaluation of 319 species with genetic orthologs for Brain Derived Neurotrophin (BDNF) were examined across the taxonomic range for jawed vertebrates (Gnathostomata).

## Results

### Figure 1. Inferred Maximum Likelihood Phylogenetic Tree for 319 genetic sequence for BDNF. Visualized via iTOL. Cladeogram and Tree with branch lengths

**Color key**
-> Blue: Mammalia
-> Orange: Sarcopterygii (lobe-finned fishes)
-> Purple: Teleostei (ray-finned fishe)

![](https://i.imgur.com/jKTFYhN.jpg)

![](https://i.imgur.com/Z4W8hXD.jpg)

TTL Calculation
Branch length distribution

Phylogenetic reconstruction of the BDNF gene, across diverse selection of species (>300 species across n taxonomic orders). Maximum likelihood phylogeny of BDNF sequences from this analysis


### Figure 2. Genetic Distances among all sequences (Pairwise sequence comparision in the alignment). Heatmap of distances is constructed as a similary matrix. Tamura-Nei 93 (TN93) pairwise genetic distances were calculated in the codon space.

Protein Space
![](https://i.imgur.com/XqgMw3u.png)

Codon Space
![](https://i.imgur.com/NDfzQLL.png)


TN93 - Codon Space
![](https://i.imgur.com/m75yCsQ.png)

Differences in sequence alignment (pre vs pro-domain, statistical differences in genetic distance, genomic attributes in GC content across species, branch lengths etc.). How significantly diverged across BDNF sequences between species. (protein-space)


### Figure 3. Evidence for recombination
We did find evidence for recombination in a subset of sequences. The most pronounced event occured in the following sequences (Event 1)

* XM_008584165.1_380-1733
* XM_015114598.2_380-1733
* XM_005578346.2_380-1733
* XM_011964715.1_380-1733
* XM_012031697.1_380-1733
* XM_002821931.2_380-1733
* XM_032166370.1_380-1733
* XM_017948537.3_380-1733
* XM_025358305.1_380-1733
* XM_033205475.1_380-1733
* XM_010374529.2_380-1733
* XM_011936307.1_380-1733
* XM_017858805.1_380-1733
* XM_008003703.2_380-1733
* XM_032283691.1_380-1733
* XM_017538722.1_380-1733
* XM_012452238.1_380-1733
* XM_020286534.1_380-1733
* XM_002755152.4_380-1733
* XM_030333208.1_380-1733
* XM_003781198.1_380-1733

Other events were noted in the following, however, because they did not have at least 3 sequences available, they are left out of subsequent selection analyses (The analyses will not run on <3 sequences.)

* XM_037204438.1_405-1791
* XM_031371313.1_1-380
* XM_026041160.1_671-1320
* XM_010226640.1_671-1320
* XM_023230347.2_384-617

Recombination free alignments were generated. This results in the main alignment now having 319 sequences (recombination free). And a second alignment consisting of 21 species with sequences from Event 1. We will analyse the main alignment and separately the Event 1 alignment in subsequent selection analyses.

The full alignment consists of 1791 nucleotide positions.

They will be refered to as the recombination free main alignment (Main)

and the recombinants from the first recombination event (Event 1)

### Figure 4. (BUSTEDS, gene level)

| Alignment\Parameter | N | Sites | Global Omega | LRT | p-value |
| -------- | -------- | -------- |-------- | -------- |-------- |
| Main     | 319     | 597 | 0.149     | 9.975     |0.0034       |
| Event 1     | 21     | 597 |0.122     | 0.6250     | 0.366       |

![](https://i.imgur.com/sBiT6gx.png)

![](https://i.imgur.com/wHXT1zE.png)



### Figure 5. (FEL, site level analysis) Inference of dN/dS rate estimates 
Main
![](https://i.imgur.com/iZKGhxG.png)

Main, Positive Sites
|  Site   |    alpha |    beta |   alpha=beta |     LRT |   p-value |     omega |
|----:|---------:|--------:|-------------:|--------:|----------:|----------:|
|  34 | 0        | 1.73056 |      1.14873 | 4.27353 | 0.0387103 | inf       |
| 134 | 0.606648 | 2.36183 |      1.88689 | 3.95668 | 0.0466857 |   3.89325 |
| 187 | 0        | 1.28625 |      1.15896 | 5.77227 | 0.016281  | inf       |
Main, Negative Sites, only showing first five sites for brevity, 232 total
|  Site   |    alpha |      beta |   alpha=beta |      LRT |     p-value |     omega |
|----:|---------:|----------:|-------------:|---------:|------------:|----------:|
|  41 |  1.81046 | 0.0972841 |     0.683871 |  7.15214 | 0.00748746  | 0.0537344 |\n
|  43 |  2.42935 | 0.372006  |     0.899683 |  4.75852 | 0.0291537   | 0.15313   |\n
|  45 | 74.341   | 1.11598   |     2.21325  | 11.5957  | 0.000661052 | 0.0150116 |\n
| 128 |  4.22923 | 1.02237   |     1.71537  |  7.5426  | 0.0060257   | 0.24174   |\n
| 180 |  3.65396 | 0.496403  |     0.973044 |  5.80839 | 0.0159499   | 0.135853  |

Event 1
![](https://i.imgur.com/T8AnvRl.png)

Event 1, no positive sites returned

Event 1, negative sites returned, only showing the first five for brevity. 24 were returned in total. **Note:** besides site 129, they all have a beta of 0.

| Site    |    alpha |     beta |   alpha=beta |     LRT |    p-value |     omega |
|----:|---------:|---------:|-------------:|--------:|-----------:|----------:|
| 129 | 12.5707  | 0.945439 |     2.92175  | 4.36859 | 0.0366073  | 0.0752097 |\n
| 240 |  4.9428  | 0        |     0.618239 | 3.98112 | 0.0460129  | 0         |\n
| 280 |  4.91853 | 0        |     0.546246 | 4.22191 | 0.0399053  | 0         |\n
| 314 |  6.07471 | 0        |     1.79518  | 6.77373 | 0.00925094 | 0         |\n
| 315 | 12.8583  | 0        |     3.568    | 9.38812 | 0.00218396 | 0         |
### Figure 5. (MEME, site level analysis) Inference of dN/dS rate estimates 
We find little evidence of adaptive evolution with FEL, so we turn to a more sensitive analysis.

Main
|   # | Site |     alpha |     beta- |       p- |    beta+ |        p+ |     LRT |     p-value | num_branches | MEME_LogL | FEL_LogL |
| ---:| ----:| ---------:| ---------:| --------:| --------:| ---------:| -------:| -----------:| ------------:| ---------:| --------:|
|   1 |   26 |  0.161755 |  0.123455 | 0.983392 |  765.359 | 0.0166084 | 9.36072 |  0.00406614 |            0 |  -25.8914 | -22.2119 |
|   2 |   28 |         0 |         0 | 0.760612 |  6.38989 |  0.239388 | 5.16213 |   0.0346796 |            1 |  -30.4859 | -28.6386 |
|   3 |   34 | 0.0731002 | 0.0391922 | 0.760523 |  9.46854 |  0.239477 | 7.61631 |  0.00987126 |            1 |  -34.2615 | -32.5901 |
|   4 |   39 |   4.25978 |         0 |  0.90773 |  219.758 | 0.0922696 | 5.96379 |   0.0229696 |            0 |  -47.6588 | -42.6318 |
|   5 |   49 | 0.0704958 | 0.0380175 | 0.839385 |  22.0613 |  0.160615 | 5.35347 |   0.0314264 |            0 |   -35.873 | -34.3692 |
|   7 |   91 |  0.628558 |  0.303951 | 0.932209 |  205.003 | 0.0677907 | 29.2336 | 1.83785e-07 |            2 |  -122.008 | -107.524 |
|   8 |   92 |  0.709668 |  0.623679 | 0.764322 |  14.3349 |  0.235678 | 6.44114 |   0.0179871 |            0 |  -122.139 |  -119.75 |
|   9 |   97 |  0.302341 |  0.035981 | 0.832711 |  64.6297 |  0.167289 | 5.61364 |   0.0274918 |            0 |  -92.0292 | -88.0246 |
|  10 |   98 |   0.90578 | 0.0632336 | 0.862902 |  28.2386 |  0.137098 | 8.55769 |  0.00611371 |            0 |  -92.7062 | -86.7974 |
|   6 |   81 |    0.5513 |         0 | 0.908234 |  17.7701 | 0.0917657 | 4.98037 |   0.0380857 |            2 |  -79.1138 |  -68.863 |
|  11 |  100 |  0.503264 |  0.279114 | 0.942441 |  689.446 | 0.0575594 | 12.9678 | 0.000655263 |            0 |  -90.6863 | -82.9598 |
|  12 |  102 | 0.0558658 | 0.0360955 | 0.833407 |  22.7748 |  0.166593 | 5.56265 |   0.0282217 |            1 |  -76.0316 |  -73.356 |
|  13 |  125 |  0.552809 | 0.0270208 | 0.795705 |  11.7654 |  0.204295 | 5.84005 |   0.0244748 |            2 |  -94.2607 | -89.4859 |
|  14 |  126 | 0.0572224 | 0.0406115 | 0.795361 |  55.3515 |  0.204639 | 18.8638 | 3.35915e-05 |            2 |  -125.727 | -117.127 |
|  15 |  127 |   1.58782 |   1.58782 | 0.926015 |  1851.01 | 0.0739853 | 5.52066 |   0.0288373 |            0 |   -119.75 | -117.183 |
|  16 |  128 |   3.76605 |  0.327006 | 0.951837 |  484.612 | 0.0481629 | 8.34118 |  0.00682517 |            0 |  -94.9832 | -88.4232 |
|  17 |  129 |  0.336927 |  0.336927 | 0.885992 |  749.501 |  0.114008 | 19.4909 | 2.45052e-05 |            0 |  -122.696 | -113.181 |
|  18 |  132 |   2.35604 |         0 |  0.81369 |  18.5801 |   0.18631 | 5.34335 |   0.0315905 |            0 |  -99.2216 | -94.8981 |
|  19 |  134 |  0.255333 |  0.255333 | 0.881651 |  69.3742 |  0.118349 | 18.3158 | 4.42546e-05 |            2 |  -104.473 | -97.2943 |
|  20 |  135 |   1.29445 |  0.599529 | 0.880116 |   49.118 |  0.119884 | 5.35249 |   0.0314422 |            1 |   -103.08 | -100.381 |
|  21 |  136 |   1.27383 |  0.310808 | 0.883208 |  57.5919 |  0.116792 | 8.78645 |  0.00544271 |            1 |  -84.5894 | -77.4551 |
|  22 |  142 |   1.42739 |  0.734231 | 0.945094 |  88.1313 | 0.0549065 | 5.55357 |   0.0283536 |            1 |   -92.374 | -89.1927 |
|  23 |  143 |  0.719601 | 0.0748341 | 0.881351 |  41.0882 |  0.118649 | 10.9905 |   0.0017804 |            2 |  -83.7961 | -77.1508 |
|  24 |  145 |   1.71172 |         0 | 0.750942 |  11.5018 |  0.249058 | 5.12458 |   0.0353571 |            1 |  -86.8917 | -83.5688 |
|  25 |  150 |   1.65778 |         0 | 0.916812 |  30.3827 | 0.0831883 |   6.328 |   0.0190594 |            1 |  -38.9506 | -33.3234 |
|  26 |  187 |         0 |         0 | 0.822842 |  15.0537 |  0.177158 | 22.9086 | 4.39778e-06 |           22 |  -242.642 | -220.361 |
|  27 |  199 |         0 |         0 | 0.921627 |  76.6077 | 0.0783731 | 5.03515 |   0.0370248 |            0 |  -22.6223 | -21.4494 |
|  28 |  214 |         0 |         0 | 0.897003 | 0.616839 |  0.102997 | 5.26364 |   0.0329133 |            2 |  -24.5805 | -23.4518 |
|  29 |  354 |   0.38257 |         0 | 0.989733 |  370.876 | 0.0102667 | 10.7409 |  0.00202016 |            0 |  -29.0425 | -22.9415 |
|  30 |  355 |  0.449345 |         0 | 0.982187 |    20.48 | 0.0178128 |  5.3946 |   0.0307684 |            1 |  -25.3093 | -21.4219 |


Event 1
|     |   alpha |   beta- |       p- |   beta+ |       p+ |    LRT |   p-value |   num_branches |   MEME_LogL |   FEL_LogL |
|----:|--------:|--------:|---------:|--------:|---------:|-------:|----------:|---------------:|------------:|-----------:|
| 130 |       0 |       0 | 0.853302 |  63.457 | 0.146698 | 6.5093 | 0.0173706 |              3 |    -21.9007 |   -19.6036 |

### A closer look at the NGF domain

Corresponds to site 468 to 575 in our alignment
FEL/MEME positive sites failed to fall within this area.

FEL Negative sites in this area for Main 
|  #  |   Site |     alpha |      beta |   alpha=beta |       LRT |     p-value |      omega |
|---:|-------:|----------:|----------:|-------------:|----------:|------------:|-----------:|
|  1 |    468 | 1.4683    | 0.0370125 |    0.416971  |  60.1498  | 8.77076e-15 | 0.0252077  |
|  2 |    469 | 1.35294   | 0         |    0.362645  |  64.2769  | 1.11022e-15 | 0          |
|  3 |    470 | 3.05122   | 0         |    0.793955  | 147.019   | 0           | 0          |
|  4 |    471 | 0.672082  | 0         |    0.189614  |  35.5138  | 2.5325e-09  | 0          |
|  5 |    472 | 0.58717   | 0         |    0.0900441 |  22.2017  | 2.45457e-06 | 0          |
|  6 |    473 | 0.671018  | 0         |    0.254039  |  35.7535  | 2.23924e-09 | 0          |
|  7 |    474 | 4.59521   | 0         |    0.44023   | 142.146   | 0           | 0          |
|  8 |    475 | 2.23286   | 0         |    0.542227  |  99.464   | 0           | 0          |
|  9 |    476 | 1.35294   | 0         |    0.255424  |  65.1007  | 6.66134e-16 | 0          |
| 10 |    477 | 0.0927779 | 0         |    0.0135239 |   3.90107 | 0.0482553   | 0          |
| 11 |    478 | 0.526846  | 0.0149764 |    0.109466  |  20.8965  | 4.84776e-06 | 0.0284265  |
| 12 |    479 | 1.27444   | 0.0692717 |    0.365324  |  44.6253  | 2.3859e-11  | 0.0543547  |
| 13 |    480 | 4.56722   | 0         |    0.419939  | 137.196   | 0           | 0          |
| 14 |    481 | 0.875004  | 0.0555052 |    0.173521  |  18.3203  | 1.8671e-05  | 0.0634342  |
| 15 |    483 | 1.35294   | 0         |    0.31259   |  55.4814  | 9.4369e-14  | 0          |
| 16 |    484 | 2.18314   | 0         |    0.567256  | 108.606   | 0           | 0          |
| 17 |    485 | 1.73111   | 0         |    0.458437  |  89.4829  | 0           | 0          |
| 18 |    486 | 1.69111   | 0.0936624 |    0.521881  |  57.8406  | 2.84217e-14 | 0.0553851  |
| 19 |    487 | 1.25506   | 0.118636  |    0.299427  |  26.0262  | 3.3682e-07  | 0.0945264  |
| 20 |    488 | 0.497179  | 0         |    0.111794  |  23.6792  | 1.13803e-06 | 0          |
| 21 |    489 | 0.294264  | 0         |    0.0449957 |  11.161   | 0.00083533  | 0          |
| 22 |    490 | 1.10526   | 0         |    0.329165  |  60.9799  | 5.77316e-15 | 0          |
| 23 |    491 | 0.943664  | 0.017771  |    0.293253  |  45.662   | 1.40525e-11 | 0.0188319  |
| 24 |    492 | 0.322277  | 0.018927  |    0.0946596 |  10.0843  | 0.00149542  | 0.0587289  |
| 25 |    493 | 0.293079  | 0         |    0.0406705 |  11.7529  | 0.000607469 | 0          |
| 26 |    495 | 2.91693   | 0.0195794 |    0.748449  | 121.19    | 0           | 0.00671235 |
| 27 |    496 | 1.35294   | 0         |    0.329536  |  62.7782  | 2.33147e-15 | 0          |
| 28 |    497 | 1.55792   | 0.0564591 |    0.371707  |  49.8169  | 1.68787e-12 | 0.0362401  |
| 29 |    498 | 2.24526   | 0.0545426 |    0.573518  |  85.6901  | 0           | 0.0242923  |
| 30 |    499 | 0.739912  | 0         |    0.225322  |  39.1267  | 3.97173e-10 | 0          |
| 31 |    500 | 2.0544    | 0.0547258 |    0.56193   |  79.8728  | 0           | 0.0266383  |
| 32 |    501 | 0.524583  | 0         |    0.160222  |  27.9857  | 1.22218e-07 | 0          |
| 33 |    502 | 1.62804   | 0.0402516 |    0.509713  |  65.2949  | 6.66134e-16 | 0.0247239  |
| 34 |    503 | 1.85714   | 0         |    0.338476  |  75.6144  | 0           | 0          |
| 35 |    504 | 1.96296   | 0         |    0.323357  |  75.58    | 0           | 0          |
| 36 |    505 | 0.610115  | 0.0192199 |    0.199841  |  26.0488  | 3.32892e-07 | 0.031502   |
| 37 |    506 | 1.63436   | 0.0164177 |    0.460828  |  81.4746  | 0           | 0.0100453  |
| 38 |    507 | 1.35294   | 0         |    0.355366  |  62.2247  | 3.10862e-15 | 0          |
| 39 |    508 | 1.25487   | 0.190954  |    0.473546  |  27.0294  | 2.00385e-07 | 0.152171   |
| 40 |    509 | 0.800274  | 0.0173994 |    0.17975   |  30.4306  | 3.46031e-08 | 0.0217418  |
| 41 |    510 | 0.287363  | 0         |    0.0883685 |  16.4054  | 5.11381e-05 | 0          |
| 42 |    511 | 1.35294   | 0         |    0.276538  |  54.284   | 1.73528e-13 | 0          |
| 43 |    512 | 0.215667  | 0         |    0.0924799 |  11.7477  | 0.000609182 | 0          |
| 44 |    513 | 0.300803  | 0         |    0.0451394 |  11.2875  | 0.000780299 | 0          |
| 45 |    514 | 0.621874  | 0         |    0.137197  |  26.8366  | 2.21407e-07 | 0          |
| 46 |    515 | 0.675354  | 0         |    0.11744   |  23.9776  | 9.74638e-07 | 0          |
| 47 |    516 | 0.148805  | 0         |    0.0253714 |   7.02891 | 0.00802041  | 0          |
| 48 |    517 | 2.51828   | 0         |    0.417373  |  83.8247  | 0           | 0          |
| 49 |    519 | 0.0927779 | 0         |    0.0249738 |   4.61552 | 0.0316839   | 0          |
| 50 |    520 | 0.510956  | 0.0360756 |    0.12979   |  13.8524  | 0.000197747 | 0.0706041  |
| 51 |    521 | 0.605505  | 0         |    0.0813138 |  23.6852  | 1.13453e-06 | 0          |
| 52 |    522 | 0.616957  | 0.0485951 |    0.136485  |  14.5627  | 0.000135571 | 0.0787659  |
| 53 |    523 | 0.873852  | 0.0692561 |    0.286504  |  29.4951  | 5.60575e-08 | 0.0792538  |
| 54 |    524 | 2.931     | 0.170733  |    0.308716  |  29.1187  | 6.80782e-08 | 0.0582508  |
| 55 |    525 | 1.01154   | 0         |    0.295894  |  55.0743  | 1.16018e-13 | 0          |
| 56 |    526 | 0.572788  | 0.0403327 |    0.133137  |  12.4295  | 0.000422595 | 0.0704148  |
| 57 |    527 | 2.25059   | 0.0360041 |    0.594403  |  95.2355  | 0           | 0.0159976  |
| 58 |    528 | 0.63564   | 0.0357556 |    0.133595  |  15.9245  | 6.59198e-05 | 0.0562513  |
| 59 |    529 | 1.7249    | 0.19835   |    0.391125  |  24.4319  | 7.69849e-07 | 0.114992   |
| 60 |    530 | 0.956466  | 0.0555505 |    0.315311  |  34.9183  | 3.43833e-09 | 0.0580788  |
| 61 |    531 | 0.50745   | 0         |    0.0677883 |  19.8247  | 8.48776e-06 | 0          |
| 62 |    532 | 1.75862   | 0         |    0.434189  |  87.8365  | 0           | 0          |
| 63 |    533 | 0.357816  | 0         |    0.110289  |  19.8699  | 8.28962e-06 | 0          |
| 64 |    534 | 0.529313  | 0         |    0.076082  |  23.2027  | 1.45794e-06 | 0          |
| 65 |    536 | 1.35294   | 0         |    0.19871   |  49.0664  | 2.47435e-12 | 0          |
| 66 |    537 | 0.432881  | 0.0528124 |    0.146711  |  11.0491  | 0.000887308 | 0.122002   |
| 67 |    538 | 2.75357   | 0.0473198 |    0.389632  |  81.6587  | 0           | 0.0171849  |
| 68 |    539 | 0.97289   | 0.0403751 |    0.111611  |  13.0581  | 0.000301976 | 0.0415002  |
| 69 |    540 | 1.58536   | 0.0159977 |    0.223004  |  50.0213  | 1.52089e-12 | 0.0100909  |
| 70 |    541 | 1.35294   | 0         |    0.358598  |  66.6795  | 3.33067e-16 | 0          |
| 71 |    542 | 1.00173   | 0         |    0.1767    |  37.5923  | 8.71874e-10 | 0          |
| 72 |    543 | 0.702343  | 0         |    0.0949889 |  27.6001  | 1.49174e-07 | 0          |
| 73 |    545 | 0.0927779 | 0         |    0.0356412 |   6.33878 | 0.0118126   | 0          |
| 74 |    546 | 0.392851  | 0.036294  |    0.140314  |  12.8993  | 0.000328711 | 0.0923861  |
| 75 |    547 | 0.796293  | 0         |    0.1292    |  28.4758  | 9.48784e-08 | 0          |
| 76 |    548 | 0.893394  | 0         |    0.267918  |  47.2714  | 6.18083e-12 | 0          |
| 77 |    549 | 6.25489   | 0.0407657 |    0.676369  | 127.165   | 0           | 0.00651741 |
| 78 |    550 | 0.529313  | 0         |    0.151529  |  27.1849  | 1.84901e-07 | 0          |
| 79 |    551 | 0.495767  | 0         |    0.201805  |  26.7279  | 2.34213e-07 | 0          |
| 80 |    552 | 1.35294   | 0         |    0.334734  |  64.5055  | 9.99201e-16 | 0          |
| 81 |    553 | 1.31576   | 0.0563887 |    0.415288  |  49.4864  | 1.99751e-12 | 0.0428565  |
| 82 |    554 | 0.374837  | 0         |    0.113475  |  21.275   | 3.97878e-06 | 0          |
| 83 |    557 | 1.89932   | 0.122216  |    0.323808  |  38.6662  | 5.02851e-10 | 0.0643474  |
| 84 |    558 | 0.369514  | 0.0354962 |    0.111525  |   9.69867 | 0.00184401  | 0.0960619  |
| 85 |    559 | 0.833024  | 0.054893  |    0.180777  |  18.4223  | 1.76976e-05 | 0.065896   |
| 86 |    560 | 1.66282   | 0.0362856 |    0.389245  |  60.9917  | 5.77316e-15 | 0.0218217  |
| 87 |    561 | 0.898587  | 0.0923569 |    0.324281  |  26.3561  | 2.83927e-07 | 0.10278    |
| 88 |    562 | 0.527623  | 0.0374953 |    0.182383  |  18.9461  | 1.34465e-05 | 0.0710647  |
| 89 |    564 | 1.35294   | 0         |    0.449822  |  72.1418  | 0           | 0          |
| 90 |    565 | 0.945446  | 0         |    0.1649    |  44.51    | 2.53064e-11 | 0          |
| 91 |    566 | 0.623239  | 0         |    0.0891851 |  27.0657  | 1.96657e-07 | 0          |
| 92 |    567 | 0.89956   | 0         |    0.201681  |  44.1408  | 3.05588e-11 | 0          |
| 93 |    570 | 0.169178  | 0         |    0.0590615 |  10.5002  | 0.0011936   | 0          |
| 94 |    571 | 1.35294   | 0         |    0.338504  |  61.9138  | 3.55271e-15 | 0          |
| 95 |    572 | 0.229253  | 0         |    0.0497017 |  12.2097  | 0.000475409 | 0          |
| 96 |    573 | 0.434904  | 0         |    0.151531  |  25.1573  | 5.28405e-07 | 0          |
| 97 |    574 | 0.19493   | 0         |    0.0381511 |   9.75054 | 0.0017927   | 0          |
| 98 |    575 | 0.21287   | 0         |    0.0720341 |  12.9564  | 0.000318832 | 0          |


FEL Negative sites in this area for Event 1
|  #  |   Site |    alpha |   beta |   alpha=beta |      LRT |     p-value |   omega |
|---:|-------:|---------:|-------:|-------------:|---------:|------------:|--------:|
|  1 |    470 |  3.8868  |      0 |     1.2806   |  4.39173 | 0.0361137   |       0 |
|  2 |    474 |  4.9428  |      0 |     0.546279 |  4.22377 | 0.0398614   |       0 |
|  3 |    480 | 20.2048  |      0 |     1.71581  | 13.6398  | 0.000221442 |       0 |
|  4 |    483 |  5.16321 |      0 |     1.53914  |  5.81029 | 0.0159326   |       0 |
|  5 |    484 | 11.7536  |      0 |     2.51621  | 10.0125  | 0.00155482  |       0 |
|  6 |    485 |  5.24063 |      0 |     1.27113  |  5.13438 | 0.0234565   |       0 |
|  7 |    487 |  9.85713 |      0 |     1.27435  |  7.83053 | 0.00513711  |       0 |
|  8 |    500 |  4.31365 |      0 |     1.19137  |  4.64326 | 0.0311757   |       0 |
|  9 |    507 |  3.68557 |      0 |     1.15132  |  4.21369 | 0.040099    |       0 |
| 10 |    508 |  5.20006 |      0 |     1.60807  |  4.1805  | 0.0408915   |       0 |
| 11 |    527 |  3.14997 |      0 |     1.10545  |  3.99338 | 0.0456794   |       0 |
| 12 |    528 |  3.9162  |      0 |     0.696912 |  3.98954 | 0.0457837   |       0 |
| 13 |    542 |  8.65167 |      0 |     2.01006  |  6.37964 | 0.0115437   |       0 |
| 14 |    547 |  8.05973 |      0 |     1.76675  |  5.73587 | 0.0166218   |       0 |
| 15 |    549 | 17.7234  |      0 |     1.67296  |  7.23815 | 0.00713705  |       0 |
| 16 |    553 |  4.33289 |      0 |     1.5105   |  4.10905 | 0.0426543   |       0 |



## Methods
### Data Retrieval
Query NCBI via https://www.ncbi.nlm.nih.gov/kis/ortholog/627/?scope=7776
336 full gene transcripts and protein sequences were downloaded.

Table of species included in this analysis: https://github.com/aglucaci/EvolutionOfNeurotrophins/blob/2021/analysis/BDNF_lineages.csv

### Data Cleaning
We use protein sequence and full gene transcripts to derive coding sequences (CDS) (via a custom script). However, this process was met with errors in 17 "PREDICTED" protein sequences which had invalid characters and these sequences were subsequently exempt from analysis. This process removes low-quality protein sequences from analysis which may inflate rates of nonsynonymous change. Original number of sequences 336, errors found in 17 sequences so 319 species will be considered. 

### Alignment
Codon-aware alignment performed via MACSEv2 [ref] with default parameters, see pipeline for invokation.

### Recombination Detection
Manually tested via RDPv5.5 [ref] with modified settings as follows:

* Recombination events where 'accepted' in cases more than 2 methods agreed.
* Slightly modified default parameters
    * Sequences are linear
    * List events detected by >2 methods
* Alignment was save as a distributed alignment (with recombinant regions separated).
* This single fasta was separated into two files the first a recombination free file with 319 sequences (with recombinanted regions separated out) and a second recombinbation files with 21 sequences with these removed sequences from Event 1.


### Phylogenetic Tree Construction
In all cases, maximum likelihood phylogenetic tree was constructed via IQ-TREE [ref], see pipeline for invokation.

### Phylogenetic Tree Visualization
https://itol.embl.de/ [ref]

Link to shared tree: https://itol.embl.de/tree/173687017153241614097877

### Similar matrix heatmap
Constructed in R via RStudio Cloud
Project link: https://rstudio.cloud/project/2230943

### Software availability
All software used is available via a dedicated github repository at: https://github.com/aglucaci/EvolutionOfNeurotrophins

Processing BUSTEDS jsons via https://colab.research.google.com/drive/1BXoup4TEMFT8AwFG_VdZIOF6RadM41bj

### NGF Annotation
Human BDNF
https://www.ncbi.nlm.nih.gov/protein/767966315
region is 215..322 in the reference
in our alignment this correspondes to a region between site 468 and 575.

### Tables generated
Are all available at: https://github.com/aglucaci/EvolutionOfNeurotrophins/tree/master/analysis/CSVs

### Mapping Human sites to the alignment columns

https://colab.research.google.com/drive/1SanrGHfpAknXLjKP9-Ix1xjUMRunWJzE#scrollTo=rv_UqFIJoy0R


## Discussion

This indicates that within species, unique evolutionary pressures and changes within the BDNF gene have evolved across time. Of interest, humans were not one of the consensus sequences to indicate significant selection pressure within their lineage.

Of note, BDNF elicits tight regulation and specific functionality that can be separated from these other neurotrophins, yet these growth factors remain closely related in their structure and sequence.


Limitations

This analysis focused on gnathostomata (jawed vertebrates), not invertebrates (clade exclusion, other BDNF gene or BDNF-like analogue gene may be in other claves, but not explored). Evolutionary temporality is also important in this context. 
Species exhibiting high recombination were not included because ______________


Future Directions
 We hypothesize that the similarities between neurotrophins reflects positive evolutionary selection for motifs and domains which support common functionality between neurotrophic factors between sites and lineages. While we note significant isotropy in mature peptide sequences for these factors, anisotropic pressures likely influenced the prodomain sequences of neurotrophins leading to alterations in processing, trafficking, regulation, and secretion. As such, we also predict differences in the evolutionary fate of neurotrophins which compartmentalize functionality, namely due to alterations within the prodomain of NGF, NT-3, NT-4, and BDNF. 



## References
1. https://journals.sagepub.com/doi/10.1177/1073858418810142


## Supplementary Material







## To discuss, 
* Species specific regulatory regions/capacity of this gene.
* Overwhelming negative selection in NGF domain.