#! /bin/sh
#==============================================================================
# <Program Name> tcl.head
#==============================================================================
# (C) Samuel A. Winful - $Id: $
# set Email [<winful> <at> <gmail> <dot> <com>]
#==============================================================================
# Description(s):
#
# The script allows for the use of Perka's API to submit an application.
# The endpoint url is used to submit an application using POST via https. 
# The data is encapsulated in JSON and sent over the wire.
#
# The following line restarts using tclsh \
    exec tclsh8.6 "$0" ${1+"$@"}

package require http
package require json
package require json::write
package require tls
package require base64
source  __tcl2json.inc

# create_perkas_json =================================================
proc create_perkas_json {theRole theResume} {

  set ourObject [ dict create \
    first_name    Samuel \
    last_name     WINFUL \
    email         samuel@winful.com \
    position_id   $theRole \
    explaination  {Made with tcl} \
    projects      [ list \
                      {https://github.com/swinful} \
                      {http://wellrounded.wordpress.com} \
                      {http://winful.com/resume/} 
                  ] \
    source       {Rowan University csjobs mailing-list via Dr. Andrea F. Lobo (former CS Advisor)} \
    resume       [base64_encode $theResume]
  ]
  return [tcl2json $ourObject]
}

# base64_encode ======================================================
proc base64_encode {theFile} {
  set ourFile [open $theFile "r"]
  set outcome {}
  fconfigure $ourFile -encoding binary
  while { ! [eof $ourFile] } {
    set line [read $ourFile]
    append outcome [base64::encode -maxlen 0 $line]
  }
  close $ourFile
  return $outcome
}

# test_http_conn ================================================ 
proc test_http_conn { jsonQuery } {

  # Register support for https via tls package
  http::register https 443 tls::socket

  set theEndPoint {https://api.perka.com/1/communication/job/apply}
  set token [http::geturl $theEndPoint -query $jsonQuery -type {application/json}]

  puts "Token: $token"
  puts "Data: [http::data $token]"
  puts "Token Error: [http::error $token]"
  puts "Token Status: [http::status $token]"

  http::cleanup $token
  http::unregister https
}

##
# Main ========================================================== 
##

if { $argc != 2 } {
  puts {}
  puts "===>>> Usage: [lindex $argv0] IOS|OPS resumeFilename"
  puts {}
  exit 1
}

set position_id [lindex $argv 0]
set resume_file [lindex $argv 1]
set json_object [create_perkas_json $position_id $resume_file]
set tcljson_object [json::json2dict $json_object]

test_http_conn $json_object

##
# Able to successfully decode encoded resume
# set encoded_resume [lindex $tcljson_object 15]
# set decoded_resume [base64::decode $encoded_resume]
# puts $decoded_resume
##
