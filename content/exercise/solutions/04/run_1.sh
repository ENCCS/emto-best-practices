cd kstr
njobs=$(ls *.dat |wc -l)
jobid_kstr=$(  sbatch -A $_PROJ -c 1 -a 1-$njobs                                                           ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd shape
njobs=$(ls *.dat |wc -l)
jobid_shape=$( sbatch -A $_PROJ -c 1 -a 1-$njobs    --dependency=afterok:$jobid_kstr                      ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd bmdl
njobs=$(ls *.dat |wc -l)
jobid_bmdl=$(  sbatch -A $_PROJ -c 1 -a 1-$njobs                                                          ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kgrn
njobs=$(ls *.dat |wc -l)
jobid_kgrn=$(  sbatch -A $_PROJ -c 1 -a 1-$njobs --dependency=afterok:$jobid_kstr,$jobid_bmdl              ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
njobs=$(ls *.dat |wc -l)
jobid_kfcd=$(  sbatch -A $_PROJ -c 1 -a 1-$njobs --dependency=afterok:$jobid_bmdl,$jobid_shape,$jobid_kgrn ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )

squeue -u `whoami`
