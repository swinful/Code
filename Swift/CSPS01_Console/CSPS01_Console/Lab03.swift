//
//  Lab03.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 11/25/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class Lab03 {
  
  var accountNumber: Int = 0
  var balance:       Double = 0.0
  var totalCharges:  Double = 0.0
  var totalPayments: Double = 0.0
  var allowedLimit:  Double = 0.0
  var inches = 0
  var feetAndInches = (0,0)
  
  // MARK: Problem One
  func promptForInches() {
    IO.print(with: "Please enter the length of your object in inches: ")
    inches = IO.readStdin().integerValue
  }
  
  func calculateFeetAndInches(inches: Int) {
    if inches <= 12 {
      feetAndInches = (inches, 0)
    } else {
      feetAndInches = (inches / 12, inches % 12)
    }
  }
  
  func displayFeetAndInches() {
    IO.print(with: "A \(inches) inch long object is \(feetAndInches.0) feet \(feetAndInches.1) inches.\n")
  }
  
  func problemOne() {
    IO.print(with: "Lab 3: Assignment 1\n\n")
    promptForInches()
    calculateFeetAndInches(inches)
    displayFeetAndInches()
  }
  
  
  // MARK: Problem Two
  func collectAndPerformFacts() {
    IO.print(with: "Account number: ")
    accountNumber = IO.readStdin().integerValue
    
    IO.print(with: "Account balance: ")
    balance = IO.readStdin().doubleValue
    
    IO.print(with: "Account total charges: ")
    totalCharges = IO.readStdin().doubleValue
    
    IO.print(with: "Account total payments: ")
    totalPayments = IO.readStdin().doubleValue
    
    IO.print(with: "Allowed credit limit: ")
    allowedLimit = IO.readStdin().doubleValue
    
    let newBalance = balance + totalCharges - totalPayments
    
    if newBalance > allowedLimit {
      IO.print(with: "Account number: \(accountNumber)\nCredit limit: \(allowedLimit)\n New balance: \(newBalance)\n")
      IO.print(with: "Credit Limit Exceeded!")
    }
    
  }
  
  func problemTwo() {
    IO.print(with: "\n\nLab 3: Assignment 2\n")
    collectAndPerformFacts()
  }
  
  // MARK: Problem Three
  func problemThree() {
    IO.print(with: "\n\nLab 3: Assignment 3\n")
    if "A" > "b"  {
      print("Lower case letters are bigger than upper case letters")
    } else {
      print("Upper case letters are bigger than lower case letters")
    }
  }
  
  // MARK: Problem Four
  var totalPennies:  Int = 0
  var totalDollars:  Int {
    get {
      if totalPennies < 100 {
        return 0
      } else  {
        return totalPennies / 100
      }
    }
  }
  
  enum Bill: Int {
    case One  = 1
    case Five = 5
    case Ten  = 10
  }
  
  enum Coin: Int {
    case Dollar  = 100
    case Quarter = 25
    case Dime    = 10
    case Nickel  = 5
    case Penny   = 1
  }
  
  func numberOfDollars(from bill: Bill) -> Int {
    if totalPennies < bill.rawValue {
      return 0
    } else {
      let denomination = totalDollars / bill.rawValue
      totalPennies -= (denomination * bill.rawValue) * 100
      return denomination
    }
  }
  
  func numberOfCoins(from coin: Coin) -> Int {
    if totalPennies < coin.rawValue {
      return 0
    } else {
      let denomination = totalPennies / coin.rawValue
      totalPennies -= denomination * coin.rawValue
      return denomination
    }
  }
  
  func collectWholeCentsAndPrintBills() {
    IO.print(with: "Enter whole number of cents: ")
    totalPennies = IO.readStdin().integerValue
    let tens     = numberOfDollars(from: Bill.Ten)
    let fives    = numberOfDollars(from: Bill.Five)
    let ones     = numberOfCoins(from: Coin.Dollar)
    let quarters = numberOfCoins(from: Coin.Quarter)
    let dimes    = numberOfCoins(from: Coin.Dime)
    let nickels  = numberOfCoins(from: Coin.Nickel)
    let pennies  = numberOfCoins(from: Coin.Penny)
    
    print("\(tens) Ten dollar bills")
    print("\(fives) Five dollar bills")
    print("\(ones) One dollar bills")
    print("\(quarters) Quarters")
    print("\(dimes) Dimes")
    print("\(nickels) Nickels")
    print("\(pennies) Pennies")
  }
  
  func problemFour() {
    IO.print(with: "\n\nLab 3: Assignment 4\n")
    collectWholeCentsAndPrintBills()
  }
  
  // MARK: Main Run
  func run() {
    problemOne()
    problemTwo()
    problemThree()
    problemFour()
  }
}