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
}

extension NSString {
  var characterValue: Character {
    get {
      let ourString = String(self)
      return ourString[ourString.startIndex]
    }
  }
}