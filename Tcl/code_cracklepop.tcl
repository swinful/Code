#! /bin/sh
#==============================================================================
# <Program Name> tcl.head
#==============================================================================
# (C) Samuel A. Winful - $Id: $
# set Email [<winful> <at> <gmail> <dot> <com>]
#==============================================================================
# Description(s):
#
# This program prints out the numbers 1 to 100 (inclusive). If the number is:
#
#   * divisible by 3, print "Crackle" instead of the number,
#   * divisible by 5, print "Pop" instead of the number,
#   * divisible by both 3 and 5, print "CracklePop".
#
# The following line restarts using tclsh \
    exec tclsh8.6 "$0" ${1+"$@"}

# code_cracklepop ====================================================
proc code_cracklepop {} {
  for {set i 0} {$i <= 100} {incr i} {
    divisible_by 3 5 $i
  }
}

# divisible_by =======================================================
proc divisible_by { {three 3} {five 5} aNumber } {

  if {[expr $aNumber % 3] == 0 && [expr $aNumber % 5] == 0} {
    puts "CracklePop"
  } elseif {[expr $aNumber % 3] == 0 } {
    puts "Crackle"
  } elseif {[expr $aNumber % 5] == 0 } {
    puts "Pop"
  } else {
    puts "($aNumber)"
  }
}

##
# Main ========================================================== 
##
code_cracklepop
