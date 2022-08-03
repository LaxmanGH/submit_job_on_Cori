#SBATCH --nodes=1                                                                                                                           
#SBATCH --time=8:00:00 # 8 hour                                                                                                             
#SBATCH --qos=shared  ## shared qos means 1 node, with some number of tasks and cpus:                                                       

#SBATCH --ntasks=1                                                                                                                          
#SBATCH --cpus-per-task=2  ## one core has 2 hyperthreads, which slurm views as "cpus":                                                     
#SBATCH --mem=32G  ## max 118 GB on Haswell, 87 GB on KNL                                                                                   

#SBATCH --image=docker:legendexp/legend-base:latest                                                                                         

export wrapperfile=$1
outfile=${wrapperfile:9:-3}.log

export outputdir=/global/cfs/cdirs/m2676/users/lpaudel/cryostatsim/jobs/logs
export wrapperdir=/global/cfs/cdirs/m2676/users/lpaudel/cryostatsim/wrappers

commandtorun="srun --output=$outputdir/$outfile -n 1 -C haswell shifter bash $wrapperdir/${wrapperfile:9}"
echo $commandtorun
$commandtorun
