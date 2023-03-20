#!/usr/bin/env nextflow     

params.greeting  = 'Hello world!' 
greeting_ch = Channel.of(params.greeting) 

include { SPLITLETTERS as SPLITLETTERS_one } from './modules.nf'
include { SPLITLETTERS as SPLITLETTERS_two } from './modules.nf'
include { SPLITLETTERS as SPLITLETTERS_three } from './modules.nf'
include { SPLITLETTERS as SPLITLETTERS_four } from './modules.nf'

include { CONVERTTOUPPER as CONVERTTOUPPER_one } from './modules.nf'
include { CONVERTTOUPPER as CONVERTTOUPPER_two } from './modules.nf'
include { CONVERTTOUPPER as CONVERTTOUPPER_three } from './modules.nf'
include { CONVERTTOUPPER as CONVERTTOUPPER_four } from './modules.nf'

workflow {
    letters_ch1 = SPLITLETTERS_one(greeting_ch)
    results_ch1 = CONVERTTOUPPER_one(letters_ch1.flatten())
    results_ch1.view{ it }

    // We can also remove the channel definitions completely from each line if we prefer
    SPLITLETTERS_two(greeting_ch)
    CONVERTTOUPPER_two(SPLITLETTERS_two.out.flatten())
    CONVERTTOUPPER_two.out.view()

    // If a process defines two or more output channels, each channel can be accessed by indexing the .out [0] [1], etc
    SPLITLETTERS_three(greeting_ch)
    CONVERTTOUPPER_three(SPLITLETTERS_three.out.flatten())
    CONVERTTOUPPER_three.out[0].view()

    // Piped output
    greeting_ch | SPLITLETTERS_four | flatten() | CONVERTTOUPPER_four | view
}