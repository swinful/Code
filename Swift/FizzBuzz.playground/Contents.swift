//: Playground - noun: a place where people can play

func anIntIs(namedInt: Int, divisibleBy: Int) -> Bool {
  var outcome = false
  
  // if ( namedInt % divisibleBy == 0 ) { outcome = true }
  // return outcome
  return (namedInt % divisibleBy == 0 ? true : false)
}

for aNumber in 1...100 {
  if anIntIs(aNumber, divisibleBy: 3) == true {
    print("\(aNumber) - Buzz")
  }
}


print("test")
