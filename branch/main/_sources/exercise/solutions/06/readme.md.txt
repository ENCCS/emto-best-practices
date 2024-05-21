# exercise/06 diamond

Carbon in [A4](https://www.aflow.org/prototype-encyclopedia/A_cF8_227_a.html) structure.

2 Fcc lattice shift along the diagonal from (0,0,0) to (1/4,1/4,1/4)

```{literalinclude} kstr/A4.dat
:lineno-match:
```

Run kstr for this A4 structure, check the output file if there are some warnings.
Will be problem ?

How about we also fill up the (1/2,1/2,1/2) and (3/4,3/4,3/4), [what lattice](https://aflow.org/prototype-encyclopedia/AB2C_cF16_225_a_c_b.html) it should be?

```{literalinclude} kstr/L21.dat
:lineno-match:
```

Check the `CMDL` value from its output, and compare with bcc (exercise/04/kstr/bcc.prn)

```bash
grep CMDL L21.prn
grep ../04/kstr/bcc.prn
```

Let's use this more "close packed" structure for diamond


```{literalinclude} kgrn/c.dat
:lineno-match:
```

- `Em`: empty sites
- `CRT..=  I`
- kstr: `NL.....= 3`


[ Lattice constants for diamond ](https://www.google.com/search?q=diamond+lattice+constant) ? 

Convert to SWS ?

````{hint}
:class: dropdown
diamond structure in cubic conventional cells contains 8 atoms, we add extra 8 emtpy sites:

   ```{math}
   16\times \frac{4\pi}{3} \omega^3 = a^3
   ```
````

## Eqation of state for diamond

```{literalinclude} solution.sh
:language: bash
:lineno-match:
```

## Maybe Heusler Alloy ?
