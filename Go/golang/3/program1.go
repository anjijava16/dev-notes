package main
import "fmt"

func main() {
  var i int
  fmt.Println("Default value of i Integer is: ", i)
  var name string
  fmt.Println("Default value of name String type is : ", name)
  var tasks [3]string
  fmt.Println("Default value of string arry is ", tasks)
  var age [3]int
  fmt.Println("Default value of int array is: ", age)
  var size float64
  fmt.Println("Default value of size of type float64 is: ", size)

  fmt.Println("Address of the i of type int is: ", &i)
  ptr := &i //address of i.
  fmt.Println("address of c is: ", ptr)
  fmt.Println("value at address ", ptr, " is: ", *ptr) //value at the address

}
