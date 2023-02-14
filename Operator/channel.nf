// View
Channel
    .of('foo', 'bar', 'baz')
    .view()

Channel
    .of('foo', 'bar', 'baz')
    .view { "- $it" }


// Map: applies a function of your choosing to every item
Channel
    .of(1,2,3,4)
    .map { it -> it * it }
    .view()

Channel
    .of( 'hello', 'world' )
    .map { word -> [word, word.size()] }
    .view { word, len -> "$word contains $len letters" }
    
Channel.fromPath('../RNAseq/data/ggal/*.fq')
    .map{file -> [file.name, file] }
    .view { name, file -> "$file has name $name" }

// Mix: combines the items emitted by two (or more) channels into a single channel.
c1 = Channel.of( 1,2,3 )
c2 = Channel.of( 'a','b' )
c3 = Channel.of( 'z' )

c1 .mix(c2,c3).view()


// Flatten: every tuple is flattened so that each entry is emitted as a sole element by the resulting channel.
foo = [11,12,13]
bar = [14,15,16]

Channel
    .of(foo, bar)
    .view()

Channel
    .of(foo, bar)
    .flatten()
    .view()

// Collect: collects all of the items emitted by a channel in a list and returns the object as a sole emission
Channel
    .of( 21, 22, 23, 24 )
    .collect()
    .view()

// groupTuple: Grouping the elements that share the same key
Channel
    .of( [1,'A'], [1,'B'], [2,'C'], [3, 'B'], [1,'C'], [2, 'A'], [3, 'D'] )
    .groupTuple()
    .view()

// join
left = Channel.of(['X', 1], ['Y', 2], ['Z', 3], ['P', 7])
right = Channel.of(['Z', 6], ['Y', 5], ['X', 4])
left.join(right).view()

//brach
Channel
    .of(1,2,3,40,50)
    .branch {
        small: it < 10
        large: it >= 10
    }
    .set { result }

result.small.view { "$it is small than 10" }
result.large.view { "$it is equal or large than 10" }