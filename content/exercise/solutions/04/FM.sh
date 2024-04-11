#! /bin/bash
# generate kgrn and kfcd input files based on kgrn/fecr_FM.dat
for i in `seq 0 2 10`  `seq 30 20 90` 100
do
  cr=$(printf "%03d" $i)
  fe=$(printf "%03d" $((100-i)))
  folder=FM/FeCr$cr
  mkdir -p $folder/{kgrn,kfcd}

  ln -s $(pwd)/kstr  $folder/kstr
  ln -s $(pwd)/bmdl  $folder/bmdl
  ln -s $(pwd)/shape $folder/shape

  for sws in `seq 2.59 0.02 2.69`
  do
        # -e "s/NCPA.=.../NCPA.= 17/"  \
        # -e "s/NKY..=.../NKY..= 21/" \
    sed -e "s/JOBNAM=.*/JOBNAM=fecr-$sws/" \
        -e "28 s/ 50.00/$fe.00/"  \
        -e "29 s/ 50.00/$cr.00/"  \
        -e "s/SWS......=......../SWS......=${sws}0000/" \
        kgrn/fecr_FM.dat > $folder/kgrn/fecr-$sws.dat

    sed -e "s/JOBNAM...=.*/JOBNAM...=fecr-$sws/" \
        kfcd/fecr_FM.dat > $folder/kfcd/fecr-$sws.dat
  done
done
