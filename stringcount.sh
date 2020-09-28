#!/bin/bash
#SBATCH --job-name=stringtie
#SBATCH --mail-user=
#SBATCH --mail-type=ALL
#SBATCH -n 1
#SBATCH -N 1
#SBATCH -c 4
#SBATCH --mem=40G
#SBATCH -o %x_%j.out
#SBATCH -e %x_%j.err
#SBATCH --partition=himem
#SBATCH --qos=himem



mkdir -p {athaliana_wt_Rep1,athaliana_wt_Rep2,athaliana_wt_Rep3,athaliana_EE_Rep1,athaliana_EE_Rep2,athaliana_EE_Rep3}


stringtie -e -B -p 4 /Users/padana/Desktop/NewRNA/mapping/wt_Rep1.bam -G stringtie_merged.gtf -o athaliana_wt_Rep1/athaliana_wt_Rep1.count -A athaliana_wt_Rep1/wt_Rep1_gene_abun.out

stringtie -e -B -p 4 /Users/padana/Desktop/NewRNA/mapping/wt_Rep2.bam -G stringtie_merged.gtf -o athaliana_wt_Rep2/athaliana_wt_Rep2.count -A athaliana_wt_Rep2/wt_Rep2_gene_abun.out

stringtie -e -B -p 4 /Users/padana/Desktop/NewRNA/mapping/wt_Rep3.bam -G stringtie_merged.gtf -o athaliana_wt_Rep3/athaliana_wt_Rep3.count -A athaliana_wt_Rep3/wt_Rep3_gene_abun.out

stringtie -e -B -p 4 /Users/padana/Desktop/NewRNA/mapping/EE_Rep1.bam -G stringtie_merged.gtf -o athaliana_EE_Rep1/athaliana_EE_Rep1.count -A athaliana_EE_Rep1/EE_Rep1_gene_abun.out

stringtie -e -B -p 4 /Users/padana/Desktop/NewRNA/mapping/EE_Rep2.bam -G stringtie_merged.gtf -o athaliana_EE_Rep2/athaliana_EE_Rep2.count -A athaliana_EE_Rep2/EE_Rep2_gene_abun.out

stringtie -e -B -p 4 /Users/padana/Desktop/NewRNA/mapping/EE_Rep3.bam -G stringtie_merged.gtf -o athaliana_EE_Rep3/athaliana_EE_Rep3.count -A athaliana_EE_Rep3/EE_Rep3_gene_abun.out
