#!/bin/bash

mkdir cpu
mkdir mem
mkdir file

for i in 1 2 4 8 12 24
do
	sysbench --cpu-max-prime=20000 --num-threads=$i --test=cpu run > cpu/cpu_result_$i.txt
	sysbench --num-threads=$i --test=memory run > mem/mem_result_$i.txt
	sysbench --num-threads=$i --test=fileio  --file-test-mode=rndwr  run > file/file_result_$i.txt
done
