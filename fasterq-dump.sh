#!/bin/bash
#SBATCH --job-name=data_dump
#SBATCH --mail-user=your.email@uconn.edu
#SBATCH --mail-type=ALL
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 1
#SBATCH --mem=10G
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
#SBATCH --partition=general
#SBATCH --qos=general 

mkdir /Users/padana/Desktop/tmp/
export TMPDIR=/Users/padana/Desktop/tmp/


fasterq-dump SRR8428909.sra	--split-files --outdir /Users/padana/Desktop/tmp/
#mv SRR8428909_1.fastq wt_Rep1_R1.fastq
#mv SRR8428909_2.fastq wt_Rep1_R2.fastq

fasterq-dump SRR8428908.sra	--split-files --outdir /Users/padana/Desktop/tmp/
#mv SRR8428908_1.fastq wt_Rep2_R1.fastq
#mv SRR8428908_2.fastq wt_Rep2_R2.fastq

fasterq-dump SRR8428907.sra	--split-files --outdir /Users/padana/Desktop/tmp/
#mv SRR8428907_1.fastq wt_Rep3_R1.fastq
#mv SRR8428907_2.fastq wt_Rep3_R2.fastq

fasterq-dump SRR8428906.sra	--split-files --outdir /Users/padana/Desktop/tmp/
#mv SRR8428906_1.fastq EE_Rep1_R1.fastq
#mv SRR8428906_2.fastq EE_Rep1_R2.fastq

fasterq-dump SRR8428905.sra	--split-files --outdir /Users/padana/Desktop/tmp/
#mv SRR8428905_1.fastq EE_Rep2_R1.fastq
#mv SRR8428905_2.fastq EE_Rep2_R2.fastq

fasterq-dump SRR8428904.sra	--split-files --outdir /Users/padana/Desktop/tmp/
#mv SRR8428904_1.fastq EE_Rep3_R1.fastq
#mv SRR8428904_2.fastq EE_Rep3_R2.fastq