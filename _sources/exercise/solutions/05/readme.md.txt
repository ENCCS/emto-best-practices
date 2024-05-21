# exercise/05: Mixing enthalpy for bcc FeCrx alloy: PM

In this exercise we will practice how to treat magnetic disorder with CPA.
It is the same story as exercise/04[^1], but here we treat the system within paramagnetic (PM) state.

```{math}
H = E_{Fe^\uparrow_{(1-x/2)}Fe^\downarrow_{(1-x/2)}Cr^\uparrow_{x/2}Cr^\downarrow_{x/2} } - ( 1-x )E_{Fe^\uparrow_{50}Fe^\downarrow_{50}} - x E_{Cr^\uparrow_{50}Cr^\downarrow_{50}}
```

[^1]: [ Electronic origin of the anomalous stability of Fe-rich bcc Fe-Cr alloys ](https://journals.aps.org/prb/abstract/10.1103/PhysRevB.73.104416)

- copy kgrn and kfcd input form exercise/04 and reuse its kstr, bmdl and shape.
  ```bash
  cp -r ../04/{kgrn,kfcd} 05/
  cd 05
  ln -s ../04/kstr
  ln -s ../04/bmdl
  ln -s ../04/shape
  cp kgrn/{fecr_FM,fecr_PM}.dat
  cp kfcd/{fecr_FM,fecr_PM}.dat
  ```
- spin {math}`\uparrow` and {math}`\downarrow` as "alloy components".

  ```{literalinclude} kgrn/fecr_PM.dat
  :caption: split the components to half in kgrn input
  :lineno-match:
  :lines: 27-31
  ```
  * remember change `MNTA.=  4`.
- add "atomic config" for the extra components.
  ```{literalinclude} kgrn/fecr_PM.dat
  :lineno-match:
  :lines: 37-60
  ```
- calculations and results processing are same as exercise/04
