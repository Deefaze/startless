#!/bin/bash

_local_ip=127.12.127.12
_local_pt=80
_url="http://$_local_ip:$_local_pt/test/"

eDesc "Start a local server on" "$_local_ip:$_local_pt"

eLN

case $2 in
  linux)
    eWait "Run in Linux..."
    x-www-browser $_url
    ;;
  osx)
    eWait "Run in OSX..."
    open $_url
    ;;
  win)
    eWait "Run in Windows..."
    rundll32 url.dll,FileProtocolHandler "$_url"
    ;;
  *)
    eDesc "For Linux   " "  $ sh peon test linux"
    eDesc "For OSx     " "  $ sh peon test osx"
    eDesc "For Windows " "  $ sh peon test win"
    exit 1
esac

eLN
eWait "Start server ... Press CTRL+C before closing terminal"
php -S $_local_ip:$_local_pt
