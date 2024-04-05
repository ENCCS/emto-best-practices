#! /bin/bash

echo reuse kstr,bmdl,shape of fcc from exercise/00

ln -vs ../00/kstr
ln -vs ../00/bmdl
ln -vs ../00/shape

echo base on 00/kgrn/cu.dat change to different SWS and also the jobnam and file name
#

mkdir -vp kgrn/{chd,pot}

for sws in `seq 2.60 0.02 2.76`
do
  sed -e "s/JOBNAM=.*/JOBNAM=cu_${sws}/" \
      -e "s/SWS......=......../SWS......=${sws}0000/" \
    ../00/kgrn/cu.dat > kgrn/cu_${sws}.dat
done
 
# maybe we need reduce the AMIX
      # -e 's/AMIX...=  0.100/AMIX...=  0.020/' \
# soft core apprixmation is important for equilibrium volume calculation 
      # -e 's/SOFC.=  N/SOFC.=  Y/' \

echo  base on 00/kfcd/cu.dat change to different jobnam and file name

mkdir -vp kfcd
for sws in `seq 2.60 0.02 2.76`
do
  sed -e "s/JOBNAM...=.*/JOBNAM...=cu_${sws}/" \
      ../00/kfcd/cu.dat > kfcd/cu_${sws}.dat
done
# maybe we want to silence the output 
      # -e 's/MSGL..=  1/MSGL..=  0/' \
