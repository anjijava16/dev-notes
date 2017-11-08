package main
import "fmt"

func main(){
  if true {
    fmt.Println("True Block is executed")
  }

  if false {
    fmt.Println("False Block is executed")
  }

  a, b:=4, 5
  if a < b {
      fmt.Println("A is Less than B")
  } else if a > b {
      fmt.Println("A is Greater than B")
  } else {
      fmt.Println("A is ", a)
  }


}
