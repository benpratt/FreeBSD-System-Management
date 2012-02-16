#!/bin/csh

rm /root/System_Maintenance/upgrade/progress_last.txt
cp /root/System_Maintenance/upgrade/progress.txt /root/System_Maintenance/upgrade/progress_last.txt
rm /root/System_Maintenance/upgrade/progress.txt

date >> /root/System_Maintenance/upgrade/progress.txt
echo "rm -rf /var/tmp/temproot"
rm -rf /var/tmp/temproot
date >> /root/System_Maintenance/upgrade/progress.txt
echo "cvsup /tmp/system-upgrade" >> /root/System_Maintenance/upgrade/progress.txt
echo "" >> /root/System_Maintenance/upgrade/progress.txt
/usr/local/bin/cvsup /tmp/system-upgrade

if ($? == "0") then
  cd /usr/src/
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "make clean" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  make clean
else
  echo "cvsup failed"
  echo "cvsup failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "make buildworld" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  make buildworld
else
  echo "clean failed"
  echo "clean failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "make buildkernel KERNCONF=MYKERNEL" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  make buildkernel KERNCONF=MYKERNEL
else
  echo "buildworld failed"
  echo "buildworld failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "make installkernel KERNCONF=MYKERNEL" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  make installkernel KERNCONF=MYKERNEL
else
  echo "buildkernel failed"
  echo "buildkernel failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/System_Maintenance/upgrade/progress.txt
  echo "Time to Reboot!" >> /root/System_Maintenance/upgrade/progress.txt
  echo "" >> /root/System_Maintenance/upgrade/progress.txt
  echo "Time to Reboot into Single User mode"
else
  echo "installkernel failed"
  echo "installkernel failed" >> /root/System_Maintenance/upgrade/progress.txt
  exit 0
endif
