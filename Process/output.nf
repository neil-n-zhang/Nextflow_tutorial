methods = ['prot','dna', 'rna']

// Output values
process FOO {

  input:
  val x

  output:
  val x

  script:
  """
  echo $x > file
  """
}

// Output files
process RANDOMNUM {

    output:
    path 'result.txt'

    script:
    """
    echo $PWD > result.txt
    """
}

workflow {
  receiver_ch1 = FOO(Channel.of(methods))
  receiver_ch1.view { "Received: $it" }

  receiver_ch2 = RANDOMNUM()
  receiver_ch2.view { "Output file: $it" }
}