import groovy.json.JsonSlurper

def f1 = file('../RNAseq/data/meta/regions.json')
def records1 = new JsonSlurper().parse(f1)


for( def entry : records1 ) {
  log.info "$entry.patient_id -- $entry.feature"
}
log.info "json end"


import org.yaml.snakeyaml.Yaml

def f2 = file('../RNAseq/data/meta/regions.yml')
def records2 = new Yaml().load(f2)


for( def entry : records2 ) {
  log.info "$entry.patient_id -- $entry.feature"
}