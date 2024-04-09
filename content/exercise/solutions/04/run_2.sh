# cd kgrn
# echo not finised kgrn
# grep -L finished *.prn | wc -l
# echo check NOS for kgrn
# grep -l finished *.prn | xargs grep NOS | awk '{printf "%s diff %10.6f\n",$0,$5-$8}'
# sed -i "s/NCPA.=  7/NCPA.= 11/" *.dat
# # sed -i "s/NCPA.=  7/NCPA.= 17/" *.dat

# njobs=$(ls *.dat |wc -l)
# jobid_kgrn=$(  sbatch -A $_PROJ -c 8 -a 1-$njobs ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )
# cd -

cd kfcd 
njobs=$(ls *.dat |wc -l)
jobid_kfcd=$(  sbatch -A $_PROJ -c 1 -a 1-$njobs --dependency=afterok:$jobid_kgrn ../../emto.sbatch |tee /dev/stderr | grep -Eo '[0-9]+' )

squeue -u `whoami`
