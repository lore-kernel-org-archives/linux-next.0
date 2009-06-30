From: Sachin Sant <sachinp@in.ibm.com>
Subject: Re: Next June 29: Boot failure with SLQB on s390
Date: Tue, 30 Jun 2009 11:03:40 +0530
Message-ID: <4A49A3B4.5070501@in.ibm.com>
References: <20090629164851.57263dbc.sfr@canb.auug.org.au> <4A488D08.30307@in.ibm.com> <20090629103123.GC9321@osiris.boeblingen.de.ibm.com> <20090629103943.GA31299@wotan.suse.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------020402090504050502030305"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp09.in.ibm.com ([59.145.155.9]:35811 "EHLO
	e28smtp09.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbZF3Fdo (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2009 01:33:44 -0400
In-Reply-To: <20090629103943.GA31299@wotan.suse.de>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nick Piggin <npiggin@suse.de>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, Pekka Enberg <penberg@cs.helsinki.fi>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-s390@vger.kernel.org

This is a multi-part message in MIME format.
--------------020402090504050502030305
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Nick Piggin wrote:
> This could I suppose be due to failed allocation where the caller
> isn't expecting failure (or using SLAB_PANIC).
>
> Did you manage to test with the prink debugging patch for SLQB that
> I sent for the power6 boot failure? I don't think I saw a reply from
> you but maybe I missed it?
>   
Hi Nick,

Sorry for the delay in getting the debug o/p. Attaching the boot
log from the Power6 box with the debug patch, although i don't
see any extra messages .

Thanks
-Sachin


-- 

---------------------------------
Sachin Sant
IBM Linux Technology Center
India Systems and Technology Labs
Bangalore, India
---------------------------------


--------------020402090504050502030305
Content-Type: text/plain;
 name="boot-log"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="boot-log"

Using 007c5c91 bytes for initrd buffer
Please wait, loading kernel...
Allocated 01200000 bytes for kernel @ 02300000
   Elf64 kernel loaded...
Loading ramdisk...
ramdisk loaded 007c5c91 @ 03500000
OF stdout device is: /vdevice/vty@30000000
Preparing to boot Linux version 2.6.31-rc1-next-20090629 (root@mpower6lp5) (gcc version 4.3.2 [gcc-4_3-branch revision 141291] (SUSE Linux) ) #1 SMP Tue Jun 30 10:31:38 IST 2009
Calling ibm,client-architecture... done
command line: root=/dev/sda3 sysrq=8 insmod=sym53c8xx insmod=ipr crashkernel=512M-:256M loglevel=8 mminit_loglevel=4 
memory layout at init:
  alloc_bottom : 0000000003cd0000
  alloc_top    : 0000000008000000
  alloc_top_hi : 0000000008000000
  rmo_top      : 0000000008000000
  ram_top      : 0000000008000000
instantiating rtas at 0x00000000074e0000... done
boot cpu hw idx 0000000000000000
copying OF device tree...
Building dt strings...
Building dt structure...
Device tree strings 0x0000000003ce0000 -> 0x0000000003ce15c2
Device tree struct  0x0000000003cf0000 -> 0x0000000003d10000
Calling quiesce...
returning from prom_init
Crash kernel location must be 0x2000000
Reserving 256MB of memory at 32MB for crashkernel (System RAM: 4096MB)
Phyp-dump disabled at boot time
Using pSeries machine description
Page orders: linear mapping = 16, virtual = 16, io = 12
Using 1TB segments
Found initrd at 0xc000000003500000:0xc000000003cc5c91
console [udbg0] enabled
Partition configured for 2 cpus.
CPU maps initialized for 2 threads per core
 (thread shift is 1)
Starting Linux PPC64 #1 SMP Tue Jun 30 10:31:38 IST 2009
-----------------------------------------------------
ppc64_pft_size                = 0x1a
physicalMemorySize            = 0x100000000
htab_hash_mask                = 0x7ffff
-----------------------------------------------------
Initializing cgroup subsys cpuset
Initializing cgroup subsys cpu
Linux version 2.6.31-rc1-next-20090629 (root@mpower6lp5) (gcc version 4.3.2 [gcc-4_3-branch revision 141291] (SUSE Linux) ) #1 SMP Tue Jun 30 10:31:38 IST 2009
[boot]0012 Setup Arch
mminit::memory_register Entering add_active_range(2, 0x0, 0x800) 0 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x800, 0x1000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x1000, 0x1800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x1800, 0x2000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x2000, 0x2800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x2800, 0x3000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x3000, 0x3800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x3800, 0x4000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x4000, 0x4800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x4800, 0x5000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x5000, 0x5800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x5800, 0x6000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x6000, 0x6800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x6800, 0x7000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x7000, 0x7800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x7800, 0x8000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x8000, 0x8800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x8800, 0x9000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x9000, 0x9800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0x9800, 0xa000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xa000, 0xa800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xa800, 0xb000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xb000, 0xb800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xb800, 0xc000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xc000, 0xc800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xc800, 0xd000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xd000, 0xd800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(2, 0xd800, 0xe000) 1 entries of 256 used
mminit::memory_register Entering add_active_range(3, 0xe000, 0xe800) 1 entries of 256 used
mminit::memory_register Entering add_active_range(3, 0xe800, 0xf000) 2 entries of 256 used
mminit::memory_register Entering add_active_range(3, 0xf000, 0xf800) 2 entries of 256 used
mminit::memory_register Entering add_active_range(3, 0xf800, 0x10000) 2 entries of 256 used
Node 0 Memory:
Node 2 Memory: 0x0-0xe0000000
Node 3 Memory: 0xe0000000-0x100000000
EEH: No capable adapters found
PPC64 nvram contains 15360 bytes
Using shared processor idle loop
Zone PFN ranges:
  DMA      0x00000000 -> 0x00010000
  Normal   0x00010000 -> 0x00010000
Movable zone start PFN for each node
early_node_map[2] active PFN ranges
    2: 0x00000000 -> 0x0000e000
    3: 0x0000e000 -> 0x00010000
mminit::pageflags_layout_widths Section 20 Node 4 Zone 2 Flags 23
mminit::pageflags_layout_shifts Section 20 Node 4 Zone 2
mminit::pageflags_layout_offsets Section 44 Node 40 Zone 38
mminit::pageflags_layout_zoneid Zone ID: 38 -> 44
mminit::pageflags_layout_usage location: 64 -> 38 unused 38 -> 23 flags 23 -> 0
Could not find start_pfn for node 0
On node 0 totalpages: 0
On node 2 totalpages: 57344
  DMA zone: 56 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 57288 pages, LIFO batch:1
mminit::memmap_init Initialising map node 2 zone 0 pfns 0 -> 57344
On node 3 totalpages: 8192
  DMA zone: 8 pages used for memmap
  DMA zone: 0 pages reserved
  DMA zone: 8184 pages, LIFO batch:0
mminit::memmap_init Initialising map node 3 zone 0 pfns 57344 -> 65536
[boot]0015 Setup Done
mminit::zonelist general 2:DMA = 2:DMA 3:DMA 
mminit::zonelist thisnode 2:DMA = 2:DMA 
mminit::zonelist general 3:DMA = 3:DMA 2:DMA 
mminit::zonelist thisnode 3:DMA = 3:DMA 
Built 3 zonelists in Node order, mobility grouping on.  Total pages: 65472
Policy zone: DMA
Kernel command line: root=/dev/sda3 sysrq=8 insmod=sym53c8xx insmod=ipr crashkernel=512M-:256M loglevel=8 mminit_loglevel=4 
PID hash table entries: 4096 (order: 12, 32768 bytes)
freeing bootmem node 2
freeing bootmem node 3
Memory: 3897728k/4194304k available (9216k kernel code, 296576k reserved, 2112k data, 4289k bss, 512k init)
Experimental hierarchical RCU implementation.
RCU-based detection of stalled CPUs is enabled.
Experimental hierarchical RCU init done.
NR_IRQS:512
[boot]0020 XICS Init
[boot]0021 XICS Done
pic: no ISA interrupt controller
time_init: decrementer frequency = 512.000000 MHz
time_init: processor frequency   = 4704.000000 MHz
clocksource: timebase mult[7d0000] shift[22] registered
clockevent: decrementer mult[83126e97] shift[32] cpu[0]
Console: colour dummy device 80x25
console handover: boot [udbg0] -> real [hvc0]
allocated 2621440 bytes of page_cgroup
please try 'cgroup_disable=memory' option if you don't want memory cgroups
Security Framework initialized
SELinux:  Disabled at boot.
Dentry cache hash table entries: 524288 (order: 6, 4194304 bytes)
Inode-cache hash table entries: 262144 (order: 5, 2097152 bytes)
Mount-cache hash table entries: 4096
Initializing cgroup subsys ns
Initializing cgroup subsys cpuacct
Initializing cgroup subsys memory
Initializing cgroup subsys devices
Initializing cgroup subsys freezer
irq: irq 2 on host null mapped to virtual irq 16
clockevent: decrementer mult[83126e97] shift[32] cpu[1]
Processor 1 found.
Brought up 2 CPUs
Node 0 CPUs: 0-1
Node 2 CPUs:
Node 3 CPUs:
CPU0 attaching sched-domain:
 domain 0: span 0-1 level SIBLING
  groups: 0 1
  domain 1: span 0-1 level NODE
   groups: 0-1
CPU1 attaching sched-domain:
 domain 0: span 0-1 level SIBLING
  groups: 1 0
  domain 1: span 0-1 level NODE
   groups: 0-1
NET: Registered protocol family 16
IBM eBus Device Driver
POWER6 performance monitor hardware support registered
PCI: Probing PCI hardware
PCI: Probing PCI hardware done
bio: create slab <bio-0> at 0
usbcore: registered new interface driver usbfs
usbcore: registered new interface driver hub
usbcore: registered new device driver usb
NET: Registered protocol family 2
IP route cache hash table entries: 32768 (order: 2, 262144 bytes)
TCP established hash table entries: 131072 (order: 5, 2097152 bytes)
TCP bind hash table entries: 65536 (order: 5, 2097152 bytes)
TCP: Hash tables configured (established 131072 bind 65536)
TCP reno registered
NET: Registered protocol family 1
Unpacking initramfs...
Switched to high resolution mode on CPU 0
Switched to high resolution mode on CPU 1
irq: irq 655360 on host null mapped to virtual irq 17
irq: irq 655367 on host null mapped to virtual irq 18
IOMMU table initialized, virtual merging enabled
irq: irq 589825 on host null mapped to virtual irq 19
RTAS daemon started
audit: initializing netlink socket (disabled)
type=2000 audit(1246339143.235:1): initialized
Kprobe smoke test started
Kprobe smoke test passed successfully
HugeTLB registered 16 MB page size, pre-allocated 0 pages
HugeTLB registered 16 GB page size, pre-allocated 0 pages
VFS: Disk quotas dquot_6.5.2
Dquot-cache hash table entries: 8192 (order 0, 65536 bytes)
Btrfs loaded
msgmni has been set to 7612
alg: No test for stdrng (krng)
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 254)
io scheduler noop registered
io scheduler anticipatory registered
io scheduler deadline registered
io scheduler cfq registered (default)
pci_hotplug: PCI Hot Plug PCI Core version: 0.5
rpaphp: RPA HOT Plug PCI Controller Driver version: 0.1
vio_register_driver: driver hvc_console registering
HVSI: registered 0 devices
Generic RTC Driver v1.07
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
Platform driver 'serial8250' needs updating - please use dev_pm_ops
pmac_zilog: 0.6 (Benjamin Herrenschmidt <benh@kernel.crashing.org>)
input: Macintosh mouse button emulation as /devices/virtual/input/input0
Uniform Multi-Platform E-IDE driver
ide-gd driver 1.18
IBM eHEA ethernet device driver (Release EHEA_0101)
irq: irq 590088 on host null mapped to virtual irq 264
ehea: eth0: Jumbo frames are disabled
ehea: eth0 -> logical port id #2
ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
mice: PS/2 mouse device common for all mice
EDAC MC: Ver: 2.1.0 Jun 30 2009
usbcore: registered new interface driver hiddev
usbcore: registered new interface driver usbhid
usbhid: v2.6:USB HID core driver
TCP cubic registered
NET: Registered protocol family 15
registered taskstats version 1
Freeing unused kernel memory: 512k freed
doing fast boot
SysRq : Changing Loglevel
Loglevel set to 8
Unable to handle kernel paging request for data at address 0xc0000000008f4504
Faulting instruction address: 0xc000000000391094
Oops: Kernel access of bad area, sig: 11 [#1]
SMP NR_CPUS=1024 DEBUG_PAGEALLOC NUMA pSeries
Modules linked in: scsi_mod(+)
NIP: c000000000391094 LR: c00000000060cd88 CTR: 0000000000000008
REGS: c0000000c63f3590 TRAP: 0300   Not tainted  (2.6.31-rc1-next-20090629)
MSR: 8000000000009032 <EE,ME,IR,DR>  CR: 24222428  XER: 20000001
DAR: c0000000008f4504, DSISR: 0000000040000000
TASK = c0000000c63e0a80[62] 'modprobe' THREAD: c0000000c63f0000 CPU: 1
GPR00: c00000000060cd88 c0000000c63f3810 c000000000b0c488 c0000000008f4500 
GPR04: c0000000ddcd0000 0000000000000001 0000000000000000 c0000000dfff8480 
GPR08: 0000000000000001 c0000000de000010 0000000000000002 c000000000c681f8 
GPR12: 0000000024222428 c000000000be2600 0000000000000000 0000000000000000 
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000 
GPR20: 0000000000000018 ffffffffffffffff 0000000000210d00 0000000000000010 
GPR24: 0000000000210d00 c0000000dfc60ea0 c000000000fc1580 c0000000008f4500 
GPR28: c0000000008f4448 c0000000008f4500 c000000000a87bd0 c0000000dfc60e80 
NIP [c000000000391094] ._raw_spin_lock+0x30/0x184
LR [c00000000060cd88] ._spin_lock+0x10/0x24
Call Trace:
[c0000000c63f38b0] [c00000000060cd88] ._spin_lock+0x10/0x24
[c0000000c63f3920] [c000000000150030] .__slab_alloc_page+0x390/0x430
[c0000000c63f39e0] [c0000000001518f0] .kmem_cache_alloc+0x160/0x2bc
[c0000000c63f3aa0] [c000000000152308] .kmem_cache_create+0x294/0x2a8
[c0000000c63f3b90] [d000000000eb177c] .scsi_init_queue+0x38/0x170 [scsi_mod]
[c0000000c63f3c20] [d000000000eb1678] .init_scsi+0x1c/0xe8 [scsi_mod]
[c0000000c63f3ca0] [c0000000000097a0] .do_one_initcall+0x80/0x19c
[c0000000c63f3d90] [c0000000000c7a08] .SyS_init_module+0x118/0x28c
[c0000000c63f3e30] [c000000000008534] syscall_exit+0x0/0x40
Instruction dump:
7c0802a6 fba1ffe8 7d800026 7c7d1b78 fbc1fff0 ebc2c268 f8010010 fb61ffd8 
fb81ffe0 fbe1fff8 91810008 f821ff61 <80030004> 6c09dead 2f894ead 419e000c 
---[ end trace e7d1b9681037bc75 ]---

--------------020402090504050502030305--
