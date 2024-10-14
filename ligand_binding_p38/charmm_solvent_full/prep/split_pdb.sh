grep -i $1 step2_solvator.pdb > $1.pdb
echo TER >> $1.pdb
echo END >> $1.pdb

