# eLN
function eLN()
{
  echo -e ""
}

# eRZ
function eRZ()
{
  echo -e "$E_RZ"
}

# eDone
function eDone()
{
  eLN
  eHead "Job done."
}

# eXit
function eXit()
{
  eLN
  eHead "For the Horde !"
  exit 1
}

# eHead "head message"
function eHead()
{
  echo -e "$E_HEAD$E_ROWH$E_RETS$1 $E_RZ"
}

# eRor "error message"
function eRor()
{
  eLN
  echo -e "$E_EROR$E_ROWE$E_RETS$1 $E_RZ"
  eXit
}

# eWait "wait message"
function eWait()
{
  eLN
  echo -e "$E_WAIT$E_ROWW$E_RETS$1 $E_RZ"
}

declare -x DESC_UPDATE=0

# eDesc "label" "description"
# or
# eDesc "label"
# eDescBeginUpdate
# eDesc "description line 1"
# eDesc "description line 2"
# eDescEndUpdate
function eDesc()
{
  if [ $DESC_UPDATE -gt 0 ]
  then
    echo -e "\t$E_CAPT$1"
  else
    case $# in
      1)
        echo -e "$E_INFO - $E_CW$1$E_INFO :"
      ;;
      2)
        echo -e "$E_INFO - $E_CW$1$E_INFO :\n\t$E_CAPT$2$E_RZ"
      ;;
      *)
        echo -e "$E_RZ"
      ;;
    esac
  fi
}

# eDescBeginUpdate
function eDescBeginUpdate()
{
  if [ $DESC_UPDATE -eq 0 ]
  then
    DESC_UPDATE=1
  fi
}

# eDescEndUpdate
function eDescEndUpdate()
{
  if [ $DESC_UPDATE -gt 0 ]
  then
    DESC_UPDATE=0
  fi
}

# eBash "parameters" "description"
function eBash()
{
  echo -e "$E_INFO - run { $E_CW\$ sh peon $1$E_INFO } for $2$E_RZ"
}

# eFoo "function name <parameters>" "description"
function eFoo()
{
  echo -e "$E_INFO @$E_CP function $E_CW$1$E_INFO :$E_CAPT\n\t$2"
  eLN
}
