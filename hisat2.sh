#!/bin/bash
#SBATCH --job-name=hisat2_run
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 8
#SBATCH --mem=120G
#SBATCH -o hisat2_run_%j.out
#SBATCH -e hisat2_run_%j.err
#SBATCH --partition=general
#SBATCH --qos=general

export TMPDIR=/home/CAM/$USER/tmp/

module load hisat2

mkdir -p ../mapping

hisat2 -p 8 --dta -x /Users/padana/Desktop/NewRNA/index/Athaliana -1 trimmed_wt_Rep1_R1.fastq -2 trimmed_wt_Rep1_R2.fastq -S ../mapping/wt_Rep1.sam

hisat2 -p 8 --dta -x /Users/padana/Desktop/NewRNA/index/Athaliana -1 trimmed_wt_Rep2_R1.fastq -2 trimmed_wt_Rep2_R2.fastq -S ../mapping/wt_Rep2.sam

hisat2 -p 8 --dta -x /Users/padana/Desktop/NewRNA/index/Athaliana -1 trimmed_wt_Rep3_R1.fastq -2 trimmed_wt_Rep3_R2.fastq -S ../mapping/wt_Rep3.sam

hisat2 -p 8 --dta -x /Users/padana/Desktop/NewRNA/index/Athaliana -1 trimmed_EE_Rep1_R1.fastq -2 trimmed_EE_Rep1_R2.fastq -S ../mapping/_EE_Rep1.sam

hisat2 -p 8 --dta -x /Users/padana/Desktop/NewRNA/index/Athaliana -1 trimmed_EE_Rep2_R1.fastq -2 trimmed_EE_Rep2_R2.fastq -S ../mapping/_EE_Rep2.sam

hisat2 -p 8 --dta -x /Users/padana/Desktop/NewRNA/index/Athaliana -1 trimmed_EE_Rep3_R1.fastq -2 trimmed_EE_Rep3_R2.fastq -S ../mapping/_EE_Rep3.sam