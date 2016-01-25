//
//  Lab11.swift
//  CSPS01_Console
//
//  Created by Samuel A WINFUL on 12/28/15.
//  Copyright © 2015 WINFUL Samuel. All rights reserved.
//

import Foundation

class Lab11 {
  
  // Private Methods
  private func iShouldContinue() -> Bool {
    var outcome = false
    IO.print(with: "\n\nDo you want to continue (type y for yes)? ")
    if let ans = readLine() {
      if ((ans == "y") || (ans == "Y" )) {
        outcome = true
      }
    }
    return outcome
  }
  
  // MARK: Main
  func run() {
    // ----------------------------- main ----------------------------
    print("\n------------------ Part 1  -----------------------")
    
    let alpha = ProjectTeam()
    let beta  = ProjectTeam()
    
    print("\nJust created two new teams: alpha and beta")
    
    print("\n\nHere's alpha:")
    alpha.printStatus()
    
    print("\n\nAdding two scientists to alpha: ")
    alpha.addSci(2)
    alpha.printStatus()
    
    print("\n\nAnd adding one engineer to alpha: ")
    alpha.addEng(1)
    alpha.printStatus()
    
    if (iShouldContinue() == false) {
      return
    }
    
    print("\n------------------ Part 2 -----------------------")
    print("\n\nHere's beta:")
    beta.printStatus()
    
    print("\n\nAdd 27 engineers to Beta:")
    beta.addEng(27)
    beta.printStatus()
    
    print("\n\nI can subtract one scientist from Beta since there are 2")
    beta.addSci(-1)
    beta.printStatus()
    print("")
    
    print("-- If you successfully complete the program to here")
    print("-- you are eligible for a total of 40 points")
    
    if (iShouldContinue() == false) {
      return
    }
    
    print("\n------------------ Part 3 -----------------------")
    
    print("\n\nHere's alpha:")
    alpha.printStatus()
    
    print("\n\nSet alpha's production level to 3.12:")
    alpha.setProd(3.12)
    alpha.printStatus()
    
    print("\n\nTry to set alpha's production level to 0 (shouldn't work):")
    alpha.setProd(0)
    alpha.printStatus()
    
    print("\n\nTry to set alpha's production level to -5 (shouldn't work):")
    alpha.setProd(0)
    alpha.printStatus()
    
    print("-- If you successfully complete the program to here")
    print("-- you are eligible for a total of 50 points")
    
    if (iShouldContinue() == false) {
      return
    }
    
    print("\n------------------ Part 4 -----------------------")
    
    print("\n\nCreate gamma, delta, and epsilon")
    print("Gamma has 25 sci, 4 eng, and 8.26 prod")
    
    var gamma = ProjectTeam(sci: 25, eng: 4, prod: 8.26)
    gamma.printStatus()
    
    print("\nDelta is going to be created with 0 eng, so it")
    print("should end up with 2, 1, 2.5")
    
    let delta = ProjectTeam(sci: 6, eng: 0, prod: 2.3)
    delta.printStatus()
    
    print("\nEpsilon is going to be created with 0 prod, so")
    print("it should also end up with 2, 1, 2.5")
    let epsilon = ProjectTeam(sci: 25, eng: 32, prod: 0)
    epsilon.printStatus()
    
    print("\n-- If you successfully complete the program to here")
    print("-- you are eligible for a total of 60 points")
    
    if (iShouldContinue() == false) {
      return
    }
    
    print("\n------------------ Part 5 -----------------------")
    
    print("Here's alpha:")
    alpha.printStatus()
    
    IO.print(with: "\nalpha's project team production is: ")
    print("\(alpha.computeDailyProduction())")
    
    print("\n\nHere's gamma:")
    
    gamma.printStatus()
    print("\n\nAnd here's gamma's daily report:")
    gamma.printDailyReport()
    
    print("\n-- If you successfully complete the program to here")
    print("-- you are eligible for a total of 80 points")
    
    if (iShouldContinue() == false) {
      return
    }
    
    print("\n------------------ Part 6 -----------------------")
    
    var omega = ProjectTeam()
    
    print("Created a new team: omega, which is a combination of")
    print("beta and gamma")
    print("\nbeta:")
    
    beta.printStatus()
    
    print("gamma:\n")
    
    gamma.printStatus()
    
    omega = beta.teamMerger(gamma)
    
    print("Here's the merged omega:")
    omega.printStatus()
    omega.printDailyReport()
    
    print("\n-- If you successfully complete the program to here\n")
    print("-- you are eligible for a total of 100 points")
    
    // UNCOMMENT THIS SECTION IF YOU DO THE EXTRA CREDIT
    // UNCOMMENT THIS SECTION IF YOU DO THE EXTRA CREDIT
    // UNCOMMENT THIS SECTION IF YOU DO THE EXTRA CREDIT
    // UNCOMMENT THIS SECTION IF YOU DO THE EXTRA CREDIT
    // UNCOMMENT THIS SECTION IF YOU DO THE EXTRA CREDIT
    
    if (iShouldContinue() == false) {
      return
    }
    
    print("\n------------------ Extra credit 1 -----------------------")
    
    print("Here's alpha:")
    alpha.printStatus()
    
    print("\nLet's remove 38 scientists from alpha:")
    alpha.addSci(-38)
    
    print("\nHere's the resulting alpha:")
    alpha.printStatus()
    
    print("-- If you successfully complete this section")
    print("-- you are eligible for a total of 10 points of extra credit")
    
    if (iShouldContinue() == false) {
      return
    }
    
    print("\n------------------ Extra credit 2 -----------------------")
    
    print("Here's alpha:")
    alpha.printStatus()
    
    print("\nAnd here's gamma:")
    gamma.printStatus()
    
    print("\nLet's try & transfer 5 sci and 1 eng from gamma to alpha.")
    
    alpha.transferPersonnel(fromTeam: &gamma, sci: 5, eng: 1)
    print("\nHere's alpha:")
    
    alpha.printStatus()
    
    print("\nAnd here's gamma:")
    gamma.printStatus()
    
    print("\nLet's try and transfer 75 sci from gamma to alpha")
    alpha.transferPersonnel(fromTeam: &gamma, sci: 75, eng: 0)
    print("Alpha should not have changed, here it is:")
    alpha.printStatus()
    
    print("\n-- If you successfully complete both extra credits")
    print("-- you are eligible for a total of 20 points of extra credit")
    
    // END OF EXTRA CREDIT
    // END OF EXTRA CREDIT
    // END OF EXTRA CREDIT
    // END OF EXTRA CREDIT
    // END OF EXTRA CREDIT
  }
}
