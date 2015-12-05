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
    IO.promptInput(with: "Please enter the length of your object in inches: ")
    inches = IO.getInput().integerValue
  }
  
  func calculateFeetAndInches(inches: Int) {
    if inches <= 12 {
      feetAndInches = (inches, 0)
    } else {
      feetAndInches = (inches / 12, inches % 12)
    }
  }
  
  func displayFeetAndInches() {
    IO.promptInput(with: "A \(inches) inch long object is \(feetAndInches.0) feet \(feetAndInches.1) inches.\n")
  }
  
  func problemOne() {
    IO.promptInput(with: "Lab 3: Assignment 1\n\n")
    promptForInches()
    calculateFeetAndInches(inches)
    displayFeetAndInches()
  }
  
  
  // MARK: Problem Two
  func collectAndPerformFacts() {
    IO.promptInput(with: "Account number: ")
    accountNumber = IO.getInput().integerValue
    
    IO.promptInput(with: "Account balance: ")
    balance = IO.getInput().doubleValue
    
    IO.promptInput(with: "Account total charges: ")
    totalCharges = IO.getInput().doubleValue
    
    IO.promptInput(with: "Account total payments: ")
    totalPayments = IO.getInput().doubleValue
    
    IO.promptInput(with: "Allowed credit limit: ")
    allowedLimit = IO.getInput().doubleValue
    
    let newBalance = balance + totalCharges - totalPayments
    
    if newBalance > allowedLimit {
      IO.promptInput(with: "Account number: \(accountNumber)\nCredit limit: \(allowedLimit)\n New balance: \(newBalance)\n")
      IO.promptInput(with: "Credit Limit Exceeded!")
    }
    
  }
  
  func problemTwo() {
    IO.promptInput(with: "\n\nLab 3: Assignment 2\n")
    collectAndPerformFacts()
  }
  
  // MARK: Problem Three
  func problemThree() {
    IO.promptInput(with: "\n\nLab 3: Assignment 3\n")
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
    IO.promptInput(with: "Enter whole number of cents: ")
    totalPennies = IO.getInput().integerValue
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
    IO.promptInput(with: "\n\nLab 3: Assignment 4\n")
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