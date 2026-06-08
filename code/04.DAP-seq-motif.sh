while read id
do
echo "findMotifsGenome.pl /mnt/may1nov1/u5009/02.dap/04.peak/${id}_peaks.narrowPeak /mnt/may1nov1/u5009/01.genome/pal_hap2_final/Palv.hap2.chr.fa ${id} -len 6,8,10 -mset plants"
done
