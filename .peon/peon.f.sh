# peonIncl <filename>
# include a .sh file localized into .peon/includes
function peonIncl()
{
  peonAstBadParamCount $FUNCNAME[0] $# 1
  peonAstNotFound $FUNCNAME[0] "$PATH_INCLUDES/$1.sh"
  LOADED_INCLUDES[ ${#LOADED_INCLUDES[@]} + 1 ]=$1
  . "$PATH_INCLUDES/$1.sh"
}

# peonIncList
# show a list with success loaded (includes)files 
function peonInclList()
{
  eDesc "loaded includes (${#LOADED_INCLUDES[@]})" "${LOADED_INCLUDES[@]}"
}

# peonTool <filename>
# include a .sh file localized into .peon/tools
function peonTool()
{
  peonAstBadParamCount ${FUNCNAME[0]} $# 1
  peonAstNotFound "$PATH_TOOLS/$1.sh"
  LOADED_TOOLS[ ${#LOADED_TOOLS[@]} + 1 ]=$1
  . "$PATH_TOOLS/$1.sh"
}

# peonToolList
# show a list with success loaded (tools)files 
function peonToolList()
{
  eDesc "loaded tools (${#LOADED_TOOLS[@]})" "${LOADED_TOOLS[@]}"
}


# peonAstNotFound <funcname> <filename>
# assert a file not found exception
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

# peonAstBadParamCount <funcname> <current param coun> <needed param count> <needed param max range>
# assert a bad parameters count exception
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
# assert a bad parameters value exception
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

# peonRegisterDevHelp <key> <callback>
# register a dev:help <?> command
function peonRegisterDevHelp()
{
  peonAstBadParamCount ${FUNCNAME[0]} $# 2
  DEV_HELP_KEY[ ${#DEV_HELP_KEY[@]} + 1 ]=$1 
  DEV_HELP_FOO[ ${#DEV_HELP_FOO[@]} + 1 ]=$2
}

# peonRegisterHelp <key> <callback>
# register a help <?> command
function peonRegisterHelp()
{
  peonAstBadParamCount ${FUNCNAME[0]} $# 2
  HELP_KEY[ ${#HELP_KEY[@]} + 1 ]=$1 
  HELP_FOO[ ${#HELP_FOO[@]} + 1 ]=$2
}

# peonRegisterCmd <key> <callback>
# register a command
function peonRegisterCmd()
{
  peonAstBadParamCount ${FUNCNAME[0]} $# 2
  HELP_KEY[ ${#CMD_KEY[@]} + 1 ]=$1 
  HELP_FOO[ ${#CMD_FOO[@]} + 1 ]=$2
}

# peonHelpUnitsList
# show the units list
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
peonRegisterHelp "list" "peonHelpUnitsList"

# peonDevHelpUnitsList
# show the dev unists list
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
peonRegisterDevHelp "list" "peonDevHelpUnitsList"

# peonTest
# show something.
function peonTest()
{
  echo -e "$E_CG Me not that kind of Orc !$E_RZ"
  eXit
} 
peonRegisterCmd "test" "peonTest"


