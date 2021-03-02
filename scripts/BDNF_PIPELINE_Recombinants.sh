#!/bin/bash

# Updated for 2021 analysis
# Create hyphy-specific analysis in order to automate this.
# @Usage: bash BDNF_PIPELINE_Recombinants.sh

clear

now=$(date)
echo "## Starting pipeline: "$now
echo ""

# Config file this.
BASEDIR="/home/aglucaci/PROJECTS_2021/EvolutionOfNeurotrophins"
cd $BASEDIR
mkdir -p ../analysis

# ######################################################
# Get data
# ######################################################
# https://www.ncbi.nlm.nih.gov/kis/ortholog/627/?scope=7776
# Download RefSeq transcripts (Fasta) (one sequence per gene)
# Download RefSeq transcripts (Fasta) (one sequence per gene)
# Download Tabular data (CSV)

# ######################################################
# Software Requirements
# ######################################################
# HyPhy, installed via conda version 2.5.8
#conda install -c bioconda hyphy
#Installers
#git clone https://github.com/veg/hyphy-analyses.git
#wget https://bioweb.supagro.inra.fr/macse/releases/macse_v2.04.jar

HYPHY="/home/aglucaci/hyphy-develop/HYPHYMPI"
PYTHON="/home/aglucaci/anaconda3/bin/python3.7"
IQTREE="/opt/iqtree/iqtree-1.6.6-Linux/bin/iqtree"
JAVA="/usr/bin/java"

# ######################################################
# Custom Scripts
# ######################################################

CODON_SCRIPT=$BASEDIR"/scripts/codons.py"
MACSE_SCRIPT=$BASEDIR"/scripts/MACSEv2.sh"
IQTREE_SCRIPT=$BASEDIR"/scripts/IQTREE.sh"
GARD_SCRIPT=$BASEDIR"/scripts/GARD.sh"
TN93_SCRIPT=$BASEDIR"/scripts/TN93.sh"
FEL_SCRIPT=$BASEDIR"/scripts/FEL.sh"
MEME_SCRIPT=$BASEDIR"/scripts/MEME.sh"
BUSTEDS_SCRIPT=$BASEDIR"/scripts/BUSTEDS.sh"
ABSREL_SCRIPT=$BASEDIR"/scripts/ABSREL.sh"
SLAC_SCRIPT=$BASEDIR"/scripts/SLAC.sh"
PRIME_SCRIPT=$BASEDIR"/scripts/PRIME.sh"
BGM_SCRIPT=$BASEDIR"/scripts/BGM.sh"
FMM_SCRIPT=$BASEDIR"/scripts/FMM.sh"

DATA_DIR=$BASEDIR"/analysis/Recombinants"

# #####################################################
# Make a tree
# #####################################################

for INPUT in $DATA_DIR/*.fas; do
  echo $INPUT
  #iqtree output
  OUTPUT_IQTREE=$INPUT".treefile"

  if [ -s $OUTPUT_IQTREE ];
  then
     echo "# IQTREE already ran"
  else
     echo qsub -V -l nodes=1:ppn=16 -q epyc $IQTREE_SCRIPT -v FASTA=$INPUT
     cmd="qsub -V -l nodes=1:ppn=16 -q epyc $IQTREE_SCRIPT -v FASTA=$INPUT"
     # launch command and collect job id
     #jobid_1=$($cmd | cut -d' ' -f3)
  fi
 
done



#exit 0


# Run Selection Analyses

# SLAC, FEL, BUSTED, MEME, aBSREL


for INPUT in $DATA_DIR/*.fas; do
    OUTPUT_CODON_MSA=$INPUT
    OUTPUT_IQTREE=$INPUT".treefile"
    
    # FEL
    OUTPUT_FEL=$OUTPUT_CODON_MSA".FEL.json"
    if [ -f $OUTPUT_FEL ];
    then
       echo "# FEL output already exists"
    else
       echo qsub -V -l nodes=1:ppn=8 -q epyc $FEL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
       cmd="qsub -V -l nodes=1:ppn=8 -q epyc $FEL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
       jobid_5=$($cmd | cut -d' ' -f3)
    fi

    # MEME
    OUTPUT_MEME=$OUTPUT_CODON_MSA".MEME.json"

    if [ -f $OUTPUT_MEME ];
    then
        echo "# MEME output already exists"
    else
        echo qsub -V -l nodes=1:ppn=8 -q epyc $MEME_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
        cmd="qsub -V -l nodes=1:ppn=8 -q epyc $MEME_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
        jobid_6=$($cmd | cut -d' ' -f3)
    fi

   # BUSTEDS
   OUTPUT_BUSTEDS=$OUTPUT_CODON_MSA".BUSTEDS.json"
   if [ -s $OUTPUT_BUSTEDS ];
   then
       echo "# BUSTEDS output already exists"
   else
       echo qsub -V -l nodes=1:ppn=8 -q epyc $BUSTEDS_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
       cmd="qsub -V -l nodes=1:ppn=8 -q epyc $BUSTEDS_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
       jobid_7=$($cmd | cut -d' ' -f3)
   fi

   # ABSREL ##
   OUTPUT_ABSREL=$OUTPUT_CODON_MSA".ABSREL.json"
   if [ -f $OUTPUT_ABSREL ];
   then
       echo "# ABSREL output already exists"
   else
       echo qsub -V -l nodes=1:ppn=8 -q epyc $ABSREL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
       cmd="qsub -V -l nodes=1:ppn=8 -q epyc $ABSREL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
       jobid_8=$($cmd | cut -d' ' -f3)
   fi

   # SLAC ##
   OUTPUT_SLAC=$OUTPUT_CODON_MSA".SLAC.json"
   if [ -f $OUTPUT_SLAC ];
   then
       echo "# SLAC output already exists"
   else
       echo qsub -V -l nodes=1:ppn=8 -q epyc $SLAC_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
       cmd="qsub -V -l nodes=1:ppn=8 -q epyc $SLAC_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
       jobid_9=$($cmd | cut -d' ' -f3)
   fi

   # PRIME ##
   OUTPUT_PRIME=$OUTPUT_CODON_MSA".PRIME.json"
   if [ -f $OUTPUT_PRIME ];
   then
       echo "# PRIME output already exists"
   else
       echo qsub -V -l nodes=1:ppn=8 -q epyc $PRIME_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
       cmd="qsub -V -l nodes=1:ppn=8 -q epyc $PRIME_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
       jobid_10=$($cmd | cut -d' ' -f3)
   fi

   # BGM ##
   OUTPUT_BGM=$OUTPUT_CODON_MSA".BGM.json"
   if [ -f $OUTPUT_BGM ];
   then
       echo "# BGM output already exists"
   else
       echo qsub -V -l nodes=1:ppn=8 -q epyc $BGM_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
       cmd="qsub -V -l nodes=1:ppn=8 -q epyc $BGM_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
       jobid_11=$($cmd | cut -d' ' -f3)
   fi

   # FMM ##
   OUTPUT_FMM=$OUTPUT_CODON_MSA".FMM.json"
   if [ -f $OUTPUT_FMM ];
   then
       echo "# FMM output already exists"
   else
       echo qsub -V -l nodes=1:ppn=8 -q epyc $FMM_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
       cmd="qsub -V -l nodes=1:ppn=8 -q epyc $FMM_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
       jobid_11=$($cmd | cut -d' ' -f3)
   fi


done






exit 0

# ######################################################
# Rename the fastas sequences
# This makes the file more hyphy 'compatible'
# ######################################################
# Rename fasta file:
OUTPUT_RENAMED_FASTA=$BASEDIR"/analysis/BDNF_codons_renamed.fasta"

if [ -s $OUTPUT_RENAMED_FASTA ];     
then
   echo "# Fasta already renamed"
else 
   #python rename_codon_msa_for_hyphy.py ../analysis/BDNF_codons.fasta ../analysis/BDNF_codons_renamed.fasta
   #$PYTHON $BASEDIR"/scripts/rename_codon_msa_for_hyphy.py" $BASEDIR"/analysis/BDNF_codons.fasta" $BASEDIR"/analysis/BDNF_codons_renamed.fasta"
   echo $PYTHON $BASEDIR"/scripts/rename_codon_msa_for_hyphy.py" $FASTA $OUTPUT_RENAMED_FASTA
   $PYTHON $BASEDIR"/scripts/rename_codon_msa_for_hyphy.py" $FASTA $OUTPUT_RENAMED_FASTA
fi

# ######################################################
# Multiple sequence alignment (MACSEv2)
# ######################################################
GENE=$BASEDIR"/analysis/BDNF_codons_renamed.fasta"
OUTPUT_CODON_MSA=$GENE"_codon_macse.fas"

if [ -s $OUTPUT_CODON_MSA ];
then
   echo "# Codon msa  (MACSE) already exists"
else
   echo qsub -V -l nodes=1:ppn=8 -q epyc $MACSE_SCRIPT -v FASTA=$GENE
   # qsub -V -l nodes=1:ppn=8 -q epyc $MACSE_SCRIPT -v FASTA=$GENE
   cmd="qsub -V -l nodes=1:ppn=8 -q epyc $MACSE_SCRIPT -v FASTA=$GENE"
   jobid_1=$($cmd | cut -d' ' -f3)
fi

# ######################################################
# Tamuri-Nei 1993 (TN93) Distance
# ######################################################
#GENE=$BASEDIR"/analysis/BDNF_codons_renamed.fasta"
OUTPUT_TN93=$OUTPUT_CODON_MSA".dst"

if [ -s $OUTPUT_TN93 ];
then
   echo "# TN93 calculation already exists"
else
   echo qsub -V -l nodes=1:ppn=2 -q epyc $TN93_SCRIPT -v FASTA=$OUTPUT_CODON_MSA
   cmd="qsub -V -l nodes=1:ppn=2 -q epyc $TN93_SCRIPT -v FASTA=$OUTPUT_CODON_MSA"
   jobid_2=$($cmd | cut -d' ' -f3)
fi


# ######################################################
# Generate Tree (ML or FastTree)
# ######################################################
# Output from previous step, the codon-aware-msa
INPUT=$OUTPUT_CODON_MSA
#iqtree output
OUTPUT_IQTREE=$INPUT".treefile"

if [ -s $OUTPUT_IQTREE ];
then
   echo "# IQTREE already ran"
else
   echo qsub -V -l nodes=1:ppn=16 -q epyc $IQTREE_SCRIPT -v FASTA=$INPUT
   cmd="qsub -V -l nodes=1:ppn=16 -q epyc $IQTREE_SCRIPT -v FASTA=$INPUT"
   # launch command and collect job id
   jobid_3=$($cmd | cut -d' ' -f3)
fi

# ######################################################
# Recombination detection (GARD)
# ######################################################

# Output from previous step, the codon-aware-msa
INPUT=$OUTPUT_CODON_MSA
OUTPUT_GARD=$INPUT".GARD.json"

if [ -s $OUTPUT_GARD ];
then
   echo "# GARD already ran"
else
   echo qsub -V -l nodes=1:ppn=32 -q epyc $GARD_SCRIPT -v FASTA=$INPUT
   #qsub -V -l nodes=1:ppn=32 -q epyc $GARD_SCRIPT -v FASTA=$INPUT
   cmd="qsub -V -l nodes=1:ppn=32 -q epyc $GARD_SCRIPT -v FASTA=$INPUT"
   jobid_4=$($cmd | cut -d' ' -f3)
fi



# ######################################################
# Selection Analyses
# ######################################################
# FEL
OUTPUT_FEL=$OUTPUT_CODON_MSA".FEL.json"
if [ -f $OUTPUT_FEL ];
then
   echo "# FEL output already exists"
else
   echo qsub -V -l nodes=1:ppn=8 -q epyc $FEL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
   cmd="qsub -V -l nodes=1:ppn=8 -q epyc $FEL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
   jobid_5=$($cmd | cut -d' ' -f3)
fi

# MEME
OUTPUT_MEME=$OUTPUT_CODON_MSA".MEME.json"

if [ -f $OUTPUT_MEME ];
then
   echo "# MEME output already exists"
else
   echo qsub -V -l nodes=1:ppn=8 -q epyc $MEME_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
   cmd="qsub -V -l nodes=1:ppn=8 -q epyc $MEME_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
   jobid_6=$($cmd | cut -d' ' -f3)
fi

# BUSTEDS
OUTPUT_BUSTEDS=$OUTPUT_CODON_MSA".BUSTEDS.json"
if [ -s $OUTPUT_BUSTEDS ];
then
   echo "# BUSTEDS output already exists"
else
   echo qsub -V -l nodes=1:ppn=8 -q epyc $BUSTEDS_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
   cmd="qsub -V -l nodes=1:ppn=8 -q epyc $BUSTEDS_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
   jobid_7=$($cmd | cut -d' ' -f3)
fi


# ABSREL ##
OUTPUT_ABSREL=$OUTPUT_CODON_MSA".ABSREL.json"
if [ -f $OUTPUT_ABSREL ];
then
   echo "# ABSREL output already exists"
else
   echo qsub -V -l nodes=1:ppn=8 -q epyc $ABSREL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
   cmd="qsub -V -l nodes=1:ppn=8 -q epyc $ABSREL_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
   jobid_8=$($cmd | cut -d' ' -f3)
fi


# SLAC ##
OUTPUT_SLAC=$OUTPUT_CODON_MSA".SLAC.json"

if [ -f $OUTPUT_SLAC ];
then
   echo "# SLAC output already exists"
else
   echo qsub -V -l nodes=1:ppn=8 -q epyc $SLAC_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE
   cmd="qsub -V -l nodes=1:ppn=8 -q epyc $SLAC_SCRIPT -v FASTA=$OUTPUT_CODON_MSA,TREE=$OUTPUT_IQTREE"
   jobid_9=$($cmd | cut -d' ' -f3)
fi









exit 1 
# ######################################################
# Multiple sequence alignment
# ######################################################
GENE=$BASEDIR"/analysis/BDNF_codons_renamed.fasta"
#REFERENCE_SEQ=$BASEDIR"/analysis/BDNF_Human_Reference.fasta"
CODON_MSA_SCRIPT=$BASEDIR"/scripts/CODON_AWARE_MSA.sh"
OUTPUT=$BASEDIR"/analysis/BDNF_codons_renamed.fasta_CODON_AWARE_ALN.fasta"

if [ -s $OUTPUT ];
then
   echo "# Codon msa already exists"
else
   echo qsub -V -l nodes=1:ppn=16 -q epyc $CODON_MSA_SCRIPT -v GENE=$GENE,REF_SEQ=$REF_SEQ
   #qsub -V -l nodes=1:ppn=16 -q epyc $CODON_MSA_SCRIPT -v GENE=$GENE,REF_SEQ=$REF_SEQ
   cmd="qsub -V -l nodes=1:ppn=16 -q epyc $CODON_MSA_SCRIPT -v GENE=$GENE,REF_SEQ=$REF_SEQ"
   # launch job and collect job id
   jobid_1=$($cmd | cut -d' ' -f3)
fi

# ######################################################
# Generate Tree (ML or FastTree)
# ######################################################

# Output from previous step, the codon-aware-msa
INPUT=$OUTPUT

#iqtree output
OUTPUT=$INPUT".treefile"
IQTREE_SCRIPT=$BASEDIR"/scripts/IQTREE.sh"

if [ -s $OUTPUT ];
then
   echo "# IQTREE already ran"
else
   echo qsub -V -l nodes=1:ppn=16 -q epyc $IQTREE_SCRIPT -v FASTA=$INPUT
   cmd="qsub -V -l nodes=1:ppn=16 -q epyc $IQTREE_SCRIPT -v FASTA=$INPUT"
   # launch command and collect job id
   jobid_2=$($cmd | cut -d' ' -f3)
fi

exit 1
# ######################################################
# Recombination detection (GARD)
# ######################################################

# Output from previous step
INPUT=$OUTPUT 
OUTPUT=$INPUT".GARD.json"
GARD_SCRIPT=$BASEDIR"/scripts/GARD.sh"

if [ -s $OUTPUT ];
then
   echo "# GARD already ran"
else
   echo qsub -V -l nodes=1:ppn=32 -q epyc $GARD_SCRIPT -v FASTA=$INPUT
   #qsub -V -l nodes=1:ppn=32 -q epyc $GARD_SCRIPT -v FASTA=$INPUT
   #cmd="qsub -V -l nodes=1:ppn=32 -q epyc $GARD_SCRIPT -v FASTA=$INPUT"
   #jobid_2=$($cmd | cut -d' ' -f3)

fi 









exit 1

# ######################################################
# Multiple sequence alignment
# ######################################################
#if [ ! -s macse_v2.05.jar ];
#then
#    echo "## Downloading MACSE2"
#    wget https://bioweb.supagro.inra.fr/macse/releases/macse_v2.05.jar
#fi

#if [  -s ../analysis/MACSE2_Out_Codons.fas ];
#then
#    echo "## Step 2  # Perform MACSE2 codon-msa"
#else
#    # Aligning vsia MACSE2 (online via: http://mbb.univ-montp2.fr/MBB/subsection/softExec.php?soft=macse2) (Attempt #3)
#    java -jar macse_v2.05.jar -prog alignSequences -seq ../analysis/BDNF_codons.fasta -gap_op -7 -gap_ext -1 -fs -30 -gc_def 1 -stop -100 -out_AA ../analysis/MACSE2_Out_AA.fas -out_NT ../analysis/MACSE2_Out_Codons.fas
#fi

# ######################################################
# Recombination detection (done on Windows10 computer)
# ######################################################
# RDP v 5.5
# Found some recombination events, saved as bdnf.rdp5 in RDP folder.
# MACSE2_Out_Codons_recombinants.fas

# Split this into 3 files (manually)
# MACSE2_Out_Codons_recombinants_0.fas
# MACSE2_Out_Codons_recombinants_1.fas
# MACSE2_Out_Codons_recombinants_2.fas

# ######################################################
# Generate Tree (ML or FastTree)
# ######################################################
#IQ-TREE multicore version 1.6.12 for Mac OS X 64-bit built Feb  2 2020
#Developed by Bui Quang Minh, Nguyen Lam Tung, Olga Chernomor,
#Heiko Schmidt, Dominik Schrempf, Michael Woodhams.

# IQTree tree for all of the sequences
# http://www.iqtree.org/doc/Command-Reference
#iqtree -v -s MACSE2_Out_NT.fas -st CODON -nt AUTO

#../analysis/MACSE2_Out_Codons.fas
if [ -s ../analysis/MACSE2_Out_Codons.fas.treefile ];
then
    echo "## Step 3a # IQ-Tree Treefile exists: "../analysis/MACSE2_Out_Codons.fas.treefile
else
    # http://www.iqtree.org/doc/Command-Reference
    echo iqtree -v -s ../analysis/MACSE2_Out_Codons.fas -st CODON -nt AUTO -m GTR+I+G
    #iqtree -v -s $BASEDIR"/analysis/MACSE2_Out_Codons.fas" -st CODON -nt AUTO -m GTR+I+G
    iqtree -s $BASEDIR"/analysis/MACSE2_Out_Codons.fas"
   
fi

#../analysis/MACSE2_Out_Codons_recombinants_0.fas
# iqtree -v -s ../analysis/MACSE2_Out_Codons_recombinants_0.fas -st CODON -nt AUTO
#if [ -s ../analysis/MACSE2_Out_Codons_recombinants_0.fas.treefile ];
#then
#    echo "## Step 3b # IQ-Tree Treefile exists: "../analysis/MACSE2_Out_Codons_recombinants_0.fas.treefile
#else
#    echo iqtree -v -s ../analysis/MACSE2_Out_Codons_recombinants_0.fas -st CODON -nt AUTO
#    iqtree -v -s ../analysis/MACSE2_Out_Codons_recombinants_0.fas -st CODON -nt AUTO
#fi

#../analysis/MACSE2_Out_Codons_recombinants_1.fas
#only has 2 sequences
#iqtree -v -s ../analysis/MACSE2_Out_Codons_recombinants_1.fas -st CODON -nt AUTO

#../analysis/MACSE2_Out_Codons_recombinants_2.fas
#iqtree -v -s ../analysis/MACSE2_Out_Codons_recombinants_2.fas -st CODON -nt AUTO


if [ -s ../analysis/Recombinants/01192021_BDNF_MACSE_RDP0.fas.treefile ];
then
        echo "## Step 4: Tree for Recombinants"
    else
        #
        iqtree -s $BASEDIR"/analysis/Recombinants/01192021_BDNF_MACSE_RDP0.fas"
fi


ALIGNMENT=$BASEDIR"/analysis/Recombinants/01192021_BDNF_MACSE_RDP0.fas"
RENAMEDAlignment=$BASEDIR"/analysis/Recombinants/01192021_BDNF_MACSE_RDP0_renamed.fas"

if [ -s $RENAMEDAlignment ]; 
then
    echo "Renamed file exists"
else
    	echo "# Renaming CODON MSA to fit HyPhy expected naming style"
        python3 rename_codon_msa_for_hyphy.py $ALIGNMENT
fi

TREE=$BASEDIR"/analysis/Recombinants/01192021_BDNF_MACSE_RDP0.fas.treefile"
HYPHY=$BASEDIR"/scripts/hyphy-develop/HYPHYMP"
RES=$BASEDIR"/scripts/hyphy-develop/res"


if [ -s $RENAMEDAlignment".MEME.json" ];
then
   echo "MEME Output Exists"
else
   echo $HYPHY LIBPATH=$RES MEME --alignment $RENAMEDAlignment --tree $TREE
   $HYPHY LIBPATH=$RES MEME --alignment $RENAMEDAlignment --tree $TREE
fi

$HYPHY LIBPATH=$RES BUSTED --alignment $RENAMEDAlignment --tree $TREE
$HYPHY LIBPATH=$RES ABSREL --alignment $RENAMEDAlignment --tree $TREE
$HYPHY LIBPATH=$RES SLAC --alignment $RENAMEDAlignment --tree $TREE
$HYPHY LIBPATH=$RES BGM --alignment $RENAMEDAlignment --tree $TREE




exit 1
# ######################################################
# Selection Analyses
# ######################################################
echo "## Step 4  # Performing selection analyses"

ALIGNMENT=""
TREE = ""

hyphy MEME --alignment $ALIGNMENT --tree $TREE
hyphy BUSTED --alignment $ALIGNMENT --tree $TREE
hyphy ABSREL --alignment $ALIGNMENT --tree $TREE
hyphy SLAC --alignment $ALIGNMENT --tree $TREE
hyphy BGM --alignment $ALIGNMENT --tree $TREE


exit 1
# FEL
if [ ! -s ../analysis/MACSE2_Out_Codons_renamed.fas.FEL.json ]; then
    hyphy FEL --alignment ../analysis/MACSE2_Out_Codons_renamed.fas --tree ../analysis/MACSE2_Out_Codons.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_0_renamed.fas.FEL.json ]; then
    hyphy FEL --alignment ../analysis/MACSE2_Out_Codons_recombinants_0_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_0.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_1_renamed.fas.FEL.json ]; then
    hyphy FEL --alignment ../analysis/MACSE2_Out_Codons_recombinants_1_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_1.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_2_renamed.fas.FEL.json ]; then
    hyphy FEL --alignment ../analysis/MACSE2_Out_Codons_recombinants_2_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_2.fas.treefile
fi

#hyphy FEL MACSE2_Out_Codons.fas.treefile
#hyphy FEL MACSE2_Out_Codons_recombinants_0.fas.treefile
#hyphy FEL MACSE2_Out_Codons_recombinants_2.fas.treefile

# aBSREL

if [ ! -s ../analysis/MACSE2_Out_Codons_renamed.fas.ABSREL.json ]; then
    hyphy aBSREL --alignment ../analysis/MACSE2_Out_Codons_renamed.fas --tree ../analysis/MACSE2_Out_Codons.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_0_renamed.fas.ABSREL.json ]; then
    hyphy aBSREL --alignment ../analysis/MACSE2_Out_Codons_recombinants_0_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_0.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_1_renamed.fas.ABSREL.json ]; then
    hyphy aBSREL --alignment ../analysis/MACSE2_Out_Codons_recombinants_1_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_1.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_2_renamed.fas.ABSREL.json ]; then
    hyphy aBSREL --alignment ../analysis/MACSE2_Out_Codons_recombinants_2_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_2.fas.treefile
fi


# SLAC


if [ ! -s ../analysis/MACSE2_Out_Codons_renamed.fas ]; then
    hyphy SLAC --alignment ../analysis/MACSE2_Out_Codons_renamed.fas --tree ../analysis/MACSE2_Out_Codons.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_0_renamed.fas ]; then
    hyphy SLAC --alignment ../analysis/MACSE2_Out_Codons_recombinants_0_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_0.fas.treefile
fi

if [ ! -s .../analysis/MACSE2_Out_Codons_recombinants_1_renamed.fas ]; then
    hyphy SLAC --alignment ../analysis/MACSE2_Out_Codons_recombinants_1_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_1.fas.treefile
fi

if [ ! -s ../analysis/MACSE2_Out_Codons_recombinants_2_renamed.fas ]; then
    hyphy SLAC --alignment ../analysis/MACSE2_Out_Codons_recombinants_2_renamed.fas --tree ../analysis/MACSE2_Out_Codons_recombinants_2.fas.treefile
fi

# FMM?






exit 0

# Try GARD again
# mafft --auto ../analysis/BDNF_codons.fasta > BDNF_codons_nt_mafft_aligned.fasta

# Aligning via hyphy (Attempt #1)
#hyphy hyphy-analyses/codon-msa/pre-msa.bf --input BDNF_codons.fasta
#mafft --auto BDNF_codons.fasta_protein.fas > BDNF_codons.fasta_protein.msa
#hyphy hyphy-analyses/codon-msa/post-msa.bf --protein-msa BDNF_codons.fasta_protein.msa --nucleotide-sequences BDNF_codons.fasta_nuc.fas --output BDNF_codons_hyphy_aligned.fasta

# Aligning via PRANK (Attempt #2)
#prank -d=input_dna.fas -o=output_codon -codon -F
#prank -d=BDNF_codons.fasta -o=BDNF_codons_prank_aligned.fasta -codon -F

# Aligning via MACSE2 (online via: http://mbb.univ-montp2.fr/MBB/subsection/softExec.php?soft=macse2) (Attempt #3)
java -jar macse_v2.04.jar -seq BDNF_codons.fasta -gap_op -7 -gap_ext -1 -fs -30 -gc_def 1 -stop -100 -out_AA MACSE2_Out_AA.fas -out_NT MACSE2_Out_NT.fas

# ######################################################
# Generate Tree (ML or FastTree)
# ######################################################
# IQTree tree for all of the sequences
# http://www.iqtree.org/doc/Command-Reference
#iqtree -v -s MACSE2_Out_NT.fas -st CODON -nt AUTO

# ######################################################
# Recombination detection
# ######################################################
# Recombination Detection
# (RDPv5.5, done on Windows computer)
# 'Split the alignment into multiple new alignments based on detected recombinants'
# Only report recombination events detected by >4 methods
# Linear sequences

# HyPhy - GARD (on MACSE2 codon alignment) (alignment too short to run)
#hyphy GARD --type codon --alignment MACSE2_Out_NT.fas --rv GDD
#hyphy GARD --type codon --alignment MACSE2_Out_NT.fas


# FastTree for MACSE2 recombinants
# http://www.microbesonline.org/fasttree/
for recombinant in MACSE2_recombinants/*.fas; do
    echo "Replacing spaces for underscores"
    #sed -i "s/ /_/g" $BASEDIR/data/VIPR/MERS/GenomicFastaResults.fasta
    #MACOS version of using sed, needs to be modified for linux environment
    echo sed -i '' 's/ /_/g' $recombinant
    sed -i '' 's/ /_/g' $recombinant
    
    echo "Replacing colons for nothing (empty)"
    #sed -i "s/ /_/g" $BASEDIR/data/VIPR/MERS/GenomicFastaResults.fasta
    #MACOS version of using sed, needs to be modified for linux environment
    echo sed -i '' 's/://g' $recombinant
    sed -i '' 's/://g' $recombinant
    
    echo "Creating Fasttree for: "$recombinant
    #FastTree -gtr -nt alignment_file > tree_file
    OUTPUT=$recombinant"_FastTree.nwk"
    
    if [ -s $OUTPUT ]; then
        echo $OUPUT" exists"
    else
        echo "FastTree -gtr -nt $recombinant > $OUTPUT"
        FastTree -gtr -nt $recombinant > $OUTPUT
    fi

    ## Selection Analyses
    TREE=$OUTPUT
    # FEL
    # https://github.com/veg/hyphy/blob/master/res/TemplateBatchFiles/SelectionAnalyses/FEL.bf
    if [ ! -s $recombinant".FEL.json" ]; then
        hyphy FEL --alignment $recombinant --tree $TREE
    fi
    
    # SLAC
    # https://github.com/veg/hyphy/blob/master/res/TemplateBatchFiles/SelectionAnalyses/SLAC.bf
    if [ ! -s $recombinant".SLAC.json" ]; then
        hyphy SLAC --alignment $recombinant --tree $TREE
    fi
    # MEME
    # https://github.com/veg/hyphy/blob/master/res/TemplateBatchFiles/SelectionAnalyses/MEME.bf
    #hyphy MEME --alignment $recombinant --tree $TREE
    
    # Multi-Hit
    #hyphy FitMultiModel/FitMultiModel.bf --alignment $recombinant --tree $TREE
    
    # BUSTEDS
    #hyphy BUSTED --srv Yes --alignment $recombinant --tree $TREE --output $recombinant".BUSTEDS.json"
    
    # BUSTEDS-MH
    #hyphy BUSTED-MH/BUSTED-MH.bf --alignment $recombinant --tree $TREE --output $recombinant".BUSTEDS-MH.json"
    
    # aBSREL
    # https://github.com/veg/hyphy/blob/master/res/TemplateBatchFiles/SelectionAnalyses/aBSREL.bf
    if [ ! -s $recombinant".aBSREL.json" ]; then
        hyphy absrel --alignment $recombinant --tree $TREE
    fi
    # aBSREL-MH
    # https://github.com/veg/hyphy/blob/master/res/TemplateBatchFiles/SelectionAnalyses/aBSREL.bf
    #hyphy absrel --alignment $recombinant --tree $TREE --multiple-hits Double+Triple --output $recombinant".aBSREL-MH.json"

done


# End of file.



#Figures
# FigTree a 1.4.4
