#!/bin/bash

rm -fr cpu mem file
mkdir cpu mem file

MAX_CPU=`ppc64_cpu --cores-on | awk -F= '{print $2}'`

DEBUG="no"

for i in `seq 1 $MAX_CPU`
do
	if [ "$DEBUG" = "yes" ] ; then
		echo $i
	else
		sysbench --cpu-max-prime=100000 --num-threads=$i --test=cpu run > cpu/cpu_result_$i.txt
		sysbench --num-threads=$i --test=memory run > mem/mem_result_$i.txt
		sysbench --num-threads=$i --test=fileio  --file-test-mode=rndwr  run > file/file_result_$i.txt
	fi
done
