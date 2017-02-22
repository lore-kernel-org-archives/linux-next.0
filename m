From: Xiong Zhou <xzhou@redhat.com>
Subject: Starting kvm/qemu guest crash kernel linux-next 0221 tree
Date: Wed, 22 Feb 2017 09:52:43 +0800
Message-ID: <20170222015243.bzcnin2xbygak4wl@XZHOUW.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45574 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753925AbdBVBwq (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 21 Feb 2017 20:52:46 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: qemu-devel@nongnu.org, kvm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org

Hi,

Starting a guest begin to crash kernel on 0221 -next tree.

It's fine on 0220 tree.

Thanks,
Xiong

-------------
Feb 22 09:24:29 host-12 systemd-journald[405]: Received SIGTERM from PID 1 (systemd).
Feb 22 09:24:29 host-12 kernel: systemd: 24 output lines suppressed due to ratelimiting
Feb 22 09:24:29 host-12 kernel: audit: type=1404 audit(1487755465.919:2): enforcing=1 old_enforcing=0 auid=4294967295 ses=4294967295
Feb 22 09:24:29 host-12 kernel: SELinux:  Permission validate_trans in class security not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Permission module_load in class system not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class binder not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class cap_userns not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class cap2_userns not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class sctp_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class icmp_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class ax25_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class ipx_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class netrom_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class atmpvc_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class x25_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class rose_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class decnet_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class atmsvc_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class rds_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class irda_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class pppox_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class llc_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class can_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class tipc_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class bluetooth_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class iucv_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class rxrpc_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class isdn_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class phonet_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class ieee802154_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class caif_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class alg_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class nfc_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class vsock_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class kcm_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class qipcrtr_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux:  Class smc_socket not defined in policy.
Feb 22 09:24:29 host-12 kernel: SELinux: the above unknown classes and permissions will be allowed
Feb 22 09:24:29 host-12 kernel: audit: type=1403 audit(1487755467.188:3): policy loaded auid=4294967295 ses=4294967295
Feb 22 09:24:29 host-12 systemd[1]: Successfully loaded SELinux policy in 1.293388s.
Feb 22 09:24:29 host-12 systemd[1]: RTC configured in localtime, applying delta of 480 minutes to system time.
Feb 22 09:24:29 host-12 kernel: ip_tables: (C) 2000-2006 Netfilter Core Team
Feb 22 09:24:29 host-12 systemd[1]: Inserted module 'ip_tables'
Feb 22 09:24:29 host-12 systemd[1]: Relabelled /dev and /run in 41.372ms.
Feb 22 09:24:29 host-12 journal: Journal started
Feb 22 09:24:29 host-12 systemd: systemd 219 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
Feb 22 09:24:29 host-12 systemd: Detected architecture x86-64.
Feb 22 09:24:29 host-12 systemd: Set hostname to <localhost.localdomain>.
Feb 22 09:24:29 host-12 systemd: Starting Flush Journal to Persistent Storage...
Feb 22 09:24:29 host-12 systemd: Mounted Arbitrary Executable File Formats File System.
Feb 22 09:24:29 host-12 journal: Runtime journal is using 8.0M (max allowed 1.6G, trying to leave 2.4G free of 16.4G available → current limit 1.6G).
Feb 22 09:24:29 host-12 kernel: RPC: Registered named UNIX socket transport module.
Feb 22 09:24:29 host-12 kernel: RPC: Registered udp transport module.
Feb 22 09:24:29 host-12 kernel: RPC: Registered tcp transport module.
Feb 22 09:24:29 host-12 kernel: RPC: Registered tcp NFSv4.1 backchannel transport module.
Feb 22 09:24:30 host-12 systemd: Started Flush Journal to Persistent Storage.
Feb 22 09:24:30 host-12 systemd: Mounted RPC Pipe File System.
Feb 22 09:24:30 host-12 systemd: Started Set Up Additional Binary Formats.
Feb 22 09:24:30 host-12 systemd: Started Create Static Device Nodes in /dev.
Feb 22 09:24:30 host-12 systemd: Starting udev Kernel Device Manager...
Feb 22 09:24:30 host-12 systemd: Started LVM2 metadata daemon.
Feb 22 09:24:30 host-12 systemd: Starting LVM2 metadata daemon...
Feb 22 09:24:30 host-12 systemd: Started udev Coldplug all Devices.
Feb 22 09:24:30 host-12 systemd: Starting udev Wait for Complete Device Initialization...
Feb 22 09:24:30 host-12 systemd: Started Configure read-only root support.
Feb 22 09:24:30 host-12 systemd-udevd: starting version 219
Feb 22 09:24:30 host-12 kernel: Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
Feb 22 09:24:30 host-12 systemd: Mounted NFSD configuration filesystem.
Feb 22 09:24:30 host-12 systemd: Started udev Kernel Device Manager.
Feb 22 09:24:30 host-12 kernel: shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
Feb 22 09:24:30 host-12 kernel: dca service started, version 1.12.1
Feb 22 09:24:30 host-12 systemd: Found device /dev/ttyS1.
Feb 22 09:24:30 host-12 kernel: ipmi message handler version 39.2
Feb 22 09:24:30 host-12 kernel: power_meter ACPI000D:00: Found ACPI power meter.
Feb 22 09:24:30 host-12 kernel: power_meter ACPI000D:00: Ignoring unsafe software power cap!
Feb 22 09:24:30 host-12 kernel: power_meter ACPI000D:00: hwmon_device_register() is deprecated. Please convert the driver to use hwmon_device_register_with_info().
Feb 22 09:24:31 host-12 kernel: ipmi device interface
Feb 22 09:24:31 host-12 kernel: wmi: Mapper loaded
Feb 22 09:24:31 host-12 kernel: input: PC Speaker as /devices/platform/pcspkr/input/input5
Feb 22 09:24:31 host-12 kernel: ioatdma: Intel(R) QuickData Technology Driver 4.00
Feb 22 09:24:31 host-12 kernel: hpwdt 0000:01:00.0: HPE Watchdog Timer Driver: NMI decoding initialized, allow kernel dump: ON (default = 1/ON)
Feb 22 09:24:31 host-12 kernel: i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
Feb 22 09:24:31 host-12 kernel: hpwdt 0000:01:00.0: HPE Watchdog Timer Driver: 1.4.0, timer margin: 30 seconds (nowayout=0).
Feb 22 09:24:31 host-12 kernel: iTCO_vendor_support: vendor-support=0
Feb 22 09:24:31 host-12 kernel: ipmi_si IPI0001:00: ipmi_si: probing via ACPI
Feb 22 09:24:31 host-12 kernel: scsi 0:0:0:0: Attached scsi generic sg0 type 12
Feb 22 09:24:31 host-12 kernel: sd 0:1:0:0: Attached scsi generic sg1 type 0
Feb 22 09:24:31 host-12 kernel: ipmi_si IPI0001:00: [io  0x0ca2-0x0ca3] regsize 1 spacing 1 irq 0
Feb 22 09:24:31 host-12 kernel: ipmi_si: Adding ACPI-specified kcs state machine
Feb 22 09:24:31 host-12 kernel: IPMI System Interface driver.
Feb 22 09:24:31 host-12 kernel: ipmi_si: probing via SMBIOS
Feb 22 09:24:31 host-12 kernel: ipmi_si: SMBIOS: io 0xca2 regsize 1 spacing 1 irq 0
Feb 22 09:24:31 host-12 kernel: ipmi_si: SMBIOS-specified kcs state machine: duplicate
Feb 22 09:24:31 host-12 kernel: ipmi_si: probing via SPMI
Feb 22 09:24:31 host-12 kernel: ipmi_si: SPMI: io 0xca3 regsize 1 spacing 1 irq 0
Feb 22 09:24:31 host-12 kernel: ipmi_si: Adding SPMI-specified kcs state machine
Feb 22 09:24:31 host-12 kernel: ipmi_si: Trying ACPI-specified kcs state machine at i/o address 0xca2, slave address 0x20, irq 0
Feb 22 09:24:31 host-12 kernel: iTCO_wdt: Intel TCO WatchDog Timer Driver v1.11
Feb 22 09:24:31 host-12 kernel: iTCO_wdt: unable to reset NO_REBOOT flag, device disabled by hardware/BIOS
Feb 22 09:24:31 host-12 kernel: ipmi_si IPI0001:00: Found new BMC (man_id: 0x00000b, prod_id: 0x2000, dev_id: 0x13)
Feb 22 09:24:31 host-12 kernel: ipmi_si IPI0001:00: IPMI kcs interface initialized
Feb 22 09:24:31 host-12 kernel: AVX2 version of gcm_enc/dec engaged.
Feb 22 09:24:31 host-12 kernel: AES CTR mode by8 optimization enabled
Feb 22 09:24:31 host-12 kernel: IPMI SSIF Interface driver
Feb 22 09:24:31 host-12 systemd: Found device LOGICAL_VOLUME 2.
Feb 22 09:24:31 host-12 kernel: alg: No test for pcbc(aes) (pcbc-aes-aesni)
Feb 22 09:24:31 host-12 systemd: Started Monitoring of LVM2 mirrors, snapshots etc. using dmeventd or progress polling.
Feb 22 09:24:31 host-12 systemd: Found device LOGICAL_VOLUME 3.
Feb 22 09:24:31 host-12 systemd: Activating swap /dev/disk/by-uuid/a7a8c90b-1d4b-4312-9d4c-2c83e83c3b06...
Feb 22 09:24:31 host-12 systemd: Reached target Local File Systems (Pre).
Feb 22 09:24:31 host-12 systemd: Starting Local File Systems (Pre).
Feb 22 09:24:31 host-12 systemd: Mounting /boot...
Feb 22 09:24:32 host-12 kernel: XFS (sda2): Mounting V5 Filesystem
Feb 22 09:24:32 host-12 kernel: Adding 31457276k swap on /dev/sda3.  Priority:-1 extents:1 across:31457276k FS
Feb 22 09:24:32 host-12 systemd: Activated swap /dev/disk/by-uuid/a7a8c90b-1d4b-4312-9d4c-2c83e83c3b06.
Feb 22 09:24:32 host-12 systemd: Reached target Swap.
Feb 22 09:24:32 host-12 systemd: Starting Swap.
Feb 22 09:24:32 host-12 kernel: XFS (sda2): Starting recovery (logdev: internal)
Feb 22 09:24:32 host-12 systemd: Mounted /boot.
Feb 22 09:24:32 host-12 kernel: EDAC MC: Ver: 3.0.0
Feb 22 09:24:32 host-12 kernel: XFS (sda2): Ending recovery (logdev: internal)
Feb 22 09:24:32 host-12 kernel: EDAC MC0: Giving out device to module sbridge_edac.c controller Haswell Socket#0: DEV 0000:7f:12.0 (INTERRUPT)
Feb 22 09:24:32 host-12 kernel: EDAC MC1: Giving out device to module sbridge_edac.c controller Haswell Socket#1: DEV 0000:ff:12.0 (INTERRUPT)
Feb 22 09:24:32 host-12 kernel: EDAC sbridge:  Ver: 1.1.1 
Feb 22 09:24:33 host-12 kernel: intel_rapl: Found RAPL domain package
Feb 22 09:24:33 host-12 kernel: intel_rapl: Found RAPL domain dram
Feb 22 09:24:33 host-12 kernel: intel_rapl: DRAM domain energy unit 15300pj
Feb 22 09:24:33 host-12 kernel: intel_rapl: Found RAPL domain package
Feb 22 09:24:33 host-12 kernel: intel_rapl: Found RAPL domain dram
Feb 22 09:24:33 host-12 kernel: intel_rapl: DRAM domain energy unit 15300pj
Feb 22 09:24:33 host-12 systemd: Started udev Wait for Complete Device Initialization.
Feb 22 09:24:33 host-12 systemd: Starting Activation of DM RAID sets...
Feb 22 09:24:33 host-12 kernel: device-mapper: uevent: version 1.0.3
Feb 22 09:24:33 host-12 kernel: device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
Feb 22 09:24:33 host-12 systemd: Started Activation of DM RAID sets.
Feb 22 09:24:33 host-12 systemd: Reached target Encrypted Volumes.
Feb 22 09:24:33 host-12 systemd: Starting Encrypted Volumes.
Feb 22 09:24:33 host-12 systemd: Reached target Local File Systems.
Feb 22 09:24:33 host-12 systemd: Starting Local File Systems.
Feb 22 09:24:33 host-12 systemd: Starting Import network configuration from initramfs...
Feb 22 09:24:33 host-12 systemd: Starting Preprocess NFS configuration...
Feb 22 09:24:33 host-12 systemd: Starting Tell Plymouth To Write Out Runtime Data...
Feb 22 09:24:33 host-12 systemd: Started Preprocess NFS configuration.
Feb 22 09:24:33 host-12 systemd: Started Import network configuration from initramfs.
Feb 22 09:24:33 host-12 systemd: Starting Create Volatile Files and Directories...
Feb 22 09:24:33 host-12 systemd: Started Tell Plymouth To Write Out Runtime Data.
Feb 22 09:24:34 host-12 systemd: Started Create Volatile Files and Directories.
Feb 22 09:24:34 host-12 systemd: Starting Security Auditing Service...
Feb 22 09:24:34 host-12 augenrules: /sbin/augenrules: No change
Feb 22 09:24:34 host-12 systemd: Started Security Auditing Service.
Feb 22 09:24:34 host-12 systemd: Starting Update UTMP about System Boot/Shutdown...
Feb 22 09:24:34 host-12 systemd: Started Update UTMP about System Boot/Shutdown.
Feb 22 09:24:34 host-12 systemd: Reached target System Initialization.
Feb 22 09:24:34 host-12 systemd: Starting System Initialization.
Feb 22 09:24:34 host-12 systemd: Started Flexible branding.
Feb 22 09:24:34 host-12 systemd: Starting Flexible branding.
Feb 22 09:24:34 host-12 systemd: Reached target Paths.
Feb 22 09:24:34 host-12 systemd: Starting Paths.
Feb 22 09:24:34 host-12 systemd: Listening on Virtual machine lock manager socket.
Feb 22 09:24:34 host-12 systemd: Starting Virtual machine lock manager socket.
Feb 22 09:24:34 host-12 systemd: Listening on Open-iSCSI iscsid Socket.
Feb 22 09:24:34 host-12 systemd: Starting Open-iSCSI iscsid Socket.
Feb 22 09:24:34 host-12 systemd: Started Daily Cleanup of Temporary Directories.
Feb 22 09:24:34 host-12 systemd: Starting Daily Cleanup of Temporary Directories.
Feb 22 09:24:34 host-12 systemd: Listening on RPCbind Server Activation Socket.
Feb 22 09:24:34 host-12 systemd: Starting RPCbind Server Activation Socket.
Feb 22 09:24:34 host-12 systemd: Listening on Virtual machine log manager socket.
Feb 22 09:24:34 host-12 systemd: Starting Virtual machine log manager socket.
Feb 22 09:24:34 host-12 auditd[1108]: Started dispatcher: /sbin/audispd pid: 1125
Feb 22 09:24:34 host-12 auditd[1108]: Init complete, auditd 2.6.5 listening for events (startup state enable)
Feb 22 09:24:34 host-12 systemd: Listening on PC/SC Smart Card Daemon Activation Socket.
Feb 22 09:24:34 host-12 systemd: Starting PC/SC Smart Card Daemon Activation Socket.
Feb 22 09:24:34 host-12 systemd: Listening on Open-iSCSI iscsiuio Socket.
Feb 22 09:24:34 host-12 systemd: Starting Open-iSCSI iscsiuio Socket.
Feb 22 09:24:34 host-12 systemd: Listening on D-Bus System Message Bus Socket.
Feb 22 09:24:34 host-12 systemd: Starting D-Bus System Message Bus Socket.
Feb 22 09:24:34 host-12 systemd: Reached target Sockets.
Feb 22 09:24:34 host-12 systemd: Starting Sockets.
Feb 22 09:24:34 host-12 systemd: Reached target Basic System.
Feb 22 09:24:34 host-12 systemd: Starting Basic System.
Feb 22 09:24:34 host-12 systemd: Starting Load CPU microcode update...
Feb 22 09:24:34 host-12 audispd: No plugins found, exiting
Feb 22 09:24:34 host-12 systemd: Starting NTP client/server...
Feb 22 09:24:34 host-12 systemd: Starting Resets System Activity Logs...
Feb 22 09:24:34 host-12 systemd: Starting GSSAPI Proxy Daemon...
Feb 22 09:24:34 host-12 systemd: Started libstoragemgmt plug-in server daemon.
Feb 22 09:24:34 host-12 systemd: Starting libstoragemgmt plug-in server daemon...
Feb 22 09:24:34 host-12 systemd: Started Self Monitoring and Reporting Technology (SMART) Daemon.
Feb 22 09:24:34 host-12 systemd: Starting Self Monitoring and Reporting Technology (SMART) Daemon...
Feb 22 09:24:34 host-12 systemd: Starting Authorization Manager...
Feb 22 09:24:34 host-12 systemd: Started Hardware RNG Entropy Gatherer Daemon.
Feb 22 09:24:34 host-12 systemd: Starting Hardware RNG Entropy Gatherer Daemon...
Feb 22 09:24:34 host-12 systemd: Starting Login Service...
Feb 22 09:24:34 host-12 systemd: Started ABRT Automated Bug Reporting Tool.
Feb 22 09:24:34 host-12 systemd: Starting ABRT Automated Bug Reporting Tool...
Feb 22 09:24:34 host-12 systemd: Started ABRT kernel log watcher.
Feb 22 09:24:34 host-12 systemd: Starting ABRT kernel log watcher...
Feb 22 09:24:34 host-12 systemd: Starting Kernel Samepage Merging...
Feb 22 09:24:34 host-12 systemd: Starting Dump dmesg to /var/log/dmesg...
Feb 22 09:24:34 host-12 rngd: read error
Feb 22 09:24:34 host-12 rngd: read error
Feb 22 09:24:34 host-12 systemd: Started irqbalance daemon.
Feb 22 09:24:34 host-12 systemd: Starting irqbalance daemon...
Feb 22 09:24:34 host-12 systemd: Starting Install ABRT coredump hook...
Feb 22 09:24:34 host-12 systemd: Started D-Bus System Message Bus.
Feb 22 09:24:35 host-12 chronyd[1157]: chronyd version 3.1 starting (+CMDMON +NTP +REFCLOCK +RTC +PRIVDROP +SCFILTER +SECHASH +SIGND +ASYNCDNS +IPV6 +DEBUG)
Feb 22 09:24:35 host-12 chronyd[1157]: commandkey directive is no longer supported
Feb 22 09:24:35 host-12 chronyd[1157]: generatecommandkey directive is no longer supported
Feb 22 09:24:35 host-12 chronyd[1157]: Could not change ownership of /var/run/chrony : Operation not permitted
Feb 22 09:24:35 host-12 chronyd[1157]: Could not access /var/run/chrony : No such file or directory
Feb 22 09:24:35 host-12 chronyd[1157]: Disabled command socket /var/run/chrony/chronyd.sock
Feb 22 09:24:35 host-12 chronyd[1157]: Frequency -3.470 +/- 0.756 ppm read from /var/lib/chrony/drift
Feb 22 09:24:35 host-12 smartd[1137]: smartd 6.2 2013-07-26 r3841 [x86_64-linux-4.10.0-linux-next-3d4ffb9-next-20170221] (local build)
Feb 22 09:24:35 host-12 smartd[1137]: Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org
Feb 22 09:24:35 host-12 smartd[1137]: Opened configuration file /etc/smartmontools/smartd.conf
Feb 22 09:24:35 host-12 smartd[1137]: Configuration file /etc/smartmontools/smartd.conf was parsed, found DEVICESCAN, scanning devices
Feb 22 09:24:35 host-12 smartd[1137]: Device: /dev/sda, opened
Feb 22 09:24:35 host-12 smartd[1137]: Device: /dev/sda, [HP       LOGICAL VOLUME   2.52], lu id: 0x600508b1001c7fba6a25449895be4539, S/N: PDNLH0BRH8Y1EX, 3.00 TB
Feb 22 09:24:35 host-12 smartd[1137]: Device: /dev/sda, is SMART capable. Adding to "monitor" list.
Feb 22 09:24:35 host-12 smartd[1137]: Monitoring 0 ATA and 1 SCSI devices
Feb 22 09:24:35 host-12 polkitd[1138]: Started polkitd version 0.112
Feb 22 09:24:35 host-12 dbus-daemon: dbus[1152]: [system] Successfully activated service 'org.freedesktop.systemd1'
Feb 22 09:24:35 host-12 dbus[1152]: [system] Successfully activated service 'org.freedesktop.systemd1'
Feb 22 09:24:35 host-12 systemd: Starting D-Bus System Message Bus...
Feb 22 09:24:35 host-12 systemd: Starting Network Manager...
Feb 22 09:24:35 host-12 systemd: Started Load CPU microcode update.
Feb 22 09:24:35 host-12 systemd: Started Resets System Activity Logs.
Feb 22 09:24:35 host-12 systemd: Started GSSAPI Proxy Daemon.
Feb 22 09:24:35 host-12 systemd: Started Kernel Samepage Merging.
Feb 22 09:24:35 host-12 systemd: Started Dump dmesg to /var/log/dmesg.
Feb 22 09:24:35 host-12 systemd: Starting Kernel Samepage Merging (KSM) Tuning Daemon...
Feb 22 09:24:35 host-12 systemd: Reached target NFS client services.
Feb 22 09:24:35 host-12 systemd: Starting NFS client services.
Feb 22 09:24:35 host-12 systemd-logind: New seat seat0.
Feb 22 09:24:35 host-12 systemd: Started Login Service.
Feb 22 09:24:35 host-12 systemd-logind: Watching system buttons on /dev/input/event0 (Power Button)
Feb 22 09:24:35 host-12 systemd: Started Kernel Samepage Merging (KSM) Tuning Daemon.
Feb 22 09:24:35 host-12 systemd: Started Install ABRT coredump hook.
Feb 22 09:24:35 host-12 systemd: Started NTP client/server.
Feb 22 09:24:35 host-12 systemd: Starting Wait for chrony to synchronize system clock...
Feb 22 09:24:35 host-12 systemd: Started Authorization Manager.
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.0696] NetworkManager (version 1.4.0-14.el7_3) is starting...
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.0703] Read config: /etc/NetworkManager/NetworkManager.conf (lib: 00-server.conf)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.0888] manager[0x55b4fe010110]: monitoring kernel firmware directory '/lib/firmware'.
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.1296] dns-mgr[0x55b4fe00a960]: init: dns=default, rc-manager=file
Feb 22 09:24:36 host-12 systemd: Started Network Manager.
Feb 22 09:24:36 host-12 systemd: Starting Network Manager Wait Online...
Feb 22 09:24:36 host-12 dbus-daemon: dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
Feb 22 09:24:36 host-12 dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
Feb 22 09:24:36 host-12 systemd: Starting Network Manager Script Dispatcher Service...
Feb 22 09:24:36 host-12 dbus[1152]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
Feb 22 09:24:36 host-12 dbus-daemon: dbus[1152]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
Feb 22 09:24:36 host-12 systemd: Started Network Manager Script Dispatcher Service.
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.2824] settings: loaded plugin ifcfg-rh: (c) 2007 - 2015 Red Hat, Inc.  To report bugs please use the NetworkManager mailing list. (/usr/lib64/NetworkManager/libnm-settings-plugin-ifcfg-rh.so)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.2831] settings: loaded plugin iBFT: (c) 2014 Red Hat, Inc.  To report bugs please use the NetworkManager mailing list. (/usr/lib64/NetworkManager/libnm-settings-plugin-ibft.so)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.2834] settings: loaded plugin keyfile: (c) 2007 - 2015 Red Hat, Inc.  To report bugs please use the NetworkManager mailing list.
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.3013] ifcfg-rh: new connection /etc/sysconfig/network-scripts/ifcfg-eno1 (d1edabff-e2a2-4738-8a9a-2c6f4c485f7c,"eno1")
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.3026] ifcfg-rh: new connection /etc/sysconfig/network-scripts/ifcfg-eno2 (d7c68eab-b7aa-4751-989d-7b63c72a9f93,"eno2")
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.3038] ifcfg-rh: new connection /etc/sysconfig/network-scripts/ifcfg-eno3 (1a3db594-f8cc-4bc7-8aea-91cae79a7ded,"eno3")
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.3051] ifcfg-rh: new connection /etc/sysconfig/network-scripts/ifcfg-eno4 (38153877-28b2-4ddd-b60d-e1c9d60ec771,"eno4")
Feb 22 09:24:36 host-12 dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.hostname1' unit='dbus-org.freedesktop.hostname1.service'
Feb 22 09:24:36 host-12 dbus-daemon: dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.hostname1' unit='dbus-org.freedesktop.hostname1.service'
Feb 22 09:24:36 host-12 abrtd: '/var/spool/abrt/oops-2016-10-27-10:38:26-12224-0' is not a problem directory
Feb 22 09:24:36 host-12 systemd: Starting Hostname Service...
Feb 22 09:24:36 host-12 dbus[1152]: [system] Successfully activated service 'org.freedesktop.hostname1'
Feb 22 09:24:36 host-12 dbus-daemon: dbus[1152]: [system] Successfully activated service 'org.freedesktop.hostname1'
Feb 22 09:24:36 host-12 systemd: Started Hostname Service.
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.7807] settings: hostname: using hostnamed
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.7807] settings: hostname changed from (none) to "localhost.localdomain"
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8046] dhcp-init: Using DHCP client 'dhclient'
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8046] manager: WiFi enabled by radio killswitch; enabled by state file
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8047] manager: WWAN enabled by radio killswitch; enabled by state file
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8047] manager: Networking is enabled by state file
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8047] Loaded device plugin: NMVxlanFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8047] Loaded device plugin: NMVlanFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8047] Loaded device plugin: NMVethFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8048] Loaded device plugin: NMTunFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8048] Loaded device plugin: NMMacvlanFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8048] Loaded device plugin: NMIPTunnelFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8048] Loaded device plugin: NMInfinibandFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8048] Loaded device plugin: NMEthernetFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8049] Loaded device plugin: NMBridgeFactory (internal)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8049] Loaded device plugin: NMBondFactory (internal)
Feb 22 09:24:36 host-12 nm-dispatcher: req:1 'hostname': new request (4 scripts)
Feb 22 09:24:36 host-12 nm-dispatcher: req:1 'hostname': start running ordered scripts...
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8845] Loaded device plugin: NMTeamFactory (/usr/lib64/NetworkManager/libnm-device-plugin-team.so)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8857] device (lo): link connected
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8866] manager: (lo): new Generic device (/org/freedesktop/NetworkManager/Devices/0)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8878] manager: (eno1): new Ethernet device (/org/freedesktop/NetworkManager/Devices/1)
Feb 22 09:24:36 host-12 NetworkManager[1167]: <info>  [1487726676.8896] device (eno1): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
Feb 22 09:24:36 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno1: link is not ready
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno1: link is not ready
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.0815] manager: (eno2): new Ethernet device (/org/freedesktop/NetworkManager/Devices/2)
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.0828] device (eno2): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno2: link is not ready
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno2: link is not ready
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.2589] manager: (eno3): new Ethernet device (/org/freedesktop/NetworkManager/Devices/3)
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.2601] device (eno3): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno3: link is not ready
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno3: link is not ready
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.4385] manager: (eno4): new Ethernet device (/org/freedesktop/NetworkManager/Devices/4)
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.4402] device (eno4): state change: unmanaged -> unavailable (reason 'managed') [10 20 2]
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno4: link is not ready
Feb 22 09:24:37 host-12 abrtd: Init complete, entering main loop
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno4: link is not ready
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.6503] device (eno1): state change: unavailable -> disconnected (reason 'none') [20 30 0]
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno1: link is not ready
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.6782] device (eno2): state change: unavailable -> disconnected (reason 'none') [20 30 0]
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.7055] device (eno3): state change: unavailable -> disconnected (reason 'none') [20 30 0]
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno2: link is not ready
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno3: link is not ready
Feb 22 09:24:37 host-12 NetworkManager[1167]: <info>  [1487726677.7325] device (eno4): state change: unavailable -> disconnected (reason 'none') [20 30 0]
Feb 22 09:24:37 host-12 kernel: IPv6: ADDRCONF(NETDEV_UP): eno4: link is not ready
Feb 22 09:24:40 host-12 kernel: tg3 0000:02:00.0 eno1: Link is up at 1000 Mbps, full duplex
Feb 22 09:24:40 host-12 kernel: tg3 0000:02:00.0 eno1: Flow control is on for TX and on for RX
Feb 22 09:24:40 host-12 kernel: tg3 0000:02:00.0 eno1: EEE is disabled
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8676] device (eno1): link connected
Feb 22 09:24:40 host-12 kernel: IPv6: ADDRCONF(NETDEV_CHANGE): eno1: link becomes ready
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8683] policy: auto-activating connection 'eno1'
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8700] device (eno1): Activation: starting connection 'eno1' (d1edabff-e2a2-4738-8a9a-2c6f4c485f7c)
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8704] device (eno1): state change: disconnected -> prepare (reason 'none') [30 40 0]
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8706] manager: NetworkManager state is now CONNECTING
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8721] device (eno1): state change: prepare -> config (reason 'none') [40 50 0]
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8729] device (eno1): state change: config -> ip-config (reason 'none') [50 70 0]
Feb 22 09:24:40 host-12 NetworkManager[1167]: <info>  [1487726680.8741] dhcp4 (eno1): activation: beginning transaction (timeout in 45 seconds)
Feb 22 09:24:41 host-12 NetworkManager[1167]: <info>  [1487726681.0377] dhcp4 (eno1): dhclient started with pid 1245
Feb 22 09:24:41 host-12 dhclient[1245]: DHCPREQUEST on eno1 to 255.255.255.255 port 67 (xid=0x41868d30)
Feb 22 09:24:47 host-12 dhclient[1245]: DHCPREQUEST on eno1 to 255.255.255.255 port 67 (xid=0x41868d30)
Feb 22 09:24:47 host-12 dhclient[1245]: DHCPACK from 10.73.5.254 (xid=0x41868d30)
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6377] dhcp4 (eno1):   address 10.73.4.145
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6380] dhcp4 (eno1):   plen 23 (255.255.254.0)
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6380] dhcp4 (eno1):   gateway 10.73.5.254
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6380] dhcp4 (eno1):   server identifier 10.73.2.108
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6380] dhcp4 (eno1):   lease time 43200
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6380] dhcp4 (eno1):   hostname 'host-12.rhts.eng.sw.com'
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6380] dhcp4 (eno1):   nameserver '10.73.2.107'
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6381] dhcp4 (eno1):   nameserver '10.73.2.108'
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6381] dhcp4 (eno1):   nameserver '10.10.160.1'
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6381] dhcp4 (eno1):   domain name 'rhts.eng.sw.com'
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6381] dhcp4 (eno1): state changed unknown -> bound
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6397] device (eno1): state change: ip-config -> ip-check (reason 'none') [70 80 0]
Feb 22 09:24:47 host-12 dhclient[1245]: bound to 10.73.4.145 -- renewal in 20999 seconds.
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6413] device (eno1): state change: ip-check -> secondaries (reason 'none') [80 90 0]
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6418] device (eno1): state change: secondaries -> activated (reason 'none') [90 100 0]
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6421] manager: NetworkManager state is now CONNECTED_LOCAL
Feb 22 09:24:47 host-12 nm-dispatcher: req:2 'connectivity-change': new request (4 scripts)
Feb 22 09:24:47 host-12 nm-dispatcher: req:2 'connectivity-change': start running ordered scripts...
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6990] manager: NetworkManager state is now CONNECTED_GLOBAL
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6992] policy: set 'eno1' (eno1) as default for IPv4 routing and DNS
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6993] policy: set 'eno1' (eno1) as default for IPv6 routing and DNS
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.6994] policy: setting system hostname to 'host-12.rhts.eng.sw.com' (from DHCPv4)
Feb 22 09:24:47 host-12 systemd-hostnamed: Changed host name to 'host-12.rhts.eng.sw.com'
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.7989] device (eno1): Activation: successful, device activated.
Feb 22 09:24:47 host-12 NetworkManager[1167]: <info>  [1487726687.7996] manager: startup complete
Feb 22 09:24:47 host-12 nm-dispatcher: req:3 'up' [eno1]: new request (4 scripts)
Feb 22 09:24:47 host-12 nm-dispatcher: req:3 'up' [eno1]: start running ordered scripts...
Feb 22 09:24:47 host-12 nm-dispatcher: req:4 'hostname': new request (4 scripts)
Feb 22 09:24:47 host-12 systemd: Started Network Manager Wait Online.
Feb 22 09:24:47 host-12 systemd: Starting LSB: Bring up/down networking...
Feb 22 09:24:48 host-12 nm-dispatcher: req:4 'hostname': start running ordered scripts...
Feb 22 09:24:48 host-12 network: Bringing up loopback interface:  [  OK  ]
Feb 22 09:24:49 host-12 network: Bringing up interface eno1:  [  OK  ]
Feb 22 09:24:49 host-12 systemd: Started LSB: Bring up/down networking.
Feb 22 09:24:49 host-12 systemd: Reached target Network.
Feb 22 09:24:49 host-12 systemd: Starting Network.
Feb 22 09:24:49 host-12 systemd: Starting Postfix Mail Transport Agent...
Feb 22 09:24:49 host-12 systemd: Starting Logout off all iSCSI sessions on shutdown...
Feb 22 09:24:49 host-12 systemd: Starting System Logging Service...
Feb 22 09:24:49 host-12 systemd: Starting Dynamic System Tuning Daemon...
Feb 22 09:24:49 host-12 systemd: Starting OpenSSH server daemon...
Feb 22 09:24:49 host-12 systemd: Reached target Network is Online.
Feb 22 09:24:49 host-12 systemd: Starting Network is Online.
Feb 22 09:24:49 host-12 systemd: Starting Enable periodic update of entitlement certificates....
Feb 22 09:24:49 host-12 systemd: Starting Notify NFS peers of a restart...
Feb 22 09:24:49 host-12 systemd: Started Logout off all iSCSI sessions on shutdown.
Feb 22 09:24:49 host-12 systemd: Reached target Remote File Systems (Pre).
Feb 22 09:24:49 host-12 systemd: Starting Remote File Systems (Pre).
Feb 22 09:24:49 host-12 systemd: Reached target Remote File Systems.
Feb 22 09:24:49 host-12 systemd: Starting Remote File Systems.
Feb 22 09:24:49 host-12 systemd: Starting Virtualization daemon...
Feb 22 09:24:49 host-12 systemd: Starting Permit User Sessions...
Feb 22 09:24:49 host-12 systemd: Starting Crash recovery kernel arming...
Feb 22 09:24:49 host-12 systemd: Starting Availability of block devices...
Feb 22 09:24:49 host-12 systemd: Started Enable periodic update of entitlement certificates..
Feb 22 09:24:49 host-12 systemd: Started Availability of block devices.
Feb 22 09:24:49 host-12 systemd: Started Permit User Sessions.
Feb 22 09:24:49 host-12 systemd: Starting Wait for Plymouth Boot Screen to Quit...
Feb 22 09:24:49 host-12 systemd: Starting Terminate Plymouth Boot Screen...
Feb 22 09:24:49 host-12 systemd: Started Job spooling tools.
Feb 22 09:24:49 host-12 systemd: Starting Job spooling tools...
Feb 22 09:24:49 host-12 systemd: Received SIGRTMIN+21 from PID 533 (plymouthd).
Feb 22 09:24:49 host-12 systemd: Started Wait for Plymouth Boot Screen to Quit.
Feb 22 09:24:49 host-12 systemd: Started Terminate Plymouth Boot Screen.
Feb 22 09:24:49 host-12 systemd: Started Getty on tty1.
Feb 22 09:24:49 host-12 systemd: Starting Getty on tty1...
Feb 22 09:24:49 host-12 systemd: Started Serial Getty on ttyS1.
Feb 22 09:24:49 host-12 systemd: Starting Serial Getty on ttyS1...
Feb 22 09:24:49 host-12 systemd: Reached target Login Prompts.
Feb 22 09:24:49 host-12 systemd: Starting Login Prompts.
Feb 22 09:24:49 host-12 sm-notify[1518]: Version 1.3.0 starting
Feb 22 09:24:49 host-12 systemd: Started Notify NFS peers of a restart.
Feb 22 09:24:49 host-12 systemd: PID file /var/run/sshd.pid not readable (yet?) after start.
Feb 22 09:24:49 host-12 systemd: Started OpenSSH server daemon.
Feb 22 09:24:49 host-12 systemd: Started System Logging Service.
Feb 22 09:24:51 host-12 systemd: Started Postfix Mail Transport Agent.
Feb 22 09:24:51 host-12 kdumpctl: Detected change(s) in the following file(s):
Feb 22 09:24:51 host-12 kdumpctl: /etc/fstab
Feb 22 09:24:51 host-12 kdumpctl: Rebuilding /boot/initramfs-4.10.0-linux-next-3d4ffb9-next-20170221kdump.img
Feb 22 09:24:51 host-12 systemd: Started Virtualization daemon.
Feb 22 09:24:51 host-12 systemd: Created slice user-0.slice.
Feb 22 09:24:51 host-12 systemd: Starting user-0.slice.
Feb 22 09:24:51 host-12 systemd-logind: New session 1 of user root.
Feb 22 09:24:51 host-12 systemd: Started Session 1 of user root.
Feb 22 09:24:51 host-12 systemd: Starting Session 1 of user root.
Feb 22 09:24:52 host-12 dbus-daemon: dbus[1152]: [system] Activating service name='org.freedesktop.problems' (using servicehelper)
Feb 22 09:24:52 host-12 dbus[1152]: [system] Activating service name='org.freedesktop.problems' (using servicehelper)
Feb 22 09:24:52 host-12 dbus[1152]: [system] Successfully activated service 'org.freedesktop.problems'
Feb 22 09:24:52 host-12 dbus-daemon: dbus[1152]: [system] Successfully activated service 'org.freedesktop.problems'
Feb 22 09:24:52 host-12 systemd: Started Dynamic System Tuning Daemon.
Feb 22 09:24:52 host-12 dracut: dracut-
Feb 22 09:24:53 host-12 dracut: Executing: /usr/sbin/dracut --hostonly --hostonly-cmdline --hostonly-i18n -o "plymouth dash resume ifcfg" -f /boot/initramfs-4.10.0-linux-next-3d4ffb9-next-20170221kdump.img 4.10.0-linux-next-3d4ffb9-next-20170221
Feb 22 09:24:54 host-12 dracut: dracut module 'ifcfg' will not be installed, because it's in the list to be omitted!
Feb 22 09:24:54 host-12 dracut: dracut module 'plymouth' will not be installed, because it's in the list to be omitted!
Feb 22 09:24:54 host-12 dracut: dracut module 'resume' will not be installed, because it's in the list to be omitted!
Feb 22 09:24:56 host-12 dracut: *** Including module: bash ***
Feb 22 09:24:56 host-12 dracut: *** Including module: nss-softokn ***
Feb 22 09:24:56 host-12 dracut: *** Including module: i18n ***
Feb 22 09:24:56 host-12 dracut: *** Including module: network ***
Feb 22 09:24:58 host-12 kernel: ip6_tables: (C) 2000-2006 Netfilter Core Team
Feb 22 09:24:59 host-12 kernel: Ebtables v2.0 registered
Feb 22 09:24:59 host-12 dracut: *** Including module: drm ***
Feb 22 09:25:01 host-12 kernel: bridge: filtering via arp/ip/ip6tables is no longer available by default. Update your scripts to load br_netfilter if you need this.
Feb 22 09:25:01 host-12 NetworkManager[1167]: <info>  [1487726701.0933] manager: (virbr0): new Bridge device (/org/freedesktop/NetworkManager/Devices/5)
Feb 22 09:25:01 host-12 kernel: tun: Universal TUN/TAP device driver, 1.6
Feb 22 09:25:01 host-12 kernel: tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
Feb 22 09:25:01 host-12 NetworkManager[1167]: <info>  [1487726701.1483] manager: (virbr0-nic): new Tun device (/org/freedesktop/NetworkManager/Devices/6)
Feb 22 09:25:01 host-12 kernel: virbr0: port 1(virbr0-nic) entered blocking state
Feb 22 09:25:01 host-12 kernel: virbr0: port 1(virbr0-nic) entered disabled state
Feb 22 09:25:01 host-12 kernel: device virbr0-nic entered promiscuous mode
Feb 22 09:25:01 host-12 NetworkManager[1167]: <info>  [1487726701.3172] device (virbr0-nic): state change: unmanaged -> unavailable (reason 'connection-assumed') [10 20 41]
Feb 22 09:25:01 host-12 NetworkManager[1167]: <info>  [1487726701.3178] device (virbr0-nic): state change: unavailable -> disconnected (reason 'none') [20 30 0]
Feb 22 09:25:01 host-12 kernel: nf_conntrack version 0.5.0 (65536 buckets, 262144 max)
Feb 22 09:25:02 host-12 kernel: virbr0: port 1(virbr0-nic) entered blocking state
Feb 22 09:25:02 host-12 kernel: virbr0: port 1(virbr0-nic) entered listening state
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1799] device (virbr0): state change: unmanaged -> unavailable (reason 'connection-assumed') [10 20 41]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1813] ifcfg-rh: add connection in-memory (8c034082-9e28-4df5-b826-74165219e79b,"virbr0")
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1821] device (virbr0): state change: unavailable -> disconnected (reason 'connection-assumed') [20 30 41]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1828] device (virbr0): Activation: starting connection 'virbr0' (8c034082-9e28-4df5-b826-74165219e79b)
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1831] device (virbr0): state change: disconnected -> prepare (reason 'none') [30 40 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1835] device (virbr0): state change: prepare -> config (reason 'none') [40 50 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1841] keyfile: add connection in-memory (9deb4c29-6eeb-4ad4-9923-f3ef989c9c5b,"virbr0-nic")
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1852] device (virbr0-nic): Activation: starting connection 'virbr0-nic' (9deb4c29-6eeb-4ad4-9923-f3ef989c9c5b)
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1852] device (virbr0): state change: config -> ip-config (reason 'none') [50 70 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1857] device (virbr0-nic): state change: disconnected -> prepare (reason 'none') [30 40 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1881] device (virbr0): state change: ip-config -> ip-check (reason 'none') [70 80 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1886] device (virbr0-nic): state change: prepare -> config (reason 'none') [40 50 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1888] device (virbr0-nic): state change: config -> ip-config (reason 'none') [50 70 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1889] device (virbr0): bridge port virbr0-nic was attached
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1889] device (virbr0-nic): Activation: connection 'virbr0-nic' enslaved, continuing activation
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1890] device (virbr0): state change: ip-check -> secondaries (reason 'none') [80 90 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1892] device (virbr0-nic): state change: ip-config -> secondaries (reason 'none') [70 90 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.1893] device (virbr0): state change: secondaries -> activated (reason 'none') [90 100 0]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.2602] device (virbr0): Activation: successful, device activated.
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.2608] device (virbr0-nic): state change: secondaries -> activated (reason 'none') [90 100 0]
Feb 22 09:25:02 host-12 dbus-daemon: dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
Feb 22 09:25:02 host-12 dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.nm_dispatcher' unit='dbus-org.freedesktop.nm-dispatcher.service'
Feb 22 09:25:02 host-12 systemd: Starting Network Manager Script Dispatcher Service...
Feb 22 09:25:02 host-12 dbus[1152]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
Feb 22 09:25:02 host-12 dbus-daemon: dbus[1152]: [system] Successfully activated service 'org.freedesktop.nm_dispatcher'
Feb 22 09:25:02 host-12 systemd: Started Network Manager Script Dispatcher Service.
Feb 22 09:25:02 host-12 nm-dispatcher: req:1 'up' [virbr0]: new request (4 scripts)
Feb 22 09:25:02 host-12 nm-dispatcher: req:1 'up' [virbr0]: start running ordered scripts...
Feb 22 09:25:02 host-12 systemd: Unit iscsi.service cannot be reloaded because it is inactive.
Feb 22 09:25:02 host-12 dnsmasq[5226]: started, version 2.66 cachesize 150
Feb 22 09:25:02 host-12 dnsmasq[5226]: compile time options: IPv6 GNU-getopt DBus no-i18n IDN DHCP DHCPv6 no-Lua TFTP no-conntrack ipset auth
Feb 22 09:25:02 host-12 dnsmasq-dhcp[5226]: DHCP, IP range 192.168.122.2 -- 192.168.122.254, lease time 1h
Feb 22 09:25:02 host-12 dnsmasq[5226]: reading /etc/resolv.conf
Feb 22 09:25:02 host-12 dnsmasq[5226]: using nameserver 10.10.160.1#53
Feb 22 09:25:02 host-12 dnsmasq[5226]: using nameserver 10.73.2.108#53
Feb 22 09:25:02 host-12 dnsmasq[5226]: using nameserver 10.73.2.107#53
Feb 22 09:25:02 host-12 dnsmasq[5226]: read /etc/hosts - 9 addresses
Feb 22 09:25:02 host-12 dnsmasq[5226]: read /var/lib/libvirt/dnsmasq/default.addnhosts - 0 addresses
Feb 22 09:25:02 host-12 dnsmasq-dhcp[5226]: read /var/lib/libvirt/dnsmasq/default.hostsfile
Feb 22 09:25:02 host-12 kernel: virbr0: port 1(virbr0-nic) entered disabled state
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.4459] device (virbr0-nic): Activation: successful, device activated.
Feb 22 09:25:02 host-12 nm-dispatcher: req:2 'up' [virbr0-nic]: new request (4 scripts)
Feb 22 09:25:02 host-12 nm-dispatcher: req:2 'up' [virbr0-nic]: start running ordered scripts...
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.4471] device (virbr0-nic): state change: activated -> unmanaged (reason 'connection-assumed') [100 10 41]
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.4477] device (virbr0): bridge port virbr0-nic was detached
Feb 22 09:25:02 host-12 NetworkManager[1167]: <info>  [1487726702.4477] device (virbr0-nic): released from master device virbr0
Feb 22 09:25:02 host-12 systemd: Unit iscsi.service cannot be reloaded because it is inactive.
Feb 22 09:25:02 host-12 nm-dispatcher: req:3 'down' [virbr0-nic]: new request (4 scripts)
Feb 22 09:25:02 host-12 nm-dispatcher: req:3 'down' [virbr0-nic]: start running ordered scripts...
Feb 22 09:25:07 host-12 dracut: *** Including module: kernel-modules ***
Feb 22 09:25:10 host-12 systemd: Started Virtual machine log manager.
Feb 22 09:25:10 host-12 systemd: Starting Virtual machine log manager...
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.4675] manager: (vnet0): new Tun device (/org/freedesktop/NetworkManager/Devices/7)
Feb 22 09:25:10 host-12 kernel: virbr0: port 2(vnet0) entered blocking state
Feb 22 09:25:10 host-12 kernel: virbr0: port 2(vnet0) entered disabled state
Feb 22 09:25:10 host-12 kernel: device vnet0 entered promiscuous mode
Feb 22 09:25:10 host-12 kernel: virbr0: port 2(vnet0) entered blocking state
Feb 22 09:25:10 host-12 kernel: virbr0: port 2(vnet0) entered listening state
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6864] device (vnet0): state change: unmanaged -> unavailable (reason 'connection-assumed') [10 20 41]
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6874] keyfile: add connection in-memory (774e103d-447a-4a06-9e76-30e7e5f31e8c,"vnet0")
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6880] device (vnet0): state change: unavailable -> disconnected (reason 'connection-assumed') [20 30 41]
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6886] device (vnet0): Activation: starting connection 'vnet0' (774e103d-447a-4a06-9e76-30e7e5f31e8c)
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6890] device (vnet0): state change: disconnected -> prepare (reason 'none') [30 40 0]
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6893] device (vnet0): state change: prepare -> config (reason 'none') [40 50 0]
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6895] device (vnet0): state change: config -> ip-config (reason 'none') [50 70 0]
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6896] device (virbr0): bridge port vnet0 was attached
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6896] device (vnet0): Activation: connection 'vnet0' enslaved, continuing activation
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6898] device (vnet0): state change: ip-config -> secondaries (reason 'none') [70 90 0]
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.6900] device (vnet0): state change: secondaries -> activated (reason 'none') [90 100 0]
Feb 22 09:25:10 host-12 dbus-daemon: dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.machine1' unit='dbus-org.freedesktop.machine1.service'
Feb 22 09:25:10 host-12 dbus[1152]: [system] Activating via systemd: service name='org.freedesktop.machine1' unit='dbus-org.freedesktop.machine1.service'
Feb 22 09:25:10 host-12 NetworkManager[1167]: <info>  [1487726710.7452] device (vnet0): Activation: successful, device activated.
Feb 22 09:25:10 host-12 nm-dispatcher: req:4 'up' [vnet0]: new request (4 scripts)
Feb 22 09:25:10 host-12 nm-dispatcher: req:4 'up' [vnet0]: start running ordered scripts...
Feb 22 09:25:10 host-12 systemd: Created slice Virtual Machine and Container Slice.
Feb 22 09:25:10 host-12 systemd: Starting Virtual Machine and Container Slice.
Feb 22 09:25:10 host-12 systemd: Starting Virtual Machine and Container Registration Service...
Feb 22 09:25:10 host-12 systemd: Unit iscsi.service cannot be reloaded because it is inactive.
Feb 22 09:25:10 host-12 dbus[1152]: [system] Successfully activated service 'org.freedesktop.machine1'
Feb 22 09:25:10 host-12 dbus-daemon: dbus[1152]: [system] Successfully activated service 'org.freedesktop.machine1'
Feb 22 09:25:10 host-12 systemd: Started Virtual Machine and Container Registration Service.
Feb 22 09:25:10 host-12 systemd-machined: New machine qemu-1-73h.
Feb 22 09:25:10 host-12 systemd: Started Virtual Machine qemu-1-73h.
Feb 22 09:25:10 host-12 systemd: Starting Virtual Machine qemu-1-73h.
Feb 22 09:25:12 host-12 virtlogd: 2017-02-22 01:25:12.140+0000: 5627: info : libvirt version: 3.0.0, package: 2.el7 (Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla>, 2017-02-09-04:47:33, x86-037.build.eng.sw.com)
Feb 22 09:25:12 host-12 virtlogd: 2017-02-22 01:25:12.140+0000: 5627: info : hostname: host-12.rhts.eng.sw.com
Feb 22 09:25:12 host-12 virtlogd: 2017-02-22 01:25:12.140+0000: 5627: error : virNetSocketReadWire:1800 : End of file while reading data: Input/output error
Feb 22 09:25:12 host-12 kernel: virbr0: port 2(vnet0) entered learning state
Feb 22 09:25:14 host-12 kernel: virbr0: port 2(vnet0) entered forwarding state
Feb 22 09:25:14 host-12 kernel: virbr0: topology change detected, propagating
Feb 22 09:25:14 host-12 NetworkManager[1167]: <info>  [1487726714.8272] device (virbr0): link connected
Feb 22 09:25:21 host-12 kernel: ------------[ cut here ]------------
Feb 22 09:25:21 host-12 kernel: WARNING: CPU: 8 PID: 5717 at lib/list_debug.c:56 __list_del_entry_valid+0x82/0xd0
Feb 22 09:25:21 host-12 kernel: list_del corruption. next->prev should be ffffea004161fae0, but was ffff881075e2fc10
Feb 22 09:25:22 host-12 kernel: Modules linked in: xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd iTCO_wdt glue_helper cryptd iTCO_vendor_support sg ipmi_si dax_pmem hpwdt i2c_i801 ioatdma pcspkr lpc_ich wmi ipmi_devintf hpilo dax pcc_cpufreq acpi_power_meter ipmi_msghandler acpi_cpufreq dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_mi
 sc ip_tables xfs libcrc32c
Feb 22 09:25:22 host-12 kernel: sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm tg3 drm ptp nd_pmem serio_raw crc32c_intel hpsa fjes i2c_core pps_core scsi_transport_sas
Feb 22 09:25:22 host-12 sh: abrt-dump-oops: Found oopses: 1
Feb 22 09:25:22 host-12 sh: abrt-dump-oops: Creating problem directories
Feb 22 09:25:22 host-12 sh: abrt-dump-oops: Not going to make dump directories world readable because PrivateReports is on
Feb 22 09:25:23 host-12 kernel: CPU: 8 PID: 5717 Comm: qemu-kvm Not tainted 4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:23 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:23 host-12 kernel: Call Trace:
Feb 22 09:25:23 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:23 host-12 kernel: __warn+0xd1/0xf0
Feb 22 09:25:23 host-12 kernel: warn_slowpath_fmt+0x5f/0x80
Feb 22 09:25:23 host-12 kernel: ? __page_cache_release+0x3c/0x250
Feb 22 09:25:23 host-12 kernel: __list_del_entry_valid+0x82/0xd0
Feb 22 09:25:23 host-12 kernel: get_page_from_freelist+0x89e/0xbe0
Feb 22 09:25:23 host-12 kernel: ? migrate_pages+0x320/0xa40
Feb 22 09:25:23 host-12 kernel: ? put_page+0x50/0x50
Feb 22 09:25:23 host-12 kernel: __alloc_pages_nodemask+0xe3/0x260
Feb 22 09:25:23 host-12 kernel: alloc_pages_vma+0xa5/0x220
Feb 22 09:25:23 host-12 kernel: wp_page_copy+0x87/0x700
Feb 22 09:25:23 host-12 kernel: do_wp_page+0xa3/0x560
Feb 22 09:25:23 host-12 kernel: __handle_mm_fault+0x74d/0x1290
Feb 22 09:25:23 host-12 kernel: handle_mm_fault+0xce/0x240
Feb 22 09:25:23 host-12 kernel: __get_user_pages+0x137/0x6b0
Feb 22 09:25:23 host-12 kernel: ? gup_pud_range+0x1ea/0x210
Feb 22 09:25:23 host-12 kernel: get_user_pages+0x4f/0x60
Feb 22 09:25:23 host-12 kernel: __gfn_to_pfn_memslot+0x1a8/0x430 [kvm]
Feb 22 09:25:23 host-12 kernel: ? pic_unlock+0x7e/0x90 [kvm]
Feb 22 09:25:23 host-12 kernel: try_async_pf+0x67/0x240 [kvm]
Feb 22 09:25:23 host-12 kernel: ? kvm_host_page_size+0x85/0x90 [kvm]
Feb 22 09:25:23 host-12 kernel: tdp_page_fault+0x131/0x260 [kvm]
Feb 22 09:25:23 host-12 kernel: kvm_mmu_page_fault+0x65/0x130 [kvm]
Feb 22 09:25:23 host-12 kernel: handle_ept_violation+0xa5/0x190 [kvm_intel]
Feb 22 09:25:23 host-12 kernel: vmx_handle_exit+0x14b/0xbc0 [kvm_intel]
Feb 22 09:25:23 host-12 kernel: vcpu_enter_guest+0x83e/0x1190 [kvm]
Feb 22 09:25:23 host-12 kernel: ? recalc_sigpending+0x1b/0x50
Feb 22 09:25:23 host-12 kernel: ? __set_task_blocked+0x3c/0xa0
Feb 22 09:25:23 host-12 kernel: kvm_arch_vcpu_ioctl_run+0x2ee/0x400 [kvm]
Feb 22 09:25:23 host-12 kernel: kvm_vcpu_ioctl+0x292/0x610 [kvm]
Feb 22 09:25:23 host-12 kernel: do_vfs_ioctl+0xa7/0x5e0
Feb 22 09:25:23 host-12 kernel: SyS_ioctl+0x79/0x90
Feb 22 09:25:23 host-12 kernel: do_syscall_64+0x67/0x180
Feb 22 09:25:23 host-12 kernel: entry_SYSCALL64_slow_path+0x25/0x25
Feb 22 09:25:23 host-12 kernel: RIP: 0033:0x7f641c6b0577
Feb 22 09:25:23 host-12 kernel: RSP: 002b:00007f641164ba98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Feb 22 09:25:23 host-12 kernel: RAX: ffffffffffffffda RBX: 00005584c4990000 RCX: 00007f641c6b0577
Feb 22 09:25:23 host-12 kernel: RDX: 0000000000000000 RSI: 000000000000ae80 RDI: 0000000000000013
Feb 22 09:25:23 host-12 kernel: RBP: 00007f6426e56000 R08: 0000000000000000 R09: 0000000000001655
Feb 22 09:25:23 host-12 kernel: R10: 000000000000001f R11: 0000000000000246 R12: 00005584c28b37a0
Feb 22 09:25:23 host-12 kernel: R13: 0000000000000001 R14: 00007f6426e57001 R15: 0000000000000001
Feb 22 09:25:23 host-12 kernel: ---[ end trace 95acd0f30b99f7f0 ]---
Feb 22 09:25:24 host-12 abrt-dump-oops: Reported 1 kernel oopses to Abrt
Feb 22 09:25:25 host-12 kernel: BUG: Bad page state in process qemu-kvm  pfn:104114e
Feb 22 09:25:25 host-12 kernel: page:ffffea0041045380 count:1 mapcount:1 mapping:          (null) index:0x0
Feb 22 09:25:25 host-12 kernel: flags: 0x57ffffc0000000()
Feb 22 09:25:25 host-12 kernel: raw: 0057ffffc0000000 0000000000000000 0000000000000000 0000000100000000
Feb 22 09:25:25 host-12 kernel: raw: ffffea00410453a0 ffffea00410453a0 0000000000000000 0000000000000000
Feb 22 09:25:25 host-12 kernel: page dumped because: nonzero _count
Feb 22 09:25:25 host-12 kernel: Modules linked in: xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd iTCO_wdt glue_helper cryptd iTCO_vendor_support sg ipmi_si dax_pmem hpwdt i2c_i801 ioatdma pcspkr lpc_ich wmi ipmi_devintf hpilo dax pcc_cpufreq acpi_power_meter ipmi_msghandler acpi_cpufreq dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_mi
 sc ip_tables xfs libcrc32c
Feb 22 09:25:25 host-12 kernel: sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm tg3 drm ptp nd_pmem serio_raw crc32c_intel hpsa fjes i2c_core pps_core scsi_transport_sas
Feb 22 09:25:25 host-12 kernel: CPU: 11 PID: 5717 Comm: qemu-kvm Tainted: G        W       4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:25 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:25 host-12 kernel: Call Trace:
Feb 22 09:25:25 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:25 host-12 kernel: bad_page+0xfe/0x11a
Feb 22 09:25:25 host-12 kernel: check_new_page_bad+0x85/0x87
Feb 22 09:25:25 host-12 kernel: get_page_from_freelist+0x781/0xbe0
Feb 22 09:25:25 host-12 kernel: __alloc_pages_nodemask+0xe3/0x260
Feb 22 09:25:25 host-12 kernel: alloc_pages_vma+0x1fc/0x220
Feb 22 09:25:25 host-12 kernel: do_huge_pmd_anonymous_page+0x12c/0x610
Feb 22 09:25:25 host-12 kernel: __handle_mm_fault+0xed4/0x1290
Feb 22 09:25:25 host-12 kernel: handle_mm_fault+0xce/0x240
Feb 22 09:25:25 host-12 kernel: __get_user_pages+0x137/0x6b0
Feb 22 09:25:25 host-12 kernel: ? gup_pud_range+0x16e/0x210
Feb 22 09:25:25 host-12 kernel: get_user_pages+0x4f/0x60
Feb 22 09:25:25 host-12 kernel: __gfn_to_pfn_memslot+0x1a8/0x430 [kvm]
Feb 22 09:25:25 host-12 kernel: ? kvm_io_bus_read+0x3f/0x110 [kvm]
Feb 22 09:25:25 host-12 kernel: try_async_pf+0x67/0x240 [kvm]
Feb 22 09:25:25 host-12 kernel: ? kvm_host_page_size+0x85/0x90 [kvm]
Feb 22 09:25:25 host-12 kernel: tdp_page_fault+0x131/0x260 [kvm]
Feb 22 09:25:25 host-12 kernel: kvm_mmu_page_fault+0x65/0x130 [kvm]
Feb 22 09:25:25 host-12 kernel: handle_ept_violation+0xa5/0x190 [kvm_intel]
Feb 22 09:25:25 host-12 kernel: vmx_handle_exit+0x14b/0xbc0 [kvm_intel]
Feb 22 09:25:25 host-12 kernel: vcpu_enter_guest+0x83e/0x1190 [kvm]
Feb 22 09:25:25 host-12 kernel: kvm_arch_vcpu_ioctl_run+0x2ee/0x400 [kvm]
Feb 22 09:25:25 host-12 kernel: kvm_vcpu_ioctl+0x292/0x610 [kvm]
Feb 22 09:25:25 host-12 kernel: do_vfs_ioctl+0xa7/0x5e0
Feb 22 09:25:25 host-12 kernel: SyS_ioctl+0x79/0x90
Feb 22 09:25:25 host-12 kernel: do_syscall_64+0x67/0x180
Feb 22 09:25:25 host-12 kernel: entry_SYSCALL64_slow_path+0x25/0x25
Feb 22 09:25:25 host-12 kernel: RIP: 0033:0x7f641c6b0577
Feb 22 09:25:25 host-12 kernel: RSP: 002b:00007f641164ba98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Feb 22 09:25:25 host-12 kernel: RAX: ffffffffffffffda RBX: 00005584c4990000 RCX: 00007f641c6b0577
Feb 22 09:25:25 host-12 kernel: RDX: 0000000000000000 RSI: 000000000000ae80 RDI: 0000000000000013
Feb 22 09:25:25 host-12 kernel: RBP: 00007f6426e56000 R08: 0000000000000000 R09: 00000000ffffffff
Feb 22 09:25:25 host-12 kernel: R10: 000000000000001f R11: 0000000000000246 R12: 00005584c28b37a0
Feb 22 09:25:25 host-12 kernel: R13: 0000000000000004 R14: 00007f6426e57004 R15: 0000000000000001
Feb 22 09:25:25 host-12 kernel: Disabling lock debugging due to kernel taint
Feb 22 09:25:26 host-12 sh: abrt-dump-oops: Found oopses: 1
Feb 22 09:25:26 host-12 sh: abrt-dump-oops: Creating problem directories
Feb 22 09:25:26 host-12 sh: abrt-dump-oops: Not going to make dump directories world readable because PrivateReports is on
Feb 22 09:25:27 host-12 abrt-server: '/var/spool/abrt/oops-2016-10-27-10:38:26-12224-0' is not a problem directory
Feb 22 09:25:27 host-12 abrt-dump-oops: Reported 1 kernel oopses to Abrt
Feb 22 09:25:27 host-12 kernel: ------------[ cut here ]------------
Feb 22 09:25:27 host-12 kernel: BUG: Bad page state in process qemu-kvm  pfn:103d503
Feb 22 09:25:27 host-12 kernel: page:ffffea0040f540c0 count:1 mapcount:1 mapping:          (null) index:0x0
Feb 22 09:25:27 host-12 kernel: flags: 0x57ffffc0000000()
Feb 22 09:25:27 host-12 kernel: raw: 0057ffffc0000000 0000000000000000 0000000000000000 0000000100000000
Feb 22 09:25:27 host-12 kernel: raw: ffffea0040f540e0 ffffea0040f540e0 0000000000000000 0000000000000000
Feb 22 09:25:27 host-12 kernel: page dumped because: nonzero _count
Feb 22 09:25:27 host-12 kernel: Modules linked in: xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd iTCO_wdt glue_helper cryptd iTCO_vendor_support sg ipmi_si dax_pmem hpwdt i2c_i801 ioatdma pcspkr lpc_ich wmi ipmi_devintf hpilo dax pcc_cpufreq acpi_power_meter ipmi_msghandler acpi_cpufreq dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_mi
 sc ip_tables xfs libcrc32c
Feb 22 09:25:27 host-12 kernel: sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm tg3 drm ptp nd_pmem serio_raw crc32c_intel hpsa fjes i2c_core pps_core scsi_transport_sas
Feb 22 09:25:27 host-12 kernel: CPU: 11 PID: 5717 Comm: qemu-kvm Tainted: G    B   W       4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:27 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:27 host-12 kernel: Call Trace:
Feb 22 09:25:27 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:27 host-12 kernel: bad_page+0xfe/0x11a
Feb 22 09:25:27 host-12 kernel: check_new_page_bad+0x85/0x87
Feb 22 09:25:27 host-12 kernel: get_page_from_freelist+0x781/0xbe0
Feb 22 09:25:27 host-12 kernel: __alloc_pages_nodemask+0xe3/0x260
Feb 22 09:25:27 host-12 kernel: alloc_pages_vma+0x1fc/0x220
Feb 22 09:25:27 host-12 kernel: do_huge_pmd_anonymous_page+0x12c/0x610
Feb 22 09:25:27 host-12 kernel: __handle_mm_fault+0xed4/0x1290
Feb 22 09:25:27 host-12 kernel: handle_mm_fault+0xce/0x240
Feb 22 09:25:27 host-12 kernel: __get_user_pages+0x137/0x6b0
Feb 22 09:25:27 host-12 kernel: ? gup_pud_range+0x16e/0x210
Feb 22 09:25:27 host-12 kernel: get_user_pages+0x4f/0x60
Feb 22 09:25:27 host-12 kernel: __gfn_to_pfn_memslot+0x1a8/0x430 [kvm]
Feb 22 09:25:27 host-12 kernel: ? kvm_io_bus_read+0x3f/0x110 [kvm]
Feb 22 09:25:27 host-12 kernel: try_async_pf+0x67/0x240 [kvm]
Feb 22 09:25:27 host-12 kernel: ? kvm_host_page_size+0x85/0x90 [kvm]
Feb 22 09:25:27 host-12 kernel: tdp_page_fault+0x131/0x260 [kvm]
Feb 22 09:25:27 host-12 kernel: kvm_mmu_page_fault+0x65/0x130 [kvm]
Feb 22 09:25:27 host-12 kernel: handle_ept_violation+0xa5/0x190 [kvm_intel]
Feb 22 09:25:27 host-12 kernel: vmx_handle_exit+0x14b/0xbc0 [kvm_intel]
Feb 22 09:25:27 host-12 kernel: vcpu_enter_guest+0x83e/0x1190 [kvm]
Feb 22 09:25:27 host-12 kernel: ? __schedule+0x281/0x910
Feb 22 09:25:27 host-12 kernel: kvm_arch_vcpu_ioctl_run+0x2ee/0x400 [kvm]
Feb 22 09:25:27 host-12 kernel: kvm_vcpu_ioctl+0x292/0x610 [kvm]
Feb 22 09:25:27 host-12 kernel: do_vfs_ioctl+0xa7/0x5e0
Feb 22 09:25:27 host-12 kernel: SyS_ioctl+0x79/0x90
Feb 22 09:25:27 host-12 kernel: do_syscall_64+0x67/0x180
Feb 22 09:25:27 host-12 kernel: entry_SYSCALL64_slow_path+0x25/0x25
Feb 22 09:25:27 host-12 kernel: RIP: 0033:0x7f641c6b0577
Feb 22 09:25:27 host-12 kernel: RSP: 002b:00007f641164ba98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Feb 22 09:25:27 host-12 kernel: RAX: ffffffffffffffda RBX: 00005584c4990000 RCX: 00007f641c6b0577
Feb 22 09:25:27 host-12 kernel: RDX: 0000000000000000 RSI: 000000000000ae80 RDI: 0000000000000013
Feb 22 09:25:27 host-12 kernel: RBP: 00007f6426e56000 R08: 0000000000000000 R09: 00000000ffffffff
Feb 22 09:25:27 host-12 kernel: R10: 000000000000001f R11: 0000000000000246 R12: 00005584c28b37a0
Feb 22 09:25:27 host-12 kernel: R13: 0000000000000004 R14: 00007f6426e57004 R15: 0000000000000001
Feb 22 09:25:27 host-12 kernel: BUG: Bad page state in process qemu-kvm  pfn:103bf2a
Feb 22 09:25:27 host-12 kernel: page:ffffea0040efca80 count:1 mapcount:1 mapping:          (null) index:0x0
Feb 22 09:25:27 host-12 kernel: flags: 0x57ffffc0000000()
Feb 22 09:25:27 host-12 kernel: raw: 0057ffffc0000000 0000000000000000 0000000000000000 0000000100000000
Feb 22 09:25:27 host-12 kernel: raw: ffffea0040efcaa0 ffffea0040efcaa0 0000000000000000 0000000000000000
Feb 22 09:25:27 host-12 kernel: page dumped because: nonzero _count
Feb 22 09:25:27 host-12 kernel: Modules linked in: xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd iTCO_wdt glue_helper cryptd iTCO_vendor_support sg ipmi_si dax_pmem hpwdt i2c_i801 ioatdma pcspkr lpc_ich wmi ipmi_devintf hpilo dax pcc_cpufreq acpi_power_meter ipmi_msghandler acpi_cpufreq dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_mi
 sc ip_tables xfs libcrc32c
Feb 22 09:25:27 host-12 kernel: sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm tg3 drm ptp nd_pmem serio_raw crc32c_intel hpsa fjes i2c_core pps_core scsi_transport_sas
Feb 22 09:25:27 host-12 kernel: CPU: 11 PID: 5717 Comm: qemu-kvm Tainted: G    B   W       4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:27 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:27 host-12 kernel: Call Trace:
Feb 22 09:25:27 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:27 host-12 kernel: bad_page+0xfe/0x11a
Feb 22 09:25:27 host-12 kernel: check_new_page_bad+0x85/0x87
Feb 22 09:25:27 host-12 kernel: get_page_from_freelist+0x781/0xbe0
Feb 22 09:25:27 host-12 kernel: __alloc_pages_nodemask+0xe3/0x260
Feb 22 09:25:27 host-12 kernel: alloc_pages_vma+0x1fc/0x220
Feb 22 09:25:27 host-12 kernel: do_huge_pmd_anonymous_page+0x12c/0x610
Feb 22 09:25:27 host-12 kernel: __handle_mm_fault+0xed4/0x1290
Feb 22 09:25:27 host-12 kernel: handle_mm_fault+0xce/0x240
Feb 22 09:25:27 host-12 kernel: __get_user_pages+0x137/0x6b0
Feb 22 09:25:27 host-12 kernel: get_user_pages+0x4f/0x60
Feb 22 09:25:27 host-12 kernel: __gfn_to_pfn_memslot+0x1a8/0x430 [kvm]
Feb 22 09:25:27 host-12 kernel: try_async_pf+0x67/0x240 [kvm]
Feb 22 09:25:27 host-12 kernel: ? kvm_host_page_size+0x85/0x90 [kvm]
Feb 22 09:25:27 host-12 kernel: tdp_page_fault+0x131/0x260 [kvm]
Feb 22 09:25:27 host-12 kernel: kvm_mmu_page_fault+0x65/0x130 [kvm]
Feb 22 09:25:27 host-12 kernel: handle_ept_violation+0xa5/0x190 [kvm_intel]
Feb 22 09:25:27 host-12 kernel: vmx_handle_exit+0x14b/0xbc0 [kvm_intel]
Feb 22 09:25:27 host-12 kernel: vcpu_enter_guest+0x83e/0x1190 [kvm]
Feb 22 09:25:27 host-12 kernel: ? x86_emulate_instruction+0x49c/0x6b0 [kvm]
Feb 22 09:25:27 host-12 kernel: ? __set_task_blocked+0x3c/0xa0
Feb 22 09:25:27 host-12 kernel: ? kvm_arch_can_inject_async_page_present+0x43/0x50 [kvm]
Feb 22 09:25:27 host-12 kernel: ? kvm_check_async_pf_completion+0x30/0x110 [kvm]
Feb 22 09:25:27 host-12 kernel: kvm_arch_vcpu_ioctl_run+0x2ee/0x400 [kvm]
Feb 22 09:25:27 host-12 kernel: kvm_vcpu_ioctl+0x292/0x610 [kvm]
Feb 22 09:25:27 host-12 kernel: do_vfs_ioctl+0xa7/0x5e0
Feb 22 09:25:27 host-12 kernel: SyS_ioctl+0x79/0x90
Feb 22 09:25:27 host-12 kernel: do_syscall_64+0x67/0x180
Feb 22 09:25:27 host-12 kernel: entry_SYSCALL64_slow_path+0x25/0x25
Feb 22 09:25:27 host-12 kernel: RIP: 0033:0x7f641c6b0577
Feb 22 09:25:27 host-12 kernel: RSP: 002b:00007f641164ba98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Feb 22 09:25:27 host-12 kernel: RAX: ffffffffffffffda RBX: 00005584c4990000 RCX: 00007f641c6b0577
Feb 22 09:25:27 host-12 kernel: RDX: 0000000000000000 RSI: 000000000000ae80 RDI: 0000000000000013
Feb 22 09:25:27 host-12 kernel: RBP: 00007f6426e56000 R08: 0000000000000000 R09: 000000000000ffff
Feb 22 09:25:27 host-12 kernel: R10: 000000000000001f R11: 0000000000000246 R12: 00005584c28b37a0
Feb 22 09:25:27 host-12 kernel: R13: 0000000000000002 R14: 00007f6426e57002 R15: 0000000000000001
Feb 22 09:25:27 host-12 kernel: WARNING: CPU: 8 PID: 6216 at lib/list_debug.c:47 __list_del_entry_valid+0x61/0xd0
Feb 22 09:25:27 host-12 kernel: list_del corruption, ffffea004161fae0->next is LIST_POISON1 (dead000000000100)
Feb 22 09:25:28 host-12 abrt-server: '/var/spool/abrt/oops-2016-10-27-10:38:26-12224-0' is not a problem directory
Feb 22 09:25:28 host-12 kernel: Modules linked in: xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd iTCO_wdt glue_helper cryptd iTCO_vendor_support sg ipmi_si dax_pmem hpwdt i2c_i801 ioatdma pcspkr lpc_ich wmi ipmi_devintf hpilo dax pcc_cpufreq acpi_power_meter ipmi_msghandler acpi_cpufreq dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_mi
 sc ip_tables xfs libcrc32c
Feb 22 09:25:28 host-12 kernel: sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm tg3 drm ptp nd_pmem serio_raw crc32c_intel hpsa fjes i2c_core pps_core scsi_transport_sas
Feb 22 09:25:28 host-12 kernel: CPU: 8 PID: 6216 Comm: dracut Tainted: G    B   W       4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:28 host-12 abrt-server: '/var/spool/abrt/oops-2016-10-27-10:38:26-12224-0' is not a problem directory
Feb 22 09:25:29 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:29 host-12 kernel: Call Trace:
Feb 22 09:25:29 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:29 host-12 kernel: __warn+0xd1/0xf0
Feb 22 09:25:29 host-12 kernel: warn_slowpath_fmt+0x5f/0x80
Feb 22 09:25:29 host-12 kernel: ? set_next_entity+0x9e/0x1b0
Feb 22 09:25:29 host-12 kernel: __list_del_entry_valid+0x61/0xd0
Feb 22 09:25:29 host-12 kernel: get_page_from_freelist+0x89e/0xbe0
Feb 22 09:25:29 host-12 kernel: __alloc_pages_nodemask+0xe3/0x260
Feb 22 09:25:29 host-12 kernel: alloc_misplaced_dst_page+0x29/0x30
Feb 22 09:25:29 host-12 kernel: migrate_pages+0x1db/0xa40
Feb 22 09:25:29 host-12 kernel: ? isolate_lru_page+0x1d2/0x2d0
Feb 22 09:25:29 host-12 kernel: ? put_page+0x50/0x50
Feb 22 09:25:29 host-12 kernel: migrate_misplaced_page+0x155/0x210
Feb 22 09:25:29 host-12 kernel: __handle_mm_fault+0x928/0x1290
Feb 22 09:25:29 host-12 kernel: handle_mm_fault+0xce/0x240
Feb 22 09:25:29 host-12 kernel: __do_page_fault+0x22a/0x4a0
Feb 22 09:25:29 host-12 kernel: do_page_fault+0x30/0x80
Feb 22 09:25:29 host-12 kernel: ? do_syscall_64+0x175/0x180
Feb 22 09:25:29 host-12 kernel: page_fault+0x28/0x30
Feb 22 09:25:29 host-12 kernel: RIP: 0033:0x7f730e23a4e1
Feb 22 09:25:29 host-12 kernel: RSP: 002b:00007ffedf5e0910 EFLAGS: 00010202
Feb 22 09:25:29 host-12 kernel: RAX: 00007f730e44d148 RBX: 00007ffedf5e0a20 RCX: 0000000000000069
Feb 22 09:25:29 host-12 kernel: RDX: 0000000000000080 RSI: 0000000000000023 RDI: 00007f730e44d148
Feb 22 09:25:29 host-12 kernel: RBP: 0000000000000080 R08: 0000000000000000 R09: 0000000000cd4d50
Feb 22 09:25:29 host-12 kernel: R10: 0000000000000006 R11: 0000000000000246 R12: 0000000000000001
Feb 22 09:25:29 host-12 kernel: R13: 0000000000000000 R14: 0000000000000080 R15: 0000000000000080
Feb 22 09:25:29 host-12 kernel: ---[ end trace 95acd0f30b99f7f1 ]---
Feb 22 09:25:29 host-12 abrt-hook-ccpp: Process 6333 (bash) of user 0 killed by SIGSEGV - dumping core
Feb 22 09:25:29 host-12 abrt-hook-ccpp: Process 6332 (bash) of user 0 killed by SIGSEGV - dumping core
Feb 22 09:25:29 host-12 kernel: ------------[ cut here ]------------
Feb 22 09:25:29 host-12 kernel: traps: dracut[6333] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:29 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:29 host-12 kernel: traps: dracut[6332] general protection ip:7f730e23a4e9 sp:7ffedf5e0060 error:0
Feb 22 09:25:29 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:29 host-12 kernel: WARNING: CPU: 8 PID: 5717 at lib/list_debug.c:47 __list_del_entry_valid+0x61/0xd0
Feb 22 09:25:29 host-12 kernel: list_del corruption, ffffea004161fae0->next is LIST_POISON1 (dead000000000100)
Feb 22 09:25:29 host-12 kernel: Modules linked in: xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd iTCO_wdt glue_helper cryptd iTCO_vendor_support sg ipmi_si dax_pmem hpwdt i2c_i801 ioatdma pcspkr lpc_ich wmi ipmi_devintf hpilo dax pcc_cpufreq acpi_power_meter ipmi_msghandler acpi_cpufreq dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_mi
 sc ip_tables xfs libcrc32c
Feb 22 09:25:29 host-12 sh: abrt-dump-oops: Found oopses: 4
Feb 22 09:25:29 host-12 sh: abrt-dump-oops: Creating problem directories
Feb 22 09:25:29 host-12 sh: abrt-dump-oops: Not going to make dump directories world readable because PrivateReports is on
Feb 22 09:25:29 host-12 abrt-hook-ccpp: Process 6339 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:29 host-12 abrt-hook-ccpp: Process 6341 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:29 host-12 kernel: traps: dracut[6339] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:29 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:29 host-12 kernel: traps: dracut[6341] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:29 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:29 host-12 kernel: sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm tg3 drm ptp nd_pmem serio_raw crc32c_intel hpsa fjes i2c_core pps_core scsi_transport_sas
Feb 22 09:25:29 host-12 abrt-hook-ccpp: Process 6343 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:29 host-12 abrt-hook-ccpp: Process 6345 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:29 host-12 abrt-hook-ccpp: Process 6347 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6349 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6352 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6355 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6351 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6357 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6361 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6363 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6360 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6366 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6367 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6369 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6373 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6375 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6371 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6377 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6379 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6382 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6383 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6386 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6388 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6391 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6389 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6393 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6396 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6399 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6397 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6401 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6405 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6404 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6407 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6412 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6414 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6411 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6417 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:30 host-12 abrt-hook-ccpp: Process 6420 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:31 host-12 abrt-hook-ccpp: Process 6422 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:31 host-12 abrt-hook-ccpp: Process 6424 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:31 host-12 abrt-hook-ccpp: Process 6418 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:31 host-12 abrt-hook-ccpp: Process 6426 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6430 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6432 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6434 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6428 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6436 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6440 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6438 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6443 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6445 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6449 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6447 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6451 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6454 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6455 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6457 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6460 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 kernel: traps: dracut[6343] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:32 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:32 host-12 kernel: traps: dracut[6345] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:32 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:32 host-12 kernel: traps: dracut[6347] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:32 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:32 host-12 kernel: traps: dracut[6349] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:32 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:32 host-12 kernel: traps: dracut[6352] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:32 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:32 host-12 kernel: traps: dracut[6355] general protection ip:7f730e23a4e9 sp:7ffedf5e0910 error:0
Feb 22 09:25:32 host-12 kernel: in ld-2.17.so[7f730e22c000+20000]
Feb 22 09:25:32 host-12 kernel: BUG: Bad page map in process dracut  pte:80000010587eb025 pmd:73cbd9067
Feb 22 09:25:32 host-12 kernel: page:ffffea004161fac0 count:1 mapcount:-1 mapping:ffff881073b0f731 index:0x0
Feb 22 09:25:32 host-12 kernel: flags: 0x50002ec004007c(referenced|uptodate|dirty|lru|active|swapbacked)
Feb 22 09:25:32 host-12 kernel: raw: 0050002ec004007c ffff881073b0f731 0000000000000000 00000001fffffffe
Feb 22 09:25:32 host-12 kernel: raw: dead000000000100 dead000000000200 0000000000000000 ffff880f7c62d800
Feb 22 09:25:32 host-12 kernel: page dumped because: bad pte
Feb 22 09:25:32 host-12 kernel: page->mem_cgroup:ffff880f7c62d800
Feb 22 09:25:32 host-12 kernel: addr:00007f730e44d000 vm_flags:00100073 anon_vma:ffff88107196c640 mapping:          (null) index:7f730e44d
Feb 22 09:25:32 host-12 kernel: file:          (null) fault:          (null) mmap:          (null) readpage:          (null)
Feb 22 09:25:32 host-12 kernel: CPU: 3 PID: 6357 Comm: dracut Tainted: G    B   W       4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:32 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:32 host-12 kernel: Call Trace:
Feb 22 09:25:32 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:32 host-12 kernel: print_bad_pte+0x1e4/0x290
Feb 22 09:25:32 host-12 kernel: unmap_page_range+0x827/0x9e0
Feb 22 09:25:32 host-12 kernel: unmap_single_vma+0x81/0xf0
Feb 22 09:25:32 host-12 kernel: unmap_vmas+0x47/0x90
Feb 22 09:25:32 host-12 kernel: exit_mmap+0xa7/0x170
Feb 22 09:25:32 host-12 kernel: ? do_coredump+0x1a1/0xec0
Feb 22 09:25:32 host-12 kernel: mmput+0x62/0x140
Feb 22 09:25:32 host-12 kernel: do_exit+0x280/0xb90
Feb 22 09:25:32 host-12 kernel: do_group_exit+0x3f/0xb0
Feb 22 09:25:32 host-12 kernel: get_signal+0x1cc/0x600
Feb 22 09:25:32 host-12 kernel: ? __handle_mm_fault+0xae8/0x1290
Feb 22 09:25:32 host-12 kernel: do_signal+0x37/0x6a0
Feb 22 09:25:32 host-12 kernel: ? wake_up_state+0x10/0x20
Feb 22 09:25:32 host-12 kernel: ? signal_wake_up_state+0x25/0x30
Feb 22 09:25:32 host-12 kernel: ? complete_signal+0xf6/0x1f0
Feb 22 09:25:32 host-12 kernel: ? send_signal+0x3e/0x80
Feb 22 09:25:32 host-12 kernel: exit_to_usermode_loop+0x4c/0x92
Feb 22 09:25:32 host-12 kernel: prepare_exit_to_usermode+0x40/0x50
Feb 22 09:25:32 host-12 kernel: retint_user+0x8/0x10
Feb 22 09:25:32 host-12 kernel: RIP: 0033:0x7f730e23a4e9
Feb 22 09:25:32 host-12 kernel: RSP: 002b:00007ffedf5e0910 EFLAGS: 00010202
Feb 22 09:25:32 host-12 kernel: RAX: 00007f730e44d148 RBX: 00007ffedf5e0a20 RCX: 0000000000000069
Feb 22 09:25:32 host-12 kernel: RDX: 01c105e001c005df RSI: 01c305d301c205d2 RDI: 00007f730e44d148
Feb 22 09:25:32 host-12 kernel: RBP: 0000000000000080 R08: 0000000000000000 R09: 0000000000cabf80
Feb 22 09:25:32 host-12 kernel: R10: 0000000000000007 R11: 0000000000000246 R12: 0000000000000001
Feb 22 09:25:32 host-12 kernel: R13: 0000000000000000 R14: 0000000000000080 R15: 0000000000000080
Feb 22 09:25:32 host-12 kernel: ------------[ cut here ]------------
Feb 22 09:25:32 host-12 kernel: WARNING: CPU: 3 PID: 6357 at lib/list_debug.c:47 __list_del_entry_valid+0x61/0xd0
Feb 22 09:25:32 host-12 kernel: list_del corruption, ffffea004161fae0->next is LIST_POISON1 (dead000000000100)
Feb 22 09:25:32 host-12 kernel: Modules linked in: xt_CHECKSUM iptable_mangle ipt_MASQUERADE nf_nat_masquerade_ipv4 iptable_nat nf_nat_ipv4 nf_nat nf_conntrack_ipv4 nf_defrag_ipv4 xt_conntrack nf_conntrack ipt_REJECT nf_reject_ipv4 tun bridge stp llc ebtable_filter ebtables ip6table_filter ip6_tables iptable_filter dm_mirror dm_region_hash dm_log dm_mod intel_rapl sb_edac edac_core x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm irqbypass crct10dif_pclmul crc32_pclmul ghash_clmulni_intel pcbc ipmi_ssif aesni_intel crypto_simd iTCO_wdt glue_helper cryptd iTCO_vendor_support sg ipmi_si dax_pmem hpwdt i2c_i801 ioatdma pcspkr lpc_ich wmi ipmi_devintf hpilo dax pcc_cpufreq acpi_power_meter ipmi_msghandler acpi_cpufreq dca shpchp nfsd auth_rpcgss nfs_acl lockd grace sunrpc binfmt_mi
 sc ip_tables xfs libcrc32c
Feb 22 09:25:32 host-12 kernel: sd_mod mgag200 i2c_algo_bit drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops ttm tg3 drm ptp nd_pmem serio_raw crc32c_intel hpsa fjes i2c_core pps_core scsi_transport_sas
Feb 22 09:25:32 host-12 kernel: CPU: 3 PID: 6357 Comm: dracut Tainted: G    B   W       4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:32 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:32 host-12 kernel: Call Trace:
Feb 22 09:25:32 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:32 host-12 kernel: __warn+0xd1/0xf0
Feb 22 09:25:32 host-12 kernel: warn_slowpath_fmt+0x5f/0x80
Feb 22 09:25:32 host-12 kernel: ? free_hot_cold_page_list+0x44/0xb0
Feb 22 09:25:32 host-12 kernel: __list_del_entry_valid+0x61/0xd0
Feb 22 09:25:32 host-12 kernel: release_pages+0x2a4/0x3f0
Feb 22 09:25:32 host-12 kernel: free_pages_and_swap_cache+0x9e/0xc0
Feb 22 09:25:32 host-12 kernel: tlb_flush_mmu_free+0x36/0x60
Feb 22 09:25:32 host-12 kernel: tlb_finish_mmu+0x1c/0x50
Feb 22 09:25:32 host-12 kernel: exit_mmap+0xd6/0x170
Feb 22 09:25:32 host-12 kernel: ? do_coredump+0x1a1/0xec0
Feb 22 09:25:32 host-12 kernel: mmput+0x62/0x140
Feb 22 09:25:32 host-12 kernel: do_exit+0x280/0xb90
Feb 22 09:25:32 host-12 kernel: do_group_exit+0x3f/0xb0
Feb 22 09:25:32 host-12 kernel: get_signal+0x1cc/0x600
Feb 22 09:25:32 host-12 kernel: ? __handle_mm_fault+0xae8/0x1290
Feb 22 09:25:32 host-12 kernel: do_signal+0x37/0x6a0
Feb 22 09:25:32 host-12 kernel: ? wake_up_state+0x10/0x20
Feb 22 09:25:32 host-12 kernel: ? signal_wake_up_state+0x25/0x30
Feb 22 09:25:32 host-12 kernel: ? complete_signal+0xf6/0x1f0
Feb 22 09:25:32 host-12 kernel: ? send_signal+0x3e/0x80
Feb 22 09:25:32 host-12 kernel: exit_to_usermode_loop+0x4c/0x92
Feb 22 09:25:32 host-12 kernel: prepare_exit_to_usermode+0x40/0x50
Feb 22 09:25:32 host-12 kernel: retint_user+0x8/0x10
Feb 22 09:25:32 host-12 kernel: RIP: 0033:0x7f730e23a4e9
Feb 22 09:25:32 host-12 kernel: RSP: 002b:00007ffedf5e0910 EFLAGS: 00010202
Feb 22 09:25:32 host-12 kernel: RAX: 00007f730e44d148 RBX: 00007ffedf5e0a20 RCX: 0000000000000069
Feb 22 09:25:32 host-12 kernel: RDX: 01c105e001c005df RSI: 01c305d301c205d2 RDI: 00007f730e44d148
Feb 22 09:25:32 host-12 kernel: RBP: 0000000000000080 R08: 0000000000000000 R09: 0000000000cabf80
Feb 22 09:25:32 host-12 kernel: R10: 0000000000000007 R11: 0000000000000246 R12: 0000000000000001
Feb 22 09:25:32 host-12 kernel: R13: 0000000000000000 R14: 0000000000000080 R15: 0000000000000080
Feb 22 09:25:32 host-12 kernel: ---[ end trace 95acd0f30b99f7f2 ]---
Feb 22 09:25:32 host-12 kernel: CPU: 8 PID: 5717 Comm: qemu-kvm Tainted: G    B   W       4.10.0-linux-next-3d4ffb9-next-20170221 #274
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6462 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6463 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6466 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6467 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6471 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6470 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6474 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6477 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6476 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6479 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6482 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6485 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6483 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6487 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6490 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6491 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6495 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6497 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6499 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6501 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6503 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6505 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6507 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6509 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6511 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:32 host-12 abrt-hook-ccpp: Process 6513 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6515 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6517 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6519 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6521 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6523 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6525 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6527 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6529 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6531 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6533 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6535 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6537 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6540 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6542 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 abrt-hook-ccpp: Process 6544 (bash) of user 0 killed by SIGSEGV - ignoring (repeated crash)
Feb 22 09:25:33 host-12 kernel: Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
Feb 22 09:25:33 host-12 kernel: Call Trace:
Feb 22 09:25:33 host-12 kernel: dump_stack+0x63/0x87
Feb 22 09:25:33 host-12 kernel: __warn+0xd1/0xf0
Feb 22 09:25:33 host-12 kernel: warn_slowpath_fmt+0x5f/0x80
Feb 22 09:25:33 host-12 kernel: __list_del_entry_valid+0x61/0xd0
Feb 22 09:25:33 host-12 kernel: get_page_from_freelist+0x89e/0xbe0
Feb 22 09:25:33 host-12 kernel: __alloc_pages_nodemask+0xe3/0x260
Feb 22 09:25:33 host-12 kernel: alloc_misplaced_dst_page+0x29/0x30
Feb 22 09:25:33 host-12 kernel: migrate_pages+0x1db/0xa40
Feb 22 09:25:33 host-12 kernel: ? isolate_lru_page+0x1d2/0x2d0
Feb 22 09:25:33 host-12 kernel: ? put_page+0x50/0x50
Feb 22 09:25:33 host-12 kernel: migrate_misplaced_page+0x155/0x210
Feb 22 09:25:33 host-12 kernel: __handle_mm_fault+0x928/0x1290
Feb 22 09:25:33 host-12 kernel: ? try_to_wake_up+0x59/0x450
Feb 22 09:25:33 host-12 kernel: handle_mm_fault+0xce/0x240
Feb 22 09:25:33 host-12 kernel: __get_user_pages+0x137/0x6b0
Feb 22 09:25:33 host-12 kernel: ? gup_pud_range+0x1ea/0x210
Feb 22 09:25:33 host-12 kernel: get_user_pages+0x4f/0x60
Feb 22 09:25:33 host-12 kernel: __gfn_to_pfn_memslot+0x1a8/0x430 [kvm]
Feb 22 09:25:33 host-12 kernel: try_async_pf+0x67/0x240 [kvm]
Feb 22 09:25:33 host-12 kernel: ? kvm_host_page_size+0x85/0x90 [kvm]
Feb 22 09:25:33 host-12 kernel: tdp_page_fault+0x131/0x260 [kvm]
Feb 22 09:25:33 host-12 kernel: kvm_mmu_page_fault+0x65/0x130 [kvm]
Feb 22 09:25:33 host-12 kernel: handle_ept_violation+0xa5/0x190 [kvm_intel]
Feb 22 09:25:33 host-12 kernel: vmx_handle_exit+0x14b/0xbc0 [kvm_intel]
Feb 22 09:25:33 host-12 kernel: ? wait_lapic_expire+0xaa/0x180 [kvm]
Feb 22 09:25:33 host-12 kernel: vcpu_enter_guest+0x83e/0x1190 [kvm]
Feb 22 09:25:33 host-12 kernel: ? recalc_sigpending+0x1b/0x50
Feb 22 09:25:33 host-12 kernel: ? kvm_apic_local_deliver+0x61/0x70 [kvm]
Feb 22 09:25:33 host-12 kernel: kvm_arch_vcpu_ioctl_run+0x2ee/0x400 [kvm]
Feb 22 09:25:33 host-12 kernel: kvm_vcpu_ioctl+0x292/0x610 [kvm]
Feb 22 09:25:33 host-12 kernel: ? do_futex+0x11c/0x570
Feb 22 09:25:33 host-12 kernel: do_vfs_ioctl+0xa7/0x5e0
Feb 22 09:25:33 host-12 kernel: SyS_ioctl+0x79/0x90
Feb 22 09:25:33 host-12 kernel: do_syscall_64+0x67/0x180
Feb 22 09:25:33 host-12 kernel: entry_SYSCALL64_slow_path+0x25/0x25
Feb 22 09:25:33 host-12 kernel: RIP: 0033:0x7f641c6b0577
Feb 22 09:25:33 host-12 kernel: RSP: 002b:00007f641164ba98 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
Feb 22 09:25:33 host-12 kernel: RAX: ffffffffffffffda RBX: 00005584c4990000 RCX: 00007f641c6b0577
Feb 22 09:25:33 host-12 kernel: RDX: 0000000000000000 RSI: 000000000000ae80 RDI: 0000000000000013
Feb 22 09:25:33 host-12 kernel: RBP: 00007f6426e56000 R08: 0000000000000000 R09: 0000000000000000
Feb 22 09:25:33 host-12 kernel: R10: 0000000000000009 R11: 0000000000000246 R12: 00005584c28b37a0
Feb 22 09:25:33 host-12 kernel: R13: 0000000000000001 R14: 00007f6426e57001 R15: 0000000000000001
Feb 22 09:25:33 host-12 kernel: ---[ end trace 95acd0f30b99f7f3 ]---
