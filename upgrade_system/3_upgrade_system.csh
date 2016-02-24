#!/bin/csh

# Remove link for next script
  rm /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh

# Document start of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Starting 3_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Update installworld config files
  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "/usr/sbin/mergemaster -p" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  /usr/sbin/mergemaster -p
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "mergemaster complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "mergemaster complete"
    echo "InstallWorld is next"
    echo "Type continue or end."
    set continue = $<
    switch ($continue)
      case continue:
        breaksw
      case end:
        exit 0
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
    endsw
  end

# Install the world
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make installworld" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make installworld
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make installworld complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "installworld complete"
    echo "Updating remaining config files is next"
    echo "Type continue or end."
    set continue = $<
    switch ($continue)
      case continue:
        breaksw
      case end:
        exit 0
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
    endsw
  end

# Update remaining config files
  cd /usr/src/etc/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "/usr/sbin/mergemaster -iF" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  /usr/sbin/mergemaster -iF
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "mergemaster complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "mergemaster complete"
    echo "Delete obsolete files is next"
    echo "Type continue or end."
    set continue = $<
    switch ($continue)
      case continue:
        breaksw
      case end:
        exit 0
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
    endsw
  end

# Delete obsolete files
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make delete-old" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  cd /usr/src
  yes|make delete-old
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "delete-old complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "delete-old complete"
    echo "Reboot is next"
    echo "Type continue or end."
    set continue = $<
    switch ($continue)
      case continue:
        breaksw
      case end:
        exit 0
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
    endsw
  end

  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Time to Reboot!" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Time to Reboot!"

# Document end of script
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Ending 3_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Create link for next script
  ln -s /root/FreeBSD-System-Maintenance/upgrade_system/4_upgrade_system.csh /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh
