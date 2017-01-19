#!/bin/csh

# Setup logging
  rm /root/FreeBSD-System-Maintenance/upgrade_system/progress_last.txt
  cp /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt /root/FreeBSD-System-Maintenance/upgrade_system/progress_last.txt
  rm /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Document start of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Starting 0_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Head or specific revision
  set specific=head
  while ($specific != "n" && $specific != "no" && $specific != "y" && $specific != "yes")
    echo ""
    echo "Would you like to update to a specific revision? (y)es or (n)o"
    set specific = $<
    echo ""
    switch ($specific)
      case n:
        set revision=.
        breaksw
      case no:
        set revision=.
        breaksw
      case y:
        set revision=get
        breaksw
      case yes:
        set revision=get
        breaksw
      default:
        echo "Please enter a valid value."
        breaksw
      endsw
    end

  if ($revision == "get") then
    set verify=no
    while ($verify != "y" && $verify != "yes")
      echo ""
      echo "What revision would you like?"
      set revision = $<
      echo ""
      echo "Is this revision correct: $revision"
      echo "(y)es?"
      echo ""
      set verify = $<
    end
  endif

# Cleanup
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "rm -rf /var/tmp/temproot"
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  rm -rf /var/tmp/temproot
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "/var/tmp/temproot removed"
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# SVN Checkout Method
  if -d /usr/src/.svn then
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    if ($revision == ".") then
      echo "cd /usr/src && svn update" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
      cd /usr/src && svn update
    else
      echo "cd /usr/src && svn update -r$revision" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
      cd /usr/src && svn update -r$revision
    endif
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "/usr/src updated" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    svn info >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  else
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    if ($revision = ".") then
      echo "svn co svn://svn.freebsd.org/base/head /usr/src" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
      svn co svn://svn.freebsd.org/base/head /usr/src
    else
      echo "svn co svn://svn.freebsd.org/base/head@$revision /usr/src" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
      svn co svn://svn.freebsd.org/base/head@$revision /usr/src
    endif
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
    echo "svn.freebsd.org/base/head checked out" >> /root/FreeBSD-System-Maintenance/upgrade_system_progress.txt
    echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  endif

# Document end of script
  date >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "Ending 0_upgrade_system.csh" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt
  echo "" >> /root/FreeBSD-System-Maintenance/upgrade_system/progress.txt

# Create link for next script
  ln -s /root/FreeBSD-System-Maintenance/upgrade_system/1_upgrade_system.csh /root/FreeBSD-System-Maintenance/upgrade_system/_next.csh