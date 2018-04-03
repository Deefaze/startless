# clear terminal
  clear

# PEON :
  . "$(dirname $0)/.peon/peon.v.sh"
  . "$PATH_ROOT/peon.t.sh"
# PEON /

# Show Header
  eHead "Peon for Startless"
  eLN

# PEON :
  . "$PATH_ROOT/peon.f.sh"
  . "$PATH_ROOT/peon.h.sh"
  . "$PATH_ROOT/peon.d.sh"
# PEON /

# test for parameters
  if [ $# -eq 0 ]
  then
    eBash "help" "showing Peon help."
    eXit 
  fi

# TOOLS :
  peonIncl "f.version"
  #peonTool "f.npm"
  #peonTool "f.lessc"
# TOOLS /

case $1 in
  help)
    peonAstBadParamCount "help" $# 1 2

    for ((i=1; i<=${#HELP_KEY[@]}; i++))
    do
      if [[ ${HELP_KEY[$i]} = "$2" ]]
      then
        ${HELP_FOO[$i]}
      fi
    done
  ;;
  dev:help)
    peonAstBadParamCount "dev:help" $# 1 2

    for ((i=1; i<=${#DEV_HELP_KEY[@]}; i++))
    do
      if [[ ${DEV_HELP_KEY[$i]} = "$2" ]]
      then
        ${DEV_HELP_FOO[$i]}
      fi
    done
  ;;
  *)
    for ((i=1; i<=${#CMD_KEY[@]}; i++))
    do
      if [[ ${CMD_KEY[$i]} = "$2" ]]
      then
        ${CMD_FOO[$i]}
      fi
    done    
esac

# Show footer
  eDone