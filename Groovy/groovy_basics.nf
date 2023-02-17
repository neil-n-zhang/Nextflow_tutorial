// Print
println("Hello, World!")

// comment a single config file

/*
   a comment spanning
   multiple lines
*/


// Variables
x = 1
println x

x = new java.util.Date()
println x

x = -3.1499392
println x

x = false
println x

x = "Hi"
println x

// List
list = [10,20,30,40]
// List indexes start at 0
println list[0]
println list.get(0)

println list.size()
// assert: Groovy will print nothing if it is correct, else it will raise an AssertionError message.
assert list[0] == 10
assert list[-1] == 40
assert list[-1..0] == list.reverse()

assert [1,2,3] << 1 == [1,2,3,1]
assert [1,2,3] + [1] == [1,2,3,1]
assert [1,2,3,1] - [1] == [2,3]
assert [1,2,3] * 2 == [1,2,3,1,2,3]
assert [1,[2,3]].flatten() == [1,2,3]
assert [1,2,3].reverse() == [3,2,1]
assert [1,2,3].collect{ it+3 } == [4,5,6]
assert [1,2,3,1].unique().size() == 3
assert [1,2,3,1].count(1) == 2
assert [1,2,3,4].min() == 1
assert [1,2,3,4].max() == 4
assert [1,2,3,4].sum() == 10
assert [4,2,1,3].sort() == [1,2,3,4]
assert [4,2,1,3].find{it%2 == 0} == 4
assert [4,2,1,3].findAll{it%2 == 0} == [4,2]

// Maps
// Maps are like lists that have an arbitrary key instead of an integer
map = [a:0, b:1, c:2]
print map
print map['a']
print map.b

map['a'] = 'x'           
map.b = 'y'              
map.put('c', 'z')
print map

// String
// We can use another variable by ${expression} syntax for double quotation marks
foxtype = 'quick'
foxcolor = ['b', 'r', 'o', 'w', 'n']
println "The $foxtype ${foxcolor.join()} fox"
x = 'Hello'
println '$x + $y'

// Difference between / and ' : For strings defined by /, there is no need to escape backslashes.
x = /tic\tac\toe/
y = 'tic\tac\toe'
z = 'tic\\tac\\toe'

println x
println y
println z

// Multi-line strings
text = """
    Hello there James.
    How are you today?
    """
println text

text = /
    This is a multi-line
    slashy string!
    It's cool, isn't it?!
    /
println text

println "Done."


