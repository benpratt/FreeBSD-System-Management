#!/bin/csh

  echo "portupgrade -a"
  /usr/local/sbin/portupgrade -a

if ($? == "0") then
  echo "Update Complete"
  exit 0
else
  echo "portupgrade -a failed"
  exit 0
endif
