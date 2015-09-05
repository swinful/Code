#! /usr/bin/xcrun swift

func arrayMax(theArray: [Int]) -> Int {
  var currentMax = theArray[0]
  let itsSize = theArray.count
  
  for (var i: Int = 1; i < itsSize; i++) {
    
    if (currentMax < theArray[i]) {
      currentMax = theArray[i]
    }
  }
  
  return currentMax
}

let firstArray  = [1,2,3,4,5]
let secondArray = [100, 900, 90, 40, 3, 0]
let thirdArray  = [-10, 10, -100, 0, 31, 1, 3, 5]

println(arrayMax(firstArray))
println(arrayMax(secondArray))
println(arrayMax(thirdArray))

