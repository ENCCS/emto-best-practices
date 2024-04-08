
# generate kgrn input based on kgrn/fecr.dat
for i in `seq 00 10 100`
do
  ccfe=$(printf "%06.2f" $i)
  cccr=$(printf "%06.2f" $((100-i)))

      # -e "s/NCPA.=  7/NCPA.= 11/"  \
  sed -e "s/JOBNAM=.*/JOBNAM=Fe${ccfe}Cr/" \
      -e "28 s/ 50.00/$ccfe/"  \
      -e "29 s/ 50.00/$cccr/"  \
      kgrn/fecr.scf > kgrn/Fe${ccfe}Cr.dat
done

# generate kfcd input based on kfcd/fecr.dat
for i in `seq 00 10 100`
do
  ccfe=$(printf "%06.2f" $i)

  sed -e "s/JOBNAM...=.*/JOBNAM...=Fe${ccfe}Cr/" \
      kfcd/fecr.fcd > kfcd/Fe${ccfe}Cr.dat
done
