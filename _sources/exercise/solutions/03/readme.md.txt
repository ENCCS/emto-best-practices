# exercise/03: elastic constance calculation for fcc Cu

In this exercise we will practice how to get elastic constance for fcc copper with EMTO code.

Orthorhombic distortion

```{math}
D_o(\delta_o) + I = \left[\begin{matrix}
1+\delta_o&0&0\\
0&1-\delta_o&0\\
0&0&\frac{1}{(1-\delta_o^2)}\\
\end{matrix}\right]
```

leads to energy change

```{math}
\Delta E(\delta_o) = 2Vc'\delta_o^2+O(\delta_o^4)
```

Monoclinic distortion

```{math}
D_m(\delta_m) + I = \left[\begin{matrix}
1&\delta_m&0\\
\delta_m&1&0\\
0&0&\frac{1}{(1-\delta_m^2)}\\
\end{matrix}\right]
```

leads to energy change

```{math}
\Delta E(\delta_m) = 2Vc_{44}\delta_m^2+O(\delta_m^4)
```

```{math}
B=\frac{1}{3}(c_{11}+2c_{12})
```

```{math}
c'=\frac{1}{2}(c_{11}-c_{12})
```

* Isochoric stain
  - volume not changed: SWS not changed.
  - only even order of {math}`\delta`.
* Orthorhombic distortion apply to fcc: face center orthorhombic (fco).
* Monoclinic distortion apply to fcc: body center orthorhombic (bco).

```{note}
All files for this exercise are in the path exercise/03
```

## fco lattice in emto

{math}`\delta=0.00`

```{literalinclude} kstr/fco0.dat
:caption: The input file (kstr/fco0.dat)
:language: bash
:linenos:
:emphasize-lines: 8-11
```
   
```{literalinclude} kstr/fco0.prn
:caption: In the output file (kstr/fco0.prn)
:language: bash
:lines: 27-41
```
{math}`\delta=0.05`

```{literalinclude} kstr/fco5.dat
:caption: The input file (kstr/fco5.dat)
:language: bash
:linenos:
:emphasize-lines: 8-11
```
   
```{literalinclude} kstr/fco5.prn
:caption: In the output file (kstr/fco5.prn)
:language: bash
:lines: 27-41
```

## bco lattice in emto

{math}`\delta=0.00`

```{literalinclude} kstr/bco0.dat
:caption: The input file (kstr/bco0.dat)
:language: bash
:linenos:
:emphasize-lines: 8-11
```
   
```{literalinclude} kstr/bco0.prn
:caption: In the output file (kstr/bco0.prn)
:language: bash
:lines: 27-41
```
{math}`\delta=0.05`

```{literalinclude} kstr/bco5.dat
:caption: The input file (kstr/bco5.dat)
:language: bash
:linenos:
:emphasize-lines: 8-11
```
   
```{literalinclude} kstr/bco5.prn
:caption: In the output file (kstr/bco5.prn)
:language: bash
:lines: 27-41
```

## kgrn inputs

```{literalinclude} kgrn/cuf5.dat
:diff: ../00/kgrn/cu.dat
```

```{literalinclude} kgrn/cuo5.dat
:diff: ../00/kgrn/cu.dat
```
## kfcd inputs

```{literalinclude} kfcd/cuf5.dat
:diff: ../00/kfcd/cu.dat
```

```{literalinclude} kfcd/cuo5.dat
:diff: ../00/kfcd/cu.dat
```
## run the exercise03


- submit all kstr, bmdl and shape jobs to the queue, use following sbatch script.
````{tabs}
```{group-tab} Tetralith
    cd kstr
    sbatch -A naiss2024-22-241 -c 1 -a 1-12 -t 10:00 ../../emto.sbatch
```
```{group-tab} Leonardo_Booster
    cd kstr
    sbatch -A xxxx -c 1 -a 1-12 -p lrd_all_serial -t 10:00 ../../emto.sbatch
```
````
- submit all kgrn jobs to the queue, use following sbatch script.
````{tabs}
```{group-tab} Tetralith
    cd kgrn
    sbatch -A naiss2024-22-241 -c 8 -a 1-12 -t 10:00 ../../emto.sbatch
```
```{group-tab} Leonardo_Booster
    cd kgrn
    sbatch -A xxxx -c 8 -a 1-12 -p lrd_all_serial -t 10:00 ../../emto.sbatch
```
````
- check if the kgrn jobs are finished correctly.
  ```{hint}
  :class: dropdown
    ```{code-block}
    cd kgrn
    grep -L "finished" *.prn
  ```
- submit all kfcd jobs to the queue, use following sbatch script.
````{tabs}
```{group-tab} Tetralith
    cd kfcd 
    sbatch -A naiss2024-22-241 -c 1 -a 1-12 -t 10:00 ../../emto.sbatch
```
```{group-tab} Leonardo_Booster
    cd kfcd
    sbatch -A xxxx -c 1 -a 1-12 -p lrd_all_serial -t 10:00 ../../emto.sbatch
```
````

## extract the results

In kfcd folder

```bash
grep TOT-PBE cuo?.prn | awk '{if(NR==1)e0=$5;printf "%s %.6f %.6f\n" $1,NR*NR*0.0001,$5-e0}'
```
fit {math}`\delta_o^2` vs. {math}`\Delta E` with the 2nd and 3th column to get {math}`c'`.     
![bco-2.687600](https://hackmd.io/_uploads/ByifcP_Tp.png)

```bash
grep TOT-PBE cuf?.prn | awk '{if(NR==1)e0=$5;printf "%s %.6f %.6f\n" $1,NR*NR*0.0001,$5-e0}'
```
fit {math}`\delta_m^2` vs. {math}`\Delta E` with the 2nd and 3th column to get {math}`c_{44}`.     
![fco-2.687600](https://hackmd.io/_uploads/Hy8Nqw_Tp.png)
