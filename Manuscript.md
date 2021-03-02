# Evolution of Neurotrophins

`Updated on 3.2.2021`

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




### Figure 2. Genetic Distances among all sequences (Pairwise sequence comparision in the alignment). Heatmap of distances is constructed as a similary matrix. Tamura-Nei 93 (TN93) pairwise genetic distances were calculated in the codon space.

Protein Space
![](https://i.imgur.com/XqgMw3u.png)

Codon Space
![](https://i.imgur.com/NDfzQLL.png)


TN93 - Codon Space
![](https://i.imgur.com/m75yCsQ.png)


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

### Figure 4. (BUSTEDS, gene level)



### Figure 5. (FEL, site level analysis) Inference of dN/dS rate estimates 
![](https://i.imgur.com/4oclYqQ.png)

|  Codon  |       alpha |      beta |       omega |   alpha=beta |     LRT |    p-value |
|---:|------------:|----------:|------------:|-------------:|--------:|-----------:|
|  2 | 8526.83     | 0.0973489 | 1.14168e-05 |     0.193711 | 5.11298 | 0.0237475  |
| 10 |    3.72956  | 0.702814  | 0.188444    |     1.13589  | 3.84647 | 0.0498507  |
| 53 |    3.07337  | 0.556588  | 0.1811      |     1.16213  | 6.72119 | 0.00952739 |
| 54 |    0.383053 | 2.22676   | 5.81318     |     1.50653  | 3.8988  | 0.0483205  |
| 55 |   10.2535   | 1.24611   | 0.12153     |     2.34521  | 9.89461 | 0.00165764 |

*This table only displays the first 5 sites for brevity*




## Methods
### Data Retrieval
Query NCBI via https://www.ncbi.nlm.nih.gov/kis/ortholog/627/?scope=7776
336 full gene transcripts and protein sequences were downloaded.

Table of species included in this analysis: https://github.com/aglucaci/EvolutionOfNeurotrophins/blob/2021/analysis/BDNF_lineages.csv

### Data Cleaning
We use protein sequence and full gene transcripts to derive coding sequences (CDS) (via a custom script). However, this process was met with errors in 17 "PREDICTED" protein sequences which had invalid characters and these sequences were subsequently exempt from analysis. This process removes low-quality protein sequences from analysis which may inflate rates of nonsynonymous change. Original number of sequences 336, errors found in 17 sequences so 319 species will be considered. 

### Alignment
Codon-aware alignment performed via MACSEv2 [ref] with default parameters, see pipeline for invokation.

### Recobmination Detection
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

## Supplementary Material








## Extra
### Figure 5 but omega values above 2 are now set to 2
This shows more of the variability which can be difficult to see on the wider omega range.
![](https://i.imgur.com/4oclYqQ.png)

### Figure 5. (FEL, site level analysis)

FEL omega
![](https://i.imgur.com/lgvEiL4.png)



|  Codon  |       alpha |      beta |       omega |   alpha=beta |     LRT |    p-value |
|---:|------------:|----------:|------------:|-------------:|--------:|-----------:|
|  2 | 8526.83     | 0.0973489 | 1.14168e-05 |     0.193711 | 5.11298 | 0.0237475  |
| 10 |    3.72956  | 0.702814  | 0.188444    |     1.13589  | 3.84647 | 0.0498507  |
| 53 |    3.07337  | 0.556588  | 0.1811      |     1.16213  | 6.72119 | 0.00952739 |
| 54 |    0.383053 | 2.22676   | 5.81318     |     1.50653  | 3.8988  | 0.0483205  |
| 55 |   10.2535   | 1.24611   | 0.12153     |     2.34521  | 9.89461 | 0.00165764 |

*This table only displays the first 5 sites for brevity*

MEME dN
![](https://i.imgur.com/DwQAjll.png)


|  Codon  |    alpha |    beta- |     beta+ |      LRT |     p-value |   MEME_LogL |   FEL_LogL |
|----:|---------:|---------:|----------:|---------:|------------:|------------:|-----------:|
|   4 | 0        | 0        |   50.3432 |  5.84115 | 0.0244611   |    -26.9874 |   -24.1274 |
|  54 | 0.342534 | 0.159822 |    5.5018 |  5.00541 | 0.037597    |    -48.106  |   -47.5525 |
|  62 | 0.84151  | 0        | 3439.43   |  7.72815 | 0.00932452  |    -29.4663 |   -24.8105 |
|  83 | 0.65602  | 0        |   10.3659 |  5.26603 | 0.0328728   |    -29.6231 |   -25.4202 |
| 100 | 1.42737  | 0        |   54.0502 | 17.8319  | 5.64558e-05 |    -99.2736 |   -84.0854 |


*This table only displays the first 5 sites for brevity*
