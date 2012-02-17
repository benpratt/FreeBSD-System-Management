#!/bin/csh

cd /usr/src/

date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
echo "/usr/sbin/mergemaster -p" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
/usr/sbin/mergemaster -p

if ($? == "0") then
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "make installworld" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  make installworld
else
  echo "mergemaster -p failed"
  echo "mergemaster -p failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/etc/
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "/usr/sbin/mergemaster" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  /usr/sbin/mergemaster
else
  echo "installworld failed"
  echo "installworld failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "Time to Reboot!" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "Time to Reboot!"
else
  echo "mergemaster failed"
  echo "mergemaster failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif
