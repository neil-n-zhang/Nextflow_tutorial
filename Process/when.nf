params.dbtype = 'nr'
params.prot = '../RNAseq/data/prots/*.tfa'
proteins = Channel.fromPath(params.prot)

process FIND {
  debug true

  input:
  path fasta
  val type

  when:
  fasta.name =~ /^BB11.*/ && type == 'nr'

  script:
  """
  echo blastp -query $fasta -db nr
  """
}

workflow {
  result = FIND(proteins, params.dbtype)
}
