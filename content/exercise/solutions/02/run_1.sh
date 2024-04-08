cd kgrn
pwd
# sed -i 's/SOFC.=  N/SOFC.=  Y/' *.dat
jobid_kgrn=$( sbatch -c 2 -a 1-9 ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
pwd
sbatch -c 1 -a 1-9 --dependency=afterok:$jobid_kgrn ../../emto.sbatch

sleep 2s ; squeue -u `whoami`
