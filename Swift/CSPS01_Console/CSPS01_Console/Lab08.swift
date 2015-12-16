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
    var char1 = IO.getInput().characterValue()
    
    IO.promptInput(with: "Please enter second character: ")
    var char2 = IO.getInput().characterValue()
    
    print("The first and second character entered were: \(char1) \(char2)\n")
    swapCharacters(first: &char1, second: &char2)
    
    print("After swaping values, the first and second character entered are: \(char1) \(char2)\n")
    
  }
  
  func problemOne() {
    returnTwoCharacters()
    
  }
  
  
  func run() {
    problemOne()
    
  }
  
}