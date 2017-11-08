package main
import "fmt"

  // We are going to pretend that we are doing some database operations:
  //    we make a connection and then attempt some database work.
  //    Then we act as if the database operations have crashed and return immediately.
  //    This would have left the database connection still dangling,
  //    but since we had already called the database disconnect function with a defer, this gets called now,
  //    and ensures that the connection is closed.

func main(){
  doDBOperations()

  defer fA() //defer fA called first
  defer fB() //defer fB called second
  //program/this function ends here
  //deferred functions executed in LIFO (last in first out) order.  fB() is executed first, and then fA().
}

func connectToDB(){
    fmt.Println("Ok, Connected to Database")
}

func disconnectFromDB(){
    fmt.Println("Ok, disconnect From Database")
}

func doDBOperations(){
  connectToDB()
  fmt.Println("Defereing the db disconnect")
  defer disconnectFromDB()

  fmt.Println("Doing some DB work")
  fmt.Println("Oops, some crash has happened")
  fmt.Println("Returning from function here")
  return

  // defered function will be executed here, just before actually returning.
}


func fA() {
    fmt.Println( "this is function A" )
}

func fB() {
    fmt.Println( "this is function B" )
}
