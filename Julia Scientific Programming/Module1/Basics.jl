# Basic arithmetics
println(1+1)
println(45-76)
println(2003*2016)
println(530/12)
println(2^10)
println(3%2)



# Read, Evaluate and Print Loop (REPL)
println("Hello, World!")
println("Hello, World!"^3) # String repetition
println("Hello" * "World!") # String concatenation
println(3+431*2, "...evaluado") # String interpolation
println('c') # Char



# Logical expressions
println(3<1)
println(3>=3)
println(6==3)
println(6!=3)
println(3<1 && 3>1)
println(3<1 || 3>1)
println(false && true || true) # false && true == false, false || true == true
println(false || sin(1.0)) # Short-circuit evaluation
println(false && sin(1.0)) # Short-circuit evaluation
println(3 & 5) # bitwise and -> 0011 & 0101 = 0001
println(8 & 5) # bitwise and -> 1000 & 0101 = 0000
println(3 | 5) # bitwise or -> 011 | 101 = 111



# Types
println(typeof(3))
println(typeof(3.0))
println(typeof("3"))
println(typeof('3'))
println(typeof(true))



# Variables and Arrays
x = Array{Int64}(undef, 3)
y = ["Hey", "Hi", "Hello"]
z = ["Hey", 'C', 3]
println(x)
println(y)
println(z)

### Arrays in Julia are 1-indexed, not 0-indexed
println(z[1])
println(z[2])
println(z[3])

### Julia allows Unicode characters as variable names
λ = 3
∑ = 4
println(λ, ∑)

### Variables can have static types, supertypes and subtypes
w::Int64 = 3 # Subtype of Integer
println(w)
g::Integer = 4 # Supertype of Int64
println(z)
xyz = Array{Integer}(undef, 2,3) # Matrix with 2 rows and 3 columns
println(xyz)
# println(xyz[2,1]) This will throw an error because the value is not initialized
println(typeof(xyz))
xyz[2,1] = 3
xyz[1,3] = 5.0 # If Julia can convert the value to the type, it will do it
println(xyz[2,1]) # This will work because the value is initialized
println(xyz[1,3])
println(xyz)



# Functions

### There are built-in functions and user-defined functions
### Built-in
a, b, c = cos(0.2), log(10), abs(-1.22)
println(a)
println(b)
println(c) # For more functions, in Julia's console press Tab two times

### Functions can have multiple dispatches
methods(muladd) # Check the methods of a function

### User-defined
### User-defined functions can be one-liners
f(x) = x^2 + 2*x + 1
println(f(3))

### Or multi-liners
function foo(x)
    return x^4 + 3*x + 1
end
println(foo(3))

### User-defined functions can have multiple dispatches too
mycos(thet::Float64) = cos(thet)
mycos(adj, hyp) = adj/hyp
println(methods(mycos))
# println(mycos(3)) This will throw an error because the function is not defined for Int64, only for Float64