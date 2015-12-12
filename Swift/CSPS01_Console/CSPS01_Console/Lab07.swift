//
//  Lab07.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/11/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class Lab07 {
  
  // MARK: ProblemThree
  func tupleOfThreeInts() -> (Int, Int, Int) {
    let message = "Please enter the time as three integers (w/ spaces): "
    IO.promptInput(with: message)
    let stringOfThree = String(IO.getInput()).componentsSeparatedByString(" ")
    
    var intArray = [Int]()
    var count    = 0
    
    for string in stringOfThree {
      intArray.append((string as NSString).integerValue)
      
      switch count {
      case 0: // check for valid hours
        while intArray[count] > 12 || intArray[count] < 1 {
          IO.promptInput(with: "\(intArray[count]) is not between 1 and 12, please reenter: ")
          intArray[count] = IO.getInput().integerValue
        }
        
      case 1, 2: // check for valid minutes
        while intArray[count] > 59 || intArray[count] < 0 {
          IO.promptInput(with: "\(intArray[count]) is not between 0 and 59, please reenter: ")
          intArray[count] = IO.getInput().integerValue
        }
        
        default: break
      }
      count++
    }
    
    return (intArray[0], intArray[1], intArray[2])
  }
  
  func secondsPastMidNight(hours hours: Int, minutes: Int, seconds: Int) {
    let totalSeconds = ((12-hours)*60*60) + (minutes*60) + (seconds)
    let timeString = "\(hours):\(minutes):\(seconds) is \(totalSeconds) seconds past midnight.\n"
    IO.promptInput(with: timeString)
  }
  
  func problemThree() {
    let (hours, minutes, seconds) = tupleOfThreeInts()
    secondsPastMidNight(hours: hours, minutes: minutes, seconds: seconds)
  }
  
  func run() {
    problemThree()
  }
}

