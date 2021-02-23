#!/bin/bash
#PBS -N MACSEv2


JAVA="/usr/bin/java"
MACSE="/home/aglucaci/EvolutionOfNeurotrophins/scripts/macse_v2.05.jar"


#java -jar macse.jar -prog alignSequences -seq TMEM184_Ensembl_small.fasta -local_realign_init 1 -local_realign_dec 1

echo $JAVA -jar $MACSE -prog alignSequences -seq $FASTA -local_realign_init 1 -local_realign_dec 1 -out_NT $FASTA"_codon_macse.fas" -out_AA $FASTA"_AA_macse.fas"
$JAVA -jar $MACSE -prog alignSequences -seq $FASTA -local_realign_init 1 -local_realign_dec 1 -out_NT $FASTA"_codon_macse.fas" -out_AA $FASTA"_AA_macse.fas"





exit 0
