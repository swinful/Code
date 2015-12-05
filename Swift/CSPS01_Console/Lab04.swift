//
//  Lab04.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/4/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

// Problem 2
// Write a program that asks the user to enter a list of numbers. You should keep reading 
// in numbers until you read an even number, in which case you should print out how many 
// odd numbers you read. (Should you use a while or a for? Do you know how many numbers 
// the user is going to type ahead of time?)


import Foundation

class Lab04 {
  
  // MARK: Problem One
  
  // MARK: Problem Two
  func isNumberEven(theNumber: Double) -> Bool {
    if theNumber % 2 == 0 {
      return true
    } else {
      return false
    }
  }
  
  func problemTwo() {
    IO.promptInput(with: "\n\nLab 4, Assignment #2\n")
    IO.promptInput(with: "Enter number: ")
    
    var numberEntered = IO.getInput().doubleValue
    var count = 0
    
    while !isNumberEven(numberEntered) {
      IO.promptInput(with: "Enter number: ")
      numberEntered = IO.getInput().doubleValue
      ++count
    }
    print("We read \(count) odd numbers.")
  }
  
  
  // MARK: Main run
  func run() {
    problemTwo()
  }
}
