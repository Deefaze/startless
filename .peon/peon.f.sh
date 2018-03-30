if [ $# -eq 2 ] && [ "$1"=="help:dev" ] && [ "$2"=="peon" ]
then
  eLN
  eDesc "peonIncl <include name>" "Include file located in $PATh_INCLUDES (without .sh extension)."
  eDesc "peonTool <tool name>" "Include file located in $PATH_TOOLS (without .sh extension)."
  eDesc "peonAstNotFound <filename>" "File not found assertion."
  eDesc "peonAstBadParam \${FUNCNAME[0]} \$# <num>" "Bad function parameter (fixed value) assertion."
  eDesc "peonAstBadParam \${FUNCNAME[0]} \$# <count min> <count max>" "Bad function parameter (ranged value) assertion."
  eXit
fi

# peonIncl <filename>
function peonIncl()
{
  peonAstBadParam ${FUNCNAME[0]} $# 1
  peonAstNotFound "$PATH_INCLUDES/$1.sh"
  . "$PATH_INCLUDES/$1.sh"
}

# peonTool <filename>
function peonTool()
{
  peonAstBadParam ${FUNCNAME[0]} $# 1
  peonAstNotFound "$PATH_TOOLS/$1.sh"
  . "$PATH_TOOLS/$1.sh"
}

# peonAstNotFound <funcname> <filename>
function peonAstNotFound()
{
  if [ ! -e $2 ]
  then
    eRor "$1() err : file not found [ $2 ]."
  fi
}

# peonAstBadParam <funcname> <current param coun> <needed param count> <needed param max range>
function peonAstBadParam()
{
  case $# in
    3)
      if [ ! $2 -eq $3 ]
      then
        eRor "$1() err : need [$3] parameters ($2)."
      fi
    ;;
    4)
      if [ $2 -lt $3 ] || [ $2 -gt $4 ]
      then
        eRor "$1() err : need [$3..$4] parameters ($2)."
      fi
    ;;
    *)
      eRor "${FUNCNAME[0]}() err : bad parameters (lol)."
  esac
}