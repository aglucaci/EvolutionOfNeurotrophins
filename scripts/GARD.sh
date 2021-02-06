#!/bin/bash
#PBS -N GARD
#PBS -l walltime=999:00:00
#@ Usage: qsub -V -l nodes=1:ppn=32 -q epyc GARD.sh -v FASTA={CODON_AWARE_MSA}


HYPHYMPI="/home/aglucaci/hyphy-develop/HYPHYMPI"
RES="/home/aglucaci/hyphy-develop/res"
MAFFT="/usr/local/bin/mafft"
GARD="GARD"
NP=32


echo mpirun --np $NP $HYPHYMPI LIBPATH=$RES $GARD --type nucleotide --code Universal --alignment $FASTA --rv GDD
mpirun --np $NP $HYPHYMPI LIBPATH=$RES $GARD --type nucleotide --code Universal --alignment $FASTA --rv GDD

exit 0
