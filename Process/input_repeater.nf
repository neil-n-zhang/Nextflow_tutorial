sequences = Channel.fromPath('../RNAseq/data/prots/*.tfa')
methods = ['regular', 'espresso', 'psicoffee']

process ALIGNSEQUENCES {
  debug true

  input:
  path seq
  each mode

  script:
  """
  echo t_coffee -in $seq -mode $mode
  """
}

workflow {
  ALIGNSEQUENCES(sequences, methods)
}
