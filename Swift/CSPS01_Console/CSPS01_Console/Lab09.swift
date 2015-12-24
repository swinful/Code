//
//  Lab09.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/18/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class Lab09 {
  
  // MARK: Problem One
  func problemOne() {
    
    let dOne = Date()
    let dTwo = Date()
    
    dOne.read()
    dTwo.read()
    
    if dTwo.differenceBetweenDates(dOne) > 0 {
      print("The first date happens first:")
      dOne.print()
    } else if dTwo.differenceBetweenDates(dOne) < 0 {
      print("The second date happens first:")
      dTwo.print()
    } else {
      print("Both dates are the same.")
    }
    
  }
  
  // MARK: Problem Two
  func problemTwo() {
    var dOne   = Date()
    var dTwo   = Date()
    var dThree = Date()
    
    
    print("Date One")
    dOne.read()
    
    print("Date Two")
    dTwo.read()
    
    print("Date Three")
    dThree.read()
    
    // Sort our three dates
    for _ in 1...3 {
      if dTwo.happensBefore(dOne) {
        swap(&dTwo, &dOne)
        if dThree.happensBefore(dTwo) {
          swap(&dThree, &dTwo)
        }
      }
      if dThree.happensBefore(dOne) {
        swap(&dThree, &dOne)
      }
    }
    
    print("Below are the dates in ascending order:")
    dOne.print()
    dTwo.print()
    dThree.print()
  }
  
  
  // MARK: Problem Three
  func problemThree() {
    
  }
  
  // MARK: Main
  func run() {
    // problemOne()
    // problemTwo()
    problemThree()
  }
  
}