process SPLITLETTERS {

    output:
    path 'chunk_*'

    """
    printf 'Hola' | split -b 1 - chunk_
    """
}

species = ['cat','dog', 'sloth']
sequences = ['AGATAG','ATGCTCT', 'ATCCCAA']

Channel.fromList(species)
       .set { species_ch }

process ALIGN {

  input:
  val x
  val seq

  output:
  path "${x}.aln"

  script:
  """
  echo align -in $seq > ${x}.aln
  """
}

workflow {
    letters = SPLITLETTERS()
    letters
        .flatMap()
        .view { "File: ${it.name} => ${it.text}" }

    genomes = ALIGN( species_ch, sequences )
    genomes.view()
}