function versionHelp()
{
  eBash "version" "show Peon, Project, NPM and Lessc version"
  eBash "version <peon|project|npm|less>" "show only <tool> version"
  eBash "version:inc <|peon>" "increase build version of Project <or Peon> [build + 1]"
  eBash "version:inc <|peon> minor" "increase minor version of Project <or Peon> [minor + 1, build=0]"
  eBash "version:inc <|peon> major" "increase major version of Project <or Peon> [major + 1, minor=0, build=0]"
  eBash "version:set <|peon> major minor build" "set all version number of Project <or Peon>"
  eXit
}
peonRegisterHelp "version" "versionHelp"

function versionDevHelp()
{
  eFoo "versionLoad <peon|project>" "Load version of Project or Peon"
  eFoo "versionSave <peon|project>" "Save version of Project or Peon"
  eFoo "versionGet <peon|project>" "Populate version data into variables."
  eFoo "versionSet <peon|project> <major> <minor> <build>" "Set version data variables"
  eXit
}
peonRegisterDevHelp "version" "versionDevHelp"

function versionLoad()
{
  peonAstBadParam ${FUNCNAME[0]} $# 1
  case $1 in
    peon)
    ;;
    project)
    ;;
    *)
  esac
}

function versionSave()
{
  echo -e "save"
}

function versionGet()
{
  _['major']=$(php -r "echo json_decode( file_get_contents( realpath( '$1' ) ) )->major;")
  _['minor']=$(php -r "echo json_decode( file_get_contents( realpath( '$1' ) ) )->minor;")
  _['build']=$(php -r "echo json_decode( file_get_contents( realpath( '$1' ) ) )->build;")
  return _;
}

function versionSet()
{
  printf '{"major":%d,"minor":%d,"build":%d}' $1 $2 $3 > $4
}
