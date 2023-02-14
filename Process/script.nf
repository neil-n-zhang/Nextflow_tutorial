// bash variable
process FOO {

  output:
  stdout

  script:
  """
  echo "The current directory is \$PWD"
  """
}

// bash variable and nextflow variable
params.data = 'le monde'

process BAZ {

  output:
  stdout

  shell:
  '''
  X='Bonjour'
  echo $X !{params.data}
  '''
}

process BBB {

  // print output to screen
  debug true

  script:
  if( params.data == 'le monde' )
    """
    echo "French"
    """
  else if( params.data == 'world' )
    """
    echo "English"
    """
  else
    throw new IllegalArgumentException("Unknown language")
}

workflow {
  FOO().view{ it } 
  BAZ().view{ it } 
  BBB()
}

