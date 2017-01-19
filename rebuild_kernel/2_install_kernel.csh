#!/bin/csh

# Install the kernel

  cd /usr/src/
  echo "make installkernel KERNCONF=MYKERNEL"
  make installkernel KERNCONF=MYKERNEL
  echo "make installkernel complete"

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "make installkernel complete"
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
