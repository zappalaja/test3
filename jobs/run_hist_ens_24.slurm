#!/bin/bash
#SBATCH --job-name=hist_cmor_24
#SBATCH --output=hist_cmor_24.%j.out
#SBATCH --error=hist_cmor_24.%j.err
#SBATCH --time=04:00:00
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mem=8G

###############################################
# Load conda + activate environment
###############################################
module load conda
conda activate fre-jake

###############################################
# Move to working directory
###############################################
cd /home/Jake.Zappala/Desktop/cmor

###############################################
# Run FRE CMOR
###############################################
fre -vv cmor run \
  --indir "spear_data/SPEAR_c192_o1_Hist_AllForc_IC1921_K50/pp_ens_24" \
  --varlist "CMIP6_input/varlist.json" \
  --table_config "CMIP6_tables/CMIP6_6hr.json" \
  --exp_config "CMIP6_input/Hist/Hist_input_ens_24.json" \
  --outdir "/arch7/jlz/CMIP6_output"

echo "Finished CMOR job hist_cmor_24"
