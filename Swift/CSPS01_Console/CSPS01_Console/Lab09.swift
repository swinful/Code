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
    IO.print(with: "\n\nLab 9, Assignment #1\n")
    
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
    IO.print(with: "\n\nLab 9, Assignment #2\n")
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
    // This is repeat code from Lab08. Consider refactoring
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
    IO.print(with: "\n\nLab 9, Assignment #3\n")
    let ourRectangle = Rectangle()
    ourRectangle.read()
    ourRectangle.print()
    
    let area      = ourRectangle.area()
    let perimeter = ourRectangle.perimeter()
    
    print("Area = \(area), Perimeter = \(perimeter)\n")
  }
  
  // MARK: Problem Four
  func problemFour() {
    IO.print(with: "\n\nLab 9, Assignment #4\n")
    let r1 = Rectangle()
    let r2 = Rectangle()
    
    print("1st Rectangle")
    r1.read()
    
    print("2nd Rectangle")
    r2.read()
    
    if r1.biggerArea(r2) {
      print("1st Rectangle is bigger")
      r1.print()
    }
    
    if r2.biggerArea(r1) {
      print("2nd Rectangle is bigger")
      r2.print()
    }
  }
  
  // MARK: Problem Five
  func problemFive() {
    IO.print(with: "\n\nLab 9, Assignment #5\n")
    let baseInt = IO.getPositiveInteger()
    let rectangle = Rectangle()
    
    for i in 1...baseInt {
      rectangle.setHeight(i)
      rectangle.setWidth(i)
      rectangle.print()
    }
    print("")
  }
  
  // MARK: Main
  func run() {
    problemOne()
    problemTwo()
    problemThree()
    problemFour()
    problemFive()
  }
}
