//
//  lab02.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/14/14.
//  Copyright (c) 2014 WINFUL Samuel. All rights reserved.
//

/** 
 * 4. Write a program that asks the user for 3 integers and compute the mean
 * (average) of those integers. Here is a sample run of the program 
 * (user input has been underlined) Make sure that your output looks 
 * exactly like mine given the same input (though, of course, you don't 
 * need to underline the input):
 *
 * Please enter 3 integers: 3 9 4
 * The average of your 3 integers is 5.33333
 *
 *
 * 5. A metric ton is 35,273.92 ounces. Write a program that will read the weight of 
 * a package of breakfast cereal in ounces and output the weight in metric tons as 
 * well as the number of boxes needed to yield one metric ton of cereal. Here's a 
 * sample run of the program (user input has been underlined) Make sure that your 
 * output looks exactly like mine below given the same input:
 *
 *  Please enter the weight of the cereal in ounces: 17.5
 *  Your cereal box weighs 0.000496117 metric tons
 *  2015.65 boxes of cereal weighs one metric ton
 **/

import Foundation
class Lab02 {
  
  private var average = 0.0
  private var ourInts = [Int]()
  private var cerealInOunces: Double = 0.0
  private var cerealInMetricTons: Double = 0.0
  private var numberOfCerealBoxes: Double {
    get {
      return Constants.OneTonInOunces / cerealInOunces
    }
  }
  
  private func promptForEven() {
    print("Lab 02: #6 -----------------------------------------")
    IO.print(with: "Please enter an even number integer: ")
    if (IO.readStdin().integerValue % 2 == 0) {
      print("Thank you.")
    } else {
      print("That was not an even number.")
    }
    print("----------------------------------------------------")
  }
  
  private func getWeightOfCereal() {
    IO.print(with: "Please enter the weight of the cereal in ounces: ")
    cerealInOunces = IO.readStdin().doubleValue
  }
  
  private func computeWeightInMetricTons() {
    print("Lab 02: #5 -----------------------------------------")
    getWeightOfCereal()
    cerealInMetricTons = cerealInOunces / Constants.OneTonInOunces
    print(String(format: "Your cereal box weighs %.9f metric tons.",cerealInMetricTons))
    print(String(format: "%.2f boxes of cereal weighs one metric ton.\n", numberOfCerealBoxes))
  }
  
  private func getInts(howMany: Int) {
    for (var i = 0; i < howMany; ++i) {
      IO.print(with: "Enter an integer: ")
      ourInts.append(IO.readStdin().integerValue)
    }
  }
  
  private func computeAverage() {
    print("Lab 02: #4 -----------------------------------------")
    print("Please enter 3 integers.")
    getInts(3)
    var sum = 0.0
    
    for theInt in ourInts {
      sum += Double(theInt)
    }
    
    average = sum / 3
    print("The average of your 3 integers is \(average)\n")
  }
  
  private func isNegative(number: Int) -> Bool {
    var outcome = false
    if number < 0 {
      outcome = true
    }
    return outcome
  }
  
  private func threePositiveIntegers() {
    print("\nLab 02: #7 -----------------------------------------")
    var arrayOfInts = [Int]()
    
    IO.print(with: "Please enter three positive integers below.\n")
    for i in 1...3 {
      IO.print(with: "Integer #\(i): ")
      let enteredInt = IO.readStdin().integerValue
      if isNegative(enteredInt) {
        print("Negative integers are not allowed.")
        exit(1)
      } else {
        arrayOfInts.append(enteredInt)
      }
    }
    
    print("Here are the sorted integers: ")
    for i in arrayOfInts.sort() {
      IO.print(with: "\(i) ")
    }
    print("\n----------------------------------------------------")
  }
  
  func run() {
    computeAverage()
    computeWeightInMetricTons()
    promptForEven()
    threePositiveIntegers()
  }
}