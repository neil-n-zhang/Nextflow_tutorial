num = Channel.of( 1, 2, 3 )
num_value = Channel.value( 4 )
letters=Channel.of('a','b','c','d')

process COMBINE1 {
  debug true

  input:
  val x
  val y

  script:
  """
  echo $x and $y
  """
}

process COMBINE2 {
  debug true

  input:
  val x
  val y

  script:
  """
  echo $x and $y
  """
}

workflow {
  COMBINE1(num,letters)
  COMBINE2(num_value,letters)
}

