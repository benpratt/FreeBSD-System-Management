#!/bin/csh

# Remove link for next script
  rm /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh

# Document start of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Starting 1_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Remove previous build
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Remove Previous Build" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  cd /usr/obj
  chflags -R noschg *
  rm -rf *
  cd /usr/src/
  make cleandir
  make cleandir
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Remove Previous Build complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "Previous build removed"
    echo "Build the world is next"
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

# Build the world

  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make buildworld" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make buildworld
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make buildworld complete" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    mail -s "buildworld complete" ben@thegeekzone.com <<< "buildworld is complete. Kernel build is next"
    echo "make buildworld complete"
    echo "Kernel build is next"
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

# Prompt for reboot

    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "Time to build the kernel!" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "Time to build the kernel"

# Document end of script
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Ending 1_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Create link for next script
  ln -s /root/FreeBSD-System-Maintenance/upgrade_system/2_upgrade_system.csh /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh
