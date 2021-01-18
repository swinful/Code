#! /bin/bash

FILE=$1

create_execute() {
  DATE=`date '+%A, %B %C, %Y'`
  cp header $FILE
  echo "# Created: $DATE" >> $FILE
  echo "# Filename: $FILE" >> $FILE

  chmod u+x $FILE
}


# Main
create_execute
