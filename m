From: Xiong Zhou <xzhou@redhat.com>
Subject: 1202 tree boot panic
Date: Fri, 2 Dec 2016 13:58:12 +0800
Message-ID: <20161202055812.og3h36lcqr4kj35k@xzhoul.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bzv7joyvaw5opt6e"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48706 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753618AbcLBF6P (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 2 Dec 2016 00:58:15 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2BF203F1F5
        for <linux-next@vger.kernel.org>; Fri,  2 Dec 2016 05:58:15 +0000 (UTC)
Received: from localhost (vpn1-4-208.pek2.redhat.com [10.72.4.208])
        by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id uB25wDQA011342
        for <linux-next@vger.kernel.org>; Fri, 2 Dec 2016 00:58:14 -0500
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org


--bzv7joyvaw5opt6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

since 1201 tree.

--bzv7joyvaw5opt6e
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=1202panic

[    0.000000] microcode: microcode updated early to revision 0x38, date = 2016-03-28
[    0.000000] Linux version 4.9.0-rc7-e05f574-next-20161202 (root@hp-dl360g9-12.rhts.eng.pek2.redhat.com) (gcc version 4.8.5 20150623 (Red Hat 4.8.5-11) (GCC) ) #52 SMP Fri Dec 2 12:37:26 CST 2016
[    0.000000] Command line: BOOT_IMAGE=/vmlinuz-4.9.0-rc7-e05f574-next-20161202 root=UUID=c649b75b-2b51-4b5d-99a2-cc19593a2ab3 ro crashkernel=auto console=ttyS1,115200n81 memmap=30G!30G LANG=en_US.UTF-8
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 bytes, using 'standard' format.
[    0.000000] e820: BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000093fff] usable
[    0.000000] BIOS-e820: [mem 0x0000000000094000-0x000000000009ffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000005ae63fff] usable
[    0.000000] BIOS-e820: [mem 0x000000005ae64000-0x000000005bb23fff] reserved
[    0.000000] BIOS-e820: [mem 0x000000005bb24000-0x00000000790fefff] usable
[    0.000000] BIOS-e820: [mem 0x00000000790ff000-0x00000000791fefff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000791ff000-0x000000007b5fefff] ACPI NVS
[    0.000000] BIOS-e820: [mem 0x000000007b5ff000-0x000000007b7fefff] ACPI data
[    0.000000] BIOS-e820: [mem 0x000000007b7ff000-0x000000007b7fffff] usable
[    0.000000] BIOS-e820: [mem 0x000000007b800000-0x000000008fffffff] reserved
[    0.000000] BIOS-e820: [mem 0x00000000ff800000-0x00000000ffffffff] reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000107fffffff] usable
[    0.000000] NX (Execute Disable) protection:ve
[    0.000000] e820: user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x0000000000093fff] usable
[    0.000000] user: [mem 0x0000000000094000-0x000000000009ffff] reserved
[    0.000000] user: [mem 0x00000000000e0000-0x00000000000fffff] reserved
[    0.000000] user: [mem 0x0000000000100000-0x000000005ae63fff] usable
[    0.000000] user: [mem 0x000000005ae64000-0x000000005bb23fff] reserved
[    0.000000] user: [mem 0x000000005bb24000-0x00000000790fefff] usable
[    0.000000] user: [mem 0x00000000790ff000-0x00000000791fefff] reserved
[    0.000000] user: [mem 0x00000000791ff000-0x000000007b5fefff] ACPI NVS
[    0.000000] user: [mem 0x000000007b5ff000-0x000000007b7fefff] ACPI data
[    0.000000] user: [mem 0x000000007b7ff000-0x000000007b7fffff] usable
[    0.000000] user: [mem 0x000000007b800000-0x000000008fffffff] reserved
[    0.000000] user: [mem 0x00000000ff800000-0x00000000ffffffff] reserved
[    0.000000] user: [mem00000077fffffff] usable
[    0.000000] user: [mem 0x0000000780000000-0x0000000effffffff] persistent (type 12)
[    0.000000] user: [mem 0x0000000f00000000-0x000000107fffffff] usable
[    0.000000] SMBIOS 2.8 present.
[    0.000000] e820: last_pfn = 0x1080000 max_arch_pfn = 0x400000000
[    0.000000] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- WT
[    0.000000] e820: last_pfn = 0x7b800 max_arch_pfn = 0x400000000
[    0.000000] Using GB pages for direct mapping
[    0.000000] RAMDISK: [mem 0x32eff000-0x35777fff]
[    0.000000] ACPI: Early table checksum verification disabled
[    0.000000] ACPI: RSDP 0x00000000000F4F00 000024 (v02 HP    )
[    0.000000] ACPI: XSDT 0x000000007B7E8188 0000EC (v01 HP     ProLiant 00000001      01000013)
[    0.000000] ACPI: FACP 0x000000007B7F6000 00010C (v05 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: DSDT 0x000000007B7E0000 007DF8 (v02 HP     DSDT     00000002 HPAG 00020000)
[    0.000000] ACPI: FACS 0x000000007B56B000 000040
[    0.000000] ACPI: UEFI 0x000000007B579000 000042 (v01 HP     ProLiant 00000002      01000013)
[    0.000000] ACPI: MCEJ 0x000000007B7FC000 000130 (v01 HP     ProLiant 00000001 INTL 0100000D)
x000000007B7FA000 0000A8 (v01 HP     ProLiant 00000001 INTL 00000001)s   00000002 INTL 20130328)
[    0.000000] ACPI: BERT 0x000000007B7F9000 000030 (v01 HP     ProLiant 00000001 INTL 00000001)
[    0.000000] ACPI: ERST 0x000000007B7F8000 000230 (v01 HP     ProLiant 00000001 INTL 00000001)
[    0.000000] ACPI: EINJ 0x000000007B7F7000 000150 (v01 HP     ProLiant 00000001 INTL 00000001)
[    0.000000] ACPI: HPET 0x000000007B7F5000 000038 (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: PMCT 0x000000007B7F4000 000064 (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: WDDT 0x000000007B7F3000 000040 (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: APIC 0x000000007B7F2000 0003EA (v03 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: MCFG 0x000000007B7F1000 00003C (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: SLIT 0x000000007B7F0000 000030 (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: SRAT 0x000000007B7EF000 000380 (v03 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: SPMI 0x000000007B7EE000 000041 (v05 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: RASF 0x000000007B7ED000 000030 (v01 HP     Pr)
[    0.000000] ACPI: SPCR 0x000000007B7EC000 000050 (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: MSCT 0x000000007B7EB000 000064 (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: BDAT 0x000000007B7EA000 000030 (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: PCCT 0x000000007B7E9000 00006E (v01 HP     ProLiant 00000001 HP   00000001)
[    0.000000] ACPI: SSDT 0x000000007B7D9000 0064EF (v02 HP     PCISSDT  00000002 HPAG 00020000)
[    0.000000] ACPI: SSDT 0x000000007B7D8000 0001CB (v02 HP     TIMESSDT 00000002 HPAG 00020000)
[    0.000000] ACPI: SSDT 0x000000007B7D7000 0002F2 (v01 HP     pmab     00000001 INTL 20130328)
[    0.000000] ACPI: DMAR 0x000000007B7FD000 0002D8 (v01 INTEL  INTEL ID 00000001 ?    00000001)
[    0.000000] SRAT: PXM 0 -> APIC 0x0000 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0002 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0004 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0006 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0008 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x000a -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x000c -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x000e -> Node 0
[    0.000000] SRAT: 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0012 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0014 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0016 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0018 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x001a -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x001c -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x001e -> Node 1
[    0.000000] SRAT: PXM 0 -> APIC 0x0001 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0003 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0005 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0007 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x0009 -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x000b -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x000d -> Node 0
[    0.000000] SRAT: PXM 0 -> APIC 0x000f -> Node 0
[    0.000000] SRAT: PXM 1 -> APIC 0x0011 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0013 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0015 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0017 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x0019 -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x001b -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x001d -> Node 1
[    0.000000] SRAT: PXM 1 -> APIC 0x001f -> Node 1
[    0.000000] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x87fffffff]
[    0.000000] ACPI: SRAT: Node 1 PXM 1 [mem 0x880000000-0x107fffffff]
[    0.0000ted [mem 0x77ffd5000-0x77fffffff]
[    0.000000] NODE_DATA(1) allocated [mem 0x107ffd2000-0x107fffcfff]
[    0.000000] kexec_core: crashkernel: memory value expected
[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x00000000000-0x0000000000ffffff]
[    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000107fffffff]
[    0.000000]   Device   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000001000-0x0000000000093fff]
[    0.000000]   node   0: [mem 0x0000000000100000-0x000000005ae63fff]
[    0.000000]   node   0: [mem 0x000000005bb24000-0x00000000790fefff]
[    0.000000]   node   0: [mem 0x000000007b7ff000-0x000000007b7fffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000077fffffff]
[    0.000000]   node   1: [mem 0x0000000f00000000-0x000000107fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000077fffffff]
[    0.000000] Initmem setup node 1 [mem 0x0000000f00000000-0x000000107fffffff]
[    0.000000] ACPI: PM-Timer IO Port: 0x408
[    0.000000] ACPI: X2APIC_NMI (uid[0x00] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x01] high level lint[0x1])
[    0.000000] ACPI: X2APIC_Nl lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x03] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x04] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x05] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x06] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x07] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x08] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x09] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x0a] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x0b] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x0c] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x0d] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x0e] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x0f] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x10] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x11] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x12] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x13] high0000] ACPI: X2APIC_NMI (uid[0x14] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x15] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x16] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x17] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x18] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x19] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x1a] high level lint[0x1])
[    0.000000] ACPI: X2APIC(uid[0x1b] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x1c] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x1d] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x1e] high level lint[0x1])
[    0.000000] ACPI: X2APIC_NMI (uid[0x1f] high level lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0xff] high level lint[0x1])
[    0.000000] IOAPIC[0]: apic_id 8, version 32, address 0xfec00000, GSI 0-23
[    0.000000] IOAPIC[1]: apic_id 9, version 32, address 0xfec01000, GSI 24-47
[    0.000000] IOAPIC[2]: apic_id 10, version 32, address 0xfec40000, GSI 48-71
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] ACPI: HPET id: 0x8086a701 base: 0xfed00000
[    0.000000] smpboot: Allowing 32 CPUs, 0 hotplug CPUs
[    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.000000] PM: Registered nosave memory: [mem 0x00094000-0x0009ffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
[    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
[    0.000000] PM: Registered nosave memory: [mem 0x5ae64000-0x5bb23fff]
[    0.000000] PM: Registered nosave memory: [mem 0x790ff000-0x791fefff]
[    0.000000] PM: Registered nosave memory: [mem 0x791ff000-0x7b5fefff]
[    0.000000] PM: Registered nosave memory: [mem 0x7b5ff000-0x7b7fefff]
[    0.000000] PM: Registered nosave memory: [mem 0x7b800000-0x8fffffff]
[    0.000000] PM: Registered nosave memory
[    0.000000] PM: Registered nosave memory: [mem 0xff800000-0xffffffff]
[    0.000000] PM: Registered nosave memory: [mem 0x780000000-0xeffffffff]
[    0.000000] e820: [mem 0x90000000-0xff7fffff] available for PCI devices
[    0.000000] Booting paravirtualized kernel on bare hardware
[    0.000000] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 1910969940391419 ns
[    0.000000] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:32 nr_cpu_ids:32 nr_node_ids:2
[    0.000000] percpu: Embedded 36 pages/cpu @ffff880763a00000 s108504 r8192 d30760 u262144
[    0.000000] Built 2 zonelists in Node order, mobility grouping on.  Total pages: 8742317
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: BOOT_IMAGE=/vmlinuz-4.9.0-rc7-e05f574-next-20161202 root=UUID=c649b75b-2b51-4b5d-99a2-cc19593a2ab3 ro crashkernel=auto console=ttyS1,115200n81 memmap=30G!30G LANG=en_US.UTF-8
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Memory: 6038192K/35524428K available (7453K kernel code, 1545K rwdata, 3360K rodata, 2076K init, 3036K bss, 688588K reserved, 0K cma-reserved)
[    =64, Order=0-3, MinObjects=0, CPUs=32, Nodes=2
[    0.000000] Hierarchical RCU implementation.
[    0.000000]  Build-time adjustment of leaf fanout to 64.
[    0.000000]  RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=32.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=32
[    0.000000] NR_IRQS:524544 nr_irqs:1496 16
[    0.000000] Console: colour VGA+ 80x25
[    0.000000] console [ttyS1] enabled
[    0.000000] mempolicy: Enabling automatic NUMA balancing. Configure with numa_balancing= or the kernel.numa_balancing sysctl
[    0.000000] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484882848 ns
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2397.382 MHz processor
[    0.000000] BUG: unable to handle kernel NULL pointer dereference at           (null)
[    0.000000] IP: _find_next_bit.part.0+0x10/0x70
[    0.000000] PGD 0 [    0.000000]
[    0.000000] Oops: 0000 [#1] SMP
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.9.0-rc7-e05f574-next-20161202 #52
[    0.000000] Hardware name: HP ProLiant DL360 Gen9, BIOS P89 05/06/2015
[    0.000000] task: ffffffff81c0e4c0 task.stack: ffffffff81c00000
[    0.000000] RIP: 0010:_find_next_bit.part.0+0x10/0x70
[    0.000000] RSP: 0000:ffffffff81c03de8 EFLAGS: 00010246
[    0.000000] RAX: 000000000 RCX: 0000000000000000
[    0.000000] RDX: 0000000000000000 RSI: 0000000000000020 RDI: 0000000000000000
[    0.000000] RBP: ffffffff81c03df8 R08: 0000000000000000 R09: 0000000000000000
[    0.000000] R10: 0000000000000000 R11: 0000000000124a63 R12: 0000000000000000
[    0.000000] R13: 0000000000000000 R14: 0000000000000000 R15: ffffffff81c03f08
[    0.000000] FS:  0000000000000000(0000) GS:ffff880763a00000(0000) knlGS:0000000000000000
[    0.000000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    0.000000] CR2: 0000000000000000 CR3: 00001c07000 CR4: 00000000000406b0
[    0.000000] Call Trace:
[    0.000000]  ? find_next_bit+0x19/0x20
[    0.000000]  cpumask_any_but+0x32/0x50
[    0.000000]  tsc_store_and_check_tsc_adjust+0x8d/0x160
[    0.000000]  tsc_init+0x1a9/0x270
[    0.000000]  x86_late_time_init+0xf/0x11
[    0.000000]  start_kernel+0x3fb/0x4cd
[    0.000000]  ? set_init_arg+0x55/0x55
[    0.000000]  ? early_idt_handler_array+0x120/0x120
[    0.000000]  x86_64_start_reservations+0x2a/0x2c
[    0.000000]  x86_64_start_kernel+0x14c/0x16f
[    0.000000]  start_cpu+0x5/0x14
[    0.000000] Code: 48 8d 04 0a 5d 48 39 f0 48 0f 47 c6 c3 31 c0 5d c3 66 2e 0f 1f 84 00 00 00 00 00 48 89 d0 55 49 89 c8 48 c1 e8 06 49 89 c9 89 d1 <4c> 33 04 c7 48 c7 c0 ff ff ff ff 48 83 e2 c0 48 d3 e0 48 89 e5
[    0.000000] RIP: _find_next_bit.part.0+0x10/0x70 RSP: ffffffff81c03de8
[    0.000000] CR2: 0000000000000000
[    0.000000] ---[ end trace 1e0dc02e8371afb9 ]---
[    0.000000] Kernel panic - not syncing: Fatal exception
[    0.000000] ---[ end Kernel panic - not syncing: Fatal exception


--bzv7joyvaw5opt6e--
