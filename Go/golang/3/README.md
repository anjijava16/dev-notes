
[Source](http://golangtutorials.blogspot.com "Permalink to Memory, variables in memory, and pointers")

# Memory, variables in memory, and pointers

Programming involves machine instructions working on data that is available in memory. So when you want to, say, add two numbers, then both those numbers have to be available in memory. And for that to happen, you should allocate some memory space for that. In Go, you can do that easily for most types with the initialization operator.
```
    package main

    import "fmt"

    func main() {
        i := 5
        var j int
        fmt.Println("i is: ", i)
        fmt.Println("j is: ", j)
    }

i is: 5  
j is: 0
```

Here Go automatically allocates some memory for the variable i - the size of the memory allocated here is that required by a single integer. Since we have also said `i := 5`, the integer value 5 is assigned to that memory space after the space is allocated. For variable `j`, no assignment has been stated. However, Go assigns a "zero-value" by default to most data types. For numeric fields, this is the value 0.

So i now holds the value 5. And j now holds the default value 0.

### Default values of primitive types
```
    package main
    import "fmt"

    func main() {
        var i int
        fmt.Println("default int is: ", i)
        var s string
        fmt.Println("default string is: ", s)
        var f float64
        fmt.Println("default float64 is: ", f)
        var arInt [3]int
        fmt.Println("default int array is: ", arInt)
        var c complex64
        fmt.Println("default complex64 is: ", c)
    }

default int is: 0  
default string is:   
default float64 is: 0  
default int array is: [0 0 0]  
default complex64 is: (0+0i)
```


### Addresses and memory location

When there is a value stored in memory, it is stored in a physical location. This location is called its address. Many programming languages, including Go, allows you to access the data in a location by specifying its location in memory.
```
package main
import "fmt"

func main() {
  var i int
  fmt.Println("Default value of i Integer is: ", i)
  fmt.Println("Address of the i of type int is: ", &i)
  ptr := &i
  fmt.Println("address of c is: ", ptr)
  fmt.Println("value at address ", ptr, " is: ", *ptr)

}
```

When a variable holds an address, it is called a pointer. So in the example `ptr := &c`, `ptr` is a pointer and it holds the address the of `c`. Putting it differently, `ptr` is a pointer to the variable `c`. You could also say that `ptr` is a reference to the variable `c`. All of these are valid, but they tend to be used in slightly different contexts.

To illustrate, if we had `i := 5; ptr := &i`, we could roughly illustrate it as shown below. In using it, both `i` and `*ptr` refers to the integer value 5.

The actual value of the address will differ from machine to machine and even on different executions of the same program as each machine could have a different memory layout and and also the location where it is allocated could be different.

### The need for addresses/pointers/references

Why do we need the complexity of addresses, pointers and references? Why can we not just use the actual value?

One of the reasons for working with addresses is a matter of efficiency; we shall see more when we discuss pass-by-reference and pass-by-value. As a metaphor, imagine a page on Wikipedia, let's say one about Paris: [http://en.wikipedia.org/wiki/Paris][3]. If you wanted to send that entire information to somebody, one way would be to copy the entire page into a document and send it to him, say via email or as a print out. An easier and much faster alternative would be to just send the link to the page, which is a unique url/reference to it. In this case, there are no redundant copies and both of you can read the latest page about Paris. If you sent the entire page, the former method, then it is similar to 'pass-by-value' - the entire value is being passed. If you sent only the link, the latter method, then it is similar to 'pass-by-reference' which is passing the address.

Both are useful depending on what is required in a situation. When you pass by reference, there is only a single copy of the target, and therefore any changes made by one person can be seen by all. When you pass by value, there are separate copies and what is changed by one person does not affect the original.  

[1]: http://4.bp.blogspot.com/-lqjgJiK_jVI/TefRvx5CrWI/AAAAAAAABHk/-bPZ6LiisoY/s1600/memory-representation.png
[2]: http://2.bp.blogspot.com/-9xPNbIKj2P8/TefRnFC87TI/AAAAAAAABHY/Xyy8OG3f0Ak/s1600/pointer-representation.png
[3]: http://draft.blogger.com/%E2%80%9Dhttp://en.wikipedia.org/wiki/Paris%E2%80%9D

# GoLang Tutorials: Control structures - Go if else statement

A few notes:  
* A special quirk: Go requires the curly braces and the `if else` keywords to be on the same line with the corresponding braces. If not you will see errors like `missing condition in if statement` or `syntax error: unexpected semicolon or newline before else`.  
* In case of multiple expressions evaluating to true, the first one encountered in lexical order has its corresponding block executed.

Note that types like an `int` cannot be used as truth values - this is unlike languages like C, where you can use integers and pointers as truth values.

You can have the explicit values like `true` or `false`, or you can also use any expression that evaluates to a `true` or `false`. So expressions that use the operators below to generate a truth or false value is permissible.

# GoLang Tutorials: Control structures - Go for loop, break, continue, range

The `for` statement is the only available looping statement in Go. The generic statement definition is:
```
    //multiple initialization; a consolidated bool expression with && and ||; multiple ‘incrementation’
    for i, j, s := 0, 5, "a"; i < 3 && j < 100 && s != "aaaaa"; i, j, s = i+1, j+1, s + "a"  {
        fmt.Println("Value of i, j, s:", i, j, s)
    }

Value of i, j, s: 0 5 a  
Value of i, j, s: 1 6 aa  
Value of i, j, s: 2 7 aaa  
```

### break keyword

We are making use of the `break` keyword to end a loop when a particular condition is met.

### continue keyword

The `continue` keyword allows you to go back to the beginning of the `for` loop, skipping the portions of the code following the `continue` statement.

### range keyword

The `range` keyword allows you to iterate over items of a list like an array or a map. For understanding it, you could translate the `range` keyword to _for each index of_. When used with arrays and slices, it returns the integer index of the item. When used with maps, it returns the key of the next key-value pair. It works with returning either one value or two. If only one, it is the index of the item, and if it is two then it is the index and the corresponding value.

### Control structures - Go defer statement

The defer statement allows you to designate specified functions to be executed just before returning from the current function block. Why would this be useful? In programming we often have to allocate/block/lock resources, but then the program abruptly ends in between and is unable to reach the part of the code where we un-allocate/unblock/unlock these sources, which is not a good thing. By using defer we are ensuring that we free up all these resources whatever happens.

You are allowed to call multiple defer-ed functions. When you do, it behaves like a stack: the functions are execute in Last In First Out (LIFO) order.


### Multiple return values from Go functions

declaration as `func SumProdDiff(i, j int) (int, int, int)`
return as `return sum, prod, diff`
call it as `s, p, d := SumProdDiff(value1, value2)`
