
[Source](http://golangtutorials.blogspot.com/2011/05/very-simple-go-hello-world-line-by-line.html "Permalink to GoLang Tutorials: Go ‘Hello World’")

# GoLang Tutorials: Go ‘Hello World’

- In Go, all files have to be associated with a package. For now just understand that there should be a package statement at the top of every .go file and it should be followed by a name of your choice. A package is a good way to logically group various functionality in larger programs. For example, if you were writing a program to build virtual models of vehicles, you could probably put all your car models in a package called cars and all your bus models in a package called buses. Helping to to group related functionality is one of its uses. More on packages later.

Programs in Go needs to be started somewhere, and there should be a recognized way of starting it in some place. Like cars are started with an ignition key and computers are powered on with a power button, programs in Go are started at the main function.
```
package main

func main() {}
```


Let's go a bit further now and add another line now as below and try again:
```
    package main

    func main() {
     Println("Hello world")
    }
```

`Println` and certain other functions to read and write text and characters are present in a package called `fmt` \- which is the formatting package.
```
    package main

    import "fmt"

    func main() {
     fmt.Println("Hello world")
    }
```

We imported the package and then said that the Println can be found in that package by using a dot notation of composition. Let's talk about that for a moment.

In English, if we wanted to refer to a keyboard that is part of a computer, we would say: computer's keyboard  
In Go: computer.keyboard

Did you notice that last line? In Go, we use a dot notation with the composing element on the left and the composed element on the right. So more hypothetical examples: Car.Wheel, Mary.Hand, Computer.Screen, Computer.Keyboard.AKey, Computer.Keyboard.AKey.RowNumber. As you can see, the composition can be nested to multiple levels.   



# Early syntax errors and other minor errors

Sometimes we know what works right, but we don't know what works wrong. Let me make a list of a few errors that one could encounter so that you don't waste much time figuring it out.

### Unncessary Imports

`ErrProg1.go`  
```
    package main

    import "fmt"
    import "os" //excessive - we are not using any function in this package

    func main() {
     fmt.Println("Hello world")
    }

Output:

prog.go:4: imported and not used: os
```

Go is particularly parsimonious when it comes to code - if you are not going to use something, don't ask for it. Here, you have indicated that you want to import the `os` package but you haven't used it anywhere. That's not allowed. If you are not using it, remove it. If you remove the `import os`, this program will work.

### Exact Names - case dependent
```
    package main

    import "fmt"

    func main() {
     fmt.println("Hello world")
    }

Output:

prog.go:6: cannot refer to unexported name fmt.println  
prog.go:6: undefined: fmt.println  
```

Notice how we have written fmt.println and not fmt.Println. Go is case dependent, which means to say that when you use another's name, use it exactly as it is defined. If the name is John, then only John works - not john, not joHn, and no other combination. So, in this case some of the others that are not allowed:


### Separating lines with semicolons

In Go, the new line character automatically indicates the end of the line. However, if you happen to put two statements in the same line, then you need to have a semicolon separating them. Let's take a look at an example.

```
package main;

import "fmt";

func main() {
 fmt.Println("Hello world"); fmt.Println("Hi again");
};

Output:

Hello world  
Hi again  
```

### Unnecessary semicolons

```
    package main

    import "fmt";;

    func main() {
     fmt.Println("Hello world")
    }
Output:
empty top-level declaration
```

Again, Go is strictly frugal with its code. Here, alongside the import statement, there are two semicolons. Now the first one is acceptable - not necessary here, but acceptable. But two! Nope, that is where Go draws the line. The semicolon indicates the end of a statement, but there is no valid statement prior to the second semicolon. So remove the extra semicolon and all should be fine again.

### Syntax and other things

The compiler demands that you follow proper syntax. There are a large possibility of syntax errors and it wouldn't be a good idea to list them all. But I shall list a few. If you know these ones, most of the rest are just similar.


    package 'main' //ERROR - no quotes for the package name: package main
    package "main" //ERROR - no quotes for the package: package main

    package main.x  //ERROR - packages names in go are just one expression.  So either package main or package x.
    package main/x  //ERROR - packages names in go are just one expression.  So either package main or package x.

    import 'fmt' //ERROR - needs double quotes "fmt"
    import fmt //ERROR - needs double quotes "fmt"

    func main { } //ERROR - functions have to be followed by parantheses: func main() {}

    func main() [] //ERROR - where curly braces are required, only those are allowed.  They are used to contain blocks of code.  func main() {}

    func main() { fmt.Println('hello world') } //ERROR - use double quotes for strings: func main() { fmt.Println("hello world") }
