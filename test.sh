#!/bin/bash
tput reset
tput smcup
tput setaf 4

case $1 in
  linux)
    x-www-browser http://127.0.0.250:80/test/
    ;;
  osx)
    open http://127.0.0.250:80/test/
    ;;
  win)
    rundll32 url.dll,FileProtocolHandler "http://127.0.0.250:80/test/"
    ;;
  *)
    tput setaf 1
    echo -e "Run Test\n--------\n"
    echo -e "  Linux   : $ sh $0 linux"
    echo -e "  OSx     : $ sh $0 osx"
    echo -e "  Windows : $ sh $0 win"
    echo -e "\n"
    tput sgr 0
    exit 1
esac
php -S 127.0.0.250:80
tput sgr 0