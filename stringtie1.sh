#!/bin/bash
#SBATCH --job-name=stringtie
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=40G
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
#SBATCH --partition=himem
#SBATCH --qos=himem

export TMPDIR=/home/CAM/$USER/tmp/

mkdir -p {athaliana_wt_Rep1,athaliana_wt_Rep2,athaliana_wt_Rep3,athaliana_EE_Rep1,athaliana_EE_Rep2,athaliana_EE_Rep3}

module load stringtie

stringtie -p 8 -l wT1 -G  /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf -o athaliana_wt_Rep1/transcripts.gtf /Users/padana/Desktop/NewRNA/mapping/wt_Rep1.bam
stringtie -p 8 -l wT2 -G  /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf -o athaliana_wt_Rep2/transcripts.gtf /Users/padana/Desktop/NewRNA/mapping/wt_Rep2.bam
stringtie -p 8 -l wT3 -G  /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf -o athaliana_wt_Rep3/transcripts.gtf /Users/padana/Desktop/NewRNA/mapping/wt_Rep3.bam

stringtie -p 8 -l EE1 -G  /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf -o athaliana_EE_Rep1/transcripts.gtf /Users/padana/Desktop/NewRNA/mapping/EE_Rep1.bam
stringtie -p 8 -l EE2 -G  /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf -o athaliana_EE_Rep2/transcripts.gtf /Users/padana/Desktop/NewRNA/mapping/EE_Rep2.bam
stringtie -p 8 -l EE3 -G  /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf -o athaliana_EE_Rep3/transcripts.gtf /Users/padana/Desktop/NewRNA/mapping/EE_Rep3.bam

ls -1 ath*/*.gtf >> sample_assembly_gtf_list.txt
stringtie --merge -p 8 -o stringtie_merged.gtf -G /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf sample_assembly_gtf_list.txt

module load gffcompare/0.10.4

gffcompare -r /Users/padana/Desktop/NewRNA/Athaliana.gene.gtf -o gffcompare stringtie_merged.gtf