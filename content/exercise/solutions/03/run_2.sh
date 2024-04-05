#! /bin/bash
cd kgrn
ls *.dat |sort |cat -n
grep finished *.prn
grep -L finished *.prn| tee /dev/stderr| sed 's/.prn/.dat/' | xargs sed -i 's/AMIX...=  0.100/AMIX...=  0.020/' 

jobid_kgrn=$( sbatch -c 16 -a 8 ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
sbatch -c 1 -a 8 --dependency=afterok:$jobid_kgrn ../../emto.sbatch

sleep 2s; squeue -u `whoami`
