#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct  4 11:57:46 2020

@author: Alexander Lucaci

"""



import os, sys
from Bio import SeqIO


FILES = ["MACSE2_Out_Codons.fas", "MACSE2_Out_Codons_recombinants_1.fas", "MACSE2_Out_Codons_recombinants_2.fas", "MACSE2_Out_Codons_recombinants_0.fas"]




for filename in FILES:
    fasta = os.path.join("../analysis/", filename)
    print("# Processing:", fasta)
    records = []
    
    with open(fasta, "r") as handle:
        for record in SeqIO.parse(handle, "fasta"):
            ID = record.id 
            DESC = record.description
            SEQ = record.seq
            
            #print(ID)
            record.description = ""
            records.append(record)
        #end for
    #end with


    OUTPUT = fasta.replace(".fas", "_renamed.fas")
    print("# Saving to:", OUTPUT)
    
    with open(OUTPUT, "w") as fh:
        SeqIO.write(records, fh, "fasta")
    #end with
    
    print()
#end for

# =============================================================================
# End of file
# =============================================================================
            
            
            