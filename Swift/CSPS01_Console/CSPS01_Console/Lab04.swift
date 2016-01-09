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
    IO.print(with: "Enter a single character: ")
    let ourCharString = IO.readStdin() as String
    let ourChar = ourCharString[ourCharString.startIndex]
    
    return (ourInteger, ourChar)
  }
  
  func askForPositiveInteger() -> Int {
    IO.print(with: "Enter a Positive Integer: ")
    positiveInteger = IO.readStdin().integerValue
    while positiveInteger < 1 {
      IO.print(with: "Enter Positive Integer: ")
      positiveInteger = IO.readStdin().integerValue
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
    IO.print(with: "\n\nLab 4, Assignment #2\n")
    IO.print(with: "Enter number: ")
    
    var numberEntered = IO.readStdin().doubleValue
    var count = 0
    
    while !isNumberEven(numberEntered) {
      IO.print(with: "Enter number: ")
      numberEntered = IO.readStdin().doubleValue
      ++count
    }
    print("We read \(count) odd numbers.")
  }
  
  // MARK: Problem Three
  func problemThree() {
    IO.print(with: "\n\nLab 4, Assignment #3\n")
    IO.print(with: "Please enter integers to total, ending with 0: ")
    var enteredInt = IO.readStdin().integerValue
    var sum = 0
    while (enteredInt != 0) {
      sum += enteredInt
      print("Added: \(enteredInt); total = \(sum)")
      IO.print(with: "Enter an integer: ")
      enteredInt = IO.readStdin().integerValue
    }
  }
  
  // MARK: Problem Four
  func problemFour() {
    IO.print(with: "\n\nLab 4, Assignment #4\n")
    positiveInteger = askForPositiveInteger()
    for _ in 1...positiveInteger {
      IO.print(with: "1")
    }
    print("")
  }
  
  // MARK: Problem Five
  func problemFive() {
    IO.print(with: "\n\nLab 4, Assignment #5\n")
    positiveInteger = askForPositiveInteger()
    
    if positiveInteger > 0 {
      for i in 1...positiveInteger {
        IO.print(with: "\(i)")
      }
    }
    print("\n")
  }
  
  // MARK: Problem Six
  func problemSix() {
    IO.print(with: "\n\nLab 4, Assignment #6\n")
    var character: Character
    (positiveInteger, character) = askForPositiveIntegerWithCharacter()
    
    for _ in 1...positiveInteger {
      IO.print(with: "\(character)")
    }
    print("")
  }
  
  // MARK: Problem Seven
  func problemSeven() {
    IO.print(with: "\n\nLab 4, Assignment #7\n")
    IO.print(with: "Please enter a sentence terminated by a period: ")
    let string = IO.readStdin() as String
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
    problemTwo()
    problemThree()
    problemFour()
    problemFive()
    problemSix()
    problemSeven()
  }
}
