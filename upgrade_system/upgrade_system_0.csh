#!/bin/csh

# Setup logging
rm /root/FreeBSD-System-Maintenance/upgrade_system/progress_last.txt
cp /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt /root/FreeBSD-System-Maintenance/upgrade_system/progress_last.txt
rm /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Cleanup
date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
echo "rm -rf /var/tmp/temproot"
rm -rf /var/tmp/temproot

# CVSUP Checkout Method (Retired)
#date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
#echo "cvsup ./system-upgrade" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
#echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
#/usr/local/bin/cvsup ./system-upgrade

# SVN Checkout Method
if -d /usr/src/.svn then
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "cd /usr/src && svn update" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  cd /usr/src && svn update
else
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "svn co svn://svn.freebsd.org/base/head /usr/src" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  svn co svn://svn.freebsd.org/base/head /usr/src
endif

if ($? == "0") then
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make clean" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make clean
else
  echo "cvsup failed"
  echo "cvsup failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make buildworld" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make buildworld
else
  echo "clean failed"
  echo "clean failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  exit 0
endif

if ($? == "0") then
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make buildkernel KERNCONF=MYKERNEL" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make buildkernel KERNCONF=MYKERNEL
else
  echo "buildworld failed"
  echo "buildworld failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make installkernel KERNCONF=MYKERNEL" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make installkernel KERNCONF=MYKERNEL
else
  echo "buildkernel failed"
  echo "buildkernel failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  exit 0
endif

if ($? == "0") then
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Time to Reboot!" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Time to Reboot into Single User mode"
else
  echo "installkernel failed"
  echo "installkernel failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  exit 0
endif
