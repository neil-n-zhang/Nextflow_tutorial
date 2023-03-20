#!/usr/bin/env nextflow
include { SAYHELLO } from './modules.nf'

params.foo = 'Hola'
params.bar = 'mundo!'

// The output is Hello world!
// To avoid being ignored, pipeline parameters should be defined at the beginning of the script before any include declarations.
workflow {
    SAYHELLO()
}