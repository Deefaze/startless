
eWait "Peon version $peon_version"
eLN

getVersion

eWait "StartLess version $_major.$_minor.$_build build $(git rev-parse --short HEAD)"
eLN
eXit