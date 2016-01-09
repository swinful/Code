//
//  Lab06.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/8/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

// Problem 1
// 
// Appendix 4 of your book describes some functions that you can use in C++ if you 
// include the appropriate files. On page 918 there are some functions that work 
// on characters. Write a program that reads a word that begins and ends with a * 
// character, and converts it so that all of the letters become upper case. Here 
// is an example (user input has been underlined):
// 
// Please enter a word beginning and ending with a *: *HeLlo*
// *HELLO*

// Problem 2
// Write a program similar to problem 1, except that it converts all lower case 
// letters to upper case, and vice versa
// Please enter a word beginning and ending with a *: *HeLlo*
// *hElLO*

// Problem 3
// Write a program that asks the user for two odd integers. Your program should
// count up (by 2's) from the smaller number to the larger number, and print as 
// it counts. Here's a sample run.
// Please enter an odd integer: 25
// Please enter an odd integer: 12
// 12 is not odd, please try again: 11
// 11 13 15 17 19 21 23 25

// Because we've just learned about functions, I want you to get some practice with 
// writing functions, so you must write and use the following functions:

// int get_odd_int ( );
// get_odd_int asks the user to input an odd integer. If the user does, that integer 
// is returned, otherwise the user is repeatedly asked again until they do give an odd
// integer, which is then returned

// void print_by_twos(int smaller, int bigger);
// This function prints out the odd numbers between smaller and bigger inclusive with
// spaces in between.  For example, if smaller is 1 and bigger is 7 this will print
// 1 3 5 7

// It is assumed that smaller and bigger are both odd. It is also assumed that smaller
// is less than bigger. If either of these assumptions are broken, the function may 
// behave unpredictably.


import Foundation

class Lab06 {

  // MARK: Problem One
  func problemOne() {
    IO.print(with: "\n\nLab 6, Assignment #1\n")
    IO.print(with: "Please enter a word beginning and ending with a *: ")
    let stringValue = String(IO.readStdin()).uppercaseString
    print("\(stringValue)")
  }
  
  // MARK: Problem Two
  
  func toggleCase(aChar: Character) -> Character {
    var aCharString = String(aChar)
    
    if aCharString == aCharString.uppercaseString {
      aCharString = aCharString.lowercaseString
    } else {
      aCharString = aCharString.uppercaseString
    }
    
    let aCharFlipped = aCharString[aCharString.startIndex]
    return aCharFlipped
  }

  func problemTwo() {
    IO.print(with: "\n\nLab 6, Assignment #2\n")
    IO.print(with: "Please enter a word beginning and ending with a *: ")
    let stringValue = String(IO.readStdin())
    for character in stringValue.characters {
      IO.print(with: "\(toggleCase(character))")
    }
  }

  // MARK: Problem Three
  func getOddInt() -> Int {
    IO.print(with: "Please enter an odd integer: ")
    var anInt = IO.readStdin().integerValue
    while(anInt % 2 == 0) {
      IO.print(with: "\(anInt) is not odd, please try again: ")
      anInt = IO.readStdin().integerValue
    }
    
    return anInt
  }
  
  func printByTwos(smaller: Int, larger: Int) {
    var start = smaller
    var end   = larger
    
    if smaller >= larger {
      start = larger
      end = smaller
    }
    
    while start <= end {
      IO.print(with: "\(start) ")
      start+=2
    }
    print("")
  }

  func problemThree() {
    IO.print(with: "\n\nLab 6, Assignment #3\n")
    printByTwos(getOddInt(), larger: getOddInt())
  }
  
  // MARK: Problem Four
  
  func min(num1: Double, num2: Double) -> Double {
    if num1 >= num2 {
      return num2
    } else {
      return num1
    }
  }
  
  func problemFour() {
    IO.print(with: "\n\nLab 6, Assignment #4\n")
    var smallest = IO.getPositiveDouble()
    
    for _ in 1...3 {
      let positiveDouble = IO.getPositiveDouble()
      if positiveDouble < smallest {
        smallest = positiveDouble
      }
    }
    print("The smallest double was: \(smallest)")
  }
  
  // MARK: Problem Five
  func getSymbolCharacter() -> Character {
    let message = "Please enter a symbol: "
    IO.print(with: message)
    let symbolString = String(IO.readStdin())
    let symbol = symbolString[symbolString.startIndex]
    return symbol
  }
  
  func drawLine(repeats: Int, symbol: Character) {
    for _ in 0..<repeats {
      IO.print(with: "\(symbol)")
    }
    print("")
  }
  
  func problemFive() {
    let positiveInteger = IO.getPositiveInteger()
    let symbol = getSymbolCharacter()
    
    for i in 1...positiveInteger {
      drawLine(i, symbol: symbol)
    }
  }
  
  
  func run() {
    problemOne()
    problemTwo()
    problemThree()
    problemFour()
    problemFive()
  }
}

