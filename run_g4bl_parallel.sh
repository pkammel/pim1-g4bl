
#!/bin/bash 

INPUT="piM1_mu.g4bl"
NJOBS=60

RUNNAME=${1:-default}

mkdir -p root/run_$RUNNAME
cd root/run_$RUNNAME

for i in $(seq 1 $NJOBS); do
(
    SEED=$((1000 + $i))
    g4bl $PIM1/$INPUT seed=$SEED
) &
done

wait
echo "All jobs finished."
