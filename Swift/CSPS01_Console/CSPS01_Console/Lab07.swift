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
    IO.print(with: message)
    let stringOfThree = String(IO.readStdin()).componentsSeparatedByString(" ")
    
    var intArray = [Int]()
    var count    = 0
    
    for string in stringOfThree {
      intArray.append((string as NSString).integerValue)
      
      switch count {
      case 0: // check for valid hours
        while intArray[count] > 12 || intArray[count] < 1 {
          IO.print(with: "\(intArray[count]) is not between 1 and 12, please reenter: ")
          intArray[count] = IO.readStdin().integerValue
        }
        
      case 1, 2: // check for valid minutes
        while intArray[count] > 59 || intArray[count] < 0 {
          IO.print(with: "\(intArray[count]) is not between 0 and 59, please reenter: ")
          intArray[count] = IO.readStdin().integerValue
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
    IO.print(with: timeString)
  }
  
  func problemThree() {
    IO.print(with: "\n\nLab 7, Assignment #3\n")
    let (hours, minutes, seconds) = tupleOfThreeInts()
    secondsPastMidNight(hours: hours, minutes: minutes, seconds: seconds)
  }
  
  // MARK: Problem Four
  
  func isEven(n: Int) -> Bool {
    return n % 2 == 0
  }
  
  func hailstones(n: Int) -> Int {
    if isEven(n) {
      return n / 2
    } else {
      return 3 * n + 1
    }
  }
  
  func problemFour() {
    IO.print(with: "\n\nLab 7, Assignment #4\n")
    IO.print(with: "Please enter starting number: ")
    var startNumber = IO.readStdin().integerValue
    
    IO.print(with: "Please enter number of hailstones: ")
    let numberOfHailstones = IO.readStdin().integerValue
    
    IO.print(with: "\(numberOfHailstones) hailstones starting at \(startNumber) are: ")
    for _ in 0..<numberOfHailstones {
      startNumber = hailstones(startNumber)
      IO.print(with: "\(startNumber) ")
    }
    print("")
  }
  
  // MARK: Problem Five
  func isLeapYear(year: Int) -> Bool {
    var outcome = false
    if year % 4 == 0 {
      outcome = true
      if year % 100 == 0 && year % 400 != 0 {
        outcome = false
      }
    }
    return outcome
  }
  
  func problemFive() {
    IO.print(with: "\n\nLab 7, Assignment #5\n")
    IO.print(with: "Please enter a year: ")
    let year = IO.readStdin().integerValue
    if isLeapYear(year) {
      print("\(year) is a leap year.")
    } else {
      print("\(year) is NOT a leap year.")
    }
  }
  
  func run() {
    problemThree()
    problemFour()
    problemFive()
  }
}
