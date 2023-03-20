#!/usr/bin/env nextflow     

params.greeting1 = 'Hello world!'
params.greeting2 = 'Nihao world!'


include { SPLITLETTERS as SPLITLETTERS_one } from './modules.nf'
include { SPLITLETTERS as SPLITLETTERS_two } from './modules.nf'

include { CONVERTTOUPPER as CONVERTTOUPPER_one } from './modules.nf'
include { CONVERTTOUPPER as CONVERTTOUPPER_two } from './modules.nf'


workflow my_pipeline_one {
    letters_ch1 = SPLITLETTERS_one(Channel.of(params.greeting1))
    results_ch1 = CONVERTTOUPPER_one(letters_ch1.flatten())
    results_ch1.view{ it }
}

workflow my_pipeline_two {
    letters_ch2 = SPLITLETTERS_two(Channel.of(params.greeting2))
    results_ch2 = CONVERTTOUPPER_two(letters_ch2.flatten())
    results_ch2.view{ it }
}

workflow {
    my_pipeline_one()
    my_pipeline_two()
}

// You can choose which pipeline runs by using the entry flag: nextflow run workflow_named.nf -entry my_pipeline_one