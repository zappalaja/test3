#!/bin/bash
#SBATCH --job-name=ssp585_cmor_25
#SBATCH --output=ssp585_cmor_25.%j.out
#SBATCH --error=ssp585_cmor_25.%j.err
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
  --indir "spear_data/SPEAR_c192_o1_Scen_SSP585_IC2011_K50/pp_ens_25" \
  --varlist "CMIP6_input/varlist.json" \
  --table_config "CMIP6_tables/CMIP6_6hr.json" \
  --exp_config "CMIP6_input/SSP585/SSP585_input_ens_25.json" \
  --outdir "/arch7/jlz/CMIP6_output"

echo "Finished CMOR job ssp585_cmor_25"
