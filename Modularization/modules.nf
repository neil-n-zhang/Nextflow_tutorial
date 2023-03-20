#!/usr/bin/env nextflow     

params.foo = 'Hello'
params.bar = 'world!'

def SAYHELLO() {
    println "$params.foo $params.bar"
}

process SPLITLETTERS { 
    input: 
    val x 

    output: 
    path 'chunk_*' 

    """ 
    printf '$x' | split -b 6 - chunk_  
    """ 
} 

process CONVERTTOUPPER { 
    input:  
    path y 

    output: 
    stdout 

    """ 
    rev $y  
    """ 
} 
