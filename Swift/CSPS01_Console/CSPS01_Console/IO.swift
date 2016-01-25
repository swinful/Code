//
//  IO.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 10/11/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//
import Foundation

class IO {
  
 static func print (with message: String) {
    Swift.print(message, terminator: "")
  }
  
  static func readStdin() -> NSString {
    return NSString(string: Swift.readLine()!)
  }
  
  static func getPositiveInteger64() -> Int64 {
    let message = "Please enter a long integer: "
    
    print(with: message)
    var positiveInteger64 = IO.readStdin().integerValue64
    
    while positiveInteger64 < 0 {
      print(with: message)
      positiveInteger64 = IO.readStdin().integerValue64
    }
    return positiveInteger64
  }
  
  static func getPositiveInteger(message: String = "Please enter a positive integer: ") -> Int {
    
    print(with: message)
    var positiveInteger = IO.readStdin().integerValue
    
    while positiveInteger < 0 {
      print(with: message)
      positiveInteger = IO.readStdin().integerValue
    }
    return positiveInteger
  }
  
  static func getPositiveDouble() -> Double {
    print(with: "Please enter a positive double: ")
    var positiveDouble = IO.readStdin().doubleValue
    
    while positiveDouble < 0.0 {
      print(with: "Please enter a positive double: ")
      positiveDouble = IO.readStdin().doubleValue
    }
    return positiveDouble
  }
} // End-Of-Class

// Extension(s) ==================================================================
extension NSString {
  var integerValue64: Int64 {
    get {
      return Int64(self.integerValue)
    }
  }
  
  var characterValue: Character {
    get {
      let ourString = String(self)
      return ourString[ourString.startIndex]
    }
  }
}
