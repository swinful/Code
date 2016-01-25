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
    }
  }
  
  // ------------------ addSci -----------------------------
  /* adds sci scientists to this ProjectTeam. Note that if sci < 0,
  this will automatically subtract sci scientists from the ProjectTeam.
  Don't worry about this for now, but you may choose to fix
  things so that you can't have a negative number of scientists
  if you do the extra credit.
  */
  func addSci(sci: Int) -> Bool {
    var outcome = false
    if sci < 0 {
      scientiest = 1
    } else {
      scientiest += sci
      outcome = true
    }
    
    return outcome
  }
  
  // adds eng engineers to this ProjectTeam. Note that if eng < 0
  // this will automatically subtract sci engineers from the
  // ProjectTeam
  // Don't worry about this for now, but you may choose to fix
  // things so that you can't have a negative number of engineers
  // if you do the extra credit.
  func addEng(eng: Int) {
    engineer += eng
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
  func computeDailyProduction() -> Double {
    
    let formatter = NSNumberFormatter()
    
    formatter.maximumFractionDigits    = 4
    formatter.minimumSignificantDigits = 1
    formatter.numberStyle              = .DecimalStyle
    
    let dScientist = NSNumber(integer: scientiest).doubleValue
    let dEngineer  = NSNumber(integer: engineer).doubleValue
    let production = (dScientist * dEngineer) / productionFactor
    
    return production
  }
  
  
  // prints a report that prints the daily production. For example,
  // if this ProjectTeam has 5 scientists, 2 engineers, and a
  // production factor of 4, this function would print:
  
  // *** Daily report: 2.5 units produced today ***
  
  // Note, you should use your computeDailyProduction function
  // inside of this function. If you don't, 5 points will be
  // deducted from your score.
  
  // Note: Also that your printout has to match mine *exactly* to get full
  // credit!
  func printDailyReport() {
    let factor = computeDailyProduction()
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
    
    // The sample run displays a production factor having the greatest of
    // either this or second as appose to "this and secons". I will follow
    // the sample output instead of the requirement here since they conflict.
    if second.productionFactor >= self.productionFactor {
      temp.productionFactor = second.productionFactor
    }
    
    return temp
  }
  
  // ---------------------- transferPersonnel -----------------------
  /**
   * YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
   * YOU ADD STUFF HERE IF YOU DO EXTRA CREDIT
   **/
  // Let's try and transfer 75 sci from gamma to alpha
  func transferPersonnel(inout fromTeam team: ProjectTeam, sci: Int, eng: Int) {
    team.scientiest -= sci
    team.engineer   -= eng
    // team.addSci(-sci)
    // team.addEng(-eng)
    self.scientiest += sci
    self.engineer   += eng
    // self.addSci(sci)
    // self.addEng(eng)
  }
  
}
