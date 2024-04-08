#! /bin/bash
cd kgrn
ls *.dat |sort |cat -n
grep finished *.prn
grep -L finished *.prn| tee /dev/stderr| sed 's/.prn/.dat/' | xargs sed -i 's/AMIX...=  0.100/AMIX...=  0.020/' 

jobid_kgrn=$( sbatch -A $_PROJ -c 2 -a 8,9 ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
sbatch -A $_PROJ -c 1 -a 8,9 --dependency=afterok:$jobid_kgrn ../../emto.sbatch

sleep 2s; squeue -u `whoami`
