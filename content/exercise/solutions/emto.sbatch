#! /bin/bash
##SBATCH -A naiss2024-22-241
#SBATCH -t 30:00
#SBATCH -n 1
#SBATCH -c 4
#SBATCH -a 1-9

jobs=( $( ls *.dat | sort ) )
myid=$(( SLURM_ARRAY_TASK_ID - 1 ))
[[ $SLURM_ARRAY_TASK_ID -gt ${#jobs[@]} ]] && { echo error: do not need so many slurm workers ; exit 1; }
thisjob=${jobs[$myid]}

ulimit -s unlimited
eval "$(env |egrep '^OMP_|^MKL_' | awk -F = '{print "unset "$1}')"
export OMP_NUM_THREADS=$SLURM_CPUS_PER_TASK
export OMP_STACKSIZE=800m
export OMP_MAX_ACTIVE_LEVELS=1
export MKL_NUM_THREADS=1
env |egrep '^OMP_|^MKL_'

declare -A emtoexes=( [kgrn]=kgrn_cpa [kfcd]=kfcd_cpa [bmdl]=bmdl [kstr]=kstr [shape]=shape )
declare -A emtodirs=( [kgrn]="pot chd" [kfcd]="." [bmdl]=mdl [kstr]=smx [shape]=shp )
ftype=$(head -n 1 $thisjob| cut -d " " -f 1)
ftype=${ftype,,}
exe=${emtoexes[$ftype]}

echo myid=$myid
echo thisjob=$thisjob
echo ftype=$ftype
echo exe=$exe
which $exe
pwd
mkdir -vp ${emtodirs[$ftype]}

time $exe < $thisjob

# mv $thisjob ${thisjob%.prn}.$exe
