function eLN()
{
  echo -e ""
}

function eRZ()
{
  echo -e "$E_RZ"
}

function eDone()
{
  eLN
  eHead "Job done."
}

function eXit()
{
  eLN
  eHead "For the Horde !"
  exit 1
}

function eHead()
{
  echo -e "$E_HEAD$E_ROWH$E_RETS$1 $E_RZ"
}

function eRor()
{
  eLN
  echo -e "$E_EROR$E_ROWE$E_RETS$1 $E_RZ"
  eXit
}

function eWait()
{
  eLN
  echo -e "$E_WAIT$E_ROWW$E_RETS$1 $E_RZ"
}

declare -x DESC_UPDATE=0

function eDesc()
{
  if [ $DESC_UPDATE -gt 0 ]
  then
    echo -e "   $E_CAPT$1"
  else
    case $# in
      1)
        echo -e "$E_INFO - $1 :   $E_CAPT"
      ;;
      2)
        echo -e "$E_INFO - $1 :   $E_CAPT$2$E_RZ"
      ;;
      *)
        echo -e "$E_RZ"
      ;;
    esac
  fi
}

function eDescBeginUpdate()
{
  if [ $DESC_UPDATE -eq 0 ]
  then
    DESC_UPDATE=1
  fi
}

function eDescEndUpdate()
{
  if [ $DESC_UPDATE -gt 0 ]
  then
    DESC_UPDATE=0
  fi
}


