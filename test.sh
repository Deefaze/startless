#!/bin/bash
tput reset
tput smcup
tput setaf 4

_local_ip=127.12.127.12
_local_pt=80

_url=http://$_local_ip:$_local_pt/test/

case $1 in
  linux)
    x-www-browser $_url
    ;;
  osx)
    open $_url
    ;;
  win)
    rundll32 url.dll,FileProtocolHandler "$_url"
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
php -S $_local_ip:$_local_pt
tput sgr 0