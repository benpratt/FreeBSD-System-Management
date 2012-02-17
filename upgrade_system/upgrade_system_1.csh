#!/bin/csh

rm /root/FreeBSD-System-Maintenance/upgrade/progress_last.txt
cp /root/FreeBSD-System-Maintenance/upgrade/progress.txt /root/FreeBSD-System-Maintenance/upgrade/progress_last.txt
rm /root/FreeBSD-System-Maintenance/upgrade/progress.txt

date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
echo "rm -rf /var/tmp/temproot"
rm -rf /var/tmp/temproot
date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
echo "cvsup ./system-upgrade" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
/usr/local/bin/cvsup ./system-upgrade

if ($? == "0") then
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "make clean" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  make clean
else
  echo "cvsup failed"
  echo "cvsup failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "make buildworld" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  make buildworld
else
  echo "clean failed"
  echo "clean failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "make buildkernel KERNCONF=MYKERNEL" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  make buildkernel KERNCONF=MYKERNEL
else
  echo "buildworld failed"
  echo "buildworld failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "make installkernel KERNCONF=MYKERNEL" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  make installkernel KERNCONF=MYKERNEL
else
  echo "buildkernel failed"
  echo "buildkernel failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "Time to Reboot!" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  echo "Time to Reboot into Single User mode"
else
  echo "installkernel failed"
  echo "installkernel failed" >> /root/FreeBSD-System-Maintenance/upgrade/progress.txt
  exit 0
endif
