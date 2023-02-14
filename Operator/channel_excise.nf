Channel.fromPath("../RNAseq/data/meta/*")
    .map { file -> [ file.baseName, file ] }
    .groupTuple()
    .view()