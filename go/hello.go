package main

import (
        "fmt"
        "strings"
        )

var(
  INPUTSTRING = "IX+III"
)
var m = map[string]int{
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000,
  }

var (
  rv = ["M","D", "C", "L", "X", "V", "I"]
  rk=  []
)

var r = map[int]string{
    1000 : "M",
    500 : "D",
    100 : "C",
    50 : "L",
    10 : "X",
    5 : "V",
    1 :"I",
 }

func main() {
    values := strings.Split(INPUTSTRING, "+")
    output_number := parse(values[0]) + parse(values[1])
    fmt.Println(unparse(output_number))
}

func parse(value string) (int) {
  letters := strings.Split(value,"")
  sum := 0
  prev := 0
  for i := len(letters) - 1; i >= 0; i-- {
    current := m[letters[i]]
    if current < prev {
      sum -= current
    }else
    {
      sum += current
    }
    prev = current
  }
  return sum
}

func unparse(value int) (string){
  tmp := value
  output := ""
  fmt.Println(tmp)
  for tmp > 0 {
    for k, v := range r{
      fmt.Println("Checking", k)
      if k <= tmp{
        fmt.Println(tmp, k, v, output)
        tmp -= k
        output += v 
      }
    }
  }
  return output
}

