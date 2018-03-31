function peonHelp()
{
  eBash "help" "show this help"
  eBash "help <unit name>" "show help of <unit name>"
  eBash "help list" "show list of documented units"

  eBash "dev:help <unit name>" "show dev help of <unit name>"
  eBash "dev:help list" "show list of documented units"

  eXit
}

function peonHelpUnitsList()
{
  eDesc "help <unit name>" ""
    
    for ((i=1; i<=${#HELP_KEY[@]}; i++))
    do
      echo -e "\t$E_CB<$E_CY" ${HELP_KEY[$i]} "$E_CB>"
    done
  eLN
  eXit
}

function peonDevHelp()
{
  eFoo "peonIncl <include name>" "Include file located in $PATH_INCLUDES (without .sh extension)."
  eFoo "peonTool <tool name>" "Include file located in $PATH_TOOLS (without .sh extension)."
  eFoo "peonAstNotFound <filename>" "File not found assertion."
  eFoo "peonAstBadParamCount \${FUNCNAME[0]} \$# <num>" "Bad function parameter count (fixed value) assertion."
  eFoo "peonAstBadParamCount \${FUNCNAME[0]} \$# <count min> <count max>" "Bad function parameter count (ranged value) assertion."
  eFoo "peonAstBadParamValue \${FUNCNAME[0]} \$# <needed value> <current value>" "Bad function parameter value assertion."
  eXit
} 

function peonDevHelpUnitsList()
{
  eDesc "dev:help <unit name>" ""
    
    for ((i=1; i<=${#DEV_HELP_KEY[@]}; i++))
    do
      echo -e "\t$E_CB<$E_CY" ${DEV_HELP_KEY[$i]} "$E_CB>"
    done
  eLN
  eXit
}


# peonIncl <filename>
function peonIncl()
{
  peonAstBadParamCount $FUNCNAME[0] $# 1
  peonAstNotFound $FUNCNAME[0] "$PATH_INCLUDES/$1.sh"
  LOADED_INCLUDES[ ${#LOADED_INCLUDES[@]} + 1 ]=$1
  . "$PATH_INCLUDES/$1.sh"
}

function peonInclList()
{
  eDesc "loaded includes (${#LOADED_INCLUDES[@]})" "${LOADED_INCLUDES[@]}"
}

# peonTool <filename>
function peonTool()
{
  peonAstBadParamCount ${FUNCNAME[0]} $# 1
  peonAstNotFound "$PATH_TOOLS/$1.sh"
  LOADED_TOOLS[ ${#LOADED_TOOLS[@]} + 1 ]=$1
  . "$PATH_TOOLS/$1.sh"
}

function peonToolList()
{
  eDesc "loaded tools (${#LOADED_TOOLS[@]})" "${LOADED_TOOLS[@]}"
}


# peonAstNotFound <funcname> <filename>
function peonAstNotFound()
{
  case $# in
    2)
      if [ ! -e $2 ]
      then
        eRor "$1 err : file not found [ $2 ]."
      fi
    ;;
    *)
      eRor "${FUNCNAME[0]} err : bad parameters ($#)[$@]."
  esac
}

# peonAstBadParam <funcname> <current param coun> <needed param count> <needed param max range>
function peonAstBadParamCount()
{
  case $# in
    3)
      if [ ! $2 -eq $3 ]
      then
        eRor "$1 err : need [$3] parameters ($2)."
      fi
    ;;
    4)
      if [ $2 -lt $3 ] || [ $2 -gt $4 ]
      then
        eRor "$1 err : need [$3..$4] parameters ($2)."
      fi
    ;;
    *)
      eRor "${FUNCNAME[0]} err : bad parameters ($#)[$@]."
  esac
}

# peonAstBadParamValue <funcname> <param num> <needed value> <current value>
function peonAstBadParamValue()
{
  case $# in
    4)
      eRor "$1 err : Bad parameter [$2 = $4] value ($3)"
    ;;
    *)
      eRor "${FUNCNAME[0]} err : bad parameters ($#)[$@]"
  esac
}

function peonRegisterDevHelp()
{
  peonAstBadParamCount ${FUNCNAME[0]} $# 2
  DEV_HELP_KEY[ ${#DEV_HELP_KEY[@]} + 1 ]=$1 
  DEV_HELP_FOO[ ${#DEV_HELP_FOO[@]} + 1 ]=$2
}

function peonRegisterHelp()
{
  peonAstBadParamCount ${FUNCNAME[0]} $# 2
  HELP_KEY[ ${#HELP_KEY[@]} + 1 ]=$1 
  HELP_FOO[ ${#HELP_FOO[@]} + 1 ]=$2
}

function peonTest()
{
  echo -e "$E_CG Me not that kind of Orc !$E_RZ"
  eXit
}

peonRegisterDevHelp "list" "peonDevHelpUnitsList"
peonRegisterDevHelp "" "peonDevHelp"
peonRegisterDevHelp "peon" "peonDevHelp"

peonRegisterHelp "list" "peonHelpUnitsList"
peonRegisterHelp "" "peonHelp"
peonRegisterHelp "peon" "peonHelp"

