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
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "mergemaster complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  while ($continue != "continue")
    echo "mergemaster complete"
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
  while ($continue != "continue")
    echo "installworld complete"
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
  while ($continue != "continue")
    echo "mergemaster complete"
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
  while ($continue != "continue")
    echo "delete-old complete"
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
  echo "Ending 2_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
