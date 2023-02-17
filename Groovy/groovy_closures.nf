// A closure can be used to define an anonymous function
// By default, closures take a single parameter called it, the curly brackets around the expression tells the script interpreter to treat this expression as code.
square = { it * it }

assert square.call(5) == 25
assert square(9) == 81

// We can change the parameter name with the -> syntax
square = { num -> num * num }
x = [ 1, 2, 3, 4 ].collect(square)
println x

// Use two arguments
printMap = { a, b -> println "$a with value $b" }
values = [ "Yue" : "Wu", "Mark" : "Williams", "Sudha" : "Kumari" ]
values.each(printMap)


result = 0                                       
values = ["China": 1 , "India" : 2, "USA" : 3]   
values.keySet().each { result += values[it] }    
println result