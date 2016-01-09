//
//  Lab05.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/7/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

// Problem 1
// Write a program that asks the user for a character and prints five copies 
// of that character on the screen. For example, if the user entered +, the 
// program would print:
// 
// +++++
//
// You must use a for loop to do this problem


// Problem 2
// Write a program that asks the user for a character and prints 3 rows, with 5 
// copies of that character on each row. For example, if the user entered *, the 
// program would print:
// 
// *****
// *****
// *****
// 
//
// Write a program that asks the user for a character, a number of rows, and a number 
// of columns, and prints a picture with that many rows and columns and that character. 
// Here's a sample run (user input has been underlined, your output should match mine 
// given the same input):
// 
// Please enter the number of columns: 4
// Please enter the number of rows: 6
// Please enter the character to print: #
// 
// Here's your picture:
// 
// ####
// ####
// ####
// ####
// ####
// ####

// Problem 4
// Write a program that prints the numbers from 1 to 5 on the screen. You must use a for 
// loop to do this problem. (Note, there is no user input in this problem)
// 12345

// Problem 5
// Write a program that displays 3 copies of the numbers from 1 to 5 so it looks like the 
// following on the screen (Note, there is no user input in this problem:)
//
// 12345
// 12345
// 12345

// Problem 6
// Write a program that displays a similar design to problem 3, but this time the number 
// of lines is read from the user. For example, if the user wants the number of lines to 
// be 6, the program will display the following design:
// 
// 12345
// 12345
// 12345
// 12345
// 12345
// 12345
// 

// Problem 7
// Write a program that displays on the screen a design similar to problem 4, but this time 
// the number of columns is also read from the user. For example, if the user wants the 
// number of lines to be 6 and the number of columns to be 3, the program will display the following design:
// 123
// 123
// 123
// 123
// 123
// 123
// 

import Foundation

class Lab05 {
  
  // MARK: Problem One
  func problemOne() {
    IO.print(with: "\n\nLab 5, Assignment #1\n")
    IO.print(with: "Please enter a character: ")
    let response = String(IO.readStdin())
    let character = response[response.startIndex]
    for _ in 0..<5 {
      IO.print(with: "\(character)")
    }
    print("")
    
  }
  
  // MARK: Problem Two
  func problemTwo() {
    IO.print(with: "\n\nLab 5, Assignment #2\n")
    IO.print(with: "Please enter a character: ")
    let response = String(IO.readStdin())
    let character = response[response.startIndex]
    for _ in 0..<3 {
      for _ in 0..<5 {
        IO.print(with: "\(character)")
      }
      print("")
    }
  }
  
  // MARK: Problem Three
  func problemThree() {
    IO.print(with: "\n\nLab 5, Assignment #3\n")
    IO.print(with: "Please enter the number of columns: ")
    let columns = IO.readStdin().integerValue
    
    IO.print(with: "Please enter the number of rows: ")
    let rows = IO.readStdin().integerValue
    
    IO.print(with: "Please enter the character to print: ")
    let string = String(IO.readStdin())
    let character = string[string.startIndex]
    
    for _ in 0..<rows {
      for _ in 0..<columns {
        IO.print(with: "\(character)")
      }
      print("")
    }
    print("")
  }
  
  // MARK: Problem Four
  func problemFour() {
    IO.print(with: "\n\nLab 5, Assignment #4\n")
    for i in 1...5 {
      IO.print(with: "\(i)")
    }
    print("")
  }
  
  // MARK: Problem Five
  func problemFive() {
    IO.print(with: "\n\nLab 5, Assignment #5\n")
    for _ in 1...3 {
      for i in 1...5 {
        IO.print(with: "\(i)")
      }
      print("")
    }
  }
  
  // MARK: Problem Six
  func problemSix() {
    IO.print(with: "\n\nLab 5, Assignment #6\n")
    IO.print(with: "Please enter the number of lines: ")
    let lines = IO.readStdin().integerValue
    for _ in 0..<lines {
      for i in 1...5 {
        IO.print(with: "\(i)")
      }
      print("")
    }
  }
  
  func problemSeven() {
    IO.print(with: "\n\nLab 5, Assignment #7\n")
    IO.print(with: "Please enter the number of columns: ")
    let columns = IO.readStdin().integerValue
    
    IO.print(with: "Please enter the number of rows: ")
    let rows = IO.readStdin().integerValue
    
    for _ in 0..<rows {
      for i in 1...columns {
        IO.print(with: "\(i)")
      }
      print("")
    }
    print("")
  }
  
  // MARK: Main run
  func run() {
    problemOne()
    problemTwo()
    problemThree()
    problemFour()
    problemFive()
    problemSix()
    problemSeven()
  }
}