
[Source](http://golangtutorials.blogspot.com)

# GoLang Tutorials: Structs in Go

* Go does not have a 'class' keyword. A `struct` is what you would use for a parallel concept in Go.
* In some object oriented languages, methods are composed within a class or struct. In Go, they are 'associated' with a struct.

`Partial code: In Java `  



    class House {
        public String getHouseName() {  //method defined within class
            //implementation
        }
    }



`Partial code: In Go`


    type House struct { }

    func (h House) GetHouseName() string { } //method defined outside of struct, but works on House



Now let's learn how to create structs and their specialities in Go that allows us to get all the goodness of object oriented programming without actually needing it. A struct is defined with the `type` and `struct` keywords.


    type my_struct_name struct { }

    type Rectangle struct { }

    type Vehicle struct { }

    type Vehicle1_Car struct { }



All of the above are valid definitions since they follow the Go variable naming conventions. The ones below are not valid.


    type Hash# struct {} //cannot have special characters
    type 0struct struct {} //cannot start with a number



Next up, structs can contain other data. So a struct, like a class, allows you to define the contents of the real world item that you are trying to represent and layout memory accordingly. Here are some valid examples.


    type my_struct_name struct {
        i int
        j int
        s string
    }

    type Rectangle struct {
        length, width int //you can define multiple items of the same type on the same line separated by commas
        area float64
    }



Now on to using structs in code. We shall retain a part of our Rectangle class and print it.


    package main

    import "fmt"

    type Rectangle struct {
        length, width int
    }

    func main() {
        r := Rectangle{}  
        fmt.Println("Default rectangle is: ", r) //print default zero-ed value
    }


Default rectangle is: {0 0}


There is one important thing to notice in the output: the values of the variables within the struct are zero-ed, i.e. an int will be 0, a string will be empty, etc. So in effect, the struct also has a zero-ed initialized value depending on the type of its constituents.

In the next example, we look at different ways of initializing a struct, setting values for variables within it, and also default printing.


    package main

    import "fmt"

    type Rectangle struct {
        length, width int
        name string
    }

    func main() {
        r1 := Rectangle{2, 1, "my_r1"} //initialize values in order they are defined in struct
        fmt.Println("Rectangle r1 is: ", r1)

        r2 := Rectangle{width:3, name:"my_r2", length:4} //initialize values by variable name in any order
        fmt.Println("Rectangle r2 is: ", r2)

        pr := new (Rectangle) //get pointer to an instance with new keyword
        (*pr).width = 6 //set value using . notation by dereferencing pointer.  
        pr.length = 8 //set value using . notation - same as previous.  There is no -&gt; operator like in c++. Go automatically converts
        pr.name = "ptr_to_rectangle"
        fmt.Println("Rectangle pr as address is: ", pr) //Go performs default printing of structs
        fmt.Println("Rectangle pr as value is: ", *pr) //address and value are differentiated with an &amp; symbol
    }


Rectangle r1 is: {2 1 my_r1}  
Rectangle r2 is: {4 3 my_r2}  
Rectangle pr as address is: &amp;{8 6 ptr_to_rectangle}  
Rectangle pr as value is: {8 6 ptr_to_rectangle}


The few things to notice here are:  
* you can initialize the values within the struct by mentioning it within curly braces in the order in which they appear, each one separated by commas. `r1 := Rectangle{2, 1, "my_r1"}`  
* you can initialize values by giving the name of the variable and its value separated by a colon. `r2 := Rectangle{width:3, name:"my_r2", length:4}`  
* you can get a pointer to a newly created struct instance using the `new` keyword.   
* a pointer thus obtained, can be used with or without using the * operator to get variables within it  
* Go provides default print mechanisms for structs based on its values.

###  Encapsulation and visibility of structs and variables

Other programming languages use a few keywords like public, private, package, protected, etc. to allow the developer to define the visibility and accessibility of variables within different contexts. I thought all of that was absolutely necessary until I saw Go's approach to it. Go's approach to variable visibility and accessibility is so simple that you'll think it is pretty silly. So, without further ado, here it is: if the first letter is capital, it is visible outside the package. That's it.

`Partial code`  



    type notExported struct { //this struct is visible only in this package as it starts with small letter
    }

    type Exported struct { //variable starts with capital letter, so visible outside this package
        notExportedVariable int //variable starts with small letter, so NOT visible outside package
        ExportedVariable int //variable starts with capital letter, so visible outside package
        s string //not exported
        S string //exported
    }   



How is this nothing short of silly you ask? And I say it is nothing short of genius. A simple idea that works so well. For one, all those unwanted extra keywords are eliminated. The second important outcome is that just by looking at the variable you know of its accessibility; you won't have to scroll back to the definition to find out its visibility. Other languages have provided this as a guideline in their variable naming conventions, but Go enforces it and makes it work very well.
