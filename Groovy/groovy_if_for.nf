list = [1,2,3]
if( list != null && list.size() > 0 ) {
  println list
}
else {
  println 'The list is empty'
}


if( list )
    println list
else
    println 'The list is empty'

  
// The previous statement can be simplified using ternary expression (aka conditional expression)
println list ? list : 'The list is empty'

for (int i = 0; i <3; i++) {
   println("Hello World $i")
}

list = ['a','b','c']

for( String elem : list ) {
  println elem
}