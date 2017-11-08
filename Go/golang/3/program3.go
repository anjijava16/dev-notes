package main
import "fmt"

func main(){

  fmt.Println("Example of Control structures - Go for loop, break, continue, range")

  for i:=0;i<5;i++ {
    if i > 3 { break;}
    fmt.Println("The Value of i is : ", i)
    if i <= 3 { continue;}
  }


  // range returns array/map elemetns as array and keys.
  // If only one, it is the index of the item, and if it is two then it is the index and the corresponding value.
  
  //on an array, range returns the index
  a := [...]string{"a", "b", "c", "d"}
  for i := range a {
      fmt.Println("Array item", i, "is", a[i])
  }

  //on a map, range returns the key
  capitals := map[string] string {"France":"Paris", "Italy":"Rome", "Japan":"Tokyo" }
  for key := range capitals {
      fmt.Println("Map item: Capital of", key, "is", capitals[key])
  }

  //range can also return two items, the index/key and the corresponding value
  for key2, val := range capitals {
      fmt.Println("Map item: Capital of", key2, "is", val)
  }


}
