#!/bin/csh

# Document start of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Starting 3_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

  cd /usr/obj/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "rm -rf *" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  rm -rf *

  if ($? == "0") then
    cd /usr/src/
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "make clean" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    make clean
  else
    echo "rm -rf * failed"
    echo "rm -rf * failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    exit 0
  endif

  if ($? == "0") then
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "All done!" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "All done!"
  else
    echo "make clean failed"
    echo "make clean failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    exit 0
  endif

# Document end of script
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Ending 3_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
