# exercise02: equilibrium volume for fcc copper

In this exercise we will practice how to get lattice parameters for fcc copper with EMTO code.
The main idea is to calculate total energy vs. different volumes, {math}`E(\omega)` curve, and fit to an "Equation of State" function.
Here we choose "Morse function":

```{math}
E(\omega)=a+be^{-\lambda\omega}+ce^{-2\lambda\omega}
```

`````{callout} System-specific instructions
Select instructions for the system you are using:
 ````{tabs}
  ```{group-tab} Tetralith
Instructions for use on the NAISS cluster Tetralith (NSC)
  ```

  ```{group-tab} Leonardo_Booster
Instructions for use on the EuroHPC cluster Leonardo Booster
  ```
 ````
`````

```{attention}
make sure we are in the path of `exercise/02`
```

1. we could reuse the kstr, bmdl and shape from exercise/00


````{hint}
:class: dropdown

```{literalinclude} solution.sh 
:language: bash
:lines: 5-7
```
````

2. base on 00/kgrn/cu.dat, change to different SWS and also the jobname and file name

````{hint}
:class: dropdown

```{literalinclude} solution.sh 
:language: bash
:lines: 12-24
```
````

3. base on 00/kfcd/cu.dat change to different jobnam and file name

````{hint}
:class: dropdown

```{literalinclude} solution.sh 
:language: bash
:lines: 28-38
```
````

4. run all calculations and get {math}`E(\omega)`

  - submit all kgrn jobs to the queue, use following sbatch script.
  ````{tabs}
  ```{group-tab} Tetralith
      cd kgrn
      sbatch -A naiss2024-22-241 -c 2 -a 1-9 -t 10:00 ../../emto.sbatch
  ```
  ```{group-tab} Leonardo_Booster
      cd kgrn
      sbatch -A xxxx -c 2 -a 1-9 -p lrd_all_serial -t 10:00 ../../emto.sbatch
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
      cd kgrn
      sbatch -A naiss2024-22-241 -c 1 -a 1-9 -t 10:00 ../../emto.sbatch
  ```
  ```{group-tab} Leonardo_Booster
      cd kgrn
      sbatch -A xxxx -c 1 -a 1-9 -p lrd_all_serial -t 10:00 ../../emto.sbatch
  ```
  ````
5. get total energy vs. `SWS` from kfcd output

    ````{hint}
    :class: dropdown
      ```{code-block}
      cd kfcd
      grep TOT-PBE *.prn
      ```
       here we choose PBE EXC
      ```{code-block}

      ```
      fit the 8th and 5th 
    ````
