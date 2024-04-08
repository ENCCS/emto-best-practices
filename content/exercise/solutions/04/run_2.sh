cd kgrn
echo not finised kgrn
grep -L finished kgrn/*.prn | wc -l
grep -l finished kgrn/*.prn | xargs grep NOS | awk '{printf "%s diff %10.6f\n",$0,$5-$8}'
sed -i "s/NCPA.=  7/NCPA.= 11/" *.dat

jobid_kgrn=$(  sbatch -c 9 -a 1-11 ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
cd -

cd kfcd 
jobid_kfcd=$(  sbatch -c 1 -a 1-11 --dependency=afterok:$jobid_kgrn ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )

squeue -u `whoami`
