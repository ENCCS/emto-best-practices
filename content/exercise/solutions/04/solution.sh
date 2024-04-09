
# generate kgrn input based on kgrn/fecr.dat
for i in `seq 0 2 9` `seq 10 10 100`
do
  ccfe=$(printf "%06.2f" $i)
  cccr=$(printf "%06.2f" $((100-i)))

  folder=Fe${ccfe}Cr
  mkdir -p $folder/{kgrn,kfcd}

  ln -s $(pwd)/kstr  $folder/kstr
  ln -s $(pwd)/bmdl  $folder/bmdl
  ln -s $(pwd)/shape $folder/shape

  for j in `seq 2.57 0.02 2.67`
  do
    sws=$(printf "%4.2f" $j )

    sed -e "s/JOBNAM=.*/JOBNAM=fecr-$sws/" \
        -e "28 s/ 50.00/$ccfe/"  \
        -e "29 s/ 50.00/$cccr/"  \
        -e "s/NCPA.=  7/NCPA.= 17/"  \
        -e "s/SWS......=......../SWS......=${sws}0000/" \
        kgrn/fecr.dat > $folder/kgrn/fecr-$sws.dat

    sed -e "s/JOBNAM...=.*/JOBNAM...=fecr-$sws/" \
        kfcd/fecr.dat > $folder/kfcd/fecr-$sws.dat
  done
done
