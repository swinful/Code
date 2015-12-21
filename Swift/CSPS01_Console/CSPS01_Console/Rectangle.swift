//
//  Rectangle.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/19/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//  Below source code was converted C++, written by Dr. Kay:
//  URL: http://elvis.rowan.edu/~kay/classes/old/csps01/code/rectangle.cpp

/// A Rectangle represents the geometric concept
/// of a rectangle whose sides are integer lengths
class Rectangle {
  
  private var rectHeight: Int
  private var rectWidth:  Int

  /// Default constructor sets "this" height and
  /// width both to 1
  init() {
    rectHeight = 1
    rectWidth  = 1
  }

  /// read asks the user for the height and width of the rectangle and repeatedly asks
  /// them to reenter the data if they are not positive the resulting rectangle is
  /// stored in "this"
  func read() {
    rectHeight = IO.getPositiveInteger("Enter height: ")
    rectWidth  = IO.getPositiveInteger("Enter width: ")
  }

  /// print will print a picture using the '*' char
  /// of "this" rectangle with a newline above and
  /// below it
  func print() {
    
    for (var row = 0; row < rectHeight; row++) {
      for (var col = 0; col < rectWidth; col++) {
        Swift.print("*", separator: "", terminator: "")
      }
      Swift.print("")
    }
    Swift.print("")
  }

   /// area returns the area of "this" rectangle
  func area() -> Int {
    return rectWidth * rectHeight
  }

  /// perimeter returns the perimeter of "this" rectangle
  func perimeter() -> Int {
    return (2 * (rectWidth + rectHeight))
  }

  /// returns true iff "this" rectangle's area is
  /// bigger than secondRectangle's area
  func biggerArea(secondRectangle: Rectangle) -> Bool {
    
    let thisArea = area()
    let secondArea = secondRectangle.area()
    
    if (thisArea > secondArea) {
      return true
    } else {
      return false
    }
  }

  /// sets the height of "this" rectangle to h
  /// if h is not positive, this function does nothing
  func setHeight(h: Int) {
    if (h > 0) {
      rectHeight = h
    }
  }

  /// sets the width of "this" rectangle to w
  /// if w is not positive, this function does nothing
  func setWidth(w: Int) {
    if (w>0) {
      rectWidth = w
    }
  }
}
