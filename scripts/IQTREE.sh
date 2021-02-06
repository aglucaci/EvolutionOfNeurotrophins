#!/bin/bash
#PBS -N IQTREE


IQTREE="/opt/iqtree/iqtree-1.6.6-Linux/bin/iqtree"

NP=16

#echo $IQTREE -v -s $FASTA -st CODON -nt AUTO -m GTR+I+G -nt $NP
#$IQTREE -v -s $FASTA -st CODON -nt AUTO -m GTR+I+G -nt $NP

echo $IQTREE -s $FASTA -nt $NP -alrt 1000 -bb 1000
$IQTREE -s $FASTA -nt $NP -alrt 1000 -bb 1000
exit 0
