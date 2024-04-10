# exercise/04: formation energy for bcc FeCrx alloy 

In this exercise we will practice how to get formation energy of bcc {math}`Fe_{ (1-x) }Cr_x` alloy with EMTO

```{math}
E = E_{Fe_{(1-x)}Cr_x} - ( 1-x )E_{Fe_{bcc}} - x E_{Cr_{bcc}}
```

The reference states are chosen as FM Fe and NM Cr, both in bcc structure. [^1] \
For each {math}`Fe_{ (1-x) }Cr_x`, we need its equilibrium volume and correspond energy.

[^1]: [ Electronic origin of the anomalous stability of Fe-rich bcc Fe-Cr alloys ](https://journals.aps.org/prb/abstract/10.1103/PhysRevB.73.104416)

## alloy setup with CPA in kgrn

### create an input files for {math}`Fe_{50}Cr_{50}`

- we could copy the kgrn input from exercise00 and make some changes.
  * `JOBNAM=fecr`
  * `FOR001=../kstr/smx/bcc.tfh`, `FOR004=../bmdl/mdl/bcc.mdl` and `IBZ..=  3`
  * `MNTA.=  2`
  * `AFM..=  F`
  * `SOFC.=  Y`
  * `AMIX...=  0.010`
  * ```bash
    Symb   IQ IT ITA NZ  CONC   Sm(s)  S(ws) WS(wst) QTR SPLT Fix
    Fe      1  1  1  26  50.00  1.000  1.000  1.000  0.0  2.0  N
    Cr      1  1  2  24  50.00  1.000  1.000  1.000  0.0 -1.0  N
    ```
  * ```bash
    Fe
    Iz=  26 Norb= 10 Ion=  0 Config= 3d7_4s1
    n      1  2  2  2  3  3  3  3  3  4
    Kappa -1 -1  1 -2 -1  1 -2  2 -3 -1
    Occup  2  2  2  4  2  2  4  4  3  1
    Valen  0  0  0  0  0  0  0  1  1  1
    Cr
    Iz=  24 Norb=  9 Ion=  0 Config= 3d4_4s2
    n      1  2  2  2  3  3  3  3  4
    Kappa -1 -1  1 -2 -1  1 -2  2 -1
    Occup  2  2  2  4  2  2  4  4  2
    Valen  0  0  0  0  0  0  0  1  1
    ```

````{hint}
:class: dropdown
```{literalinclude} kgrn/fecr.dat
:diff: ../00/kgrn/cu.dat
```
````

- kstr, bmdl, shape and kfcd input files
````{hint}
:class: dropdown

```{literalinclude} kstr/bcc.dat
:caption: The input file (kstr/bcc.dat)
:linenos:
```

```{literalinclude} bmdl/bcc.dat
:caption: The input file (bmdl/bcc.dat)
:linenos:
```

````
- run all calculations
  ```bash
  tree
    .
  ├── bmdl
  │   ├── bcc.dat
  │   └── mdl
  ├── kfcd
  │   └── fecr.dat
  ├── kgrn
  │   ├── chd
  │   ├── fecr.dat
  │   └── pot
  ├── kstr
  │   ├── bcc.dat
  │   └── smx
  └── shape
      ├── bcc.dat
      └── shp

  11 directories, 5 files
  ```
  * check `NOS` from kgrn/fecr.prn
  ```bash
  grep -H NOS *.prn
  fecr.prn: KKRFCD: NOS(Ef) =      7.000025 ELT =      7.000000
  fecr.prn: KKRFCD: NOS(Ef) =      7.000025 ELT =      7.000000
  ```
  ````{hint}
  :class: dropdown
  increase `NCPA` to make sure cpa loop converged
  ```bash
  sed -i 's/NCPA.=  7/NCPA.= 17/' fecr.dat
  ```
  ````
### create input files with different volumes for each {math}`Fe_{(1-x)}Cr_x`

```{literalinclude} solution.sh 
:language: bash
:linenos:
```
