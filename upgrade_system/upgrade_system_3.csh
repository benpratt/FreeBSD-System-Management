#!/bin/csh

cd /usr/obj/
date >> /root/System_Maintenance/upgrade/progress.txt
echo "rm -rf *" >> /root/System_Maintenance/upgrade/progress.txt
echo "" >> /root/System_Maintenance/upgrade/progress.txt
rm -rf *

if ($? == "0") then
  cd /usr/src/
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "make clean" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  make clean
else
  echo "rm -rf * failed"
  echo "rm -rf * failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "All done!" >> /root/System_Maintenance/upgrade/progress.txt
  echo "All done!"
else
  echo "make clean failed"
  echo "make clean failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif
