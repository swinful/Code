#! /usr/bin/env bash
#
# Desc: Simple Mx search/replace script. 
#       Warns if the folder is potentially not a valid Mx folder.
#
# $Id: search_replace.sh 672 2012-07-10 21:12:22Z swinful $
#

EXT_LIST=
FIND_NAME_OPTS=
OLD_NAME="$1"
NEW_NAME="$2"
SCOPE="g"
CWD=`pwd`
LOG=
LOG_LINES=
export PATH=/usr/bin:/bin:$PATH

# Set CMD Paths =======================================================
BASENAME_CMD=/usr/bin/basename
FIND_CMD=/usr/bin/find
GREP_CMD=/usr/bin/grep
PERL_CMD=/usr/bin/perl
RM_CMD=/usr/bin/rm
SED_CMD=/usr/bin/sed
SH_CMD=/usr/bin/sh
TOUCH_CMD=/usr/bin/touch
TR_CMD=/usr/bin/tr
TTY_CMD=/usr/bin/tty
UNAME_CMD=/usr/bin/uname
WHO_CMD=/usr/bin/who
XARGS_CMD=/usr/bin/xargs

if [ ! -x $UNAME_CMD ]; then
  UNAME_CMD=/bin/uname
fi

OS_TYPE=`${UNAME_CMD}`
case $OS_TYPE in

  Linux)
    BASENAME_CMD=/bin/basename
    GREP_CMD=/bin/grep
    RM_CMD=/bin/rm
    SED_CMD='/bin/sed -i'
    SH_CMD=/bin/sh
    TOUCH_CMD=/bin/touch
    UNAME_CMD=/bin/uname
    UNAME_CMD=/bin/xargs
    ;;

  SunOS)
    SED_CMD='/usr/bin/sed -e'
    ;;

  FreeBSD)
    SED_CMD="/usr/bin/sed -i ''"
    RM_CMD="/bin/rm"
    SH_CMD="/bin/sh"
    UNAME_CMD="/bin/uname"
    ;;

esac
# =====================================================================
if [[ ! -s ./mxg2000_settings.sh ]] || [[ ! -s ./launchmxj.app ]] || [[ ! -x ./mx ]]; then
  echo ''
  echo " ===>>> [WARN] This may not be a valid Murex Application Folder." 
  read -p " ===>>> [WARN] Continue anyway (yes/no) [no]? " ANS
  echo ''
  ANS=${ANS:-no}
  if [ "${ANS}" == "no" ]; then
    exit 1
  fi
fi



# Usage ===============================================================
Usage() {
  # Arg1: INFO, just display without exit

  echo ''
  echo " Usage: `$BASENAME_CMD $0` [-o <old>] [-n <new>] [-t .sh,.mxres,...]"
  echo ''
  echo "   -o: String to be replaced by 'new string' (-n)"
  echo "   -n: String to be replaced by 'new string' (-n)"
  echo "   -t: Comma delimited list of extensions w/o space to operate on"
  echo ''

  if [ "$1" == "INFO" ]; then
    return
  fi

  exit $outcome
}

# sendToGraphite ======================================================
sendToGraphite() {
  export PATH=.:$PATH # required to call pstats2graphite.pl
  THIS_HOST=`hostname | cut -f1 -d'.'`
  EPOCH=`${PERL_CMD} -e 'print time;'`
  TTY=`${TTY_CMD} | cut -d/ -f3-4`
  REMOTE_HOST=`${WHO_CMD} | grep ${TTY} | cut -f2 -d'(' | cut -f1 -d')'`
  RESULT=`host $REMOTE_HOST`
  if [[ "$RESULT" =~ "address" ]]; then # REMOTE_HOST has it.
    LOGIN=`echo ${REMOTE_HOST} | cut -f1 -d'.'`
  fi

  if [[ "$RESULT" =~ "pointer" ]]; then # extract HOSTNAME
    LOGIN=`echo $RESULT | awk '{print $NF}' | cut -f1 -d'.'`
  fi

  if [ -z "${LOGIN}" ]; then
    LOGIN=unknown
  fi

  itsStr="cem.scripts.search_replace.user_${LOGIN}.${THIS_HOST}"
  itsStr="${itsStr}.changed_files $LOG_LINES $EPOCH"
  echo "$itsStr" | pstats2graphite.pl
}


# SetNameOpts =========================================================
SetNameOpts() {
  LIST=$1

  if [ ! -z "${LIST}" ]; then # Don't operate on an 'empty list'.

    if [[ "$LIST" =~ ',' ]]; then
      for ext in `echo $LIST | $TR_CMD ',' ' '`;
      do
        FIND_NAME_OPTS="$FIND_NAME_OPTS -name '*${ext}' -o"
      done

      FIND_NAME_OPTS=${FIND_NAME_OPTS%??}      # Remove last two chars
      FIND_NAME_OPTS=${FIND_NAME_OPTS##?}      # Remove first char (space)
      FIND_NAME_OPTS="\\( ${FIND_NAME_OPTS} \\)" # Remove first char (space)
    else
      FIND_NAME_OPTS="-name '*${LIST}'"
    fi
  fi
}

# Dealing w/ supplied arguments
# =====================================================================
while getopts t:o:n:h opt; do
  case $opt in
    n)
      NEW_NAME="${OPTARG}"
      ;;
    o)
      OLD_NAME="${OPTARG}"
      ;;

    t)
      EXT_LIST="${OPTARG}"
      SetNameOpts "${OPTARG}"
      ;;

    h) Usage; exit 0;
      ;;
  esac
done

# Sanity Checks
# =====================================================================
if [ $# -eq 0 ]; then
  Usage INFO
fi

while [ -z "${OLD_NAME}" ]; do
  read -p " ===>>> Find what text? (-o): " OLD_NAME
done

while [ -z "${NEW_NAME}" ]; do
  read -p " ===>>> Replace (${OLD_NAME}) with what? (-n): " NEW_NAME
done

while [ -z "${EXT_LIST}" ]; do
  read -p " ===>>> Operate on extension(s)? (-t): " EXT_LIST
  if [[ "${EXT_LIST}" =~ '\*' ]] || [[ "${EXT_LIST}" =~ ' ' ]]; then
    EXT_LIST=
    echo "        .. The wildcard or space, [*] [ ], is not allowed!"
    echo ''
    continue
  fi
  SetNameOpts "${EXT_LIST}"
done

if [ -z "${OLD_NAME}" ]; then
  echo ''
  echo " ===>> -o option required!"
  echo ''
  Usage
fi

if [ -z "${NEW_NAME}" ]; then
  echo ''
  echo " ===>> -n option required!"
  echo ''
  Usage
fi

if [ -z "${EXT_LIST}" ]; then
  SetNameOpts ".mxres"
fi

echo ''
echo "Summary:"
echo " For files ending with: ${EXT_LIST}"
echo " Replace all instances of [ ${OLD_NAME} ] with [ ${NEW_NAME} ]"
echo ''
read -p " ===>>> We will prompt again before final commit. Continue [Y]? " ANS

ANS=${ANS:-yes}
OUTCOME=' ===>>> No harm done.'

case "$ANS" in
  [Yy][Ee][Ss] | [Yy])

    # TODO:
    # 1. Check if the 'old' and 'new' names have a / and rename to .

    _OLD_NAME=`echo ${OLD_NAME} | ${TR_CMD} / .`
    _OLD_NAME=`echo ${_OLD_NAME} | ${TR_CMD} ' ' _`
    _NEW_NAME=`echo ${NEW_NAME} | ${TR_CMD} / .`
    _NEW_NAME=`echo ${_NEW_NAME} | ${TR_CMD} ' ' _`
    LOG="/tmp/rename_${_OLD_NAME}_${_NEW_NAME}.$$.log"
    TMP_SCRIPT="/tmp/rename_${_OLD_NAME}_${_NEW_NAME}.$$.sh"

    echo ' ===>>> Searching...'
    echo ''
    echo "${FIND_CMD} . -type f ${FIND_NAME_OPTS} \
      -print | ${XARGS_CMD} ${GREP_CMD} -l '${OLD_NAME}' 2>/dev/null" | /bin/sh > ${LOG}

    if [ -s "${LOG}" ]; then
      F_COUNT=`cat ${LOG} | wc -l`
      cat ${LOG}
      echo ''
      echo " ===>>> [WARN] The above [${F_COUNT}] files will all be modified!"
      read -p " ===>>> [WARN] Commit and finalize changes (yes/no) [no]?: " ANS

      if [ "$ANS" == "yes" ]; then
        while read line; do
          ${PERL_CMD} -p -i.prev -e "s,${OLD_NAME},${NEW_NAME},${SCOPE}" $line
        done < $LOG
        OUTCOME=" ===>>> Done! View log in: $LOG"
        LOG_LINES=`cat $LOG | wc -l`
        # sendToGraphite
        echo ''
      fi
    else
      OUTCOME=" ===>>> Search Term [ $OLD_NAME ] not found!"
    fi

    ;;

  [Nn][Oo] | [Nn])
    echo "$OUTCOME"
    exit 1
    ;;
esac

echo ''
echo "$OUTCOME"
echo ''

