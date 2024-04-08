cd kstr
jobid_kstr=$(  sbatch -A $_PROJ -c 1 -a 1-12                                                           ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd shape
jobid_shape=$( sbatch -A $_PROJ -c 1 -a 1-12 --dependency=afterok:$jobid_kstr                         ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd bmdl
jobid_bmdl=$(  sbatch -A $_PROJ -c 1 -a 1-12                                                           ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kgrn
sed -i 's/SOFC.=  N/SOFC.=  Y/' *.dat
jobid_kgrn=$(  sbatch -A $_PROJ -c 8 -a 1-12 --dependency=afterok:$jobid_kstr,$jobid_bmdl              ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
jobid_kfcd=$(  sbatch -A $_PROJ -c 1 -a 1-12 --dependency=afterok:$jobid_bmdl,$jobid_shape,$jobid_kgrn ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )

squeue -u `whoami`
