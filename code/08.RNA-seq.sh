mkdir 01.bam
mkdir 02.gtf
mkdir 03.tab_file
while read id
do
	mkdir -p 03.tab_file/${id}_tabfile
	echo "fastp -w 8 -i /mnt/may1nov1/u5009/06.rna/bulk/${id}_1.fq.gz -I /mnt/may1nov1/u5009/06.rna/bulk/${id}_2.fq.gz -o ${id}_clean_R1.fastq.gz -O ${id}_clean_R2.fastq.gz && hisat2 -p 8 -x /mnt/may1nov1/u5009/01.genome/pal_hap2_final/Pal_hap2 -1 ${id}_clean_R1.fastq.gz -2 ${id}_clean_R2.fastq.gz | samtools view -bS -@ 8 -| samtools sort -@ 8 -o ./01.bam/${id}.bam - && stringtie ./01.bam/${id}.bam -G /mnt/may1nov1/u5009/01.genome/pal_hap2_final/Palv.hap2.chr.longest.gff3  -o ./02.gtf/${id}.gtf -p 10 -A ./03.tab_file/${id}.tab -b ./03.tab_file/${id}_tabfile  -e && rm -f ${id}_clean_R1.fastq.gz  ${id}_clean_R2.fastq.gz" >> pal_RNA.sh
done
