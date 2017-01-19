#!/bin/csh

# Build the kernel

  cd /usr/src/
  echo "make buildkernel KERNCONF=MYKERNEL"
  make buildkernel KERNCONF=MYKERNEL
  echo "make buildkernel complete"

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "make buildkernel complete"
    echo "Kernel install is next"
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