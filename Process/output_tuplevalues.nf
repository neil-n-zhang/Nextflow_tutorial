reads_ch = Channel.fromFilePairs('../RNAseq/data/ggal/*_{1,2}.fq')

process FOO {

  input:
    tuple val(sample_id), path(sample_files)

  output:
  // single quotation ' will cause error here
    tuple val(sample_id), path("${sample_id}.bam")

  script:
  """
    echo your_command_here --reads $sample_files > ${sample_id}.bam
  """
}

workflow {
  bam_ch = FOO(reads_ch)
  bam_ch.view()
}