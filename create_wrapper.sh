macrofile=$1

macroname=$(echo $macrofile | tr "/" "\n" | tail -1)
wrappername="wrappers/${macroname::-4}.sh"
echo "$macrofile > $wrappername"

echo "source /global/cfs/cdirs/m2676/users/lpaudel/cryostatsim/setup_mage.sh" > $wrappername
echo "/global/homes/l/laxman/sw/bin/MaGe $macrofile" >> $wrappername
