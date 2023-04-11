rule align:
    input:
        unpack(get_fq),
        index="resources/star_genome",
    output:
        aln="results/star/{sample}-{unit}/Aligned.sortedByCoord.out.bam",
        reads_per_gene="results/star/{sample}-{unit}/ReadsPerGene.out.tab",
    log:
        "logs/star/{sample}-{unit}.log",
    params:
        idx=lambda wc, input: input.index,
        extra="--outSAMtype BAM SortedByCoordinate --quantMode GeneCounts --sjdbGTFfile {} {}".format(
            "resources/genome.gtf", config["params"]["star"]
        ),
    threads: 24
    wrapper:
        "v1.21.4/bio/star/align"
