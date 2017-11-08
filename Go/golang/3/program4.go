package main
import "fmt"

func main()  {
  //If no switch expression, the type is bool
  switch  {
    case true: fmt.Println("expression is true")
    case false: fmt.Println("expression is false")
    default: fmt.Println("Default expression")
  }


  a := 5
  switch a {
  case 1,2: fmt.Println("Value of a is either 1 or 2")
  case 3,4: fmt.Println("Value of a is either 3 or 4")
  case 5,6: fmt.Println("Value of a is either 5 or 6")
  }

  b :=5
  switch b {
  case a: fmt.Println("Value of a === b")

  }

  //In Go: when a case block is executed, all the case blocks below it are also executed, unless explicitly terminated (by say using a break statement).
  //In Go, this is not the default behavior, but if you want to achieve the same result, then use the fallthrough statement to indicate
  //that the case block following the current one has to be executed.

  k := 6
  switch k {
  case 4: fmt.Println("was <= 4"); fallthrough;
  case 5: fmt.Println("was <= 5"); fallthrough;
  case 6: fmt.Println("was <= 6"); fallthrough;
  case 7: fmt.Println("was <= 7"); fallthrough;
  case 8: fmt.Println("was <= 8"); fallthrough;
  default: fmt.Println("default case")
  }





}
