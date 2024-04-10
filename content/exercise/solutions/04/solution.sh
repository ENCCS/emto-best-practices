#! /bin/bash
# generate kgrn and kfcd input files based on kgrn/fecr.dat
for i in 000 002 004 006 008 010 030 050 070 090 100
do
  folder=FeCr$i
  mkdir -p $folder/{kgrn,kfcd}

  ln -s $(pwd)/kstr  $folder/kstr
  ln -s $(pwd)/bmdl  $folder/bmdl
  ln -s $(pwd)/shape $folder/shape

  for sws in `seq 2.59 0.02 2.69`
  do
        # -e "s/NCPA.=.../NCPA.= 17/"  \
        # -e "s/NKY..=.../NKY..= 21/" \
    sed -e "s/JOBNAM=.*/JOBNAM=fecr-$sws/" \
        -e "28 s/ 50.00/$i.00/"  \
        -e "29 s/ 50.00/$i.00/"  \
        -e "s/SWS......=......../SWS......=${sws}0000/" \
        kgrn/fecr.dat > $folder/kgrn/fecr-$sws.dat

    sed -e "s/JOBNAM...=.*/JOBNAM...=fecr-$sws/" \
        kfcd/fecr.dat > $folder/kfcd/fecr-$sws.dat
  done
done
