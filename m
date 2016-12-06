From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: next-20161206 WARN@ mm/hugetlb.c:2918 during boot
Date: Tue, 6 Dec 2016 21:11:46 +0530
Message-ID: <70A62042-92E6-414D-8FBD-BA0F5308944B@linux.vnet.ibm.com>
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Content-Type: multipart/mixed;
 boundary="Apple-Mail=_C6CAF781-3B93-442F-A65F-0D1E0CDFEC1F"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from 001b2d01.pphosted.com ([148.163.156.1]:41065 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1754013AbcLFPmX (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 6 Dec 2016 10:42:23 -0500
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id uB6FXvbh121582
        for <linux-next@vger.kernel.org>; Tue, 6 Dec 2016 10:42:11 -0500
Received: from e28smtp05.in.ibm.com (e28smtp05.in.ibm.com [125.16.236.5])
        by mx0a-001b2d01.pphosted.com with ESMTP id 275w5hm967-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 06 Dec 2016 10:42:10 -0500
Received: from localhost
        by e28smtp05.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <sachinp@linux.vnet.ibm.com>;
        Tue, 6 Dec 2016 21:12:05 +0530
Received: from d28relay07.in.ibm.com (d28relay07.in.ibm.com [9.184.220.158])
        by d28dlp01.in.ibm.com (Postfix) with ESMTP id 8F15EE005E
        for <linux-next@vger.kernel.org>; Tue,  6 Dec 2016 21:12:32 +0530 (IST)
Received: from d28av08.in.ibm.com (d28av08.in.ibm.com [9.184.220.148])
        by d28relay07.in.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id uB6FfRMK29098150
        for <linux-next@vger.kernel.org>; Tue, 6 Dec 2016 21:11:27 +0530
Received: from d28av08.in.ibm.com (localhost [127.0.0.1])
        by d28av08.in.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id uB6Fg1jW030644
        for <linux-next@vger.kernel.org>; Tue, 6 Dec 2016 21:12:02 +0530
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: sfr@canb.auug.org.au


--Apple-Mail=_C6CAF781-3B93-442F-A65F-0D1E0CDFEC1F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Following warning is displayed during todays next boot
on a Power8 LPAR. Kernel was built with pseries_le_defconfig.

[    0.016702] ------------[ cut here ]------------
[    0.016708] WARNING: CPU: 1 PID: 1 at mm/hugetlb.c:2918 =
hugetlb_add_hstate+0x1e8/0x210
[    0.016709] Modules linked in:
[    0.016712] CPU: 1 PID: 1 Comm: swapper/0 Not tainted =
4.9.0-rc8-next-20161206 #2
[    0.016715] task: c0000003bacc0000 task.stack: c0000003bad00000
[    0.016717] NIP: c000000000cd30a0 LR: c000000000cd303c CTR: =
c00000000057d910
[    0.016719] REGS: c0000003bad03870 TRAP: 0700   Not tainted  =
(4.9.0-rc8-next-20161206)
[    0.016721] MSR: 8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>
[    0.016728]   CR: 88004022  XER: 2000000e
[    0.016730] CFAR: c00000000057db9c SOFTE: 1=20
GPR00: c000000000cd303c c0000003bad03af0 c000000000e84000 =
0000000000000014=20
GPR04: c000000000bb7927 0000000000000002 fffffffffffffff4 =
c000000000db4000=20
GPR08: c000000000d14000 0000000000000001 0000000000000000 =
0000000000000006=20
GPR12: 0000000088004028 c00000000ea70400 c00000000000ddd8 =
0000000000000000=20
GPR16: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
GPR20: 0000000000000000 0000000000000000 0000000000000000 =
0000000000000000=20
GPR24: 0000000000000000 c000000000ca3614 0000000000000020 =
c000000000ec1228=20
GPR28: 0000000000001c78 c000000000faa9f0 0000000400000000 =
c000000000fac668=20
[    0.016767] NIP [c000000000cd30a0] hugetlb_add_hstate+0x1e8/0x210
[    0.016770] LR [c000000000cd303c] hugetlb_add_hstate+0x184/0x210
[    0.016771] Call Trace:
[    0.016773] [c0000003bad03af0] [c000000000cd303c] =
hugetlb_add_hstate+0x184/0x210 (unreliable)
[    0.016778] [c0000003bad03b80] [c000000000cb26ec] =
add_huge_page_size+0xa8/0xc8
[    0.016782] [c0000003bad03bb0] [c000000000cb27d8] =
hugetlbpage_init+0x60/0x1cc
[    0.016785] [c0000003bad03c40] [c00000000000d4e0] =
do_one_initcall+0x60/0x1c0
[    0.016788] [c0000003bad03d00] [c000000000ca4254] =
kernel_init_freeable+0x284/0x364
[    0.016791] [c0000003bad03dc0] [c00000000000ddf4] =
kernel_init+0x24/0x150
[    0.016795] [c0000003bad03e30] [c00000000000bae0] =
ret_from_kernel_thread+0x5c/0x7c
[    0.016797] Instruction dump:
[    0.016799] 7d0807b4 394a0010 7d0a5036 3d02ffe9 7fbe5040 fbe83d80 =
41fc001c 3ce2fff3=20
[    0.016805] 89471fa4 2f8a0000 40fe000c 99271fa4 <0fe00000> 38210090 =
e8010010 eb61ffd8=20
[    0.016811] ---[ end trace 42481f903da18455 ]---
[    0.016882] pstore: using zlib compression

Complete dmesg log is attached.

Thanks
-Sachin



--Apple-Mail=_C6CAF781-3B93-442F-A65F-0D1E0CDFEC1F
Content-Disposition: attachment;
	filename=dmesg.log
Content-Type: application/octet-stream;
	x-unix-mode=0644;
	name="dmesg.log"
Content-Transfer-Encoding: 7bit

[    0.000000] kexec_core: crashkernel: memory value expected
[    0.000000] Allocated 2097152 bytes for 2048 pacas at c00000000ea70000
[    0.000000] Page sizes from device-tree:
[    0.000000] base_shift=12: shift=12, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=0
[    0.000000] base_shift=12: shift=16, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=7
[    0.000000] base_shift=12: shift=24, sllp=0x0000, avpnm=0x00000000, tlbiel=1, penc=56
[    0.000000] base_shift=16: shift=16, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=1
[    0.000000] base_shift=16: shift=24, sllp=0x0110, avpnm=0x00000000, tlbiel=1, penc=8
[    0.000000] base_shift=24: shift=24, sllp=0x0100, avpnm=0x00000001, tlbiel=0, penc=0
[    0.000000] base_shift=34: shift=34, sllp=0x0120, avpnm=0x000007ff, tlbiel=0, penc=3
[    0.000000] Page orders: linear mapping = 24, virtual = 16, io = 16, vmemmap = 24
[    0.000000] Using 1TB segments
[    0.000000] Initializing hash mmu with SLB
[    0.000000] Linux version 4.9.0-rc8-next-20161206 (root@alp12.pok.stglabs.ibm.com) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-11) (GCC) ) #2 SMP Tue Dec 6 07:27:13 PST 2016
[    0.000000] Found initrd at 0xc000000009800000:0xc00000000ab19ce6
[    0.000000] Using pSeries machine description
[    0.000000] bootconsole [udbg0] enabled
[    0.000000] Partition configured for 16 cpus.
[    0.000000] CPU maps initialized for 8 threads per core
[    0.000000]  (thread shift is 3)
[    0.000000] Freed 2031616 bytes for unused pacas
[    0.000000] -----------------------------------------------------
[    0.000000] ppc64_pft_size    = 0x1d
[    0.000000] phys_mem_size     = 0x3c0000000
[    0.000000] dcache_bsize      = 0x80
[    0.000000] icache_bsize      = 0x80
[    0.000000] cpu_features      = 0x27fc7aec18500249
[    0.000000]   possible        = 0x7fffffff18500649
[    0.000000]   always          = 0x0000000018100040
[    0.000000] cpu_user_features = 0xdc0065c2 0xef000000
[    0.000000] mmu_features      = 0x7c004001
[    0.000000] firmware_features = 0x00000001c45ffc5f
[    0.000000] htab_hash_mask    = 0x3fffff
[    0.000000] -----------------------------------------------------
[    0.000000] numa: Initmem setup node 0
[    0.000000] numa:   NODE_DATA [mem 0x3bff62300-0x3bff6bfff]
[    0.000000] numa:     NODE_DATA(0) on node 5
[    0.000000] numa: Initmem setup node 5 [mem 0x00000000-0x3bfffffff]
[    0.000000] numa:   NODE_DATA [mem 0x3bff58600-0x3bff622ff]
[    0.000000] Section 957 and 959 (node 5) have a circular dependency on usemap and pgdat allocations
[    0.000000] PPC64 nvram contains 15360 bytes
[    0.000000] Top of RAM: 0x3c0000000, Total RAM: 0x3c0000000
[    0.000000] Memory hole size: 0MB
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000000000-0x00000003bfffffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   5: [mem 0x0000000000000000-0x00000003bfffffff]
[    0.000000] Could not find start_pfn for node 0
[    0.000000] Initmem setup node 0 [mem 0x0000000000000000-0x0000000000000000]
[    0.000000] On node 0 totalpages: 0
[    0.000000] Initmem setup node 5 [mem 0x0000000000000000-0x00000003bfffffff]
[    0.000000] On node 5 totalpages: 245760
[    0.000000]   DMA zone: 240 pages used for memmap
[    0.000000]   DMA zone: 0 pages reserved
[    0.000000]   DMA zone: 245760 pages, LIFO batch:1
[    0.000000] percpu: Embedded 3 pages/cpu @c0000003bfb00000 s146072 r0 d50536 u262144
[    0.000000] pcpu-alloc: s146072 r0 d50536 u262144 alloc=1*1048576
[    0.000000] pcpu-alloc: [0] 00 01 02 03 [0] 04 05 06 07 
[    0.000000] pcpu-alloc: [0] 08 09 10 11 [0] 12 13 14 15 
[    0.000000] Built 2 zonelists in Node order, mobility grouping on.  Total pages: 245520
[    0.000000] Policy zone: DMA
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-4.9.0-rc8-next-20161206 root=/dev/mapper/rhel_alp12-root ro crashkernel=auto rd.lvm.lv=rhel_alp12/root rd.lvm.lv=rhel_alp12/swap biosdevname=0 LANG=en_US.UTF-8
[    0.000000] PID hash table entries: 4096 (order: -1, 32768 bytes)
[    0.000000] Memory: 15650816K/15728640K available (10048K kernel code, 1408K rwdata, 2804K rodata, 832K init, 1349K bss, 77824K reserved, 0K cma-reserved)
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=16, Nodes=6
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=2048 to nr_cpu_ids=16.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=16
[    0.000000] NR_IRQS:512 nr_irqs:512 16
[    0.000000] pic: no ISA interrupt controller
[    0.000000] time_init: decrementer frequency = 512.000000 MHz
[    0.000000] time_init: processor frequency   = 3724.000000 MHz
[    0.000001] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: 0x761537d007, max_idle_ns: 440795202126 ns
[    0.000025] clocksource: timebase mult[1f40000] shift[24] registered
[    0.000038] clockevent: decrementer mult[83126e98] shift[32] cpu[0]
[    0.000087] Console: colour dummy device 80x25
[    0.000097] console [hvc0] enabled
[    0.000104] bootconsole [udbg0] disabled
[    0.000125] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.000129] pid_max: default: 32768 minimum: 301
[    0.000237] Dentry cache hash table entries: 2097152 (order: 8, 16777216 bytes)
[    0.003084] Inode-cache hash table entries: 1048576 (order: 7, 8388608 bytes)
[    0.004497] Mount-cache hash table entries: 32768 (order: 2, 262144 bytes)
[    0.004504] Mountpoint-cache hash table entries: 32768 (order: 2, 262144 bytes)
[    0.004900] EEH: pSeries platform initialized
[    0.004903] POWER8 performance monitor hardware support registered
[    0.005157] smp: Bringing up secondary CPUs ...
[    0.006602] smp: Brought up 2 nodes, 8 CPUs
[    0.006608] numa: Node 0 CPUs:
[    0.006610] numa: Node 5 CPUs: 0-7
[    0.006959] devtmpfs: initialized
[    0.015989] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    0.016019] kworker/u33:0 (59) used greatest stack depth: 12416 bytes left
[    0.016129] NET: Registered protocol family 16
[    0.016162] EEH: No capable adapters found
[    0.016639] cpuidle: using governor menu
[    0.016692] RTAS daemon started
[    0.016702] ------------[ cut here ]------------
[    0.016708] WARNING: CPU: 1 PID: 1 at mm/hugetlb.c:2918 hugetlb_add_hstate+0x1e8/0x210
[    0.016709] Modules linked in:
[    0.016712] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 4.9.0-rc8-next-20161206 #2
[    0.016715] task: c0000003bacc0000 task.stack: c0000003bad00000
[    0.016717] NIP: c000000000cd30a0 LR: c000000000cd303c CTR: c00000000057d910
[    0.016719] REGS: c0000003bad03870 TRAP: 0700   Not tainted  (4.9.0-rc8-next-20161206)
[    0.016721] MSR: 8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>
[    0.016728]   CR: 88004022  XER: 2000000e
[    0.016730] CFAR: c00000000057db9c SOFTE: 1 
GPR00: c000000000cd303c c0000003bad03af0 c000000000e84000 0000000000000014 
GPR04: c000000000bb7927 0000000000000002 fffffffffffffff4 c000000000db4000 
GPR08: c000000000d14000 0000000000000001 0000000000000000 0000000000000006 
GPR12: 0000000088004028 c00000000ea70400 c00000000000ddd8 0000000000000000 
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR24: 0000000000000000 c000000000ca3614 0000000000000020 c000000000ec1228 
GPR28: 0000000000001c78 c000000000faa9f0 0000000400000000 c000000000fac668 
[    0.016767] NIP [c000000000cd30a0] hugetlb_add_hstate+0x1e8/0x210
[    0.016770] LR [c000000000cd303c] hugetlb_add_hstate+0x184/0x210
[    0.016771] Call Trace:
[    0.016773] [c0000003bad03af0] [c000000000cd303c] hugetlb_add_hstate+0x184/0x210 (unreliable)
[    0.016778] [c0000003bad03b80] [c000000000cb26ec] add_huge_page_size+0xa8/0xc8
[    0.016782] [c0000003bad03bb0] [c000000000cb27d8] hugetlbpage_init+0x60/0x1cc
[    0.016785] [c0000003bad03c40] [c00000000000d4e0] do_one_initcall+0x60/0x1c0
[    0.016788] [c0000003bad03d00] [c000000000ca4254] kernel_init_freeable+0x284/0x364
[    0.016791] [c0000003bad03dc0] [c00000000000ddf4] kernel_init+0x24/0x150
[    0.016795] [c0000003bad03e30] [c00000000000bae0] ret_from_kernel_thread+0x5c/0x7c
[    0.016797] Instruction dump:
[    0.016799] 7d0807b4 394a0010 7d0a5036 3d02ffe9 7fbe5040 fbe83d80 41fc001c 3ce2fff3 
[    0.016805] 89471fa4 2f8a0000 40fe000c 99271fa4 <0fe00000> 38210090 e8010010 eb61ffd8 
[    0.016811] ---[ end trace 42481f903da18455 ]---
[    0.016882] pstore: using zlib compression
[    0.016886] pstore: Registered nvram as persistent store backend
[    0.018812] PCI: Probing PCI hardware
[    0.018815] PCI: Probing PCI hardware done
[    0.018908] pseries-rng: Registering arch random hook.
[    0.022449] HugeTLB registered 16 MB page size, pre-allocated 0 pages
[    0.022456] HugeTLB registered 16 GB page size, pre-allocated 0 pages
[    0.023036] vgaarb: loaded
[    0.023124] SCSI subsystem initialized
[    0.023186] libata version 3.00 loaded.
[    0.023306] usbcore: registered new interface driver usbfs
[    0.023323] usbcore: registered new interface driver hub
[    0.023366] usbcore: registered new device driver usb
[    0.023413] pps_core: LinuxPPS API ver. 1 registered
[    0.023419] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.023435] PTP clock support registered
[    0.023695] clocksource: Switched to clocksource timebase
[    0.031568] NET: Registered protocol family 2
[    0.031697] TCP established hash table entries: 131072 (order: 4, 1048576 bytes)
[    0.031924] TCP bind hash table entries: 65536 (order: 4, 1048576 bytes)
[    0.032033] TCP: Hash tables configured (established 131072 bind 65536)
[    0.032052] UDP hash table entries: 8192 (order: 2, 262144 bytes)
[    0.032081] UDP-Lite hash table entries: 8192 (order: 2, 262144 bytes)
[    0.032141] NET: Registered protocol family 1
[    0.032255] RPC: Registered named UNIX socket transport module.
[    0.032257] RPC: Registered udp transport module.
[    0.032258] RPC: Registered tcp transport module.
[    0.032260] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.032263] PCI: CLS 0 bytes, default 128
[    0.032291] Trying to unpack rootfs image as initramfs...
[    0.277591] Freeing initrd memory: 19520K
[    0.278436] IOMMU table initialized, virtual merging enabled
[    0.288618] hv-24x7: read 1330 catalog entries, created 337 event attrs (0 failures), 169 descs
[    0.289113] futex hash table entries: 4096 (order: 3, 524288 bytes)
[    0.289179] audit: initializing netlink subsys (disabled)
[    0.289225] audit: type=2000 audit(1481038219.280:1): initialized
[    0.289876] workingset: timestamp_bits=38 max_order=18 bucket_order=0
[    0.292964] NFS: Registering the id_resolver key type
[    0.292973] Key type id_resolver registered
[    0.292975] Key type id_legacy registered
[    0.292984] SGI XFS with ACLs, security attributes, no debug enabled
[    0.293736] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    0.293743] io scheduler noop registered
[    0.293746] io scheduler deadline registered
[    0.293778] io scheduler cfq registered (default)
[    0.293865] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
[    0.308924] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.311536] brd: module loaded
[    0.312844] loop: module loaded
[    0.312919] ipr: IBM Power RAID SCSI Device Driver version: 2.6.3 (October 17, 2015)
[    0.313058] ibmvscsi 30000070: SRP_VERSION: 16.a
[    0.313282] ibmvscsi 30000070: Maximum ID: 64 Maximum LUN: 32 Maximum Channel: 3
[    0.313285] scsi host0: IBM POWER Virtual SCSI Adapter 1.5.9
[    0.313457] ibmvscsi 30000070: partner initialization complete
[    0.313496] ibmvscsi 30000070: host srp version: 16.a, host partition alp18-VIOS (100), OS 3, max io 1048576
[    0.313556] ibmvscsi 30000070: Client reserve enabled
[    0.313563] ibmvscsi 30000070: sent SRP login
[    0.313593] ibmvscsi 30000070: SRP_LOGIN succeeded
[    0.334017] scsi 0:0:1:0: Direct-Access     AIX      VDASD            0001 PQ: 0 ANSI: 3
[    0.334313] scsi 0:0:2:0: CD-ROM            AIX      VOPTA                 PQ: 0 ANSI: 4
[    0.360246] random: fast init done
[    0.361518] sd 0:0:1:0: [sda] 62914560 512-byte logical blocks: (32.2 GB/30.0 GiB)
[    0.361553] sr 0:0:2:0: [sr0] scsi-1 drive
[    0.361554] sd 0:0:1:0: [sda] Write Protect is off
[    0.361555] sd 0:0:1:0: [sda] Mode Sense: 17 00 00 08
[    0.361558] cdrom: Uniform CD-ROM driver Revision: 3.20
[    0.361600] sd 0:0:1:0: [sda] Cache data unavailable
[    0.361603] sd 0:0:1:0: [sda] Assuming drive cache: write through
[    0.361746] sr 0:0:2:0: Attached scsi CD-ROM sr0
[    0.361855] sd 0:0:1:0: Attached scsi generic sg0 type 0
[    0.361910] sr 0:0:2:0: Attached scsi generic sg1 type 5
[    0.362095] libphy: Fixed MDIO Bus: probed
[    0.362112] ibmveth: IBM Power Virtual Ethernet Driver 1.05
[    0.362264] e100: Intel(R) PRO/100 Network Driver, 3.5.24-k2-NAPI
[    0.362268] e100: Copyright(c) 1999-2006 Intel Corporation
[    0.362287] e1000: Intel(R) PRO/1000 Network Driver - version 7.3.21-k8-NAPI
[    0.362291] e1000: Copyright (c) 1999-2006 Intel Corporation.
[    0.362307] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    0.362310] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    0.362328] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.362332] ehci-pci: EHCI PCI platform driver
[    0.362348] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.362355] ohci-pci: OHCI PCI platform driver
[    0.362421]  sda: sda1 sda2 sda3
[    0.362432] mousedev: PS/2 mouse device common for all mice
[    0.362609] rtc-generic rtc-generic: rtc core: registered rtc-generic as rtc0
[    0.362764] device-mapper: uevent: version 1.0.3
[    0.362886] device-mapper: ioctl: 4.35.0-ioctl (2016-06-23) initialised: dm-devel@redhat.com
[    0.363009] sd 0:0:1:0: [sda] Attached SCSI disk
[    0.363101] pseries_idle_driver registered
[    0.363121] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_size new:4096 old:0
[    0.363124] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sync_sg new:510 old:0
[    0.363128] nx_compress_pseries ibm,compression-v1: nx842_OF_upd: max_sg_len new:4080 old:0
[    0.363478] usbcore: registered new interface driver usbhid
[    0.363482] usbhid: USB HID core driver
[    0.363486] oprofile: using timer interrupt.
[    0.363582] ipip: IPv4 and MPLS over IPv4 tunneling driver
[    0.363780] NET: Registered protocol family 17
[    0.363812] Key type dns_resolver registered
[    0.363922] Running code patching self-tests ...
[    0.364326] Running feature fixup self-tests ...
[    0.364331] Running MSI bitmap self-tests ...
[    0.364556] registered taskstats version 1
[    0.364599] console [netcon0] enabled
[    0.364602] netconsole: network logging started
[    0.364653] rtc-generic rtc-generic: setting system clock to 2016-12-06 15:30:19 UTC (1481038219)
[    0.365525] Freeing unused kernel memory: 832K
[    0.365527] This architecture does not have kernel memory protection.
[    0.367502] systemd[1]: Failed to insert module 'autofs4'
[    0.372476] systemd[1]: systemd 219 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ -LZ4 -SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    0.372565] systemd[1]: Detected architecture ppc64-le.
[    0.372569] systemd[1]: Running in initial RAM disk.
[    0.372814] systemd[1]: Set hostname to <localhost.localdomain>.
[    0.374727] systemd-fstab-g (1562) used greatest stack depth: 11968 bytes left
[    0.400011] systemd[1]: Reached target Local File Systems.
[    0.400021] systemd[1]: Starting Local File Systems.
[    0.400361] systemd[1]: Created slice Root Slice.
[    0.400369] systemd[1]: Starting Root Slice.
[    0.400614] systemd[1]: Created slice System Slice.
[    0.400623] systemd[1]: Starting System Slice.
[    0.576592] scsi_id (2498) used greatest stack depth: 11632 bytes left
[    2.060511] XFS (dm-0): Mounting V5 Filesystem
[    2.129119] XFS (dm-0): Ending clean mount
[    2.129292] mount (2819) used greatest stack depth: 10896 bytes left
[    2.475081] systemd-journald[1587]: Received SIGTERM from PID 1 (systemd).
[    2.524971] systemd: 24 output lines suppressed due to ratelimiting
[    2.839297] autofs4: disagrees about version of symbol memcpy
[    2.839314] autofs4: Unknown symbol memcpy (err -22)
[    2.839345] autofs4: disagrees about version of symbol memchr
[    2.839346] autofs4: Unknown symbol memchr (err -22)
[    2.839354] autofs4: disagrees about version of symbol strncpy
[    2.839355] autofs4: Unknown symbol strncpy (err -22)
[    2.839358] autofs4: disagrees about version of symbol memcmp
[    2.839360] autofs4: Unknown symbol memcmp (err -22)
[    2.839365] autofs4: disagrees about version of symbol memset
[    2.839367] autofs4: Unknown symbol memset (err -22)
[    2.874043] systemd[1]: Failed to insert module 'autofs4'
[    2.887709] x_tables: disagrees about version of symbol memcpy
[    2.887716] x_tables: Unknown symbol memcpy (err -22)
[    2.887730] x_tables: disagrees about version of symbol strncpy
[    2.887732] x_tables: Unknown symbol strncpy (err -22)
[    2.887737] x_tables: disagrees about version of symbol __arch_hweight32
[    2.887739] x_tables: Unknown symbol __arch_hweight32 (err -22)
[    2.887744] x_tables: disagrees about version of symbol memset
[    2.887746] x_tables: Unknown symbol memset (err -22)
[    3.145112] systemd-efi-boo (2887) used greatest stack depth: 10704 bytes left
[    3.272883] systemd-sysv-generator[2893]: stat() failed on /etc/rc.d/init.d/autotest: No such file or directory
[    3.436932] kdump-dep-gener (2895) used greatest stack depth: 10544 bytes left
[    3.891530] systemd-readahead[2902]: Failed to create fanotify object: Function not implemented
[    4.295886] systemd-journald[2906]: Received request to flush runtime journal from PID 1
[    4.684406] rng_core: disagrees about version of symbol memset
[    4.684445] rng_core: Unknown symbol memset (err -22)
[    4.743953] vmx_crypto: disagrees about version of symbol memcpy
[    4.743995] vmx_crypto: Unknown symbol memcpy (err -22)
[    4.823860] vmx_crypto: disagrees about version of symbol memcpy
[    4.823902] vmx_crypto: Unknown symbol memcpy (err -22)
[    4.884378] vmx_crypto: disagrees about version of symbol memcpy
[    4.884420] vmx_crypto: Unknown symbol memcpy (err -22)
[    4.963811] vmx_crypto: disagrees about version of symbol memcpy
[    4.963841] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.063783] vmx_crypto: disagrees about version of symbol memcpy
[    5.063815] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.063973] ibmveth 30000002 net0: renamed from eth0
[    5.123762] vmx_crypto: disagrees about version of symbol memcpy
[    5.123795] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.193760] vmx_crypto: disagrees about version of symbol memcpy
[    5.193790] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.203641] gzip (4732) used greatest stack depth: 10512 bytes left
[    5.222769] Adding 3145664k swap on /dev/mapper/rhel_alp12-swap.  Priority:-1 extents:1 across:3145664k 
[    5.233741] vmx_crypto: disagrees about version of symbol memcpy
[    5.233758] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.303740] vmx_crypto: disagrees about version of symbol memcpy
[    5.303748] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.373723] vmx_crypto: disagrees about version of symbol memcpy
[    5.373739] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.483722] vmx_crypto: disagrees about version of symbol memcpy
[    5.483742] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.553728] vmx_crypto: disagrees about version of symbol memcpy
[    5.553751] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.603734] vmx_crypto: disagrees about version of symbol memcpy
[    5.603754] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.643727] vmx_crypto: disagrees about version of symbol memcpy
[    5.643747] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.713729] vmx_crypto: disagrees about version of symbol memcpy
[    5.713749] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.813714] vmx_crypto: disagrees about version of symbol memcpy
[    5.813732] vmx_crypto: Unknown symbol memcpy (err -22)
[    5.848383] XFS (sda2): Mounting V5 Filesystem
[    6.426162] XFS (sda2): Ending clean mount
[    8.619478] x_tables: disagrees about version of symbol memcpy
[    8.619497] x_tables: Unknown symbol memcpy (err -22)
[    8.619516] x_tables: disagrees about version of symbol strncpy
[    8.619518] x_tables: Unknown symbol strncpy (err -22)
[    8.619524] x_tables: disagrees about version of symbol __arch_hweight32
[    8.619526] x_tables: Unknown symbol __arch_hweight32 (err -22)
[    8.619531] x_tables: disagrees about version of symbol memset
[    8.619533] x_tables: Unknown symbol memset (err -22)
[    8.672677] x_tables: disagrees about version of symbol memcpy
[    8.672698] x_tables: Unknown symbol memcpy (err -22)
[    8.672718] x_tables: disagrees about version of symbol strncpy
[    8.672720] x_tables: Unknown symbol strncpy (err -22)
[    8.672726] x_tables: disagrees about version of symbol __arch_hweight32
[    8.672728] x_tables: Unknown symbol __arch_hweight32 (err -22)
[    8.672733] x_tables: disagrees about version of symbol memset
[    8.672735] x_tables: Unknown symbol memset (err -22)
[    8.724525] random: crng init done
[    8.737767] x_tables: disagrees about version of symbol memcpy
[    8.737796] x_tables: Unknown symbol memcpy (err -22)
[    8.737818] x_tables: disagrees about version of symbol strncpy
[    8.737820] x_tables: Unknown symbol strncpy (err -22)
[    8.737827] x_tables: disagrees about version of symbol __arch_hweight32
[    8.737829] x_tables: Unknown symbol __arch_hweight32 (err -22)
[    8.737836] x_tables: disagrees about version of symbol memset
[    8.737838] x_tables: Unknown symbol memset (err -22)
[    8.799164] x_tables: disagrees about version of symbol memcpy
[    8.799193] x_tables: Unknown symbol memcpy (err -22)
[    8.799223] x_tables: disagrees about version of symbol strncpy
[    8.799228] x_tables: Unknown symbol strncpy (err -22)
[    8.799237] x_tables: disagrees about version of symbol __arch_hweight32
[    8.799241] x_tables: Unknown symbol __arch_hweight32 (err -22)
[    8.799252] x_tables: disagrees about version of symbol memset
[    8.799256] x_tables: Unknown symbol memset (err -22)
[    8.877316] x_tables: disagrees about version of symbol memcpy
[    8.877338] x_tables: Unknown symbol memcpy (err -22)
[    8.877357] x_tables: disagrees about version of symbol strncpy
[    8.877359] x_tables: Unknown symbol strncpy (err -22)
[    8.877365] x_tables: disagrees about version of symbol __arch_hweight32
[    8.877367] x_tables: Unknown symbol __arch_hweight32 (err -22)
[    8.877373] x_tables: disagrees about version of symbol memset
[    8.877375] x_tables: Unknown symbol memset (err -22)
[    8.938160] x_tables: disagrees about version of symbol memcpy
[    8.938188] x_tables: Unknown symbol memcpy (err -22)
[    8.938213] x_tables: disagrees about version of symbol strncpy
[    8.938215] x_tables: Unknown symbol strncpy (err -22)
[    8.938222] x_tables: disagrees about version of symbol __arch_hweight32
[    8.938224] x_tables: Unknown symbol __arch_hweight32 (err -22)
[    8.938232] x_tables: disagrees about version of symbol memset
[    8.938234] x_tables: Unknown symbol memset (err -22)
[    9.036735] Netfilter messages via NETLINK v0.30.
[   15.044965] systemd-sysv-generator[5923]: stat() failed on /etc/rc.d/init.d/autotest: No such file or directory
[   15.229469] systemd-sysv-generator[6160]: stat() failed on /etc/rc.d/init.d/autotest: No such file or directory
[   17.806045] rpaphp: RPA HOT Plug PCI Controller Driver version: 0.1
[   17.806465] rpadlpar_io: disagrees about version of symbol memcpy
[   17.806470] rpadlpar_io: Unknown symbol memcpy (err -22)

--Apple-Mail=_C6CAF781-3B93-442F-A65F-0D1E0CDFEC1F--
