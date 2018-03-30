# clear terminal
  clear

# PEON :
  . "$(dirname $0)/.peon/peon.v.sh"
  . "$(dirname $0)/.peon/peon.t.sh"
# PEON /

# Show Header
  eHead "Peon for Startless"
  eLN

# PEON :
  . "$(dirname $0)/.peon/peon.f.sh"
# PEON /

# test for parameters
  if [ $# -le 0 ] || [ $# -gt 9 ]
  then
    eDesc "$ sh peon help" "Showing peon Help."
    peonAstBadParam "peon" $# 1 9 
  fi

# TOOLS :
  peonIncl "f.version"
  peonTool "f.npm"
  peonTool "f.lessc"
# TOOLS /

# Show footer
  eDone