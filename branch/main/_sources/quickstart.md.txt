# quick setup for this workshop 

`````{tabs}
````{group-tab} Tetralith

```bash
module use /proj/vasp-ws2024/emto_ws/emto/modules 
ml emtoworkshop
```

```bash
usereservation emtoworkshop-2024-04-16
```
copy exercise to your own place (e.g home)
```bash
cp -r /proj/vasp-ws2024/emto_ws/exercise ~/
```

````

````{group-tab} Leonardo_Booster
```bash
module use /leonardo_scratch/fast/EUHPC_TD02_030/emto_ws2024/modules
ml emtoworkshop
```
copy exercise to your own place (e.g home)
```bash
cp -r /leonardo_scratch/fast/EUHPC_TD02_030/emto_ws2024/exercise ~/
```
````
`````


optional settings:

```bash
export SQUEUE_FORMAT="%.15i %.8u %.15a %.15j %.3t %.10M %.10L %.5D %.4C %.10Q %16R %P"
alias sinfo='sinfo -o "%10D %20F %P"'
alias all-myjobs='squeue --me'
```
