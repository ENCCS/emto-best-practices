# quickstart setup for this workshop 

`````{tabs}
````{group-tab} Tetralith
```bash
module use /proj/vasp-ws2024/emto_ws/emto/modules 
ml emtoworkshop
```
````

````{group-tab} Leonardo_Booster
```bash
module use /leonardo_scratch/fast/EUHPC_TD02_030/emto_ws2024/modules
ml emtoworkshop
```
````
`````


optional settings:


```bash
export SQUEUE_FORMAT="%.20i %.8u %.15a %.15j %.3t %9r %19S %.10M %.10L %.5D %.4C %.10Q %40R"
```
