#!/bin/bash
#MAX_CPU=`ppc64_cpu --cores-on | awk -F= '{print $2}'`
MAX_CPU=17

echo "Number of threads		Total Time (s)"

for i in `seq 1 $MAX_CPU`
do

 	cat cpu/cpu_result_$i.txt | grep 'Number of threads' | awk -n -F: '{printf $2}'
        cat cpu/cpu_result_$i.txt | grep 'total time:' | awk -F: '{print "\t" $2}' | sed 's/s//g'
done
