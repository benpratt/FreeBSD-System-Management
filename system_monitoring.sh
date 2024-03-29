#!/usr/local/bin/bash

status="run"

while [ "$status" = run ]
do
clear
echo 'Options: '
echo ''
echo '0) General (bpytop)'
echo '1) Network (systat -ifstat 1)'
echo '2) Network Connections (iftop)'
echo 'exit) Exit'
echo ''
echo 'Which option? '

read option

case $option in

0)
  bpytop
  ;;
1)
  systat -ifstat 1
  ;;
2)
  iftop
  ;;
exit)
  status="exit"
  ;;
esac

done
