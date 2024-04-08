cd kstr
jobid_kstr=$(  sbatch -c 1 -a 1                                                              ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd shape
jobid_shape=$( sbatch -c 1 -a 1    --dependency=afterok:$jobid_kstr                         ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd bmdl
jobid_bmdl=$(  sbatch -c 1 -a 1                                                              ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kgrn
jobid_kgrn=$(  sbatch -c 9 -a 1-11 --dependency=afterok:$jobid_kstr,$jobid_bmdl              ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
jobid_kfcd=$(  sbatch -c 1 -a 1-11 --dependency=afterok:$jobid_bmdl,$jobid_shape,$jobid_kgrn ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )

squeue -u `whoami`