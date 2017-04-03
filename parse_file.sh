#!/bin/bash
#MAX_CPU=`ppc64_cpu --cores-on | awk -F= '{print $2}'`
MAX_CPU=8

echo "Number of threads		Throughput (MB/s)"

for i in `seq 1 $MAX_CPU`
do

 	cat file/file_result_$i.txt | grep 'Number of threads' | awk -n -F: '{printf $2}'
        cat file/file_result_$i.txt | grep 'b/sec' | awk -F\(  '{print \
		"\t\t\t\t" $2}'  | sed 's/Mb\/sec)//g'
done
