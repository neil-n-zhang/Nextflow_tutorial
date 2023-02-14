fastqs = Channel.fromPath('../RNAseq/data/ggal/*_1.fq')
reference='../RNAseq/data/ggal/transcriptome.fa'
aligner=Channel.of('salmon',"kallisto")

process RNAQUANT {
  debug true

  input:
  path fastqs
  val reference
  each aligner

  script:
  """
  echo $aligner $reference $fastqs
  """
}

workflow {
  RNAQUANT(fastqs,reference,aligner)
}

