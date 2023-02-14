params.outdir = 'my-results'
params.prot = '../RNAseq/data/prots/*.tfa'
proteins = Channel.fromPath(params.prot)

// Put all results in one folder
process BLASTSEQ {
    publishDir "$params.outdir/bam_files", mode: 'copy'

    input:
    path fasta

    output:
    path ('*.txt')

    script:
    """
    echo blastp $fasta > ${fasta}_result.txt
    """
}

// Put different output files in separate folders
params.reads = '../RNAseq/data/reads/*_{1,2}.fq.gz'
samples_ch = Channel.fromFilePairs(params.reads, flat: true)

process FOO {
  publishDir "$params.outdir/$sampleId/", pattern: '*.fq'
  publishDir "$params.outdir/$sampleId/counts", pattern: "*_counts.txt"
  publishDir "$params.outdir/$sampleId/outlooks", pattern: '*_outlook.txt'

  input:
    tuple val(sampleId), path('sample1.fq.gz'), path('sample2.fq.gz')

  output:
    path "*"

  script:
  """
    < sample1.fq.gz zcat > sample1.fq
    < sample2.fq.gz zcat > sample2.fq

    awk '{s++}END{print s/4}' sample1.fq > sample1_counts.txt
    awk '{s++}END{print s/4}' sample2.fq > sample2_counts.txt

    head -n 50 sample1.fq > sample1_outlook.txt
    head -n 50 sample2.fq > sample2_outlook.txt
  """
}

workflow {
  blast_ch = BLASTSEQ(proteins)
  blast_ch.view()
  
  out_channel = FOO(samples_ch)
}