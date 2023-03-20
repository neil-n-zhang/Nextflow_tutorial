#!/usr/bin/env nextflow     

params.greeting  = 'Hello world!' 
greeting_ch = Channel.of(params.greeting) 

include { SPLITLETTERS; CONVERTTOUPPER } from './modules.nf'

// Defines a workflow with named my_pipeline
workflow my_pipeline {
    // Declare the input channel
    take:
    greeting

    main:
    SPLITLETTERS(greeting)
    CONVERTTOUPPER(SPLITLETTERS.out.flatten())
    
    // Declare the output channel
    emit:
    CONVERTTOUPPER.out
}

workflow {
    my_pipeline(Channel.of(params.greeting))
    my_pipeline.out.view()
}