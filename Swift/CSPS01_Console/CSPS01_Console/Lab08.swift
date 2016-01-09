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
  
    IO.print(with: "Please enter first character: ")
    var char1 = IO.readStdin().characterValue
    
    IO.print(with: "Please enter second character: ")
    var char2 = IO.readStdin().characterValue
    
    print("The first and second character entered were: \(char1) \(char2)\n")
    swapCharacters(first: &char1, second: &char2)
    
    print("After swaping values, the first and second character entered are: \(char1) \(char2)\n")
    
  }
  
  func problemOne() {
    IO.print(with: "\n\nLab 8, Assignment #1\n")
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
    IO.print(with: "\n\nLab 8, Assignment #2\n")
    var first  = 0
    var second = 0
    getTwoPositives(&first, second: &second)
    
    print("Square of first integer, \(first), is \(square(first))")
    print("Square of second integer, \(second), is \(square(second))")
  }
  
  // MARK: Problem Three
  func reorderThree(inout first: Int64, inout second: Int64, inout third: Int64) {
    
    // 
    for _ in 1...3 {
      if first > second {
        swap(&first, &second)
        if second > third {
          swap(&second, &third)
        }
      }
      
      if third < second {
        swap(&third, &second)
      }
    }
  }
  
  func problemThree() {
    IO.print(with: "\n\nLab 8, Assignment #3\n")
    var longInt1: Int64 = IO.getPositiveInteger64()
    var longInt2: Int64 = IO.getPositiveInteger64()
    var longInt3: Int64 = IO.getPositiveInteger64()
    
    reorderThree(&longInt1, second: &longInt2, third: &longInt3)
    
    print("In order: \(longInt1) \(longInt2) \(longInt3)")
    
  }
  
  func run() {
    problemOne()
    problemTwo()
    problemThree()
  }
}

