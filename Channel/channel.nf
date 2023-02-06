// Queue channel
// A queue channel is implicitly created by process output definitions or using channel factories such as Channel.of or Channel.fromPath.
ch1 = Channel.of(1,2,3)
ch2 = Channel.of(1)
// Value channel
ch3 = Channel.value(1)

process SUM1 {
    
    input:
    val x
    val y

    output:
    stdout

    script:
    
    """
    echo Queue channel:
    echo \$(($x+$y))
    """
}

process SUM2 {
    input:
    val x
    val y

    output:
    stdout

    script:
    """
    echo Value channels:
    echo \$(($x+$y))
    """
}

workflow {
    SUM1(ch1,ch2).view()
    SUM2(ch1,ch3).view()
}