#! /usr/bin/env perl
# Desc: Simple Mx search/replace script. 
#     Warns if the folder is potentially not a valid Mx folder.
# 
#
#

use IO::Socket;
use strict;

# send2Graphite ..............................................
# ............................................................
# Send messages to graphite (Carbon)
#
sub send2Graphite {
  my $gHost = '172.21.xxx.xxx'; # vm06-XX.us.XxXxx.com
  my $gPort = 2003;

  my $itsMesg = shift() . "\n";
  my $sock = new IO::Socket::INET(PeerAddr => $gHost, 
                PeerPort => $gPort, Proto => 'tcp');

  print $itsMesg;
  $sock->send($itsMesg);
  close($sock);
}

# Main =======================================================
# ============================================================
#
foreach my $mesg (<>) {
  send2Graphite $mesg;
}
