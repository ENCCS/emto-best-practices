#! /bin/bash

mkdir -vp diamond/kgrn/{chd,pot}
mkdir -vp diamond/kfcd/

cd diamond
ln -s ../kstr
ln -s ../shape
ln -s ../bmdl
cd -

for sws in `seq 1.60 0.02 1.70`
do
  sed -e "s/JOBNAM=.*/JOBNAM=c_${sws}/" \
      -e "s/SWS......=......../SWS......=${sws}0000/" \
      kgrn/c.dat > diamond/kgrn/c_${sws}.dat

  sed -e "s/JOBNAM...=.*/JOBNAM...=c_${sws}/" \
      kfcd/c.dat > diamond/kfcd/c_${sws}.dat
done
