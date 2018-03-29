peon_ver_major=0
peon_ver_minor=2
peon_ver_build=1
peon_version=$peon_ver_major.$peon_ver_minor.$peon_ver_build

dir=$(dirname $0)
ver="$(dirname $0)/version.json"

function eRor()
{
  echo -e "\e[37;41m !                                                                            ! \e[77D$1\e[0m"
  eLN
  eXit
}

function eDesc()
{
  echo -e "\e[34m# $1 :\n\e[33m$2\e[0m"
}
function eCapt()
{
  echo -e "\e[34m# $1 :\e[33m"
}
function eHead()
{
  echo -e "\e[37;44m #                                                                            # \e[77D$1\e[0m"
}

function eWait()
{
  echo -e "\e[37;45m >                                                                              \e[77D$1\e[0m"
}

function eLN()
{
  echo -e ""
}

function eXit()
{
  eHead "For the Horde !"
  exit 1
}

function getVersion()
{
  _major=$(php -r "echo json_decode( file_get_contents( realpath( '$ver' ) ) )->major;")
  _minor=$(php -r "echo json_decode( file_get_contents( realpath( '$ver' ) ) )->minor;")
  _build=$(php -r "echo json_decode( file_get_contents( realpath( '$ver' ) ) )->build;")
}

function setVersion()
{
  printf '{"major":%d,"minor":%d,"build":%d}' $1 $2 $3 > $ver
}

function versionShowHelp()
{
  
  eXit
}