function lesscHelpDev()
{
  eDesc "lesscHelpDev" "This help."
  eDesc "lesscVersion" "Show current lessc version."
  eDesc "lesscUpdate" "Updating Less compiler."
  eDesc "lesscLint <source>" "Lint the less <source>."
  eDesc "lesscCompile <source> <target>" "Compile the <source> to <target> file."
}

function lesscVersion()
{
  eDesc "LessC version" $(lessc -v)
}

function lesscUpdate()
{
  lesscVersion
  eDesc "Update LessC" 
  eDescBeginUpdate
  npmInstallGlobal "less"
  eDescEndUpdate
  lesscVersion
}

function lesscLint()
{
  if [ ! $# -eq 1 ]
  then
    eRor "lesscLint() err : need 1 parameter."
  fi
  if [ ! -e $1 ]
  then
    eRor "lesscLint() err : file not found [ $1 ]"
  fi
  eWait "Less linting file [ $1 ]"
  lesscVersion
  less -l $1
}

function lesscCompile()
{
  if [ ! $# -eq 2 ]
  then
    eRor "lesscCompile() err : need 2 parameters."
  fi
  if [ ! -e $1 ]
  then
    eRor "lessCompile() err : file not found [ $1 ]"
  fi
  eWait "Less compile file [ $1 ]"
  lesscVersion
  less $1 $2
}