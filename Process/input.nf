num = Channel.of( 1, 2, 3 )
reads = Channel.fromPath( '../RNAseq/data/ggal/*.fq' )

process BASICEXAMPLE {
  debug true

  input:
  val x

  script:
  """
  echo process job $x
  """
}

process FOO1 {
  debug true

  input:
  path sample

  script:
  """
  ls  $sample
  """
}

process FOO2 {
  debug true

  input:
  path sample

  script:
  """
  ls  $sample
  """
}


workflow {
  // the process is executed three times, each time a value is received from the channel
  myrun = BASICEXAMPLE(num)
  result1 = FOO1(reads)
  result2 = FOO2(reads.collect())
}

