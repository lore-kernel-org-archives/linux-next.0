From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/2] tracing/tlb/x85: Fix splat of calling RCU trace code
 on offline CPU
Date: Fri, 6 Feb 2015 13:38:56 -0800
Message-ID: <20150206213856.GN5418@linux.vnet.ibm.com>
References: <20150206200653.009919583@goodmis.org>
 <CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e32.co.us.ibm.com ([32.97.110.150]:46332 "EHLO
	e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753347AbbBFVjD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 6 Feb 2015 16:39:03 -0500
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 6 Feb 2015 14:39:02 -0700
Content-Disposition: inline
In-Reply-To: <CA+icZUVvnOA9O0GMDangTLATPOHU=Do5Kj-fo0bVu5Wfb0TT7Q@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, Dave Hansen <dave@sr71.net>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-next <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Kristen Carlson Accardi <kristen@linux.intel.com>, "H. Peter Anvin" <hpa@linux.intel.com>, Rik van Riel <riel@redhat.com>, Mel Gorman <mgorman@suse.de>, Andrew Morton <akpm@linux-foundation.org>

On Fri, Feb 06, 2015 at 10:07:56PM +0100, Sedat Dilek wrote:
> On Fri, Feb 6, 2015 at 9:06 PM, Steven Rostedt <rostedt@goodmis.org> wrote:
> > Paul,
> >
> > I found a much better fix than adding the rcu_nocheck(). Simply have the
> > rcu check inside the condition check as well. This way the rcu splat
> > will only happen if the condition is set too. The condition doesn't need
> > the tracepoint enabled.
> >
> > Now I'm thinking that I should push the first patch through my tree as it
> > only touches tracing. The second patch you can freely take.
> >
> > Neither patch really depends on the other, but both patches are required
> > to make the splat go away. If Sedat could test these patches together,
> > and give his tested-by tag, that would be great. I'll run my patch through
> > my full series of tests and then push to linux next. You could take the second
> > patch and push that through your tree (linux-next). When both arrive, the
> > bug will be fixed. The two do not need to come in together.
> >
> > Thoughts?
> >
> > -- Steve
> >
> >
> > Steven Rostedt (Red Hat) (2):
> >       tracing: Add condition check to RCU lockdep checks
> >       x86/tbl/trace: Do not trace on CPU that is offline
> >
> > ----
> >  include/linux/tracepoint.h | 2 +-
> >  include/trace/events/tlb.h | 4 +++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> 
> Your patchset fixes the issue for me (look at the attached files for
> more detailed information).
> 
> I tested the "To Be Loved" (TBL VS. TLB flushes) edition against
> Linux-next (next-20150204) where I had originally seen and reported
> the call-trace.
> 
> Before I forget... The Fixes-tag misses pointing to Dave Hansen's...
> 
> commit d17d8f9dedb9dd76fd540a5c497101529d9eb25a
> "x86/mm: Add tracepoints for TLB flushes"
> 
> My POV is that both patches somehow belong together.
> If you decide to push them through two different trees, please add a
> note/reference to each other.

I am fine with Steven pushing these, and have dropped his earlier
version from my tree.

							Thanx, Paul

> Thanks to all involved people nailing this down.
> 
> - Sedat -

> [    0.000000] Initializing cgroup subsys cpuset
> [    0.000000] Initializing cgroup subsys cpu
> [    0.000000] Initializing cgroup subsys cpuacct
> [    0.000000] Linux version 3.19.0-rc7-next-20150204.12-iniza-small (sedat.dilek@gmail.com@fambox) (gcc version 4.9.2 (Ubuntu 4.9.2-0ubuntu1~12.04) ) #1 SMP Fri Feb 6 21:47:54 CET 2015
> [    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-3.19.0-rc7-next-20150204.12-iniza-small root=UUID=001AADA61AAD9964 loop=/ubuntu/disks/root.disk ro
> [    0.000000] KERNEL supported cpus:
> [    0.000000]   Intel GenuineIntel
> [    0.000000]   AMD AuthenticAMD
> [    0.000000]   Centaur CentaurHauls
> [    0.000000] Disabled fast string operations
> [    0.000000] e820: BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009d7ff] usable
> [    0.000000] BIOS-e820: [mem 0x000000000009d800-0x000000000009ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000000e0000-0x00000000000fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000001fffffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000020000000-0x00000000201fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000020200000-0x000000003fffffff] usable
> [    0.000000] BIOS-e820: [mem 0x0000000040000000-0x00000000401fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000040200000-0x00000000d9c9efff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000d9c9f000-0x00000000dae7efff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000dae7f000-0x00000000daf9efff] ACPI NVS
> [    0.000000] BIOS-e820: [mem 0x00000000daf9f000-0x00000000daffefff] ACPI data
> [    0.000000] BIOS-e820: [mem 0x00000000dafff000-0x00000000daffffff] usable
> [    0.000000] BIOS-e820: [mem 0x00000000db000000-0x00000000df9fffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000f8000000-0x00000000fbffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed08000-0x00000000fed08fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed10000-0x00000000fed19fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fed1c000-0x00000000fed1ffff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
> [    0.000000] BIOS-e820: [mem 0x00000000ffd80000-0x00000000ffffffff] reserved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000011fdfffff] usable
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] SMBIOS 2.6 present.
> [    0.000000] DMI: SAMSUNG ELECTRONICS CO., LTD. 530U3BI/530U4BI/530U4BH/530U3BI/530U4BI/530U4BH, BIOS 13XK 03/28/2013
> [    0.000000] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
> [    0.000000] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000000] AGP: No AGP bridge found
> [    0.000000] e820: last_pfn = 0x11fe00 max_arch_pfn = 0x400000000
> [    0.000000] MTRR default type: uncachable
> [    0.000000] MTRR fixed ranges enabled:
> [    0.000000]   00000-9FFFF write-back
> [    0.000000]   A0000-BFFFF uncachable
> [    0.000000]   C0000-FFFFF write-protect
> [    0.000000] MTRR variable ranges enabled:
> [    0.000000]   0 base 000000000 mask F80000000 write-back
> [    0.000000]   1 base 080000000 mask FC0000000 write-back
> [    0.000000]   2 base 0C0000000 mask FE0000000 write-back
> [    0.000000]   3 base 0DC000000 mask FFC000000 uncachable
> [    0.000000]   4 base 0DB000000 mask FFF000000 uncachable
> [    0.000000]   5 base 100000000 mask FE0000000 write-back
> [    0.000000]   6 base 11FE00000 mask FFFE00000 uncachable
> [    0.000000]   7 base 0FFC00000 mask FFFC00000 write-protect
> [    0.000000]   8 disabled
> [    0.000000]   9 disabled
> [    0.000000] PAT configuration [0-7]: WB  WC  UC- UC  WB  WC  UC- UC  
> [    0.000000] e820: last_pfn = 0xdb000 max_arch_pfn = 0x400000000
> [    0.000000] found SMP MP-table at [mem 0x000f00e0-0x000f00ef] mapped at [ffff8800000f00e0]
> [    0.000000] Scanning 1 areas for low memory corruption
> [    0.000000] Base memory trampoline at [ffff880000097000] 97000 size 24576
> [    0.000000] reserving inaccessible SNB gfx pages
> [    0.000000] init_memory_mapping: [mem 0x00000000-0x000fffff]
> [    0.000000]  [mem 0x00000000-0x000fffff] page 4k
> [    0.000000] BRK [0x02cae000, 0x02caefff] PGTABLE
> [    0.000000] BRK [0x02caf000, 0x02caffff] PGTABLE
> [    0.000000] BRK [0x02cb0000, 0x02cb0fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x11fc00000-0x11fdfffff]
> [    0.000000]  [mem 0x11fc00000-0x11fdfffff] page 2M
> [    0.000000] BRK [0x02cb1000, 0x02cb1fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0x100000000-0x11fbfffff]
> [    0.000000]  [mem 0x100000000-0x11fbfffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0xc0000000-0xd9c9efff]
> [    0.000000]  [mem 0xc0000000-0xd9bfffff] page 2M
> [    0.000000]  [mem 0xd9c00000-0xd9c9efff] page 4k
> [    0.000000] BRK [0x02cb2000, 0x02cb2fff] PGTABLE
> [    0.000000] BRK [0x02cb3000, 0x02cb3fff] PGTABLE
> [    0.000000] init_memory_mapping: [mem 0xdafff000-0xdaffffff]
> [    0.000000]  [mem 0xdafff000-0xdaffffff] page 4k
> [    0.000000] init_memory_mapping: [mem 0x00100000-0x1fffffff]
> [    0.000000]  [mem 0x00100000-0x001fffff] page 4k
> [    0.000000]  [mem 0x00200000-0x1fffffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x20200000-0x3fffffff]
> [    0.000000]  [mem 0x20200000-0x3fffffff] page 2M
> [    0.000000] init_memory_mapping: [mem 0x40200000-0xbfffffff]
> [    0.000000]  [mem 0x40200000-0xbfffffff] page 2M
> [    0.000000] RAMDISK: [mem 0x378f8000-0x37c73fff]
> [    0.000000] ACPI: Early table checksum verification disabled
> [    0.000000] ACPI: RSDP 0x00000000000F0100 000024 (v02 SECCSD)
> [    0.000000] ACPI: XSDT 0x00000000DAFFE170 00008C (v01 SECCSD LH43STAR 00000002 PTEC 00000002)
> [    0.000000] ACPI: FACP 0x00000000DAFEF000 00010C (v05 SECCSD LH43STAR 00000002 PTL  00000002)
> [    0.000000] ACPI: DSDT 0x00000000DAFF2000 0083AC (v02 SECCSD SNB-CPT  00000000 INTL 20061109)
> [    0.000000] ACPI: FACS 0x00000000DAF47000 000040
> [    0.000000] ACPI: SLIC 0x00000000DAFFD000 000176 (v01 SECCSD LH43STAR 00000002 PTEC 00000001)
> [    0.000000] ACPI: SSDT 0x00000000DAFFB000 001068 (v01 SECCSD PtidDevc 00001000 INTL 20061109)
> [    0.000000] ACPI: ASF! 0x00000000DAFF1000 0000A5 (v32 SECCSD LH43STAR 00000002 PTL  00000002)
> [    0.000000] ACPI: HPET 0x00000000DAFEE000 000038 (v01 SECCSD LH43STAR 00000002 PTL  00000002)
> [    0.000000] ACPI: APIC 0x00000000DAFED000 000098 (v03 SECCSD LH43STAR 00000002 PTL  00000002)
> [    0.000000] ACPI: MCFG 0x00000000DAFEC000 00003C (v01 SECCSD LH43STAR 00000002 PTL  00000002)
> [    0.000000] ACPI: SSDT 0x00000000DAFEB000 000804 (v01 PmRef  Cpu0Ist  00003000 INTL 20061109)
> [    0.000000] ACPI: SSDT 0x00000000DAFEA000 000996 (v01 PmRef  CpuPm    00003000 INTL 20061109)
> [    0.000000] ACPI: UEFI 0x00000000DAFE9000 00003E (v01 SECCSD LH43STAR 00000002 PTL  00000002)
> [    0.000000] ACPI: UEFI 0x00000000DAFE8000 000042 (v01 PTL    COMBUF   00000001 PTL  00000001)
> [    0.000000] ACPI: UEFI 0x00000000DAFE7000 00026A (v01 SECCSD LH43STAR 00000002 PTL  00000002)
> [    0.000000] ACPI: SSDT 0x00000000DAFE6000 0000D0 (v01 Iffs   IffsAsl  00003000 INTL 20061109)
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] No NUMA configuration found
> [    0.000000] Faking a node at [mem 0x0000000000000000-0x000000011fdfffff]
> [    0.000000] NODE_DATA(0) allocated [mem 0x11fdf8000-0x11fdfcfff]
> [    0.000000]  [ffffea0000000000-ffffea00047fffff] PMD -> [ffff88011b400000-ffff88011f3fffff] on node 0
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.000000]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000011fdfffff]
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000000001000-0x000000000009cfff]
> [    0.000000]   node   0: [mem 0x0000000000100000-0x000000001fffffff]
> [    0.000000]   node   0: [mem 0x0000000020200000-0x000000003fffffff]
> [    0.000000]   node   0: [mem 0x0000000040200000-0x00000000d9c9efff]
> [    0.000000]   node   0: [mem 0x00000000dafff000-0x00000000daffffff]
> [    0.000000]   node   0: [mem 0x0000000100000000-0x000000011fdfffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000000001000-0x000000011fdfffff]
> [    0.000000] On node 0 totalpages: 1021500
> [    0.000000]   DMA zone: 64 pages used for memmap
> [    0.000000]   DMA zone: 156 pages reserved
> [    0.000000]   DMA zone: 3996 pages, LIFO batch:0
> [    0.000000]   DMA32 zone: 13859 pages used for memmap
> [    0.000000]   DMA32 zone: 886944 pages, LIFO batch:31
> [    0.000000]   Normal zone: 2040 pages used for memmap
> [    0.000000]   Normal zone: 130560 pages, LIFO batch:31
> [    0.000000] Reserving Intel graphics stolen memory at 0xdba00000-0xdf9fffff
> [    0.000000] ACPI: PM-Timer IO Port: 0x408
> [    0.000000] ACPI: Local APIC address 0xfee00000
> [    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x00] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x01] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x02] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x04] lapic_id[0x03] enabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x05] lapic_id[0x00] disabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x06] lapic_id[0x00] disabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x07] lapic_id[0x00] disabled)
> [    0.000000] ACPI: LAPIC (acpi_id[0x08] lapic_id[0x00] disabled)
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
> [    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> [    0.000000] ACPI: IOAPIC (id[0x0e] address[0xfec00000] gsi_base[0])
> [    0.000000] IOAPIC[0]: apic_id 14, version 32, address 0xfec00000, GSI 0-23
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.000000] ACPI: IRQ0 used by override.
> [    0.000000] ACPI: IRQ9 used by override.
> [    0.000000] Using ACPI (MADT) for SMP configuration information
> [    0.000000] ACPI: HPET id: 0x8086a301 base: 0xfed00000
> [    0.000000] smpboot: Allowing 8 CPUs, 4 hotplug CPUs
> [    0.000000] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
> [    0.000000] PM: Registered nosave memory: [mem 0x0009d000-0x0009dfff]
> [    0.000000] PM: Registered nosave memory: [mem 0x0009e000-0x0009ffff]
> [    0.000000] PM: Registered nosave memory: [mem 0x000a0000-0x000dffff]
> [    0.000000] PM: Registered nosave memory: [mem 0x000e0000-0x000fffff]
> [    0.000000] PM: Registered nosave memory: [mem 0x20000000-0x201fffff]
> [    0.000000] PM: Registered nosave memory: [mem 0x40000000-0x401fffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xd9c9f000-0xdae7efff]
> [    0.000000] PM: Registered nosave memory: [mem 0xdae7f000-0xdaf9efff]
> [    0.000000] PM: Registered nosave memory: [mem 0xdaf9f000-0xdaffefff]
> [    0.000000] PM: Registered nosave memory: [mem 0xdb000000-0xdf9fffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xdfa00000-0xf7ffffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xf8000000-0xfbffffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfc000000-0xfebfffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfec01000-0xfed07fff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed08000-0xfed08fff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed09000-0xfed0ffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed10000-0xfed19fff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed1a000-0xfed1bfff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed1c000-0xfed1ffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfed20000-0xfedfffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfee00000-0xfee00fff]
> [    0.000000] PM: Registered nosave memory: [mem 0xfee01000-0xffd7ffff]
> [    0.000000] PM: Registered nosave memory: [mem 0xffd80000-0xffffffff]
> [    0.000000] e820: [mem 0xdfa00000-0xf7ffffff] available for PCI devices
> [    0.000000] Booting paravirtualized kernel on bare hardware
> [    0.000000] setup_percpu: NR_CPUS:256 nr_cpumask_bits:256 nr_cpu_ids:8 nr_node_ids:1
> [    0.000000] PERCPU: Embedded 33 pages/cpu @ffff88011fa00000 s94984 r8192 d31992 u262144
> [    0.000000] pcpu-alloc: s94984 r8192 d31992 u262144 alloc=1*2097152
> [    0.000000] pcpu-alloc: [0] 0 1 2 3 4 5 6 7 
> [    0.000000] Built 1 zonelists in Node order, mobility grouping on.  Total pages: 1005381
> [    0.000000] Policy zone: Normal
> [    0.000000] Kernel command line: BOOT_IMAGE=/boot/vmlinuz-3.19.0-rc7-next-20150204.12-iniza-small root=UUID=001AADA61AAD9964 loop=/ubuntu/disks/root.disk ro
> [    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
> [    0.000000] xsave: enabled xstate_bv 0x7, cntxt size 0x340 using standard form
> [    0.000000] AGP: Checking aperture...
> [    0.000000] AGP: No AGP bridge found
> [    0.000000] Calgary: detecting Calgary via BIOS EBDA area
> [    0.000000] Calgary: Unable to locate Rio Grande table in EBDA - bailing!
> [    0.000000] Memory: 3918912K/4086000K available (8143K kernel code, 1272K rwdata, 3464K rodata, 1408K init, 14360K bss, 167088K reserved, 0K cma-reserved)
> [    0.000000] Running RCU self tests
> [    0.000000] Hierarchical RCU implementation.
> [    0.000000] 	RCU lockdep checking is enabled.
> [    0.000000] 	RCU restricting CPUs from NR_CPUS=256 to nr_cpu_ids=8.
> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=8
> [    0.000000] NR_IRQS:16640 nr_irqs:488 16
> [    0.000000] Console: colour dummy device 80x25
> [    0.000000] console [tty0] enabled
> [    0.000000] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc., Ingo Molnar
> [    0.000000] ... MAX_LOCKDEP_SUBCLASSES:  8
> [    0.000000] ... MAX_LOCK_DEPTH:          48
> [    0.000000] ... MAX_LOCKDEP_KEYS:        8191
> [    0.000000] ... CLASSHASH_SIZE:          4096
> [    0.000000] ... MAX_LOCKDEP_ENTRIES:     32768
> [    0.000000] ... MAX_LOCKDEP_CHAINS:      65536
> [    0.000000] ... CHAINHASH_SIZE:          32768
> [    0.000000]  memory used by lock dependency info: 8159 kB
> [    0.000000]  per task-struct memory footprint: 1920 bytes
> [    0.000000] hpet clockevent registered
> [    0.000000] tsc: Fast TSC calibration using PIT
> [    0.000000] tsc: Detected 1596.391 MHz processor
> [    0.000076] Calibrating delay loop (skipped), value calculated using timer frequency.. 3192.78 BogoMIPS (lpj=6385564)
> [    0.000089] pid_max: default: 32768 minimum: 301
> [    0.000113] ACPI: Core revision 20141107
> [    0.018556] ACPI: All ACPI Tables successfully acquired
> [    0.020240] Security Framework initialized
> [    0.020257] AppArmor: AppArmor initialized
> [    0.020262] Yama: becoming mindful.
> [    0.021140] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
> [    0.022502] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
> [    0.022986] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
> [    0.023008] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
> [    0.024120] Initializing cgroup subsys blkio
> [    0.024132] Initializing cgroup subsys memory
> [    0.024157] Initializing cgroup subsys devices
> [    0.024190] Initializing cgroup subsys freezer
> [    0.024251] Initializing cgroup subsys perf_event
> [    0.024263] Initializing cgroup subsys hugetlb
> [    0.024340] Disabled fast string operations
> [    0.024347] CPU: Physical Processor ID: 0
> [    0.024352] CPU: Processor Core ID: 0
> [    0.024361] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
> [    0.024367] ENERGY_PERF_BIAS: View and update with x86_energy_perf_policy(8)
> [    0.024375] mce: CPU supports 7 MCE banks
> [    0.024392] CPU0: Thermal monitoring enabled (TM1)
> [    0.024414] Last level iTLB entries: 4KB 512, 2MB 8, 4MB 8
> [    0.024420] Last level dTLB entries: 4KB 512, 2MB 32, 4MB 32, 1GB 0
> [    0.024635] Freeing SMP alternatives memory: 24K (ffffffff81ea0000 - ffffffff81ea6000)
> [    0.026318] ftrace: allocating 28430 entries in 112 pages
> [    0.042354] x2apic: IRQ remapping doesn't support X2APIC mode
> [    0.042959] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
> [    0.082627] TSC deadline timer enabled
> [    0.082633] smpboot: CPU0: Intel(R) Core(TM) i5-2467M CPU @ 1.60GHz (fam: 06, model: 2a, stepping: 07)
> [    0.082686] Performance Events: PEBS fmt1+, 16-deep LBR, SandyBridge events, full-width counters, Intel PMU driver.
> [    0.082729] ... version:                3
> [    0.082734] ... bit width:              48
> [    0.082739] ... generic registers:      4
> [    0.082745] ... value mask:             0000ffffffffffff
> [    0.082750] ... max period:             0000ffffffffffff
> [    0.082755] ... fixed-purpose events:   3
> [    0.082760] ... event mask:             000000070000000f
> [    0.084699] x86: Booting SMP configuration:
> [    0.084707] .... node  #0, CPUs:      #1
> [    0.095662] Disabled fast string operations
> [    0.098202] NMI watchdog: enabled on all CPUs, permanently consumes one hw-PMU counter.
> [    0.098730]  #2
> [    0.109678] Disabled fast string operations
> [    0.112309]  #3<6>[    0.123263] Disabled fast string operations
> [    0.125437] x86: Booted up 1 node, 4 CPUs
> [    0.125451] smpboot: Total of 4 processors activated (12771.12 BogoMIPS)
> [    0.130362] devtmpfs: initialized
> [    0.135216] evm: security.selinux
> [    0.135223] evm: security.SMACK64
> [    0.135228] evm: security.capability
> [    0.135403] PM: Registering ACPI NVS region [mem 0xdae7f000-0xdaf9efff] (1179648 bytes)
> [    0.137337] NET: Registered protocol family 16
> [    0.149574] cpuidle: using governor ladder
> [    0.159863] cpuidle: using governor menu
> [    0.160023] ACPI: bus type PCI registered
> [    0.160333] PCI: MMCONFIG for domain 0000 [bus 00-3f] at [mem 0xf8000000-0xfbffffff] (base 0xf8000000)
> [    0.160345] PCI: MMCONFIG at [mem 0xf8000000-0xfbffffff] reserved in E820
> [    0.160491] PCI: Using configuration type 1 for base access
> [    0.177300] ACPI: Added _OSI(Module Device)
> [    0.177309] ACPI: Added _OSI(Processor Device)
> [    0.177315] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.177321] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.189484] ACPI: Executed 1 blocks of module-level executable AML code
> [    0.198093] [Firmware Bug]: ACPI: BIOS _OSI(Linux) query ignored
> [    0.199908] ACPI: Dynamic OEM Table Load:
> [    0.199936] ACPI: SSDT 0xFFFF88011AB65000 000688 (v01 PmRef  Cpu0Cst  00003001 INTL 20061109)
> [    0.202102] ACPI: Dynamic OEM Table Load:
> [    0.202129] ACPI: SSDT 0xFFFF88011A4CA000 000303 (v01 PmRef  ApIst    00003000 INTL 20061109)
> [    0.204098] ACPI: Dynamic OEM Table Load:
> [    0.204122] ACPI: SSDT 0xFFFF88011A4C5A00 000119 (v01 PmRef  ApCst    00003000 INTL 20061109)
> [    0.209096] ACPI: Interpreter enabled
> [    0.209121] ACPI Exception: AE_NOT_FOUND, While evaluating Sleep State [\_S2_] (20141107/hwxface-580)
> [    0.209179] ACPI: (supports S0 S1 S3 S4 S5)
> [    0.209186] ACPI: Using IOAPIC for interrupt routing
> [    0.209273] PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
> [    0.230313] ACPI: Power Resource [FN00] (off)
> [    0.230755] ACPI: Power Resource [FN01] (off)
> [    0.231116] ACPI: Power Resource [FN02] (off)
> [    0.231441] ACPI: Power Resource [FN03] (off)
> [    0.231768] ACPI: Power Resource [FN04] (off)
> [    0.234124] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-3e])
> [    0.234138] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI]
> [    0.234741] \_SB_.PCI0:_OSC invalid UUID
> [    0.234743] _OSC request data:1 1f 0 
> [    0.234749] acpi PNP0A08:00: _OSC failed (AE_ERROR); disabling ASPM
> [    0.236303] PCI host bridge to bus 0000:00
> [    0.236312] pci_bus 0000:00: root bus resource [bus 00-3e]
> [    0.236319] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7]
> [    0.236326] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff]
> [    0.236333] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff]
> [    0.236340] pci_bus 0000:00: root bus resource [mem 0xdfa00000-0xfeafffff]
> [    0.236347] pci_bus 0000:00: root bus resource [mem 0xfed40000-0xfed44fff]
> [    0.236406] pci 0000:00:00.0: [8086:0104] type 00 class 0x060000
> [    0.236794] pci 0000:00:02.0: [8086:0116] type 00 class 0x030000
> [    0.236815] pci 0000:00:02.0: reg 0x10: [mem 0xf0000000-0xf03fffff 64bit]
> [    0.236826] pci 0000:00:02.0: reg 0x18: [mem 0xe0000000-0xefffffff 64bit pref]
> [    0.236834] pci 0000:00:02.0: reg 0x20: [io  0x3000-0x303f]
> [    0.237289] pci 0000:00:16.0: [8086:1c3a] type 00 class 0x078000
> [    0.237335] pci 0000:00:16.0: reg 0x10: [mem 0xf0705000-0xf070500f 64bit]
> [    0.237489] pci 0000:00:16.0: PME# supported from D0 D3hot D3cold
> [    0.237858] pci 0000:00:1a.0: [8086:1c2d] type 00 class 0x0c0320
> [    0.237896] pci 0000:00:1a.0: reg 0x10: [mem 0xf070a000-0xf070a3ff]
> [    0.238077] pci 0000:00:1a.0: PME# supported from D0 D3hot D3cold
> [    0.238385] pci 0000:00:1b.0: [8086:1c20] type 00 class 0x040300
> [    0.238422] pci 0000:00:1b.0: reg 0x10: [mem 0xf0700000-0xf0703fff 64bit]
> [    0.238600] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
> [    0.238794] pci 0000:00:1b.0: System wakeup disabled by ACPI
> [    0.238955] pci 0000:00:1c.0: [8086:1c10] type 01 class 0x060400
> [    0.239134] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
> [    0.239294] pci 0000:00:1c.0: System wakeup disabled by ACPI
> [    0.239467] pci 0000:00:1c.3: [8086:1c16] type 01 class 0x060400
> [    0.239645] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
> [    0.239805] pci 0000:00:1c.3: System wakeup disabled by ACPI
> [    0.239964] pci 0000:00:1c.4: [8086:1c18] type 01 class 0x060400
> [    0.240143] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
> [    0.240461] pci 0000:00:1d.0: [8086:1c26] type 00 class 0x0c0320
> [    0.240500] pci 0000:00:1d.0: reg 0x10: [mem 0xf0709000-0xf07093ff]
> [    0.240680] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
> [    0.240981] pci 0000:00:1f.0: [8086:1c49] type 00 class 0x060100
> [    0.241443] pci 0000:00:1f.2: [8086:1c03] type 00 class 0x010601
> [    0.241486] pci 0000:00:1f.2: reg 0x10: [io  0x3088-0x308f]
> [    0.241503] pci 0000:00:1f.2: reg 0x14: [io  0x3094-0x3097]
> [    0.241520] pci 0000:00:1f.2: reg 0x18: [io  0x3080-0x3087]
> [    0.241536] pci 0000:00:1f.2: reg 0x1c: [io  0x3090-0x3093]
> [    0.241553] pci 0000:00:1f.2: reg 0x20: [io  0x3060-0x307f]
> [    0.241569] pci 0000:00:1f.2: reg 0x24: [mem 0xf0708000-0xf07087ff]
> [    0.241697] pci 0000:00:1f.2: PME# supported from D3hot
> [    0.241994] pci 0000:00:1f.3: [8086:1c22] type 00 class 0x0c0500
> [    0.242027] pci 0000:00:1f.3: reg 0x10: [mem 0xf0704000-0xf07040ff 64bit]
> [    0.242073] pci 0000:00:1f.3: reg 0x20: [io  0xefa0-0xefbf]
> [    0.242802] pci 0000:01:00.0: [8086:0091] type 00 class 0x028000
> [    0.243208] pci 0000:01:00.0: reg 0x10: [mem 0xf0600000-0xf0601fff 64bit]
> [    0.245001] pci 0000:01:00.0: PME# supported from D0 D3hot D3cold
> [    0.245334] pci 0000:01:00.0: System wakeup disabled by ACPI
> [    0.253895] pci 0000:00:1c.0: PCI bridge to [bus 01]
> [    0.253912] pci 0000:00:1c.0:   bridge window [mem 0xf0600000-0xf06fffff]
> [    0.254166] pci 0000:02:00.0: [10ec:8168] type 00 class 0x020000
> [    0.254258] pci 0000:02:00.0: reg 0x10: [io  0x2000-0x20ff]
> [    0.254395] pci 0000:02:00.0: reg 0x18: [mem 0xf0404000-0xf0404fff 64bit pref]
> [    0.254479] pci 0000:02:00.0: reg 0x20: [mem 0xf0400000-0xf0403fff 64bit pref]
> [    0.254957] pci 0000:02:00.0: supports D1 D2
> [    0.254959] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [    0.255131] pci 0000:02:00.0: System wakeup disabled by ACPI
> [    0.261787] pci 0000:00:1c.3: PCI bridge to [bus 02]
> [    0.261799] pci 0000:00:1c.3:   bridge window [io  0x2000-0x2fff]
> [    0.261814] pci 0000:00:1c.3:   bridge window [mem 0xf0400000-0xf04fffff 64bit pref]
> [    0.262029] pci 0000:03:00.0: [1b21:1042] type 00 class 0x0c0330
> [    0.262078] pci 0000:03:00.0: reg 0x10: [mem 0xf0500000-0xf0507fff 64bit]
> [    0.262353] pci 0000:03:00.0: PME# supported from D3hot D3cold
> [    0.262631] pci 0000:00:1c.4: PCI bridge to [bus 03]
> [    0.262646] pci 0000:00:1c.4:   bridge window [mem 0xf0500000-0xf05fffff]
> [    0.264713] ACPI: PCI Interrupt Link [LNKA] (IRQs 1 3 4 5 6 10 *11 12 14 15)
> [    0.264894] ACPI: PCI Interrupt Link [LNKB] (IRQs 1 3 4 5 6 10 11 12 14 15) *0, disabled.
> [    0.265074] ACPI: PCI Interrupt Link [LNKC] (IRQs 1 3 4 5 6 *10 11 12 14 15)
> [    0.265261] ACPI: PCI Interrupt Link [LNKD] (IRQs 1 3 4 5 6 *10 11 12 14 15)
> [    0.265448] ACPI: PCI Interrupt Link [LNKE] (IRQs 1 3 4 5 6 10 11 12 14 15) *9
> [    0.265625] ACPI: PCI Interrupt Link [LNKF] (IRQs 1 3 4 5 6 10 11 12 14 15) *0, disabled.
> [    0.265836] ACPI: PCI Interrupt Link [LNKG] (IRQs 1 3 4 5 6 10 *11 12 14 15)
> [    0.266011] ACPI: PCI Interrupt Link [LNKH] (IRQs 1 3 4 5 6 10 11 12 14 15) *9
> [    0.267408] ACPI: Enabled 4 GPEs in block 00 to 3F
> [    0.267555] ACPI : EC: GPE = 0x17, I/O: command/status = 0x66, data = 0x62
> [    0.267887] ACPI : EC: 0 stale EC events cleared
> [    0.268656] vgaarb: setting as boot device: PCI:0000:00:02.0
> [    0.268664] vgaarb: device added: PCI:0000:00:02.0,decodes=io+mem,owns=io+mem,locks=none
> [    0.268679] vgaarb: loaded
> [    0.268684] vgaarb: bridge control possible 0000:00:02.0
> [    0.269455] SCSI subsystem initialized
> [    0.269625] libata version 3.00 loaded.
> [    0.269739] ACPI: bus type USB registered
> [    0.269814] usbcore: registered new interface driver usbfs
> [    0.269852] usbcore: registered new interface driver hub
> [    0.269941] usbcore: registered new device driver usb
> [    0.270404] PCI: Using ACPI for IRQ routing
> [    0.274119] PCI: pci_cache_line_size set to 64 bytes
> [    0.274247] e820: reserve RAM buffer [mem 0x0009d800-0x0009ffff]
> [    0.274256] e820: reserve RAM buffer [mem 0xd9c9f000-0xdbffffff]
> [    0.274259] e820: reserve RAM buffer [mem 0xdb000000-0xdbffffff]
> [    0.274261] e820: reserve RAM buffer [mem 0x11fe00000-0x11fffffff]
> [    0.275040] NetLabel: Initializing
> [    0.275046] NetLabel:  domain hash size = 128
> [    0.275051] NetLabel:  protocols = UNLABELED CIPSOv4
> [    0.275112] NetLabel:  unlabeled traffic allowed by default
> [    0.275302] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0, 0, 0, 0, 0
> [    0.275316] hpet0: 8 comparators, 64-bit 14.318180 MHz counter
> [    0.277408] Switched to clocksource hpet
> [    0.319452] AppArmor: AppArmor Filesystem Enabled
> [    0.319718] pnp: PnP ACPI init
> [    0.320383] system 00:00: [io  0x0680-0x069f] has been reserved
> [    0.320394] system 00:00: [io  0x1000-0x100f] has been reserved
> [    0.320402] system 00:00: [io  0x5000-0x5003] has been reserved
> [    0.320410] system 00:00: [io  0xffff] has been reserved
> [    0.320418] system 00:00: [io  0x0400-0x0453] could not be reserved
> [    0.320426] system 00:00: [io  0x0458-0x047f] has been reserved
> [    0.320435] system 00:00: [io  0x0500-0x057f] has been reserved
> [    0.320442] system 00:00: [io  0x0a00-0x0a0f] has been reserved
> [    0.320450] system 00:00: [io  0x164e-0x164f] has been reserved
> [    0.320461] system 00:00: [io  0x5000-0x500f] could not be reserved
> [    0.320501] system 00:00: Plug and Play ACPI device, IDs PNP0c02 (active)
> [    0.320609] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
> [    0.320764] system 00:02: [io  0x0454-0x0457] has been reserved
> [    0.320775] system 00:02: Plug and Play ACPI device, IDs INT3f0d PNP0c02 (active)
> [    0.320876] pnp 00:03: Plug and Play ACPI device, IDs PNP0303 (active)
> [    0.321008] pnp 00:04: Plug and Play ACPI device, IDs ETD0b00 SYN0002 PNP0f13 (active)
> [    0.321471] system 00:05: [mem 0xfed1c000-0xfed1ffff] has been reserved
> [    0.321480] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
> [    0.321488] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
> [    0.321496] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
> [    0.321504] system 00:05: [mem 0xf8000000-0xfbffffff] has been reserved
> [    0.321512] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
> [    0.321520] system 00:05: [mem 0xfed90000-0xfed93fff] has been reserved
> [    0.321528] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
> [    0.321536] system 00:05: [mem 0xff000000-0xffffffff] could not be reserved
> [    0.321545] system 00:05: [mem 0xfee00000-0xfeefffff] could not be reserved
> [    0.321556] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active)
> [    0.322474] system 00:06: Plug and Play ACPI device, IDs PNP0c01 (active)
> [    0.322539] pnp: PnP ACPI: found 7 devices
> [    0.333511] pci 0000:00:1c.0: PCI bridge to [bus 01]
> [    0.333527] pci 0000:00:1c.0:   bridge window [mem 0xf0600000-0xf06fffff]
> [    0.333547] pci 0000:00:1c.3: PCI bridge to [bus 02]
> [    0.333555] pci 0000:00:1c.3:   bridge window [io  0x2000-0x2fff]
> [    0.333572] pci 0000:00:1c.3:   bridge window [mem 0xf0400000-0xf04fffff 64bit pref]
> [    0.333589] pci 0000:00:1c.4: PCI bridge to [bus 03]
> [    0.333601] pci 0000:00:1c.4:   bridge window [mem 0xf0500000-0xf05fffff]
> [    0.333621] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7]
> [    0.333624] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff]
> [    0.333626] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff]
> [    0.333628] pci_bus 0000:00: resource 7 [mem 0xdfa00000-0xfeafffff]
> [    0.333630] pci_bus 0000:00: resource 8 [mem 0xfed40000-0xfed44fff]
> [    0.333632] pci_bus 0000:01: resource 1 [mem 0xf0600000-0xf06fffff]
> [    0.333634] pci_bus 0000:02: resource 0 [io  0x2000-0x2fff]
> [    0.333636] pci_bus 0000:02: resource 2 [mem 0xf0400000-0xf04fffff 64bit pref]
> [    0.333638] pci_bus 0000:03: resource 1 [mem 0xf0500000-0xf05fffff]
> [    0.333773] NET: Registered protocol family 2
> [    0.334368] TCP established hash table entries: 32768 (order: 6, 262144 bytes)
> [    0.334870] TCP bind hash table entries: 32768 (order: 9, 2097152 bytes)
> [    0.337241] TCP: Hash tables configured (established 32768 bind 32768)
> [    0.337334] TCP: reno registered
> [    0.337439] UDP hash table entries: 2048 (order: 6, 327680 bytes)
> [    0.337814] UDP-Lite hash table entries: 2048 (order: 6, 327680 bytes)
> [    0.338387] NET: Registered protocol family 1
> [    0.338422] pci 0000:00:02.0: Video device with shadowed ROM
> [    0.340080] PCI: CLS 64 bytes, default 64
> [    0.340367] Trying to unpack rootfs image as initramfs...
> [    0.426748] Freeing initrd memory: 3568K (ffff8800378f8000 - ffff880037c74000)
> [    0.426771] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [    0.426779] software IO TLB [mem 0xd5c9f000-0xd9c9f000] (64MB) mapped at [ffff8800d5c9f000-ffff8800d9c9efff]
> [    0.427595] RAPL PMU detected, hw unit 2^-16 Joules, API unit is 2^-32 Joules, 3 fixed counters 163840 ms ovfl timer
> [    0.427834] microcode: CPU0 sig=0x206a7, pf=0x10, revision=0x28
> [    0.427858] microcode: CPU1 sig=0x206a7, pf=0x10, revision=0x28
> [    0.427888] microcode: CPU2 sig=0x206a7, pf=0x10, revision=0x28
> [    0.427911] microcode: CPU3 sig=0x206a7, pf=0x10, revision=0x28
> [    0.428095] microcode: Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>, Peter Oruba
> [    0.428176] Scanning for low memory corruption every 60 seconds
> [    0.429567] futex hash table entries: 2048 (order: 6, 262144 bytes)
> [    0.429751] Initialise system trusted keyring
> [    0.429886] audit: initializing netlink subsys (disabled)
> [    0.430000] audit: type=2000 audit(1423259462.424:1): initialized
> [    0.431016] HugeTLB registered 2 MB page size, pre-allocated 0 pages
> [    0.431625] VFS: Disk quotas dquot_6.5.2
> [    0.431673] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
> [    0.432544] fuse init (API version 7.23)
> [    0.433943] Key type asymmetric registered
> [    0.433969] Asymmetric key parser 'x509' registered
> [    0.434031] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
> [    0.434202] io scheduler noop registered
> [    0.434212] io scheduler deadline registered (default)
> [    0.434248] io scheduler cfq registered
> [    0.434258] start plist test
> [    0.436667] end plist test
> [    0.437875] pci_hotplug: PCI Hot Plug PCI Core version: 0.5
> [    0.438029] pciehp: PCI Express Hot Plug Controller Driver version: 0.4
> [    0.438266] intel_idle: MWAIT substates: 0x21120
> [    0.438268] intel_idle: v0.4 model 0x2A
> [    0.438270] intel_idle: lapic_timer_reliable_states 0xffffffff
> [    0.439937] ACPI: AC Adapter [ADP1] (on-line)
> [    0.440774] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input0
> [    0.440828] ACPI: Lid Switch [LID0]
> [    0.440981] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input1
> [    0.441034] ACPI: Power Button [PWRB]
> [    0.441187] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input2
> [    0.441200] ACPI: Power Button [PWRF]
> [    0.444935] thermal LNXTHERM:00: registered as thermal_zone0
> [    0.444943] ACPI: Thermal Zone [TZ00] (71 C)
> [    0.445818] thermal LNXTHERM:01: registered as thermal_zone1
> [    0.445825] ACPI: Thermal Zone [TZ01] (30 C)
> [    0.445940] GHES: HEST is not enabled!
> [    0.446293] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
> [    0.453433] ACPI: Battery Slot [BAT1] (battery present)
> [    0.455885] Linux agpgart interface v0.103
> [    0.463268] brd: module loaded
> [    0.467803] loop: module loaded
> [    0.471847] ahci 0000:00:1f.2: version 3.0
> [    0.472238] ahci 0000:00:1f.2: SSS flag set, parallel bus scan disabled
> [    0.485448] ahci 0000:00:1f.2: AHCI 0001.0300 32 slots 6 ports 6 Gbps 0x1b impl SATA mode
> [    0.485463] ahci 0000:00:1f.2: flags: 64bit ncq sntf ilck stag pm led clo pio slum part ems sxs apst 
> [    0.511805] scsi host0: ahci
> [    0.512414] scsi host1: ahci
> [    0.512857] scsi host2: ahci
> [    0.513366] scsi host3: ahci
> [    0.513772] scsi host4: ahci
> [    0.514232] scsi host5: ahci
> [    0.514441] ata1: SATA max UDMA/133 abar m2048@0xf0708000 port 0xf0708100 irq 25
> [    0.514453] ata2: SATA max UDMA/133 abar m2048@0xf0708000 port 0xf0708180 irq 25
> [    0.514461] ata3: DUMMY
> [    0.514468] ata4: SATA max UDMA/133 abar m2048@0xf0708000 port 0xf0708280 irq 25
> [    0.514478] ata5: SATA max UDMA/133 abar m2048@0xf0708000 port 0xf0708300 irq 25
> [    0.514486] ata6: DUMMY
> [    0.515958] libphy: Fixed MDIO Bus: probed
> [    0.516357] tun: Universal TUN/TAP device driver, 1.6
> [    0.516363] tun: (C) 1999-2004 Max Krasnyansky <maxk@qualcomm.com>
> [    0.516601] PPP generic driver version 2.4.2
> [    0.517001] xhci_hcd 0000:03:00.0: xHCI Host Controller
> [    0.517200] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus number 1
> [    0.527077] xhci_hcd 0000:03:00.0: hcc params 0x0200f180 hci version 0x96 quirks 0x00080000
> [    0.527864] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
> [    0.527873] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    0.527882] usb usb1: Product: xHCI Host Controller
> [    0.527888] usb usb1: Manufacturer: Linux 3.19.0-rc7-next-20150204.12-iniza-small xhci-hcd
> [    0.527897] usb usb1: SerialNumber: 0000:03:00.0
> [    0.528887] hub 1-0:1.0: USB hub found
> [    0.528977] hub 1-0:1.0: 2 ports detected
> [    0.530020] xhci_hcd 0000:03:00.0: xHCI Host Controller
> [    0.530038] xhci_hcd 0000:03:00.0: new USB bus registered, assigned bus number 2
> [    0.530265] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
> [    0.530272] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    0.530281] usb usb2: Product: xHCI Host Controller
> [    0.530287] usb usb2: Manufacturer: Linux 3.19.0-rc7-next-20150204.12-iniza-small xhci-hcd
> [    0.530297] usb usb2: SerialNumber: 0000:03:00.0
> [    0.530879] hub 2-0:1.0: USB hub found
> [    0.530944] hub 2-0:1.0: 2 ports detected
> [    0.531502] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    0.531513] ehci-pci: EHCI PCI platform driver
> [    0.531872] ehci-pci 0000:00:1a.0: EHCI Host Controller
> [    0.531902] ehci-pci 0000:00:1a.0: new USB bus registered, assigned bus number 3
> [    0.531936] ehci-pci 0000:00:1a.0: debug port 2
> [    0.535873] ehci-pci 0000:00:1a.0: cache line size of 64 is not supported
> [    0.535910] ehci-pci 0000:00:1a.0: irq 16, io mem 0xf070a000
> [    0.545455] ehci-pci 0000:00:1a.0: USB 2.0 started, EHCI 1.00
> [    0.545695] usb usb3: New USB device found, idVendor=1d6b, idProduct=0002
> [    0.545702] usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    0.545710] usb usb3: Product: EHCI Host Controller
> [    0.545716] usb usb3: Manufacturer: Linux 3.19.0-rc7-next-20150204.12-iniza-small ehci_hcd
> [    0.545724] usb usb3: SerialNumber: 0000:00:1a.0
> [    0.546337] hub 3-0:1.0: USB hub found
> [    0.546369] hub 3-0:1.0: 2 ports detected
> [    0.547170] ehci-pci 0000:00:1d.0: EHCI Host Controller
> [    0.547192] ehci-pci 0000:00:1d.0: new USB bus registered, assigned bus number 4
> [    0.547221] ehci-pci 0000:00:1d.0: debug port 2
> [    0.551151] ehci-pci 0000:00:1d.0: cache line size of 64 is not supported
> [    0.551188] ehci-pci 0000:00:1d.0: irq 23, io mem 0xf0709000
> [    0.561378] ehci-pci 0000:00:1d.0: USB 2.0 started, EHCI 1.00
> [    0.561565] usb usb4: New USB device found, idVendor=1d6b, idProduct=0002
> [    0.561572] usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
> [    0.561581] usb usb4: Product: EHCI Host Controller
> [    0.561586] usb usb4: Manufacturer: Linux 3.19.0-rc7-next-20150204.12-iniza-small ehci_hcd
> [    0.561594] usb usb4: SerialNumber: 0000:00:1d.0
> [    0.562167] hub 4-0:1.0: USB hub found
> [    0.562198] hub 4-0:1.0: 2 ports detected
> [    0.562631] ehci-platform: EHCI generic platform driver
> [    0.562671] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
> [    0.562696] ohci-pci: OHCI PCI platform driver
> [    0.562735] ohci-platform: OHCI generic platform driver
> [    0.562763] uhci_hcd: USB Universal Host Controller Interface driver
> [    0.562892] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:EPAD] at 0x60,0x64 irq 1,12
> [    0.570192] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    0.570251] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    0.571144] mousedev: PS/2 mouse device common for all mice
> [    0.572747] rtc_cmos 00:01: rtc core: registered rtc_cmos as rtc0
> [    0.572790] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvram, hpet irqs
> [    0.572907] device-mapper: uevent: version 1.0.3
> [    0.573110] device-mapper: ioctl: 4.30.0-ioctl (2014-12-22) initialised: dm-devel@redhat.com
> [    0.573151] Intel P-state driver initializing.
> [    0.575047] ledtrig-cpu: registered to indicate activity on CPUs
> [    0.575585] TCP: cubic registered
> [    0.575883] NET: Registered protocol family 10
> [    0.578069] NET: Registered protocol family 17
> [    0.578148] Key type dns_resolver registered
> [    0.580378] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input3
> [    0.582734] Loading compiled-in X.509 certificates
> [    0.584079] Loaded X.509 cert 'Magrathea: Glacier signing key: f0f992c575902471cf410410bace80fd81340f6e'
> [    0.584132] registered taskstats version 1
> [    0.590656] Key type trusted registered
> [    0.600332] Key type encrypted registered
> [    0.600351] AppArmor: AppArmor sha1 policy hashing enabled
> [    0.600361] evm: HMAC attrs: 0x1
> [    0.601357] rtc_cmos 00:01: setting system clock to 2015-02-06 21:51:02 UTC (1423259462)
> [    0.601558] BIOS EDD facility v0.16 2004-Jun-25, 0 devices found
> [    0.601567] EDD information not available.
> [    0.833194] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    0.834589] ata1.00: ATA-8: Hitachi HTS545050A7E380, GG2OA6C0, max UDMA/133
> [    0.834614] ata1.00: 976773168 sectors, multi 16: LBA48 NCQ (depth 31/32), AA
> [    0.836069] ata1.00: configured for UDMA/133
> [    0.837035] scsi 0:0:0:0: Direct-Access     ATA      Hitachi HTS54505 A6C0 PQ: 0 ANSI: 5
> [    0.838312] sd 0:0:0:0: [sda] 976773168 512-byte logical blocks: (500 GB/465 GiB)
> [    0.838325] sd 0:0:0:0: [sda] 4096-byte physical blocks
> [    0.838619] sd 0:0:0:0: [sda] Write Protect is off
> [    0.838628] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
> [    0.838733] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    0.838787] sd 0:0:0:0: Attached scsi generic sg0 type 0
> [    0.854199]  sda: sda1 sda2 sda3
> [    0.855616] sd 0:0:0:0: [sda] Attached SCSI disk
> [    0.857160] usb 3-1: new high-speed USB device number 2 using ehci-pci
> [    0.873124] usb 4-1: new high-speed USB device number 2 using ehci-pci
> [    0.989899] usb 3-1: New USB device found, idVendor=8087, idProduct=0024
> [    0.989909] usb 3-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    0.990658] hub 3-1:1.0: USB hub found
> [    0.990844] hub 3-1:1.0: 6 ports detected
> [    1.005749] usb 4-1: New USB device found, idVendor=8087, idProduct=0024
> [    1.005777] usb 4-1: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    1.006494] hub 4-1:1.0: USB hub found
> [    1.006736] hub 4-1:1.0: 6 ports detected
> [    1.156963] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [    1.157572] ata2.00: ATA-8: SanDisk iSSD P4 16GB, SSD 9.14, max UDMA/133
> [    1.157582] ata2.00: 31277232 sectors, multi 1: LBA48 
> [    1.158289] ata2.00: configured for UDMA/133
> [    1.158633] scsi 1:0:0:0: Direct-Access     ATA      SanDisk iSSD P4  9.14 PQ: 0 ANSI: 5
> [    1.159443] sd 1:0:0:0: [sdb] 31277232 512-byte logical blocks: (16.0 GB/14.9 GiB)
> [    1.159572] sd 1:0:0:0: Attached scsi generic sg1 type 0
> [    1.159623] sd 1:0:0:0: [sdb] Write Protect is off
> [    1.159630] sd 1:0:0:0: [sdb] Mode Sense: 00 3a 00 00
> [    1.159681] sd 1:0:0:0: [sdb] Write cache: enabled, read cache: enabled, doesn't support DPO or FUA
> [    1.160896]  sdb: sdb1 sdb2
> [    1.161905] sd 1:0:0:0: [sdb] Attached SCSI disk
> [    1.265064] usb 3-1.2: new high-speed USB device number 3 using ehci-pci
> [    1.280958] usb 4-1.4: new low-speed USB device number 3 using ehci-pci
> [    1.360123] usb 3-1.2: New USB device found, idVendor=12d1, idProduct=1436
> [    1.360135] usb 3-1.2: New USB device strings: Mfr=4, Product=3, SerialNumber=0
> [    1.360143] usb 3-1.2: Product: HUAWEI Mobile
> [    1.360148] usb 3-1.2: Manufacturer: HUAWEI Technology
> [    1.379621] usb 4-1.4: New USB device found, idVendor=046d, idProduct=c00e
> [    1.379657] usb 4-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    1.379665] usb 4-1.4: Product: USB-PS/2 Optical Mouse
> [    1.379670] usb 4-1.4: Manufacturer: Logitech
> [    1.424860] tsc: Refined TSC clocksource calibration: 1596.373 MHz
> [    1.436931] usb 3-1.4: new high-speed USB device number 4 using ehci-pci
> [    1.452938] usb 4-1.5: new full-speed USB device number 4 using ehci-pci
> [    1.476699] ata4: SATA link down (SStatus 0 SControl 300)
> [    1.550057] usb 4-1.5: New USB device found, idVendor=8086, idProduct=0189
> [    1.550068] usb 4-1.5: New USB device strings: Mfr=0, Product=0, SerialNumber=0
> [    1.688759] usb 3-1.4: New USB device found, idVendor=2232, idProduct=1018
> [    1.688770] usb 3-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> [    1.688780] usb 3-1.4: Product: WebCam SC-13HDL11431N
> [    1.688785] usb 3-1.4: Manufacturer: 123
> [    1.796631] ata5: SATA link down (SStatus 0 SControl 300)
> [    1.797626] Freeing unused kernel memory: 1408K (ffffffff81d40000 - ffffffff81ea0000)
> [    1.797636] Write protecting the kernel read-only data: 12288k
> [    1.798094] Freeing unused kernel memory: 36K (ffff8800017f7000 - ffff880001800000)
> [    1.798508] Freeing unused kernel memory: 632K (ffff880001b62000 - ffff880001c00000)
> [    1.837964] udevd[131]: starting version 175
> [    2.142777] usb-storage 3-1.2:1.0: USB Mass Storage device detected
> [    2.153137] usb-storage 3-1.2:1.1: USB Mass Storage device detected
> [    2.162480] usb-storage 3-1.2:1.2: USB Mass Storage device detected
> [    2.167877] usb-storage 3-1.2:1.3: USB Mass Storage device detected
> [    2.168715] r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
> [    2.168750] r8169 0000:02:00.0: can't disable ASPM; OS doesn't have ASPM control
> [    2.171920] usb-storage 3-1.2:1.4: USB Mass Storage device detected
> [    2.173964] usb-storage 3-1.2:1.5: USB Mass Storage device detected
> [    2.175046] r8169 0000:02:00.0 eth0: RTL8168evl/8111evl at 0xffffc90000672000, e8:03:9a:36:17:a9, XID 0c900800 IRQ 31
> [    2.175068] r8169 0000:02:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksumming: ko]
> [    2.176819] scsi host11: usb-storage 3-1.2:1.5
> [    2.177711] usb-storage 3-1.2:1.6: USB Mass Storage device detected
> [    2.180263] scsi host12: usb-storage 3-1.2:1.6
> [    2.183197] usbcore: registered new interface driver usb-storage
> [    2.211774] usbcore: registered new interface driver usbhid
> [    2.211788] usbhid: USB HID core driver
> [    2.276614] input: Logitech USB-PS/2 Optical Mouse as /devices/pci0000:00/0000:00:1d.0/usb4/4-1/4-1.4/4-1.4:1.0/0003:046D:C00E.0001/input/input6
> [    2.277181] hid-generic 0003:046D:C00E.0001: input: USB HID v1.10 Mouse [Logitech USB-PS/2 Optical Mouse] on usb-0000:00:1d.0-1.4/input0
> [    2.424268] Switched to clocksource tsc
> [    3.028926] EXT4-fs (loop0): mounted filesystem with ordered data mode. Opts: (null)
> [    3.177339] scsi 11:0:0:0: CD-ROM            HUAWEI   Mass Storage     2.31 PQ: 0 ANSI: 2
> [    3.181418] scsi 12:0:0:0: Direct-Access     HUAWEI   SD Storage       2.31 PQ: 0 ANSI: 2
> [    3.182006] sr 11:0:0:0: [sr0] scsi-1 drive
> [    3.182019] cdrom: Uniform CD-ROM driver Revision: 3.20
> [    3.182972] sr 11:0:0:0: Attached scsi CD-ROM sr0
> [    3.183205] sr 11:0:0:0: Attached scsi generic sg2 type 5
> [    3.184099] sd 12:0:0:0: Attached scsi generic sg3 type 0
> [    3.187712] sd 12:0:0:0: [sdc] Attached SCSI removable disk
> [    3.458986] random: nonblocking pool is initialized
> [    5.024605] init: ureadahead main process (460) terminated with status 5
> [    9.455370] Adding 262140k swap on /host/ubuntu/disks/swap.disk.  Priority:-1 extents:1 across:262140k FS
> [    9.642469] EXT4-fs (loop0): re-mounted. Opts: errors=remount-ro
> [    9.820862] udevd[747]: starting version 175
> [   11.060846] lp: driver loaded but no devices found
> [   13.160840] wmi: Mapper loaded
> [   13.326884] ACPI Warning: SystemIO range 0x0000000000000428-0x000000000000042f conflicts with OpRegion 0x0000000000000400-0x000000000000047f (\PMIO) (20141107/utaddress-258)
> [   13.326897] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [   13.326906] ACPI Warning: SystemIO range 0x0000000000000540-0x000000000000054f conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20141107/utaddress-258)
> [   13.326914] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [   13.326918] ACPI Warning: SystemIO range 0x0000000000000530-0x000000000000053f conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20141107/utaddress-258)
> [   13.326925] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [   13.326929] ACPI Warning: SystemIO range 0x0000000000000500-0x000000000000052f conflicts with OpRegion 0x0000000000000500-0x0000000000000563 (\GPIO) (20141107/utaddress-258)
> [   13.326935] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> [   13.326938] lpc_ich: Resource conflict(s) found affecting gpio_ich
> [   13.402542] samsung_laptop: detected SABI interface: SwSmi@
> [   13.402548] samsung_laptop: Backlight controlled by ACPI video driver
> [   14.724891] [drm] Initialized drm 1.1.0 20060810
> [   15.008742] Bluetooth: Core ver 2.20
> [   15.008797] NET: Registered protocol family 31
> [   15.008800] Bluetooth: HCI device and connection manager initialized
> [   15.008887] Bluetooth: HCI socket layer initialized
> [   15.008896] Bluetooth: L2CAP socket layer initialized
> [   15.008946] Bluetooth: SCO socket layer initialized
> [   15.359655] usbcore: registered new interface driver btusb
> [   15.442198] psmouse serio1: elantech: assuming hardware version 3 (with firmware version 0x450f00)
> [   15.457199] psmouse serio1: elantech: Synaptics capabilities query result 0x08, 0x17, 0x0c.
> [   15.537049] input: ETPS/2 Elantech Touchpad as /devices/platform/i8042/serio1/input/input7
> [   15.570704] usbcore: registered new interface driver usbserial
> [   15.628831] audit: type=1400 audit(1423255877.535:2): apparmor="STATUS" operation="profile_load" name="/sbin/dhclient" pid=1038 comm="apparmor_parser"
> [   15.628842] audit: type=1400 audit(1423255877.535:3): apparmor="STATUS" operation="profile_load" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=1038 comm="apparmor_parser"
> [   15.628849] audit: type=1400 audit(1423255877.535:4): apparmor="STATUS" operation="profile_load" name="/usr/lib/connman/scripts/dhclient-script" pid=1038 comm="apparmor_parser"
> [   15.629491] audit: type=1400 audit(1423255877.535:5): apparmor="STATUS" operation="profile_replace" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=1038 comm="apparmor_parser"
> [   15.629499] audit: type=1400 audit(1423255877.535:6): apparmor="STATUS" operation="profile_replace" name="/usr/lib/connman/scripts/dhclient-script" pid=1038 comm="apparmor_parser"
> [   15.629875] audit: type=1400 audit(1423255877.535:7): apparmor="STATUS" operation="profile_replace" name="/usr/lib/connman/scripts/dhclient-script" pid=1038 comm="apparmor_parser"
> [   15.631533] audit: type=1400 audit(1423255877.535:8): apparmor="STATUS" operation="profile_replace" name="/sbin/dhclient" pid=1089 comm="apparmor_parser"
> [   15.631550] audit: type=1400 audit(1423255877.535:9): apparmor="STATUS" operation="profile_replace" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=1089 comm="apparmor_parser"
> [   15.631561] audit: type=1400 audit(1423255877.535:10): apparmor="STATUS" operation="profile_replace" name="/usr/lib/connman/scripts/dhclient-script" pid=1089 comm="apparmor_parser"
> [   15.632259] audit: type=1400 audit(1423255877.535:11): apparmor="STATUS" operation="profile_replace" name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=1089 comm="apparmor_parser"
> [   15.714679] cfg80211: Calling CRDA to update world regulatory domain
> [   16.655139] usbcore: registered new interface driver option
> [   16.656989] usbserial: USB Serial support registered for GSM modem (1-port)
> [   16.657087] option 3-1.2:1.0: GSM modem (1-port) converter detected
> [   16.657945] usb 3-1.2: GSM modem (1-port) converter now attached to ttyUSB0
> [   16.658156] option 3-1.2:1.3: GSM modem (1-port) converter detected
> [   16.658584] usb 3-1.2: GSM modem (1-port) converter now attached to ttyUSB1
> [   16.658646] option 3-1.2:1.4: GSM modem (1-port) converter detected
> [   16.658948] usb 3-1.2: GSM modem (1-port) converter now attached to ttyUSB2
> [   16.908413] cfg80211: World regulatory domain updated:
> [   16.908418] cfg80211:  DFS Master region: unset
> [   16.908420] cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp), (dfs_cac_time)
> [   16.908423] cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
> [   16.908426] cfg80211:   (2457000 KHz - 2482000 KHz @ 20000 KHz), (300 mBi, 2000 mBm), (N/A)
> [   16.908428] cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm), (N/A)
> [   16.908430] cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
> [   16.908431] cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm), (N/A)
> [   17.014151] Intel(R) Wireless WiFi driver for Linux
> [   17.014157] Copyright(c) 2003- 2014 Intel Corporation
> [   17.014473] iwlwifi 0000:01:00.0: can't disable ASPM; OS doesn't have ASPM control
> [   17.342869] init: failsafe main process (1136) killed by TERM signal
> [   17.650236] iwlwifi 0000:01:00.0: loaded firmware version 18.168.6.1 op_mode iwldvm
> [   17.978053] ppdev: user-space parallel port driver
> [   18.077794] Linux video capture interface: v2.00
> [   19.482642] cdc_ether 3-1.2:1.1 wwan0: register 'cdc_ether' at usb-0000:00:1a.0-1.2, Mobile Broadband Network Device, 02:50:f3:00:00:00
> [   19.482740] usbcore: registered new interface driver cdc_ether
> [   19.606363] uvcvideo: Found UVC 1.00 device WebCam SC-13HDL11431N (2232:1018)
> [   19.626151] input: WebCam SC-13HDL11431N as /devices/pci0000:00/0000:00:1a.0/usb3/3-1/3-1.4/3-1.4:1.0/input/input8
> [   19.626558] usbcore: registered new interface driver uvcvideo
> [   19.626563] USB Video Class driver (1.1.1)
> [   19.761436] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [   19.761440] Bluetooth: BNEP filters: protocol multicast
> [   19.761449] Bluetooth: BNEP socket layer initialized
> [   19.951800] Bluetooth: RFCOMM TTY layer initialized
> [   19.951820] Bluetooth: RFCOMM socket layer initialized
> [   19.951837] Bluetooth: RFCOMM ver 1.11
> [   20.819125] audit_printk_skb: 63 callbacks suppressed
> [   20.819131] audit: type=1400 audit(1423255882.727:33): apparmor="STATUS" operation="profile_load" name="/usr/bin/evince" pid=1323 comm="apparmor_parser"
> [   20.819145] audit: type=1400 audit(1423255882.727:34): apparmor="STATUS" operation="profile_load" name="launchpad_integration" pid=1323 comm="apparmor_parser"
> [   20.819157] audit: type=1400 audit(1423255882.727:35): apparmor="STATUS" operation="profile_load" name="sanitized_helper" pid=1323 comm="apparmor_parser"
> [   20.819167] audit: type=1400 audit(1423255882.727:36): apparmor="STATUS" operation="profile_load" name="/usr/bin/evince-previewer" pid=1323 comm="apparmor_parser"
> [   20.819177] audit: type=1400 audit(1423255882.727:37): apparmor="STATUS" operation="profile_load" name="launchpad_integration" pid=1323 comm="apparmor_parser"
> [   20.819187] audit: type=1400 audit(1423255882.727:38): apparmor="STATUS" operation="profile_load" name="sanitized_helper" pid=1323 comm="apparmor_parser"
> [   20.819197] audit: type=1400 audit(1423255882.727:39): apparmor="STATUS" operation="profile_load" name="/usr/bin/evince-thumbnailer" pid=1323 comm="apparmor_parser"
> [   20.819207] audit: type=1400 audit(1423255882.727:40): apparmor="STATUS" operation="profile_load" name="sanitized_helper" pid=1323 comm="apparmor_parser"
> [   20.820465] [drm] Memory usable by graphics device = 2048M
> [   20.820557] [drm] Replacing VGA console driver
> [   20.829352] audit: type=1400 audit(1423255882.735:41): apparmor="STATUS" operation="profile_replace" name="launchpad_integration" pid=1323 comm="apparmor_parser"
> [   20.829364] audit: type=1400 audit(1423255882.735:42): apparmor="STATUS" operation="profile_replace" name="sanitized_helper" pid=1323 comm="apparmor_parser"
> [   20.847137] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [   20.847141] [drm] Driver supports precise vblank timestamp query.
> [   20.847949] vgaarb: device changed decodes: PCI:0000:00:02.0,olddecodes=io+mem,decodes=io+mem:owns=io+mem
> [   20.862155] ACPI: Video Device [GFX0] (multi-head: yes  rom: no  post: no)
> [   20.862997] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input9
> [   20.864212] [drm] Initialized i915 1.6.0 20150130 for 0000:00:02.0 on minor 0
> [   20.879430] fbcon: inteldrmfb (fb0) is primary device
> [   20.880127] sound hdaudioC0D0: autoconfig for ALC269VC: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [   20.880130] sound hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
> [   20.880132] sound hdaudioC0D0:    hp_outs=1 (0x15/0x0/0x0/0x0/0x0)
> [   20.880134] sound hdaudioC0D0:    mono: mono_out=0x0
> [   20.880135] sound hdaudioC0D0:    inputs:
> [   20.880140] sound hdaudioC0D0:      Internal Mic=0x19
> [   20.880143] sound hdaudioC0D0:      Mic=0x18
> [   20.914432] iwlwifi 0000:01:00.0: CONFIG_IWLWIFI_DEBUG disabled
> [   20.914434] iwlwifi 0000:01:00.0: CONFIG_IWLWIFI_DEBUGFS enabled
> [   20.914435] iwlwifi 0000:01:00.0: CONFIG_IWLWIFI_DEVICE_TRACING enabled
> [   20.914438] iwlwifi 0000:01:00.0: Detected Intel(R) Centrino(R) Advanced-N 6230 AGN, REV=0xB0
> [   20.914934] iwlwifi 0000:01:00.0: L1 Enabled - LTR Disabled
> [   21.040534] ieee80211 phy0: Selected rate control algorithm 'iwl-agn-rs'
> [   21.072053] input: HDA Intel PCH Mic as /devices/pci0000:00/0000:00:1b.0/sound/card0/input10
> [   21.074129] input: HDA Intel PCH Headphone as /devices/pci0000:00/0000:00:1b.0/sound/card0/input11
> [   21.075125] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1b.0/sound/card0/input12
> [   21.828181] Console: switching to colour frame buffer device 170x48
> [   21.831638] i915 0000:00:02.0: fb0: inteldrmfb frame buffer device
> [   21.831642] i915 0000:00:02.0: registered panic notifier
> [   25.793536] r8169 0000:02:00.0 eth0: link down
> [   25.793728] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [   60.926428] usb 4-1.5: USB disconnect, device number 4
> [   81.525579] PPP BSD Compression module registered
> [   81.531611] PPP Deflate Compression module registered
> [  147.667264] intel_pstate CPU 1 exiting
> [  147.680991] smpboot: CPU 1 is now offline
> [  161.870036] x86: Booting SMP configuration:
> [  161.870040] smpboot: Booting Node 0 Processor 1 APIC 0x1
> [  161.880993] Disabled fast string operations
> [  167.787918] PM: Syncing filesystems ... done.
> [  167.943309] Freezing user space processes ... (elapsed 0.004 seconds) done.
> [  167.948016] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [  167.949796] Suspending console(s) (use no_console_suspend to debug)
> [  167.952865] sd 1:0:0:0: [sdb] Synchronizing SCSI cache
> [  167.953066] sd 0:0:0:0: [sda] Synchronizing SCSI cache
> [  167.953309] sd 0:0:0:0: [sda] Stopping disk
> [  167.955383] sd 1:0:0:0: [sdb] Stopping disk
> [  168.576044] PM: suspend of devices complete after 625.207 msecs
> [  168.592018] PM: late suspend of devices complete after 15.976 msecs
> [  168.595254] r8169 0000:02:00.0: System wakeup enabled by ACPI
> [  168.608157] PM: noirq suspend of devices complete after 16.145 msecs
> [  168.608437] ACPI: Preparing to enter system sleep state S3
> [  168.632143] PM: Saving platform NVS memory
> [  168.632206] Disabling non-boot CPUs ...
> [  168.632404] intel_pstate CPU 1 exiting
> [  168.634869] smpboot: CPU 1 is now offline
> [  168.647123] intel_pstate CPU 2 exiting
> [  168.648655] smpboot: CPU 2 is now offline
> [  168.665672] intel_pstate CPU 3 exiting
> [  168.666055] Broke affinity for irq 1
> [  168.666082] Broke affinity for irq 12
> [  168.667155] smpboot: CPU 3 didn't die...
> [  168.678463] ACPI: Low-level resume complete
> [  168.678525] PM: Restoring platform NVS memory
> [  168.679509] Enabling non-boot CPUs ...
> [  168.679943] x86: Booting SMP configuration:
> [  168.679945] smpboot: Booting Node 0 Processor 1 APIC 0x1
> [  168.690910] Disabled fast string operations
> [  168.715831] CPU1 is up
> [  168.716314] smpboot: Booting Node 0 Processor 2 APIC 0x2
> [  168.727271] Disabled fast string operations
> [  168.747958] CPU2 is up
> [  168.748307] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [  168.759268] Disabled fast string operations
> [  168.780328] CPU3 is up
> [  168.785510] ACPI : EC: 0 stale EC events cleared
> [  168.785517] ACPI: Waking up from system sleep state S3
> [  168.851153] pcieport 0000:00:1c.4: System wakeup disabled by ACPI
> [  168.852214] PM: noirq resume of devices complete after 17.604 msecs
> [  168.854123] PM: early resume of devices complete after 1.840 msecs
> [  168.855178] usb usb1: root hub lost power or was reset
> [  168.855181] usb usb2: root hub lost power or was reset
> [  168.855296] r8169 0000:02:00.0: System wakeup disabled by ACPI
> [  168.857573] rtc_cmos 00:01: System wakeup disabled by ACPI
> [  168.859751] iwlwifi 0000:01:00.0: RF_KILL bit toggled to enable radio.
> [  168.869871] sd 0:0:0:0: [sda] Starting disk
> [  168.869918] sd 1:0:0:0: [sdb] Starting disk
> [  169.073567] usb 3-1.4: reset high-speed USB device number 4 using ehci-pci
> [  169.205201] ata5: SATA link down (SStatus 0 SControl 300)
> [  169.205250] ata2: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [  169.205463] ata4: SATA link down (SStatus 0 SControl 300)
> [  169.209525] ata2.00: configured for UDMA/133
> [  169.261569] usb 4-1.4: reset low-speed USB device number 3 using ehci-pci
> [  169.548464] PM: resume of devices complete after 694.827 msecs
> [  169.550654] Restarting tasks ... 
> [  169.551364] usb 3-1.2: USB disconnect, device number 3
> [  169.560023] done.
> [  169.564450] option1 ttyUSB0: GSM modem (1-port) converter now disconnected from ttyUSB0
> [  169.564547] option 3-1.2:1.0: device disconnected
> [  169.565384] cdc_ether 3-1.2:1.1 wwan0: unregister 'cdc_ether' usb-0000:00:1a.0-1.2, Mobile Broadband Network Device
> [  169.591382] option1 ttyUSB1: GSM modem (1-port) converter now disconnected from ttyUSB1
> [  169.591447] option 3-1.2:1.3: device disconnected
> [  169.593250] option1 ttyUSB2: GSM modem (1-port) converter now disconnected from ttyUSB2
> [  169.593313] option 3-1.2:1.4: device disconnected
> [  171.283809] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
> [  171.286318] ata1.00: configured for UDMA/133
> [  172.003365] usb 3-1.2: new high-speed USB device number 5 using ehci-pci
> [  172.177260] r8169 0000:02:00.0 eth0: link down
> [  172.177333] IPv6: ADDRCONF(NETDEV_UP): eth0: link is not ready
> [  172.193326] usb 3-1.2: New USB device found, idVendor=12d1, idProduct=1446
> [  172.193332] usb 3-1.2: New USB device strings: Mfr=3, Product=2, SerialNumber=0
> [  172.193334] usb 3-1.2: Product: HUAWEI Mobile
> [  172.193336] usb 3-1.2: Manufacturer: HUAWEI Technology
> [  172.197128] usb-storage 3-1.2:1.0: USB Mass Storage device detected
> [  172.197769] scsi host13: usb-storage 3-1.2:1.0
> [  172.198439] usb-storage 3-1.2:1.1: USB Mass Storage device detected
> [  172.198703] scsi host14: usb-storage 3-1.2:1.1
> [  173.196795] scsi 13:0:0:0: CD-ROM            HUAWEI   Mass Storage     2.31 PQ: 0 ANSI: 2
> [  173.197004] scsi 14:0:0:0: Direct-Access     HUAWEI   SD Storage       2.31 PQ: 0 ANSI: 2
> [  173.201759] sr 13:0:0:0: [sr0] scsi-1 drive
> [  173.203885] sr 13:0:0:0: Attached scsi CD-ROM sr0
> [  173.204681] sr 13:0:0:0: Attached scsi generic sg2 type 5
> [  173.207294] sd 14:0:0:0: Attached scsi generic sg3 type 0
> [  173.211005] sd 14:0:0:0: [sdc] Attached SCSI removable disk
> [  173.519199] usb 3-1.2: USB disconnect, device number 5
> [  177.555645] usb 3-1.2: new high-speed USB device number 6 using ehci-pci
> [  177.650499] usb 3-1.2: New USB device found, idVendor=12d1, idProduct=1436
> [  177.650504] usb 3-1.2: New USB device strings: Mfr=4, Product=3, SerialNumber=0
> [  177.650507] usb 3-1.2: Product: HUAWEI Mobile
> [  177.650509] usb 3-1.2: Manufacturer: HUAWEI Technology
> [  177.654209] usb-storage 3-1.2:1.0: USB Mass Storage device detected
> [  177.654652] option 3-1.2:1.0: GSM modem (1-port) converter detected
> [  177.655212] usb 3-1.2: GSM modem (1-port) converter now attached to ttyUSB0
> [  177.655735] usb-storage 3-1.2:1.1: USB Mass Storage device detected
> [  177.659395] cdc_ether 3-1.2:1.1 wwan0: register 'cdc_ether' at usb-0000:00:1a.0-1.2, Mobile Broadband Network Device, 02:50:f3:00:00:00
> [  177.659931] usb-storage 3-1.2:1.3: USB Mass Storage device detected
> [  177.660372] option 3-1.2:1.3: GSM modem (1-port) converter detected
> [  177.660685] usb 3-1.2: GSM modem (1-port) converter now attached to ttyUSB1
> [  177.660975] usb-storage 3-1.2:1.4: USB Mass Storage device detected
> [  177.661307] option 3-1.2:1.4: GSM modem (1-port) converter detected
> [  177.661603] usb 3-1.2: GSM modem (1-port) converter now attached to ttyUSB2
> [  177.661889] usb-storage 3-1.2:1.5: USB Mass Storage device detected
> [  177.662510] scsi host19: usb-storage 3-1.2:1.5
> [  177.663042] usb-storage 3-1.2:1.6: USB Mass Storage device detected
> [  177.663659] scsi host20: usb-storage 3-1.2:1.6
> [  178.660445] scsi 19:0:0:0: CD-ROM            HUAWEI   Mass Storage     2.31 PQ: 0 ANSI: 2
> [  178.664493] scsi 20:0:0:0: Direct-Access     HUAWEI   SD Storage       2.31 PQ: 0 ANSI: 2
> [  178.665097] sr 19:0:0:0: [sr0] scsi-1 drive
> [  178.666133] sr 19:0:0:0: Attached scsi CD-ROM sr0
> [  178.667232] sr 19:0:0:0: Attached scsi generic sg2 type 5
> [  178.668809] sd 20:0:0:0: Attached scsi generic sg3 type 0
> [  178.672325] sd 20:0:0:0: [sdc] Attached SCSI removable disk

> Martin K. Petersen (1):
>       block: Quiesce zeroout wrapper
> 
> Sedat Dilek (1):
>       Merge branch 'for-next20150204/tracing-tlb-x86-fixes' into 3.19.0-rc7-next-20150204.12-iniza-small
> 
> Steven Rostedt (Red Hat) (2):
>       tracing: Add condition check to RCU lockdep checks
>       x86/tbl/trace: Do not trace on CPU that is offline
> 
>  block/blk-lib.c            | 26 +++++++-------------------
>  include/linux/tracepoint.h |  2 +-
>  include/trace/events/tlb.h |  4 +++-
>  3 files changed, 11 insertions(+), 21 deletions(-)
> 
> diff --git a/block/blk-lib.c b/block/blk-lib.c
> index 715e948f58a4..7688ee3f5d72 100644
> --- a/block/blk-lib.c
> +++ b/block/blk-lib.c
> @@ -286,7 +286,6 @@ static int __blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>   * @discard:	whether to discard the block range
>   *
>   * Description:
> -
>   *  Zero-fill a block range.  If the discard flag is set and the block
>   *  device guarantees that subsequent READ operations to the block range
>   *  in question will return zeroes, the blocks will be discarded. Should
> @@ -303,26 +302,15 @@ int blkdev_issue_zeroout(struct block_device *bdev, sector_t sector,
>  			 sector_t nr_sects, gfp_t gfp_mask, bool discard)
>  {
>  	struct request_queue *q = bdev_get_queue(bdev);
> -	unsigned char bdn[BDEVNAME_SIZE];
> -
> -	if (discard && blk_queue_discard(q) && q->limits.discard_zeroes_data) {
>  
> -		if (!blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, 0))
> -			return 0;
> -
> -		bdevname(bdev, bdn);
> -		pr_warn("%s: DISCARD failed. Manually zeroing.\n", bdn);
> -	}
> +	if (discard && blk_queue_discard(q) && q->limits.discard_zeroes_data &&
> +	    blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, 0) == 0)
> +		return 0;
>  
> -	if (bdev_write_same(bdev)) {
> -
> -		if (!blkdev_issue_write_same(bdev, sector, nr_sects, gfp_mask,
> -					     ZERO_PAGE(0)))
> -			return 0;
> -
> -		bdevname(bdev, bdn);
> -		pr_warn("%s: WRITE SAME failed. Manually zeroing.\n", bdn);
> -	}
> +	if (bdev_write_same(bdev) &&
> +	    blkdev_issue_write_same(bdev, sector, nr_sects, gfp_mask,
> +				    ZERO_PAGE(0)) == 0)
> +		return 0;
>  
>  	return __blkdev_issue_zeroout(bdev, sector, nr_sects, gfp_mask);
>  }
> diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
> index e08e21e5f601..c72851328ca9 100644
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -173,7 +173,7 @@ extern void syscall_unregfunc(void);
>  				TP_PROTO(data_proto),			\
>  				TP_ARGS(data_args),			\
>  				TP_CONDITION(cond),,);			\
> -		if (IS_ENABLED(CONFIG_LOCKDEP)) {			\
> +		if (IS_ENABLED(CONFIG_LOCKDEP) && (cond)) {		\
>  			rcu_read_lock_sched_notrace();			\
>  			rcu_dereference_sched(__tracepoint_##name.funcs);\
>  			rcu_read_unlock_sched_notrace();		\
> diff --git a/include/trace/events/tlb.h b/include/trace/events/tlb.h
> index 13391d288107..0e7635765153 100644
> --- a/include/trace/events/tlb.h
> +++ b/include/trace/events/tlb.h
> @@ -13,11 +13,13 @@
>  	{ TLB_LOCAL_SHOOTDOWN,		"local shootdown" },		\
>  	{ TLB_LOCAL_MM_SHOOTDOWN,	"local mm shootdown" }
>  
> -TRACE_EVENT(tlb_flush,
> +TRACE_EVENT_CONDITION(tlb_flush,
>  
>  	TP_PROTO(int reason, unsigned long pages),
>  	TP_ARGS(reason, pages),
>  
> +	TP_CONDITION(cpu_online(smp_processor_id())),
> +
>  	TP_STRUCT__entry(
>  		__field(	  int, reason)
>  		__field(unsigned long,  pages)
