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
peonRegisterHelp "" "peonHelp"
peonRegisterHelp "peon" "peonHelp"