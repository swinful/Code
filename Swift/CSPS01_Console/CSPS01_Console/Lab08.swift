//
//  Lab08.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/15/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//
// Problem 1:
// 
// Write a program that asks the user for two characters. It should print the characters, 
// then call a "swap" function (as described in class), and then print the (swapped) 
// characters again (so the order is reversed).
// 
// Your swap function must have the following prototype:
// 
// void swap (char &c1, char &c2);

// Problem 2:
//
// Write a program that asks the user for 2 positive integers (if either number entered 
// is not positive you should keep asking for that number until you get a positive number) 
// and then prints out the square of each number. To do this, you must use two functions 
// with the following prototypes:
//
// int square_int (int num);
// void get_two_positives (int &first, int &second);


import Foundation

class Lab08 {
  
  // MARK: Problem One
  func swapCharacters(inout first first:Character, inout second:Character) {
    let tmp = first
    first  = second
    second = tmp
  }
  
  /**
   * Pre-Condition:
   * Post-Condition:
   *
   **/
  func returnTwoCharacters() {
  
    IO.promptInput(with: "Please enter first character: ")
    var char1 = IO.getInput().characterValue
    
    IO.promptInput(with: "Please enter second character: ")
    var char2 = IO.getInput().characterValue
    
    print("The first and second character entered were: \(char1) \(char2)\n")
    swapCharacters(first: &char1, second: &char2)
    
    print("After swaping values, the first and second character entered are: \(char1) \(char2)\n")
    
  }
  
  func problemOne() {
    returnTwoCharacters()
  }
  
  
  // MARK: Problem Two
  func getTwoPositives(inout first: Int, inout second: Int) {
    first  = IO.getPositiveInteger()
    second = IO.getPositiveInteger()
  }
  
  func square(anInt: Int) -> Int {
    return anInt * anInt
  }
  
  func problemTwo() {
    var first  = 0
    var second = 0
    getTwoPositives(&first, second: &second)
    
    print("Square of first integer, \(first), is \(square(first))")
    print("Square of second integer, \(second), is \(square(second))")
  }
  
  func run() {
    // problemOne()
    problemTwo()
    
  }
}

