package main

import (
  "fmt"
  "errors"
  "math"
)

func  main()  {
  sum, prod, diff := SumProdDiff(2,3)
  fmt.Println("Sum : ", sum, " | Product is ", prod, "| Diff is : ", diff)

  ret1, err1 :=SquareRoot(-1)

  if err1 != nil {
    fmt.Println("Error! returns values are ",ret1, err1)
  } else {
    fmt.Println("ok, return values are ", ret1, err1)
  }

  fmt.Print("Another Example")
  if ret2, err2 := SquareRoot(5); err2 != nil {
    fmt.Println("Error! returns values are ",ret2, err2)
  } else {
    fmt.Println("ok, return values are ", ret2, err2)
  }

    fmt.Println(MySqrt2(5))
}

func SumProdDiff(i, j int) (int, int, int){
  return i+j, i*j, i-j
}

func SquareRoot(f float64) (float64, error){
  if (f<0){
    return float64(math.NaN()), errors.New("I won't be able to do a sqrt of negative number!")
  }

  return math.Sqrt(f), nil
}

//name the return variables - by default it will have 'zero-ed' values i.e. numbers are 0, string is empty, etc.
func MySqrt2(f float64) (ret float64, err error) {
    if (f < 0) {
        //then you can use those variables in code
        ret = float64(math.NaN())
        err = errors.New("I won't be able to do a sqrt of negative number!")
    } else {
        ret = math.Sqrt(f)
        //err is not assigned, so it gets default value nil
    }
    //automatically return the named return variables ret and err
    return
}
