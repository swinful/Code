//
//  ProjectTeam.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/28/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class ProjectTeam {
  
  // MARK: Private Properties
  private var scientiest:       Int
  private var engineer:         Int
  private var productionFactor: Double
  
  // Mark: Public Methods
  // Default constructor: creates a ProjectTeam with 2 scientists,
  // 1 engineer, and a production factor of 2.5.
  init() {
    scientiest       = 2
    engineer         = 1
    productionFactor = 2.5
  }
  
  // Constructor: If sci, eng, and prod are all > 0, then
  // creates a ProjectTeam with sci scientists, eng engineers,
  // and a production factor of prod.
  // Otherwise, creates a ProjectTeam with 2 scientists,
  // 1 engineer, and a production factor of 2.5.
  convenience init(sci: Int, eng: Int, prod: Double) {
    self.init()
    
    if sci > 0 && eng > 0 && prod > 0 {
      scientiest       = sci
      engineer         = eng
      productionFactor = prod
    } else { // below should not be needed and taken care of by self.init()
      scientiest       = 2
      engineer         = 1
      productionFactor = 2.5
    }
  }
  
  // ------------------ addSci -----------------------------
  /* adds sci scientists to this ProjectTeam. Note that if sci < 0,
  this will automatically subtract sci scientists from the ProjectTeam.
  Don't worry about this for now, but you may choose to fix
  things so that you can't have a negative number of scientists
  if you do the extra credit.
  */
  func addSci(sci: Int) {
    if sci > 0 {
      scientiest += sci
    }
  }
  
  // adds eng engineers to this ProjectTeam. Note that if eng < 0
  // this will automatically subtract sci engineers from the
  // ProjectTeam
  // Don't worry about this for now, but you may choose to fix
  // things so that you can't have a negative number of engineers
  // if you do the extra credit.
  func addEng(eng: Int) {
    if eng > 0 {
      engineer += eng
    }
  }
  
  // If prod > 0, sets the production factor to prod, otherwise,
  // does nothing.
  func setProd(prod: Double) {
    if prod > 0 {
      productionFactor = prod
    }
  }
  
  // prints a message with the number of scientists, number of
  // engineers, and production factor of this ProjectTeam. For example,
  // if this ProjectTeam has 1 scientist, 3 engineers, and a
  // production factor of 4.1, this function would print:
  
  // status: 1 scientists, 3 engineers, 4.1 production factor.
  
  // Note that your printout has to match mine *exactly* to get full
  // credit!
  func printStatus() {
    print("status: \(scientiest) scientists, \(engineer) engineers, \(productionFactor) production factor")
  }
  
  // returns the total daily production for this ProjectTeam, which is
  // equal to:
  
  // number of scientists * number of engineers
  // ------------------------------------------
  // production factor
  
  // for example, if you had 5 scientists, and 2 engineers and a
  // production factor of 4, then the total daily production would
  // be
  
  // 5 * 2      10
  // ----- ==  --- == 2.5
  // 4        4
  func computeProjectTeamProduction() -> Double {
    let teamProduction = Double(scientiest * engineer) / productionFactor
    let formatter = NSNumberFormatter()
    formatter.minimumFractionDigits = 4
    formatter.maximumFractionDigits = 4
    let result = formatter.stringFromNumber(teamProduction)
    return Double(result!)!
  }
  
  
  // prints a report that prints the daily production. For example,
  // if this ProjectTeam has 5 scientists, 2 engineers, and a
  // production factor of 4, this function would print:
  
  // *** Daily report: 2.5 units produced today ***
  
  // Note, you should use your compute_Project_team_production function
  // inside of this function. If you don't, 5 points will be
  // deducted from your score.
  
  // Note also that your printout has to match mine *exactly* to get full
  // credit!
  func printDailyReport() {
    let factor = computeProjectTeamProduction()
    print("*** Daily report: \(factor) units produced today ***")
  }
  
  // returns a ProjectTeam, that has the number of scientists equal
  // to the total of the scientists from this and second, the
  // number of engineers equal to the total of the engineers from
  // this and second, and a production factor equal to the greater of
  // this and seconds' production factors.
  func teamMerger(second: ProjectTeam) -> ProjectTeam {
    let temp = self
    temp.scientiest       += second.scientiest
    temp.engineer         += second.engineer
    temp.productionFactor += second.productionFactor + 1 // ??
    
    return temp
  }
  
  // ---------------------- transfer_personnel -----------------------
  /* YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
  YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
  YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
  YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
  YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
  YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
  */
}
