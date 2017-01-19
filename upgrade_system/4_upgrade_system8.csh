#!/bin/csh

# Remove link for next script
  rm /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh

# Document start of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Starting 4_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

  cd /usr/obj/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "rm -rf *" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  chflags -R noschg *
  rm -rf *
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "/usr/obj/ removed" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "/usr/obj/ removed"
    echo "make clean of /usr/src/ is next"
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

  cd /usr/src/
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "make clean" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  make clean
  make cleandir
  make cleandir
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "/usr/src/ cleaned" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "/usr/src/ cleaned"
    echo "Almost done!"
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
  echo "All done!" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "All done!"

# Document end of script
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Ending 4_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt