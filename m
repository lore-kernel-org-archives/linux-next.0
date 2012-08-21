From: "Luck, Tony" <tony.luck@intel.com>
Subject: RE: ia64 won't boot because of rcu_sched self-detected stall
Date: Tue, 21 Aug 2012 23:53:50 +0000
Message-ID: <3908561D78D1C84285E8C5FCA982C28F19396504@ORSMSX104.amr.corp.intel.com>
References: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
 <20120821232038.GV2456@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:13737 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752821Ab2HUXxx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 21 Aug 2012 19:53:53 -0400
In-Reply-To: <20120821232038.GV2456@linux.vnet.ibm.com>
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "paulmck@linux.vnet.ibm.com" <paulmck@linux.vnet.ibm.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>

Thanks for the pointers.

I turned on CONFIG_RCU_CPU_STALL_INFO=y and bumped RCU_STALL_RAT_DELAY
from 2 to 20

This is the new console log.  There is a minute of hang before the first
pair of stack traces. Then hang for a minute and the second pair show
up.

Linux version 3.6.0-rc2-zx1-smp-next-20120821 (aegl@linux-bxb1) (gcc version 4.3.4 [gcc-4_3-branch revision 152973] (SUSE Linux) ) #2 SMP Tue Aug 21 16:44:17 PDT 2012
EFI v1.10 by HP: SALsystab=0x3fefa000 ACPI 2.0=0x3fd5e000 SMBIOS=0x3fefc000 HCDP=0x3fd5c000
Early serial console at MMIO 0xff5e0000 (options '9600')
bootconsole [uart0] enabled
PCDP: v0 at 0x3fd5c000
Explicit "console="; ignoring PCDP
ACPI: RSDP 000000003fd5e000 00028 (v02     HP)
ACPI: XSDT 000000003fd5e02c 00094 (v01     HP   rx2620 00000000   HP 00000000)
ACPI: FACP 000000003fd67390 000F4 (v03     HP   rx2620 00000000   HP 00000000)
ACPI BIOS Bug: Warning: 32/64X length mismatch in FADT/Gpe0Block: 32/16 (20120711/tbfadt-567)
ACPI BIOS Bug: Warning: 32/64X length mismatch in FADT/Gpe1Block: 32/16 (20120711/tbfadt-567)
ACPI: DSDT 000000003fd5e100 05F3C (v01     HP   rx2620 00000007 INTL 02012044)
ACPI: FACS 000000003fd67488 00040
ACPI: SPCR 000000003fd674c8 00050 (v01     HP   rx2620 00000000   HP 00000000)
ACPI: DBGP 000000003fd67518 00034 (v01     HP   rx2620 00000000   HP 00000000)
ACPI: APIC 000000003fd67610 000B0 (v01     HP   rx2620 00000000   HP 00000000)
ACPI: SPMI 000000003fd67550 00050 (v04     HP   rx2620 00000000   HP 00000000)
ACPI: CPEP 000000003fd675a0 00034 (v01     HP   rx2620 00000000   HP 00000000)
ACPI: SSDT 000000003fd64040 001D6 (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: SSDT 000000003fd64220 00702 (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: SSDT 000000003fd64930 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: SSDT 000000003fd65350 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: SSDT 000000003fd65d70 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: SSDT 000000003fd66790 00A16 (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: SSDT 000000003fd671b0 000EB (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: SSDT 000000003fd672a0 000EF (v01     HP   rx2620 00000006 INTL 02012044)
ACPI: Local APIC address c0000000fee00000
2 CPUs available, 2 CPUs total
warning: skipping physical page 0
Initial ramdisk at: 0xe00000407e9bb000 (6071698 bytes)
SAL 3.1: HP version 3.15
SAL Platform features: None
SAL: AP wakeup using external interrupt vector 0xff
MCA related initialization done
warning: skipping physical page 0
Zone ranges:
  DMA      [mem 0x00004000-0xffffffff]
  Normal   [mem 0x100000000-0x407ffc7fff]
Movable zone start for each node
Early memory node ranges
  node   0: [mem 0x00004000-0x3f4ebfff]
  node   0: [mem 0x3fc00000-0x3fd5bfff]
  node   0: [mem 0x4040000000-0x407fd2bfff]
  node   0: [mem 0x407fd98000-0x407fe07fff]
  node   0: [mem 0x407fe80000-0x407ffc7fff]
Virtual mem_map starts at 0xa0007fffc7900000
Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 72586
Kernel command line: BOOT_IMAGE=scsi0:\efi\SuSE\l-zx1-smp.gz root=/dev/disk/by-id/scsi-200000e1100a5d5f2-part2  console=uart,mmio,0xff5e0000 
PID hash table entries: 4096 (order: 1, 32768 bytes)
Dentry cache hash table entries: 262144 (order: 7, 2097152 bytes)
Inode-cache hash table entries: 131072 (order: 6, 1048576 bytes)
Memory: 2048432k/2086064k available (13698k code, 37632k reserved, 5791k data, 816k init)
SLUB: Genslabs=17, HWalign=128, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
Hierarchical RCU implementation.
	Additional per-CPU info printed with stalls.
	RCU restricting CPUs from NR_CPUS=16 to nr_cpu_ids=2.
NR_IRQS:768
ACPI: Local APIC address c0000000fee00000
GSI 36 (level, low) -> CPU 0 (0x0000) vector 48
Console: colour dummy device 80x25
Calibrating delay loop... 1945.60 BogoMIPS (lpj=3891200)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 1024
ACPI: Core revision 20120711
Boot processor id 0x0/0x0
Fixed BSP b0 value from CPU 1
CPU 1: synchronized ITC with CPU 0 (last diff -3 cycles, maxerr 579 cycles)
Brought up 2 CPUs
Total of 2 processors activated (3891.20 BogoMIPS).
SMBIOS 2.3 present.
NET: Registered protocol family 16
ACPI: bus type pci registered
bio: create slab <bio-0> at 0
ACPI: Added _OSI(Module Device)
ACPI: Added _OSI(Processor Device)
ACPI: Added _OSI(3.0 _SCP Extensions)
ACPI: Added _OSI(Processor Aggregator Device)
INFO: rcu_sched self-detected stall on CPU
	1: (15000 ticks this GP) idle=001/140000000000001/0 
INFO: rcu_sched detected stalls on CPUs/tasks:
	1: (15000 ticks this GP) idle=001/140000000000001/0 
	(detected by 0, t=15020 jiffies)

Call Trace:
 [<a000000100015420>] show_stack+0x80/0xa0
                                sp=a0000001012079d0 bsp=a0000001012010d0
 [<a000000100d4d0e0>] dump_stack+0x30/0x50
                                sp=a000000101207ba0 bsp=a0000001012010b8
 [<a000000100130fb0>] rcu_check_callbacks+0xf70/0x10a0
                                sp=a000000101207ba0 bsp=a000000101200fd8
 [<a000000100099b70>] update_process_times+0x50/0xa0
                                sp=a000000101207bf0 bsp=a000000101200fa8
 [<a00000010003ef30>] timer_interrupt+0x130/0x3c0
                                sp=a000000101207bf0 bsp=a000000101200f58
 [<a00000010011ee80>] handle_irq_event_percpu+0x80/0x460
                                sp=a000000101207bf0 bsp=a000000101200ef0
 [<a000000100126740>] handle_percpu_irq+0x120/0x1a0
                                sp=a000000101207bf0 bsp=a000000101200ec0
 [<a00000010011e160>] generic_handle_irq+0xa0/0xe0
                                sp=a000000101207bf0 bsp=a000000101200ea0
 [<a000000100011750>] ia64_handle_irq+0x110/0x440
                                sp=a000000101207bf0 bsp=a000000101200e18
 [<a00000010000c0e0>] ia64_native_leave_kernel+0x0/0x270
                                sp=a000000101207bf0 bsp=a000000101200e18
 [<a000000100013b90>] default_idle+0x130/0x180
                                sp=a000000101207dc0 bsp=a000000101200dd0
 [<a000000100014e20>] cpu_idle+0x1c0/0x3c0
                                sp=a000000101207e20 bsp=a000000101200d68
 [<a000000100d09240>] rest_init+0xe0/0x100
                                sp=a000000101207e20 bsp=a000000101200d50
 [<a0000001010b5310>] start_kernel+0x760/0x870
                                sp=a000000101207e20 bsp=a000000101200cd0
 [<a000000100d09120>] start_ap+0x760/0x780
                                sp=a000000101207e30 bsp=a000000101200bc0
	 (t=15605 jiffies)

Call Trace:
 [<a000000100015420>] show_stack+0x80/0xa0
                                sp=e0000040601179e0 bsp=e000004060110f78
 [<a000000100d4d0e0>] dump_stack+0x30/0x50
                                sp=e000004060117bb0 bsp=e000004060110f60
 [<a0000001001304f0>] rcu_check_callbacks+0x4b0/0x10a0
                                sp=e000004060117bb0 bsp=e000004060110e88
 [<a000000100099b70>] update_process_times+0x50/0xa0
                                sp=e000004060117c00 bsp=e000004060110e58
 [<a00000010003ef30>] timer_interrupt+0x130/0x3c0
                                sp=e000004060117c00 bsp=e000004060110e08
 [<a00000010011ee80>] handle_irq_event_percpu+0x80/0x460
                                sp=e000004060117c00 bsp=e000004060110d98
 [<a000000100126740>] handle_percpu_irq+0x120/0x1a0
                                sp=e000004060117c00 bsp=e000004060110d68
 [<a00000010011e160>] generic_handle_irq+0xa0/0xe0
                                sp=e000004060117c00 bsp=e000004060110d48
 [<a000000100011750>] ia64_handle_irq+0x110/0x440
                                sp=e000004060117c00 bsp=e000004060110cc0
 [<a00000010000c0e0>] ia64_native_leave_kernel+0x0/0x270
                                sp=e000004060117c00 bsp=e000004060110cc0
 [<a000000100013b90>] default_idle+0x130/0x180
                                sp=e000004060117dd0 bsp=e000004060110c80
 [<a000000100014e20>] cpu_idle+0x1c0/0x3c0
                                sp=e000004060117e30 bsp=e000004060110c18
 [<a000000100d46840>] start_secondary+0x390/0x530
                                sp=e000004060117e30 bsp=e000004060110bc0
 [<a000000100d09110>] start_ap+0x750/0x780
                                sp=e000004060117e30 bsp=e000004060110bc0
INFO: rcu_sched self-detected stall on CPU
	1: (15000 ticks this GP) idle=001/140000000000001/0 
INFO: rcu_sched detected stalls on CPUs/tasks:
	1: (15000 ticks this GP) idle=001/140000000000001/0 
	(detected by 0, t=15020 jiffies)

Call Trace:
 [<a000000100015420>] show_stack+0x80/0xa0
                                sp=a0000001012079d0 bsp=a0000001012010d0
 [<a000000100d4d0e0>] dump_stack+0x30/0x50
                                sp=a000000101207ba0 bsp=a0000001012010b8
 [<a000000100130fb0>] rcu_check_callbacks+0xf70/0x10a0
                                sp=a000000101207ba0 bsp=a000000101200fd8
 [<a000000100099b70>] update_process_times+0x50/0xa0
                                sp=a000000101207bf0 bsp=a000000101200fa8
 [<a00000010003ef30>] timer_interrupt+0x130/0x3c0
                                sp=a000000101207bf0 bsp=a000000101200f58
 [<a00000010011ee80>] handle_irq_event_percpu+0x80/0x460
                                sp=a000000101207bf0 bsp=a000000101200ef0
 [<a000000100126740>] handle_percpu_irq+0x120/0x1a0
                                sp=a000000101207bf0 bsp=a000000101200ec0
 [<a00000010011e160>] generic_handle_irq+0xa0/0xe0
                                sp=a000000101207bf0 bsp=a000000101200ea0
 [<a000000100011750>] ia64_handle_irq+0x110/0x440
                                sp=a000000101207bf0 bsp=a000000101200e18
 [<a00000010000c0e0>] ia64_native_leave_kernel+0x0/0x270
                                sp=a000000101207bf0 bsp=a000000101200e18
 [<a000000100013b90>] default_idle+0x130/0x180
                                sp=a000000101207dc0 bsp=a000000101200dd0
 [<a000000100014e20>] cpu_idle+0x1c0/0x3c0
                                sp=a000000101207e20 bsp=a000000101200d68
 [<a000000100d09240>] rest_init+0xe0/0x100
                                sp=a000000101207e20 bsp=a000000101200d50
 [<a0000001010b5310>] start_kernel+0x760/0x870
                                sp=a000000101207e20 bsp=a000000101200cd0
 [<a000000100d09120>] start_ap+0x760/0x780
                                sp=a000000101207e30 bsp=a000000101200bc0
	 (t=15605 jiffies)

Call Trace:
 [<a000000100015420>] show_stack+0x80/0xa0
                                sp=e0000040601179e0 bsp=e000004060110f78
 [<a000000100d4d0e0>] dump_stack+0x30/0x50
                                sp=e000004060117bb0 bsp=e000004060110f60
 [<a0000001001304f0>] rcu_check_callbacks+0x4b0/0x10a0
                                sp=e000004060117bb0 bsp=e000004060110e88
 [<a000000100099b70>] update_process_times+0x50/0xa0
                                sp=e000004060117c00 bsp=e000004060110e58
 [<a00000010003ef30>] timer_interrupt+0x130/0x3c0
                                sp=e000004060117c00 bsp=e000004060110e08
 [<a00000010011ee80>] handle_irq_event_percpu+0x80/0x460
                                sp=e000004060117c00 bsp=e000004060110d98
 [<a000000100126740>] handle_percpu_irq+0x120/0x1a0
                                sp=e000004060117c00 bsp=e000004060110d68
 [<a00000010011e160>] generic_handle_irq+0xa0/0xe0
                                sp=e000004060117c00 bsp=e000004060110d48
 [<a000000100011750>] ia64_handle_irq+0x110/0x440
                                sp=e000004060117c00 bsp=e000004060110cc0
 [<a00000010000c0e0>] ia64_native_leave_kernel+0x0/0x270
                                sp=e000004060117c00 bsp=e000004060110cc0
 [<a000000100013b90>] default_idle+0x130/0x180
                                sp=e000004060117dd0 bsp=e000004060110c80
 [<a000000100014e20>] cpu_idle+0x1c0/0x3c0
                                sp=e000004060117e30 bsp=e000004060110c18
 [<a000000100d46840>] start_secondary+0x390/0x530
                                sp=e000004060117e30 bsp=e000004060110bc0
 [<a000000100d09110>] start_ap+0x750/0x780
                                sp=e000004060117e30 bsp=e000004060110bc0
