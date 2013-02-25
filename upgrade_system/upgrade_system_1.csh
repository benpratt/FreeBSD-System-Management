#!/bin/csh

  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make clean" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make clean

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
