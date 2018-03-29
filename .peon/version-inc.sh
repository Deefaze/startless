if [ ! -f $ver ]
then
  eRor "Cannot increase because version file not found."
fi

declare -i _major
declare -i _minor
declare -i _build

getVersion

function incMajor()
{
  let _major++
}
function incMinor()
{
  let _minor++
  if [ $_minor -gt 99 ]
  then
    eWait "Lok'tar! A new Major number appeared !"
    eLN
    _minor=0      
    incMajor
  fi
}
function incBuild()
{
  let _build++
  if [ $_build -gt 99 ]
  then
    eWait "Dabu! A new Minor number appeared !"
    eLN
    _build=0
    incMinor
  fi
}

eWait "Current version is v$_major.$_minor.$_build" 
eLN

case $# in
  1) # increase build normal way $ sh peon version:inc
    eWait "Increase build by 1"
    incBuild
  ;;
  2) # increase minor or major $ sh peon version:inc major|minor
    case $2 in
      major)
        eWait "Increase major by 1"
        incMajor
      ;;
      minor)
        eWait "Increase minor by 1"
        incMinor
      ;;
      *)
        versionShowHelp
    esac      
  ;;
  3) # increase anyone by number $ sh peon version:inc build|minor|major n
    case $2 in
      build)
        if [ $3 -ge 0 ] && [ $3 -le 99 ]
        then
          eWait "Increase build by $3"
          _build=$3
        else
          eRor "Invalid inc value for build number ($3)![0..99]"
        fi
      ;;
      minor)
        if [ $3 -ge 0 ] && [ $3 -le 99 ]
        then
          eWait "Increase minor by $3"
          _minor=$3
        else
          eRor "Invalid inc value for minor number ($3)![0..99]"
        fi
      ;;
      major)
        if [ $3 -ge 0 ] && [ $3 -le 99 ]
        then
          eWait "Increase major by $3"
          _major=$3
        else
          eRor "Invalid inc value for major number ($3)![0..99]"
        fi
      ;;
      *)
        versionShowHelp
    esac
  ;;
  *)
    versionShowHelp
esac

eLN
eWait "New version is v$_major.$_minor.$_build ... i'll try to write it." 
setVersion $_major $_minor $_build

