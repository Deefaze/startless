function peonHelp()
{
  eBash "help" "show this help"
  eBash "help <unit name>" "show help of <unit name>"
  eBash "help list" "show list of documented units"

  eBash "dev:help <unit name>" "show dev help of <unit name>"
  eBash "dev:help list" "show list of documented units"


  eXit
}

peonRegisterDevHelp "" "peonDevHelp"
peonRegisterDevHelp "peon" "peonDevHelp"



