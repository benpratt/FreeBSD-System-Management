#!/bin/csh

# Updating MYKERNEL
  echo "Updating MYKERNEL"

  if (`uname -p` == "i386") then
    cd /usr/src/sys/i386/conf/
  else if (`uname -p` == "amd64") then
    cd /usr/src/sys/amd64/conf/
  else
    exit 0
  endif

  rm MYKERNEL

  echo "include	GENERIC" >> MYKERNEL
  echo "ident	MYKERNEL" >> MYKERNEL

  echo "" >> MYKERNEL

  echo "# IPFW Firewall Support" >> MYKERNEL
  echo "options	IPFIREWALL" >> MYKERNEL
  echo "#options	IPFIREWALL_FORWARD" >> MYKERNEL
  echo "options	IPFIREWALL_VERBOSE" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# IPF Firewall Support" >> MYKERNEL
  echo "#options	IPFILTER" >> MYKERNEL
  echo "#options	IPFILTER_LOG" >> MYKERNEL
  echo "#options	IPFILTER_DEFAULT_BLOCK" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# Bridge Support" >> MYKERNEL
  echo "device	if_bridge" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# NAT Support" >> MYKERNEL
  echo "options	IPDIVERT" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# CD-RW Support" >> MYKERNEL
  echo "#device	atapicam" >> MYKERNEL
  echo "" >> MYKERNEL

  echo "# Dummynet Support" >> MYKERNEL
  echo "#options	DUMMYNET" >> MYKERNEL
  echo "#options	HZ=1000" >> MYKERNEL

  echo "" >> MYKERNEL

# General Options
  echo "nooptions	GEOM_RAID" >> MYKERNEL
  echo "nooptions	COMPAT_FREEBSD4" >> MYKERNEL
  echo "nooptions	COMPAT_FREEBSD5" >> MYKERNEL
  echo "nooptions	COMPAT_FREEBSD6" >> MYKERNEL
  echo "nooptions	COMPAT_FREEBSD7" >> MYKERNEL
  echo "nooptions	COMPAT_FREEBSD9" >> MYKERNEL

# SMP
  echo "nooptions	SMP" >> MYKERNEL

# Floppy Drive
  echo "nodevice	fdc" >> MYKERNEL

# ATA controllers
  echo "nodevice	mvs" >> MYKERNEL
  echo "nodevice	siis" >> MYKERNEL

# SCSI Controllers
  echo "nodevice	esp" >> MYKERNEL
  echo "nodevice	hptiop" >> MYKERNEL
  echo "nodevice	isp" >> MYKERNEL
  echo "nodevice	ispfw" >> MYKERNEL
  echo "nodevice	mpt" >> MYKERNEL
  echo "nodevice	mps" >> MYKERNEL
  echo "nodevice	mpr" >> MYKERNEL
  echo "nodevice	ncr" >> MYKERNEL
  echo "nodevice	sym" >> MYKERNEL
  echo "nodevice	trm" >> MYKERNEL
  echo "nodevice	adv" >> MYKERNEL
  echo "nodevice	adw" >> MYKERNEL
  echo "nodevice	aic" >> MYKERNEL
  echo "nodevice	bt" >> MYKERNEL
  echo "nodevice	isci" >> MYKERNEL

# RAID Controllers
  echo "nodevice	amr" >> MYKERNEL
  echo "nodevice	arcmsr" >> MYKERNEL
  echo "nodevice	ciss" >> MYKERNEL
  echo "nodevice	dpt" >> MYKERNEL
  echo "nodevice	hptmv" >> MYKERNEL
  echo "nodevice	hptnr" >> MYKERNEL
  echo "nodevice	hptrr" >> MYKERNEL
  echo "nodevice	hpt27xx" >> MYKERNEL
  echo "nodevice	iir" >> MYKERNEL
  echo "nodevice	ips" >> MYKERNEL
  echo "nodevice	mly" >> MYKERNEL
  echo "nodevice	twa" >> MYKERNEL
  echo "nodevice	tws" >> MYKERNEL
  echo "nodevice	aac" >> MYKERNEL
  echo "nodevice	aacp" >> MYKERNEL
  echo "nodevice	aacraid" >> MYKERNEL
  echo "nodevice	ida" >> MYKERNEL
  echo "nodevice	mfi" >> MYKERNEL
  echo "nodevice	mlx" >> MYKERNEL
  echo "nodevice	mrsas" >> MYKERNEL
  echo "nodevice	pmspcv" >> MYKERNEL
  echo "nodevice	pst" >> MYKERNEL
  echo "nodevice	twe" >> MYKERNEL

# NVM Express
  echo "nodevice	nvme" >> MYKERNEL
  echo "nodevice	nvd" >> MYKERNEL

# PCCARD
  echo "nodevice	cbb" >> MYKERNEL
  echo "nodevice	pccard" >> MYKERNEL
  echo "nodevice	cardbus" >> MYKERNEL

# Parallel port
  echo "nodevice	ppc" >> MYKERNEL
  echo "nodevice	ppbus" >> MYKERNEL
  echo "nodevice	lpt" >> MYKERNEL
  echo "nodevice	ppi" >> MYKERNEL
  echo "nodevice	vpo" >> MYKERNEL
  echo "nodevice	puc" >> MYKERNEL

# NICs
  echo "nodevice	bxe" >> MYKERNEL
  echo "nodevice	de" >> MYKERNEL
  echo "nodevice	igb" >> MYKERNEL
  echo "nodevice	ix" >> MYKERNEL
  echo "nodevice	ixv" >> MYKERNEL
  echo "nodevice	ixl" >> MYKERNEL
  echo "nodevice	ixlv" >> MYKERNEL
  echo "nodevice	le" >> MYKERNEL
  echo "nodevice	ti" >> MYKERNEL
  echo "nodevice	txp" >> MYKERNEL
  echo "nodevice	vx" >> MYKERNEL

  echo "nodevice	ae" >> MYKERNEL
  echo "nodevice	age" >> MYKERNEL
  echo "nodevice	alc" >> MYKERNEL
  echo "nodevice	ale" >> MYKERNEL
  echo "nodevice	bce" >> MYKERNEL
  echo "nodevice	bfe" >> MYKERNEL
  echo "nodevice	bge" >> MYKERNEL
  echo "nodevice	cas" >> MYKERNEL
  echo "nodevice	et" >> MYKERNEL
  echo "nodevice	fxp" >> MYKERNEL
  echo "nodevice	gem" >> MYKERNEL
  echo "nodevice	hme" >> MYKERNEL
  echo "nodevice	jme" >> MYKERNEL
  echo "nodevice	lge" >> MYKERNEL
  echo "nodevice	msk" >> MYKERNEL
  echo "nodevice	nfe" >> MYKERNEL
  echo "nodevice	nge" >> MYKERNEL
  echo "nodevice	pcn" >> MYKERNEL
  echo "nodevice	sf" >> MYKERNEL
  echo "nodevice	sge" >> MYKERNEL
  echo "nodevice	sis" >> MYKERNEL
  echo "nodevice	sk" >> MYKERNEL
  echo "nodevice	ste" >> MYKERNEL
  echo "nodevice	stge" >> MYKERNEL
  echo "nodevice	tl" >> MYKERNEL
  echo "nodevice	tx" >> MYKERNEL
  echo "nodevice	vge" >> MYKERNEL
  echo "nodevice	vr" >> MYKERNEL
  echo "nodevice	wb" >> MYKERNEL

# Wireless
  echo "nodevice	wlan" >> MYKERNEL
  echo "nooptions	IEEE80211_DEBUG" >> MYKERNEL
  echo "nooptions	IEEE80211_AMPDU_AGE" >> MYKERNEL
  echo "nooptions	IEEE80211_SUPPORT_MESH" >> MYKERNEL
  echo "nodevice	wlan_wep" >> MYKERNEL
  echo "nodevice	wlan_ccmp" >> MYKERNEL
  echo "nodevice	wlan_tkip" >> MYKERNEL
  echo "nodevice	wlan_amrr" >> MYKERNEL
  echo "nodevice	an" >> MYKERNEL
  echo "nodevice	ath" >> MYKERNEL
  echo "nodevice	ath_pci" >> MYKERNEL
  echo "nodevice	ath_hal" >> MYKERNEL
  echo "nooptions	AH_SUPPORT_AR5416" >> MYKERNEL
  echo "nooptions	AH_AR5416_INTERRUPT_MITIGATION" >> MYKERNEL
  echo "nooptions	ATH_ENABLE_11N" >> MYKERNEL
  echo "nodevice	ath_rate_sample" >> MYKERNEL
  echo "nodevice	ipw" >> MYKERNEL
  echo "nodevice	iwi" >> MYKERNEL
  echo "nodevice	iwn" >> MYKERNEL
  echo "nodevice	malo" >> MYKERNEL
  echo "nodevice	mwl" >> MYKERNEL
  echo "nodevice	ral" >> MYKERNEL
  echo "nodevice	wi" >> MYKERNEL
  echo "nodevice	wpi" >> MYKERNEL

# Pseudo devices
  echo "nodevice	padlock_rng" >> MYKERNEL
  echo "nodevice	rdrand_rng" >> MYKERNEL

# Sound
  echo "nodevice	snd_cmi" >> MYKERNEL
  echo "nodevice	snd_csa" >> MYKERNEL
  echo "nodevice	snd_emu10kx" >> MYKERNEL
  echo "nodevice	snd_es137x" >> MYKERNEL
  echo "nodevice	snd_hda" >> MYKERNEL
  echo "nodevice	snd_ich" >> MYKERNEL
  echo "nodevice	snd_via8233" >> MYKERNEL

# HyperV
  echo "nodevice	hyperv" >> MYKERNEL

# Xen
  echo "nodevice	XENHVM" >> MYKERNEL
  echo "nodevice	xenpci" >> MYKERNEL

# VMware
  echo "nodevice	vmx" >> MYKERNEL

# Netmap
  echo "nodevice	netmap" >> MYKERNEL

# Confirm Continue
  set continue=empty
  while ($continue != "continue")
    echo "Kernel Configuration Complete"
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