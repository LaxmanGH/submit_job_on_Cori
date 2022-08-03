#This simulation has been done for LGND_1T_CDR cryostat gamma simulation

*step 0: you should be on cori. you have to install your own ROOT,Genant4, and MaGe. OR if you want to use the legend container, run the following in the terminal:
```sh
shifter --image docker:legendexp/legend-base:latest
```
but you should use the MaGe camke branch to load the CDR geometry. you can find the installation script(intallMaGe.py) on github repo of LEGEND.

* first, create macros file using the following code in the terminal:
```sh
for h in {1..50..1}; do python create_macro.py -sn $h; done
```
------macros are produced in ./macros directory (make sure you initially have "L1T_CDR_cryostat_10miilion_template.mac" file, also read the code in create_macro.py)--------------------------------------------------------------

*second, create the wrappers so that we can submit the jobs on cori (there should be easy script, but this is how i am doing)

## creating wrapper
```sh
for m in $(ls macros/L1T_CDR_cryosat_10miilion_*); do ./create_wrapper.sh $m;done
```
-------------make sure you have wrappers (see [:9] in sbatch_test.sh) directory created.

*third,submitting jobs:
```sh
for m in $(ls wrappers/L1T_CDR_cryostat_10miilion_*);do sbatch sbatch_test.sh $m;done
```