function npmHelpDev()
{
  eDesc "npmVersion" "Get the current NPM version"
}
function npmVersion()
{
  eDesc "NPM version" $(npm -v)
}

function npmInstallGlobal()
{
  _=$(npm install -g $1)
}

function npmInstall()
{
  _=$(npm install $1)
}
