ulimit -s unlimited
eval "$(env |egrep '^OMP_|^MKL_' | awk -F = '{print "unset "$1}')"
export OMP_NUM_THREADS=4
export OMP_STACKSIZE=800m
export OMP_MAX_ACTIVE_LEVELS=1
export MKL_NUM_THREADS=1
env |egrep '^OMP_|^MKL_' 

mkdir -p kstr/smx bmdl/mdl shape/shp kgrn/{chd,pot} kfcd
# sed -i 's/\(MSGL\.*\)=  ./\1=  1/' */*.dat
sed -i 's/\(MSGL\.*\)=  ./\1=  0/' */*.dat

cd bmdl
pwd
time bmdl < fcc.dat
cd -

cd kstr
pwd
time kstr < fcc.dat
cd -

cd shape
pwd
time shape < fcc.dat
cd -

cd kgrn
pwd
# sed -i 's/SOFC.=  N/SOFC.=  Y/' cu.dat
time kgrn_cpa < cu.dat
grep -H Converged cu.prn || { echo ERROR STOP: kgrn/cu.dat not Converged; exit 1; }
grep -H NOS cu.prn 
grep -H finished  cu.prn || { echo ERROR STOP: kgrn/cu.dat not finished ; exit 1; }
cd -

cd kfcd
pwd
time kfcd_cpa < cu.dat
grep TOT- cu.prn
