dir=$(dirname $0)

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