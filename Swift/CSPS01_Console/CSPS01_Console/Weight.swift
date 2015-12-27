//
//  Weight.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/25/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class Weight {
  
  // MARK: Properties
  private var pounds: Int
  private var ounces: Int
  
  
  /// read-only property.
  private var totalOunces: Int {
    get {
      return 16 * pounds + ounces
    }
    set {
      pounds = newValue / 16
      ounces = newValue % 16
    }
  }
  
  /// Constructor; MUST initialize the weight to 0 lb. 0 oz.
  init() {
    pounds = 0
    ounces = 0
  }
  
  // Prompt for and read a weight.
  //  It MUST prompt "Enter pounds: ", read a number,
  //  then prompt "Enter ounces: " and read another number.
  // You may assume the user will enter nonnegative integers.
  func read() {
    pounds = IO.getPositiveInteger("Enter pounds: ")
    ounces = IO.getPositiveInteger("Enter ounces: ")
  }
  
  // Note: The const keyboard appended to this function in C++ was used
  // to explicitly state the method was not allowed to change properties
  // of its class. Hence, an error would have been generated if rule implied
  // by const was not followed. In Swift, the keyword mutating or nonmutating
  // is not applicable here. Instead they are applicable to value types like
  // struct or enums. A class in swift is not a value type. Hence, why mutating
  // or nonmutating are not applicable. A class method in Swift can always change
  // its properties.
  /// Print this weight in the form "X lb. Y oz.", with no line breaks. 
  /// (X is the number of pounds, Y is the number of ounces.)
  ///  (For example, 5 lb. 2 oz. or 0 lb. 13 oz.)
  func print() {
    IO.print(with: "\(pounds) lb. \(ounces) oz.")
  }
  
  
  /// Sets this weight to the given number of pounds and ounces 
  // (You may assume poundsIn and ouncesIn are nonnegative.)
  func set(poundsIn poundsIn: Int, ouncesIn: Int) {
    pounds = poundsIn
    ounces = ouncesIn
  }
  
  /// Returns true if and only if this weight is heavier than otherWeight
  func heavier(otherWeight: Weight) -> Bool {
    if self.totalOunces > otherWeight.totalOunces {
      return true
    } else {
      return false
    }
  }
  
  // Returns a new weight, which equals this weight + otherWeight
  // (e.g. 2 lb. 3 oz. + 0 lb. 15 oz. = 3 lb. 2 oz.;
  //  there are 16 ounces in a pound)
  // This weight is NOT changed.
  func plus(otherWeight: Weight) -> Weight {
    
    let aNewWeight = Weight()
    aNewWeight.totalOunces = self.totalOunces + otherWeight.totalOunces
    
    return aNewWeight
  }
  
  /// Returns a new weight, which equals this weight times 'factor'
  // e.g. if A is a Weight object,
  //   A.times(2.0)  gives a new weight that's twice A.
  // This weight is NOT changed.
  func times(factor: Double) -> Weight {
    let aNewWeight = self
    aNewWeight.pounds = Int(Double(aNewWeight.pounds) * factor)
    aNewWeight.ounces = Int(Double(aNewWeight.ounces) * factor)
    
    return aNewWeight
  }
}