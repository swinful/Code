#! /bin/sh
#==============================================================================
# <Program Name> tcl.head
#==============================================================================
# (C) Samuel A. Winful - $Id: $
# set Email [<winful> <at> <gmail> <dot> <com>]
#==============================================================================
# Description(s):
#
# The script reads a safeword backup (.ldif) file to determine which tokens are
# assigned to which users. Tested with backups procuded by Safeword 2008.
#
# The following line restarts using tclsh \
  exec tclsh8.4 "$0" ${1+"$@"}

;# Global Variables ===========================================================
;# ============================================================================
array set USERTOK {}

# Used as a Block marker
set DNSTR   {(^dn): sccUserId=(.+),}

# Hardware/Software Roken
set HWSWTOK {sccAuthenticator: \d:(.\d+$)}

# Fixed Password Token
set PASSTOK {sccAuthenticator: \d:(.+.FXD$)}

;# Initialize ----------------------------------------------------------------- 
;# ----------------------------------------------------------------------------
proc setup {} {

	if { $::argc != 1 } {
		puts {}
		puts "===>>> Usage: $::argv0 <safeword2008-backup.ldif.>"
		puts {}
	} else {
		getUserTokens [lindex $::argv 0]
		showUserTokens
	}
} 

proc shutdown {} {}

;# Procs ----------------------------------------------------------------------
;# ----------------------------------------------------------------------------

# Return Code:
#   1 --> Matches found
#   0 --> Not found
proc isDnUsername {theLine} {

	# if theLine contains 'dn' then the username
	# should be there for extraction.
	catch {regexp $::DNSTR $theLine --> isDn username} found

	return $found
}

# extractToken
# Extract token if specified on $theLine
proc extractToken {theLine} {
	catch { regexp $::HWSWTOK $theLine --> hwswTok } foundTok
	catch { regexp $::PASSTOK $theLine --> passTok } foundPass

	if {$foundTok == 1} { return $hwswTok }
	if {$foundPass == 1} { return {$FixedPasswd$} }
}

# extractUsername
# Extract username from dn
proc extractUsername {theLine} {
  if { [ isDnUsername $theLine ] } {
		regexp $::DNSTR $theLine --> isDn username
	}
	return $username
}

# extractDn
# Extract dn attribute used for checkig where we are
proc extractDn {theLine} {
	set dnAttr {}

  if { [ isDnUsername $theLine ] } {
		regexp $::DNSTR $theLine --> dnAttr username
	}
	return $dnAttr
}

# showUserTokens
#
proc showUserTokens {} {
	foreach user [lsort [array names ::USERTOK]] {
		puts [format "%-*s %s" 18 $user $::USERTOK($user)]
	}
}

# getUserTokens
# =================
proc getUserTokens { fromFile } {
  set theFile [file join $::env(PWD) $fromFile]
	set fd [open $theFile r]

	while { ![eof $fd] } {
		gets $fd line
		
		set marker [extractDn $line]
		while { $marker == "dn" } {
		 	set username [string tolower [extractUsername $line]]

			gets $fd line
			set marker [extractDn $line]

			while { $marker != "dn" && ![eof $fd] } {
				gets $fd line
				set token [extractToken $line]
				if { $token != {} } { lappend ::USERTOK($username) $token }
				set marker [extractDn $line]
			}
		}
	}
}


;#
;# Main Section --------------------------------------------------------------- 
;# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;# ----------------------------------------------------------------------------
;#
  setup
  shutdown

