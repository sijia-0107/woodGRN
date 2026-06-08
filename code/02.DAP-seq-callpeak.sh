while read id
do
echo "macs3 callpeak -t /mnt/may1nov1/u5009/02.dap/03.map/${id}-1.q30.bam /mnt/may1nov1/u5009/02.dap/03.map/${id}-2.q30.bam /mnt/may1nov1/u5009/02.dap/03.map/${id}-3.q30.bam -c /mnt/may1nov1/u5009/02.dap/03.map/Input-8.q30.bam -g 438106270 -n ${id} -q 0.0000000001 -f BAMPE"
done
