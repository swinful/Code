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
// ---
// Problem 3
// Write a program that accepts integers from the keyboard, and displays a running total
// after each integer. The program should stop after the user enters 0.
// ---
// Problem 4
// Write a program that asks the user for a positive integer, and prints that many 1's on 
// the screen. If the user does not enter a positive number, keep asking them for one 
// until they do so (what kind of loop do you need for this?) For example, if the user 
// entered 7, your program would print:
// 1111111




import Foundation

class Lab04 {
  
  // MARK: Common Problem Variables
  var positiveInteger = 0
  var character: Character = "*"
  
  // MARK: Common Member Function Variables
  func askForPositiveIntegerWithCharacter() -> (Int, Character) {
   let ourInteger = askForPositiveInteger()
    IO.promptInput(with: "Enter a single character: ")
    let ourCharString = IO.getInput() as String
    let ourChar = ourCharString[ourCharString.startIndex]
    
    return (ourInteger, ourChar)
  }
  
  func askForPositiveInteger() -> Int {
    IO.promptInput(with: "Enter a Positive Integer: ")
    positiveInteger = IO.getInput().integerValue
    while positiveInteger < 1 {
      IO.promptInput(with: "Enter Positive Integer: ")
      positiveInteger = IO.getInput().integerValue
    }
    return positiveInteger
  }
  
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
  
  // MARK: Problem Three
  func problemThree() {
    IO.promptInput(with: "\n\nLab 4, Assignment #3\n")
    IO.promptInput(with: "Please enter integers to total, ending with 0: ")
    var enteredInt = IO.getInput().integerValue
    var sum = 0
    while (enteredInt != 0) {
      sum += enteredInt
      print("Added: \(enteredInt); total = \(sum)")
      IO.promptInput(with: "Enter an integer: ")
      enteredInt = IO.getInput().integerValue
    }
  }
  
  // MARK: Problem Four
  func problemFour() {
    positiveInteger = askForPositiveInteger()
    for _ in 1...positiveInteger {
      IO.promptInput(with: "1")
    }
    print("")
  }
  
  // MARK: Problem Five
  func problemFive() {
    positiveInteger = askForPositiveInteger()
    
    if positiveInteger > 0 {
      for i in 1...positiveInteger {
        IO.promptInput(with: "\(i)")
      }
    }
    print("\n")
  }
  
  // MARK: Problem Six
  func problemSix() {
    var character: Character
    (positiveInteger, character) = askForPositiveIntegerWithCharacter()
    
    for _ in 1...positiveInteger {
      IO.promptInput(with: "\(character)")
    }
    print("")
  }
  
  // MARK: Problem Seven
  func problemSeven() {
    IO.promptInput(with: "Please enter a sentence terminated by a period: ")
    let string = IO.getInput() as String
    var vowelCount = 0
    
    for char in string.characters {
      switch char {
      case "A", "a", "E", "e", "I", "i", "O", "o", "U", "u":
        vowelCount++
      default: continue
        
      }
    }
    print("Your sentence contains \(vowelCount) vowels.")
  }
  
  // MARK: Main run
  func run() {
    // problemTwo()
    // problemThree()
    // problemFour()
    // problemFive()
    // problemSix()
    problemSeven()
  }
}
