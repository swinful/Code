//
//  lab01.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/13/14.
//  Copyright (c) 2014 WINFUL Samuel. All rights reserved.
//
//  Write a program that asks the user for the year of their birth, 
//  and prints out how old they will be at the end of 2001. Here is 
//  a sample run, user input has been underlined:

//  Please enter the year of your birth: 1998
//  At the end of 2001 you will be 3 years old.


//

class Lab01 {
  
  private var yearOfBirth: Int = 0
  private var age:         Int = 0
  
  private func setYearOfBirth() {
    IO.print(with: "Please enter the year of your birth: ")
    yearOfBirth = IO.readStdin().integerValue
  }
  
  private func calculateAge() {
    age = Constants.ThisYear - yearOfBirth
  }
  
  private func tellAt() {
    print("At the end of \(Constants.ThisYear) you will be \(age) years old.")
  }
  
  func run() {
    print("Lab 01 ---------------------------------------------")
    setYearOfBirth()
    calculateAge()
    tellAt()
    print("----------------------------------------------------")
  }
}