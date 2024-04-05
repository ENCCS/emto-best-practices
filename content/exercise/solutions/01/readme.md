# exercise01: 4 sites conventional fcc cell for copper

In this exercise we will use a different setups for fcc lattice.

1. Copy all input files from exercise/00:

```{hint}
:class: dropdown

make sure we are in the path `exercise/`
```bash
 cp -r 00/* 01/
 rm -f 01/*/*.{prn,log,kstr,bmdl,shape,bmdl,kgrn,kfcd,out} 01/*/*/*

```


2. Modify kstr and bmdl for conventional fcc unit cell:

```{hint}
:class: dropdown
- `NQ` and `LAT`for kstr and bmdl
- `a/w` in kstr

```{literalinclude} kstr/fcc.dat
:diff: ../00/kstr/fcc.dat
```

3. put 4 Cu on these 4 sites in kgrn
```{hint}
:class: dropdown

- `NT=1` and all `IT` should be same: 4 Cu atoms should be equivalent.
- `IBZ=1` for simple cubic symmetry.

```{literalinclude} kgrn/cu.dat
:diff: ../00/kgrn/cu.dat
```

4. run all of the calculations and compare the total energy in kfcd for these 2 different fcc setups.

The energy of two setups should be same/close, but if not ?

```{hint}
:class: dropdown
we could play with the k-points for convergence test.

e.g:

- NKY=37 for 00/kgrn/cu.dat
- NKY=19 for 01/kgrn/cu.dat

```
