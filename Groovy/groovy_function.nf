// You can optionally specify explicit types for the function's parameters and return value (int is used here)
int fib(int n) {
    return n < 2 ? 1 : fib(n-1) + fib(n-2)
}
assert fib(10)==89

// Explicit types can be omitted, the return keyword can be omitted and the function implicitly returns the value of the last evaluated expression
def fact( n ) {
  n > 1 ? n * fact(n-1) : 1
}
assert fact(5) == 120