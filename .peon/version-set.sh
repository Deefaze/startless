if [ ! -f $ver ]
then
  eRor "Cannot set because version file not found."
fi

declare -i _major
declare -i _minor
declare -i _build

getVersion

eWait "Current version is v$_major.$_minor.$_build" 
eLN

if [ $# -eq 3 ]
then
  # increase anyone by number $ sh peon version:inc build|minor|major n
    case $2 in
      build)
        if [ $3 -ge 0 ] && [ $3 -le 99 ]
        then
          eWait "Increase build by $3"
          _build=$3
        else
          eRor "version:set invalid value for build number ($3)!in[0..99] (try $ sh peon help)."
        fi
      ;;
      minor)
        if [ $3 -ge 0 ] && [ $3 -le 99 ]
        then
          eWait "Increase minor by $3"
          _minor=$3
        else
          eRor "version:set invalid value for minor number ($3)!in[0..99] (try $ sh peon help)."
        fi
      ;;
      major)
        if [ $3 -ge 0 ] && [ $3 -le 99 ]
        then
          eWait "Increase major by $3"
          _major=$3
        else
          eRor "version:set invalid value for major number ($3)!in[0..99] (try $ sh peon help)."
        fi
      ;;
      *)
        eRor "version:set bad parameters ($2)!=[build|minor|major] (try $ sh peon help)."
    esac
else
  eRor "version:set bad parameters ($#)!=3 (try $ sh peon help)."
fi

eLN
eWait "New version is v$_major.$_minor.$_build ... i'll try to write it." 
setVersion $_major $_minor $_build

