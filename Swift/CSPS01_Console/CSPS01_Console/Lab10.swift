//
//  Lab10.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/26/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class Lab10 {
  
  // MARK: Main
  func run() {
    let a = Weight()
    let b = Weight()
    let c = Weight()
    
    IO.print(with: "An uninitialized Weight variable is ")
    a.print()
    print("\n")
    
    print("Please enter the weight of the first package:")
    a.read()
    
    print("Please enter the weight of the second package:")
    b.read()
    
    print("")
    IO.print(with: "You entered ")
    a.print()
    
    IO.print(with: " and ")
    b.print()
    print("")
    
    if (a.heavier(b)) {
      print("The first package is heavier.")
    } else if (b.heavier(a)) {
      print("The second package is heavier.\n")
    } else {
      print("The two packages are the same weight.\n")
    }
    
    IO.print(with: "Their average weight is ")
    
    var x = Weight()
    x = a.plus(b)
    x = x.times(0.5)
    x.print()
    
    //    If you really wanted, you could do all of the above
    //    Just by typing: a.plus(b).times(0.5).print()
    
    print("")
    
    c.set(poundsIn: 5, ouncesIn: 0)
    IO.print(with: "The average weight of those two packages TOGETHER WITH a package weighing ")
    c.print()
    IO.print(with: " is ")
    
    x = a.plus(b)
    x = x.plus(c)
    x = x.times(1/Double(3))
    x.print()
    
    // or, the complicated way to do
    // the above:    a.plus(b).plus(c).times(1/double(3)).print()
    print("")
  }
}
