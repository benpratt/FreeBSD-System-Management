#!/bin/csh

cd /usr/src/

date >> /root/System_Maintenance/upgrade/progress.txt
echo "/usr/sbin/mergemaster -p" >> /root/System_Maintenance/upgrade/progress.txt
echo "" >> /root/System_Maintenance/upgrade/progress.txt
/usr/sbin/mergemaster -p

if ($? == "0") then
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "make installworld" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  make installworld
else
  echo "mergemaster -p failed"
  echo "mergemaster -p failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/etc/
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "/usr/sbin/mergemaster" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  /usr/sbin/mergemaster
else
  echo "installworld failed"
  echo "installworld failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "Time to Reboot!" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  echo "Time to Reboot!"
else
  echo "mergemaster failed"
  echo "mergemaster failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif
