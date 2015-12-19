//
//  Lab09.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/18/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class Lab09 {
  
  // MARK: Problem One
  func problemOne() {
    
    let dOne = Date()
    let dTwo = Date()
    
    dOne.read()
    dTwo.read()
    
    if dTwo.differenceBetweenDates(dOne) > 0 {
      print("The first date happens first:")
      dOne.print()
    } else if dTwo.differenceBetweenDates(dOne) < 0 {
      print("The second date happens first:")
      dTwo.print()
    } else {
      print("Both dates are the same.")
    }
    
  }
  
  
  
  // MARK: Main
  func run() {
    
    problemOne()
    
  }
  
}