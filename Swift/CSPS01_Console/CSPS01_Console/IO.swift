//
//  IO.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 10/11/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class IO {
  
 static func promptInput (with message: String) {
    print(message, terminator: "")
  }
  
  static func getInput() -> NSString {
    let fileHandle = NSFileHandle.fileHandleWithStandardInput()
    let data = fileHandle.availableData
    let inputStr = NSString(data: data, encoding: NSUTF8StringEncoding)
    
    return inputStr!
  }
  
  static func getPositiveInteger() -> Int {
    promptInput(with: "\n\nLab 6, Assignment #5\n")
    let message = "Please enter a positive integer: "
    
    promptInput(with: message)
    var positiveInteger = IO.getInput().integerValue
    
    while positiveInteger < 0 {
      IO.promptInput(with: message)
      positiveInteger = IO.getInput().integerValue
    }
    return positiveInteger
  }
  
  static func getPositiveDouble() -> Double {
    promptInput(with: "Please enter a positive double: ")
    var positiveDouble = IO.getInput().doubleValue
    
    while positiveDouble < 0.0 {
      IO.promptInput(with: "Please enter a positive double: ")
      positiveDouble = IO.getInput().doubleValue
    }
    return positiveDouble
  }
} // EOC

// Extension(s) ==================================================================
extension NSString {
  var characterValue: Character {
    get {
      let ourString = String(self)
      return ourString[ourString.startIndex]
    }
  }
}