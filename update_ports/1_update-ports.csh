#!/bin/csh

echo "cvsup ./ports-supfile"
/usr/local/bin/cvsup ./ports-supfile

if ($? == "0") then
  echo "make fetchindex"
  cd /usr/ports/
  make fetchindex
else
  echo "cvsup failed"
  exit 0
endif

if ($? == "0") then
  echo "pkgdb -F"
  /usr/local/sbin/pkgdb -F
else
  echo "make fetchindex failed"
  exit 0
endif

if ($? == "0") then
  echo "Ports Source Update Complete"
else
  echo "pkgdb -F failed"
  exit 0
endif
