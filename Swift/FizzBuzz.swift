#! /usr/bin/xcrun swift

/**
 * Filename: FizzBuzz.swift
 * Author: Samuel A. Winful
 * 
 * Print the numbers from 1 to 100 in sequence and :
 *   1. If the number is a multiple of three print "Fizz" instead of the number.
 *   2. If the number is a multiple of five, print "Buzz". 
 *   3. If the number is a multiple of both three and five print "Fizz-Buzz".
 **/ 

for aNumber in 1...100 {

  var (isModThree, isModFive) = (false, false) 
  if aNumber % 3 == 0 { isModThree = true }
  if aNumber % 5 == 0 { isModFive  = true }

  if (!isModThree && !isModFive) {
    print(aNumber)
  } else {
    if isModThree { print("Fizz") }
    if isModFive  { print("Buzz") }
  }
}
