#! /bin/bash
# generate kgrn and kfcd input files based on kgrn/fecr.dat
for i in `seq 0 1 5` `seq 15 10 45` 50
do
  cr=$(printf "%03d" $i)
  fe=$(printf "%03d" $((50-i)))
  folder=PM/FeCr$(printf "%03d" $((2* i)) )
  mkdir -p $folder/{kgrn,kfcd}

  ln -s $(pwd)/kstr  $folder/kstr
  ln -s $(pwd)/bmdl  $folder/bmdl
  ln -s $(pwd)/shape $folder/shape

  for sws in `seq 2.59 0.02 2.69`
  do
        # -e "s/NCPA.=.../NCPA.= 17/"  \
        # -e "s/NKY..=.../NKY..= 21/" \
    sed -e "s/JOBNAM=.*/JOBNAM=fecr-$sws/" \
        -e "28 s/ 25.00/$fe.00/"  \
        -e "29 s/ 25.00/$fe.00/"  \
        -e "30 s/ 25.00/$cr.00/"  \
        -e "31 s/ 25.00/$cr.00/"  \
        -e "s/SWS......=......../SWS......=${sws}0000/" \
        kgrn/fecr_PM.dat > $folder/kgrn/fecr-$sws.dat

    sed -e "s/JOBNAM...=.*/JOBNAM...=fecr-$sws/" \
        kfcd/fecr_PM.dat > $folder/kfcd/fecr-$sws.dat
  done
done
