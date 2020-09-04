#!/bin/bash
#clear

#Requires
# HyPhy, installed via conda version 2.5.8

#Installers
#git clone https://github.com/veg/hyphy-analyses.git


# Version 1
#python codons.py BDNF_refseq_protein.fasta BDNF_refseq_transcript.fasta BDNF_codons.fasta

# Aligning via hyphy
#hyphy hyphy-analyses/codon-msa/pre-msa.bf --input BDNF_codons.fasta
#mafft --auto BDNF_codons.fasta_protein.fas > BDNF_codons.fasta_protein.msa
#hyphy hyphy-analyses/codon-msa/post-msa.bf --protein-msa BDNF_codons.fasta_protein.msa --nucleotide-sequences BDNF_codons.fasta_nuc.fas --output BDNF_codons_hyphy_aligned.fasta

# Aligning via PRANK
#prank -d=input_dna.fas -o=output_codon -codon -F
#prank -d=BDNF_codons.fasta -o=BDNF_codons_prank_aligned.fasta -codon -F

# Aligning via MACSE2 (online via: http://mbb.univ-montp2.fr/MBB/subsection/softExec.php?soft=macse2)
# macse2 -seq BDNF_codons.fasta -gap_op -7 -gap_ext -1 -fs -30 -gc_def 1 -stop -100 -out_AA Out_AA.fas -out_NT Out_NT.fas

# IQTree tree for all of the sequences
# http://www.iqtree.org/doc/Command-Reference
#iqtree -v -s MACSE2_Out_NT.fas -st CODON -nt AUTO

# Recombination Detection
# (RDPv5.5, done on Windows computer)
# 'Split the alignment into multiple new alignments based on detected recombinants'
# Only report recombination events detected by >4 methods
# Linear sequences

# HyPhy - GARD (on MACSE2 codon alignment)
#hyphy GARD --type codon --alignment MACSE2_Out_NT.fas --rv GDD
#hyphy GARD --type codon --alignment MACSE2_Out_NT.fas

# FastTree for MACSE2 recombinants
# http://www.microbesonline.org/fasttree/
for recombinant in MACSE2_recombinants/*.fas; do
    echo "Creating Fasttree for: "$recombinant
    #FastTree -gtr -nt alignment_file > tree_file
    OUTPUT=$recombinant"_FastTree.nwk"
    echo "FastTree -gtr -nt $recombinant > $OUTPUT"
    FastTree -gtr -nt $recombinant > $OUTPUT
done



# End of file.

