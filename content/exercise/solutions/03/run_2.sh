#! /bin/bash
cd kgrn
ls *.dat |sort |cat -n
grep finished *.prn

grep -l finished *.prn |parallel "mkdir -p good; mv {.}.* good/; mkdir -p ../kfcd/good; mv ../kfcd/{.}.prn ../kfcd/good/"

echo calculations are not finished:
grep -L finished *.prn

sed -i 's/AMIX...=  ...../AMIX...=  0.020/' *.dat

njobs=$(ls *.dat| wc -l)

[[ $njobs -eq 0 ]] && { echo no jobs need resubmit exit; exit 0 ; }

jobid_kgrn=$( sbatch -A $_PROJ -c 8 -a 1-$njobs ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
sbatch -A $_PROJ -c 1 -a 1-$njobs --dependency=afterok:$jobid_kgrn ../../emto.sbatch

sleep 2s; squeue -u `whoami`
