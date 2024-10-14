#! /bin/bash

CHARMMEXEC=/data/homezvol0/rhayes1/CHARMM/chv5/charmm_exe/gnu/charmm
source ~/modules
source ../alf-20230911/setupenv
export CRITERIA=3.2e-4

# Set slurm options for cluster
export SLURMOPTSMD="--time=1440 --ntasks=5 --tasks-per-node=1 --cpus-per-task=1 -p free-gpu --gres=gpu:1 --export=ALL"
export SLURMOPTSPP="--time=1440 --ntasks=1 --tasks-per-node=1 --cpus-per-task=1 -p free-gpu --gres=gpu:1 --export=ALL"

# Run flattening
DEPEND=""
PID=`sbatch --parsable $SLURMOPTSMD $DEPEND ./runflat.sh`

# Run short production
DEPEND="--dependency=afterok:$PID"
NEWDEPEND="--dependency="
COMMA=""
for p in a b c d e
do
  export step=331
  export p
  export nitt=5
  PID=`sbatch --parsable $SLURMOPTSMD --array=1-1%1 $DEPEND ./runprod.sh`
  NEWDEPEND="${NEWDEPEND}${COMMA}afterok:$PID"
  COMMA=","
done

# Run postprocessing on short production to optimize biases
DEPEND=$NEWDEPEND
export i=331
export eqS=1
export S=5
export N=5
export skipE=1
PID=`sbatch --parsable $SLURMOPTSPP $DEPEND ./postprocess.sh`

# Run medium production
DEPEND="--dependency=afterok:$PID"
NEWDEPEND="--dependency="
COMMA=""
for p in a b c d e
do
  export step=332
  export p
  export nitt=5
  PID=`sbatch --parsable $SLURMOPTSMD --array=1-4%1 $DEPEND ./runprod.sh`
  NEWDEPEND="${NEWDEPEND}${COMMA}afterok:$PID"
  COMMA=","
done

# Run postprocessing on medium production to optimize biases
DEPEND=$NEWDEPEND
export i=332
export eqS=5
export S=20
export N=5
export skipE=2
PID=`sbatch --parsable $SLURMOPTSPP $DEPEND ./postprocess.sh`

# Run long production
DEPEND="--dependency=afterok:$PID"
NEWDEPEND="--dependency="
COMMA=""
for p in a b c d e
do
  export step=333
  export p
  export nitt=5
  PID=`sbatch --parsable $SLURMOPTSMD --array=1-20%1 $DEPEND ./runprod.sh`
  NEWDEPEND="${NEWDEPEND}${COMMA}afterok:$PID"
  COMMA=","
done

# Run postprocessing on long production to optimize biases
DEPEND=$NEWDEPEND
export i=333
export eqS=25
export S=100
export N=5
export skipE=10
PID=`sbatch --parsable $SLURMOPTSPP $DEPEND ./postprocess.sh`
