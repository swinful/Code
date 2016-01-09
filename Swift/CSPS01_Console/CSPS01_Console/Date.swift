//
//  Date.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/17/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//
// This class was rewritten from:
//   URL: http://elvis.rowan.edu/~kay/classes/old/csps01/code/date_code.cpp
//
// This class will represent any date after Jan 1, 1753. 1752 was a difficult year when
// they skipped 11 days to make up for the leap year problem.
//


import Foundation

class Date {

  // MARK: Member Properties -- Private
  private var dYear:  Int
  private var dMonth: Int
  private var dDay:   Int
  
  
  // MARK: Member Functions -- Public
  
  /**
   * init "default constructor" - creates a new date object with date July 4, 1776
   **/
  init() {
    dMonth = 7
    dDay   = 4
    dYear  = 1776
  }
  
  /**
   * init "default constructor" - creates a new date from supplied arguments
   **/
  init(year: Int, month: Int, day: Int) {
    dYear  = year
    dMonth = month
    dDay   = day
  }
  
  /**
   * read prompts the user to enter the month, day, and year and enters it
   * into the value of "this". If they enter invalid data, they are 
   * repeatedly asked to re-enter until they enter legal values.
   *
   **/
  func read() {
    
    var year  = 0
    var month = 0
    var day   = 0
    
    repeat {
      IO.print(with: "Enter a year 1753 or later: ")
      year = IO.readStdin().integerValue
      
      IO.print(with: "Enter month (1-12): ")
      month = IO.readStdin().integerValue
      
      IO.print(with: "Enter day (1-31): ")
      day = IO.readStdin().integerValue
      
      if !isLegalDate(month: month, day: day, year: year) {
        Swift.print("\nILLEGAL DATE!!!\nPlease try again\n")
      }
    } while !isLegalDate(month: month, day: day, year: year)
    
    setDate(month: month, day: day, year: year)
  }
  
  /**
   * print prints out "this's" month, day, and year in a fancy format
   * for example January 3, 1999 would be printed as 1/3/1999
   **/
  func print() {
    Swift.print("\(dMonth) / \(dDay) / \(dYear)")
  }
  
  /**
   * add_days adds num days to "this", changing "this", if num is not
   * positive, "this" will not be changed.
   **/
  func addDays(num: Int) {
    
    for (var i = 0; i < num; ++i) {
      addOneDay()
    }
  }
  
  /**
   * happensBefore returns true if "this" date is earlier than
   * other_date (and false if "this" date is not earlier)
   *
   * * Test
   **/
  func happensBefore(otherDate: Date) -> Bool {
    
    let thisDays = daysAfter1_1_1753()
    let otherDays = otherDate.daysAfter1_1_1753()
    
    return thisDays < otherDays
  }
  
  
  /**
   * differenceBetweenDates returns the number of dates between "this"
   * and other_date. E.g., if this is Jan 25, 2000  and other_date is 
   * Jan 10, 2000 differenceBetweenDates would return 15 
   **/
  func differenceBetweenDates(otherDate: Date) -> Int {
    
    let thisDays  = daysAfter1_1_1753()
    let otherDays = otherDate.daysAfter1_1_1753()
    
    return thisDays - otherDays
  }
  
  
  // MARK: Member Functions -- Private
  /**
   * isLeapYear returns true iff year is a leap year
   **/
  private func isLeapYear(year: Int) -> Bool {
    
    if year % 400 == 0 {
      return true
    } else if year % 100 == 0 {
      return false
    } else if year % 4 == 0 {
      return true
    } else {
      return false
    }
  }
  
  /**
   * setDate converts month,day, year into days since 1753 format and
   * inserts the appropriate value in "this". If month,day,year are
   * illegal "this" is not changed 
   **/
  private func setDate(month month: Int, day: Int, year: Int) {
    
    if isLegalDate(month: month, day: day, year: year) {
      dMonth = month
      dDay   = day
      dYear  = year
    }
  }
  
  /**
   * isLegalDate returns true if a date is a legitimate date after 1/1/1753
   **/
  private func isLegalDate(month month: Int, day: Int, year: Int) -> Bool {
    
    if year < 1753 {
      return false
    }
    
    if month < 1 || month > 12 {
      return false
    }
    
    if day < 1 {
      return false
    } else if day > daysInMonth(month: month, year: year) {
      return false
    } else {
      return true
    }
  }
  
  /**
   * daysInMonth returns the number of days in the given month/year (year needed for Feb)
   **/
  private func daysInMonth(month month: Int, year: Int) -> Int {
    switch month {
    case 2:
      if isLeapYear(year) {
        return 29
      } else {
        return 28
      }
      
    // April, June, September, November
    case 4, 6, 9, 11:
      return 30
      
    default:
      return 31
    }
  }
  
  /**
   * addOneDay adds one day to "this" date
   **/
  private func addOneDay() {
    ++dDay
    
    if dDay > daysInMonth(month: dMonth, year: dYear) {
      dDay = 1
      ++dMonth
    }
    
    if dMonth == 13 {
      ++dYear
      dMonth = 1
    }
  }
  
  
  /** 
   *
   *
   * daysAfter1_1_1753 returns an int that represents the number of days 
   * past 1/1/1753 that "this" date is
   **/
  private func daysAfter1_1_1753() -> Int {
    var total = 0
    var i = 0
    
    // start out by adding in the days for the number of whole years before "this" year.
    for (i = 1753; i < dYear; ++i) {
      if isLeapYear(i) {
        total += 366
      } else {
        total += 365
      }
    }
    
    // now add in the number of days for the months before "this" month
    for (i=1; i<dMonth; ++i) {
      total += daysInMonth(month: i, year: dYear)
    }
    
    // finally add in the day
    total += dDay
    
    return total
  }
}
