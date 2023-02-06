list = ['hello', 'world']

Channel
  .fromList(list)
  .view()


Channel.fromPath( '../RNAseq/data/**.fq*' ).view()

Channel
  .fromFilePairs('../RNAseq/data/ggal/*_{1,2}.fq')
  .view()
Channel
  .fromFilePairs('../RNAseq/data/meta/*_{1,2}.csv',flat:true)
  .view()

Channel
  .fromPath('../RNAseq/data/meta/random.txt') 
  .splitText( by: 2 )
  .subscribe {
    print it;
    print "--- end of the chunk ---\n"
  }

Channel
  .fromPath("../RNAseq/data/meta/patients_1.csv")
  .splitCsv()
  // row is a list object
  .view { row -> "${row[0]},${row[3]}" }

Channel
  .fromPath("../RNAseq/data/meta/regions.tsv", checkIfExists:true)
  // use `sep` option to parse TAB separated files
  .splitCsv(sep:'\t',header:true)
  // row is a list object
  .view(row -> "${row.patient_id}" )