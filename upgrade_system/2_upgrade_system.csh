#!/bin/csh

# Document start of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Starting 2_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Update installworld config files
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "/usr/sbin/mergemaster -p" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  /usr/sbin/mergemaster -p

# Install the world
  if ($? == "0") then
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "make installworld" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    make installworld
  else
    echo "mergemaster -p failed"
    echo "mergemaster -p failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    exit 0
  endif

# Update remaining config files
  if ($? == "0") then
    cd /usr/src/etc/
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "/usr/sbin/mergemaster -p" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    /usr/sbin/mergemaster -p
  else
    echo "installworld failed"
    echo "installworld failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    exit 0
  endif

# Delete obsolete files
  if ($? == "0") then
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "make delete-old" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    cd /usr/src
    make delete-old
  else
    echo "mergemaster -p failed"
    echo "mergemaster -p failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    exit 0
  endif

  if ($? == "0") then
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "Time to Reboot!" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "Time to Reboot!"
  else
    echo "make delete-old failed"
    echo "make delete-old failed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    exit 0
  endif

# Document end of script
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Ending 2_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
