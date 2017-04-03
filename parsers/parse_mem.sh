#!/bin/bash
MAX_CPU=`ppc64_cpu --cores-on | awk -F= '{print $2}'`

echo "Number of threads		Bandwidth (s)"

for i in `seq 1 $MAX_CPU`
do

 	cat mem/mem_result_$i.txt | grep 'Number of threads' | awk -n -F: '{printf $2}'
        cat mem/mem_result_$i.txt | grep 'transferred' | awk -F\( \
		'{print "\t\t\t\t" $2}'  | sed 's/MB\/sec)//g'
done
