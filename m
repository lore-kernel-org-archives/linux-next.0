From: Nico -telmich- Schottelius
	<nico-linux-ipw3945-devel@schottelius.org>
Subject: Re: [ipw3945-devel] next-20081125: call trace for iwlagn (rfkill
	switch on)
Date: Thu, 4 Dec 2008 12:23:02 +0100
Message-ID: <20081204112302.GA22532@denkbrett.schottelius.org>
References: <20081128063859.GB4700@denkbrett.schottelius.org> <AFAB8585072C7E48BC5C6F9C87F9B7970214D75A@pdsmsx502.ccr.corp.intel.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="vGgW1X5XWziG23Ko"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.schottelius.org ([77.109.138.221]:46629 "EHLO
	mx3.schottelius.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753375AbYLDLXG (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 4 Dec 2008 06:23:06 -0500
Content-Disposition: inline
In-Reply-To: <AFAB8585072C7E48BC5C6F9C87F9B7970214D75A@pdsmsx502.ccr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luo, Ximin" <ximin.luo@intel.com>
Cc: "ipw3945-devel@lists.sourceforge.net" <ipw3945-devel@lists.sourceforge.net>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>


--vGgW1X5XWziG23Ko
Content-Type: multipart/mixed; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline


--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Luo, Ximin [Fri, Nov 28, 2008 at 03:03:23PM +0800]:
> Maybe you can the download the latest driver which had fixed this issue.
> You can get the information from http://www.intellinuxwireless.org/bugzil=
la/show_bug.cgi?id=3D1800

As reinette stated, it's not fixed (dmesg attached), running
2.6.28-rc6-wl-denkbrett-21906-g24e8b9a.

Sincerly,

Nico


--=20
Think about Free and Open Source Software (FOSS).
http://nico.schottelius.org/documentations/foss/the-term-foss/

PGP: BFE4 C736 ABE5 406F 8F42  F7CF B8BE F92A 9885 188C

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="dmesg.2.6.28-rc6-wl-denkbrett-21906-g24e8b9a"
Content-Transfer-Encoding: quoted-printable

[    0.000000] BIOS EBDA/lowmem at: 0009ec00/0009ec00
[    0.000000] Linux version 2.6.28-rc6-wl-denkbrett-21906-g24e8b9a (compil=
er@ikn) (gcc version 4.3.2 (Debian 4.3.2-1) ) #1 SMP PREEMPT Tue Dec 2 18:1=
7:25 CET 2008
[    0.000000] Command line: root=3D/dev/sda1 ro=20
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Centaur CentaurHauls
[    0.000000] BIOS-provided physical RAM map:
[    0.000000]  BIOS-e820: 0000000000000000 - 000000000009ec00 (usable)
[    0.000000]  BIOS-e820: 000000000009ec00 - 00000000000a0000 (reserved)
[    0.000000]  BIOS-e820: 00000000000dc000 - 0000000000100000 (reserved)
[    0.000000]  BIOS-e820: 0000000000100000 - 000000007c4a1000 (usable)
[    0.000000]  BIOS-e820: 000000007c4a1000 - 000000007c4a7000 (reserved)
[    0.000000]  BIOS-e820: 000000007c4a7000 - 000000007c5b7000 (usable)
[    0.000000]  BIOS-e820: 000000007c5b7000 - 000000007c60f000 (reserved)
[    0.000000]  BIOS-e820: 000000007c60f000 - 000000007c6c6000 (usable)
[    0.000000]  BIOS-e820: 000000007c6c6000 - 000000007c6d1000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007c6d1000 - 000000007c6d4000 (ACPI data)
[    0.000000]  BIOS-e820: 000000007c6d4000 - 000000007c6d8000 (reserved)
[    0.000000]  BIOS-e820: 000000007c6d8000 - 000000007c6dc000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007c6dc000 - 000000007c6df000 (reserved)
[    0.000000]  BIOS-e820: 000000007c6df000 - 000000007c706000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007c706000 - 000000007c708000 (ACPI data)
[    0.000000]  BIOS-e820: 000000007c708000 - 000000007c90f000 (reserved)
[    0.000000]  BIOS-e820: 000000007c90f000 - 000000007c99f000 (ACPI NVS)
[    0.000000]  BIOS-e820: 000000007c99f000 - 000000007c9ff000 (ACPI data)
[    0.000000]  BIOS-e820: 000000007c9ff000 - 000000007ca00000 (usable)
[    0.000000]  BIOS-e820: 000000007cc00000 - 000000007f000000 (reserved)
[    0.000000]  BIOS-e820: 00000000e0000000 - 00000000f0000000 (reserved)
[    0.000000]  BIOS-e820: 00000000fec00000 - 00000000fec10000 (reserved)
[    0.000000]  BIOS-e820: 00000000fed00000 - 00000000fed00400 (reserved)
[    0.000000]  BIOS-e820: 00000000fed10000 - 00000000fed14000 (reserved)
[    0.000000]  BIOS-e820: 00000000fed18000 - 00000000fed1a000 (reserved)
[    0.000000]  BIOS-e820: 00000000fed1c000 - 00000000fed90000 (reserved)
[    0.000000]  BIOS-e820: 00000000fee00000 - 00000000fee01000 (reserved)
[    0.000000]  BIOS-e820: 00000000ff800000 - 0000000100000000 (reserved)
[    0.000000] DMI present.
[    0.000000] last_pfn =3D 0x7ca00 max_arch_pfn =3D 0x3ffffffff
[    0.000000] init_memory_mapping: 0000000000000000-000000007ca00000
[    0.000000]  0000000000 - 007ca00000 page 2M
[    0.000000] kernel direct mapping tables up to 7ca00000 @ 8000-b000
[    0.000000] last_map_addr: 7ca00000 end: 7ca00000
[    0.000000] ACPI: RSDP 000F73A0, 0024 (r2 LENOVO)
[    0.000000] ACPI: XSDT 7C97BD45, 009C (r1 LENOVO TP-6D        1050  LTP =
       0)
[    0.000000] ACPI: FACP 7C97BF00, 00F4 (r3 LENOVO TP-6D        1050 LNVO =
       1)
[    0.000000] ACPI: DSDT 7C97C2F4, D910 (r1 LENOVO TP-6D        1050 MSFT =
 3000000)
[    0.000000] ACPI: FACS 7C98E000, 0040
[    0.000000] ACPI: SSDT 7C97C0B4, 0240 (r1 LENOVO TP-6D        1050 MSFT =
 3000000)
[    0.000000] ACPI: ECDT 7C989C04, 0052 (r1 LENOVO TP-6D        1050 LNVO =
       1)
[    0.000000] ACPI: APIC 7C989C56, 0078 (r1 LENOVO TP-6D        1050 LNVO =
       1)
[    0.000000] ACPI: MCFG 7C989CCE, 003C (r1 LENOVO TP-6D        1050 LNVO =
       1)
[    0.000000] ACPI: HPET 7C989D0A, 0038 (r1 LENOVO TP-6D        1050 LNVO =
       1)
[    0.000000] ACPI: SLIC 7C989DC2, 0176 (r1 LENOVO TP-6D        1050  LTP =
       0)
[    0.000000] ACPI: BOOT 7C989F38, 0028 (r1 LENOVO TP-6D        1050  LTP =
       1)
[    0.000000] ACPI: ASF! 7C989F60, 00A0 (r16 LENOVO TP-6D        1050 PTL =
        1)
[    0.000000] ACPI: SSDT 7C98D203, 055F (r1 LENOVO TP-6D        1050 INTL =
20050513)
[    0.000000] ACPI: TCPA 7C707000, 0032 (r0                        0      =
       0)
[    0.000000] ACPI: DMAR 7C706000, 0120 (r1               =01        1    =
         0)
[    0.000000] ACPI: SSDT 7C6D3000, 0655 (r1  PmRef    CpuPm     3000 INTL =
20050624)
[    0.000000] ACPI: SSDT 7C6D2000, 0274 (r1  PmRef  Cpu0Tst     3000 INTL =
20050624)
[    0.000000] ACPI: SSDT 7C6D1000, 0242 (r1  PmRef    ApTst     3000 INTL =
20050624)
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] (5 early reservations) =3D=3D> bootmem [0000000000 - 007ca00=
000]
[    0.000000]   #0 [0000000000 - 0000001000]   BIOS data page =3D=3D> [000=
0000000 - 0000001000]
[    0.000000]   #1 [0000006000 - 0000008000]       TRAMPOLINE =3D=3D> [000=
0006000 - 0000008000]
[    0.000000]   #2 [0000200000 - 00006c4f08]    TEXT DATA BSS =3D=3D> [000=
0200000 - 00006c4f08]
[    0.000000]   #3 [000009ec00 - 0000100000]    BIOS reserved =3D=3D> [000=
009ec00 - 0000100000]
[    0.000000]   #4 [0000008000 - 0000009000]          PGTABLE =3D=3D> [000=
0008000 - 0000009000]
[    0.000000] found SMP MP-table at [ffff8800000f73e0] 000f73e0
[    0.000000]  [ffffe20000000000-ffffe20001bfffff] PMD -> [ffff88000120000=
0-ffff880002dfffff] on node 0
[    0.000000] Zone PFN ranges:
[    0.000000]   DMA      0x00000000 -> 0x00001000
[    0.000000]   DMA32    0x00001000 -> 0x00100000
[    0.000000]   Normal   0x00100000 -> 0x00100000
[    0.000000] Movable zone start PFN for each node
[    0.000000] early_node_map[5] active PFN ranges
[    0.000000]     0: 0x00000000 -> 0x0000009e
[    0.000000]     0: 0x00000100 -> 0x0007c4a1
[    0.000000]     0: 0x0007c4a7 -> 0x0007c5b7
[    0.000000]     0: 0x0007c60f -> 0x0007c6c6
[    0.000000]     0: 0x0007c9ff -> 0x0007ca00
[    0.000000] On node 0 totalpages: 509447
[    0.000000]   DMA zone: 56 pages used for memmap
[    0.000000]   DMA zone: 1323 pages reserved
[    0.000000]   DMA zone: 2619 pages, LIFO batch:0
[    0.000000]   DMA32 zone: 6923 pages used for memmap
[    0.000000]   DMA32 zone: 498526 pages, LIFO batch:31
[    0.000000]   Normal zone: 0 pages used for memmap
[    0.000000]   Movable zone: 0 pages used for memmap
[    0.000000] ACPI: PM-Timer IO Port: 0x1008
[    0.000000] ACPI: Local APIC address 0xfee00000
[    0.000000] ACPI: LAPIC (acpi_id[0x00] lapic_id[0x00] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x01] lapic_id[0x01] enabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x02] lapic_id[0x02] disabled)
[    0.000000] ACPI: LAPIC (acpi_id[0x03] lapic_id[0x03] disabled)
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.000000] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.000000] ACPI: IOAPIC (id[0x01] address[0xfec00000] gsi_base[0])
[    0.000000] IOAPIC[0]: apic_id 1, version 0, address 0xfec00000, GSI 0-23
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.000000] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.000000] ACPI: IRQ0 used by override.
[    0.000000] ACPI: IRQ2 used by override.
[    0.000000] ACPI: IRQ9 used by override.
[    0.000000] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.000000] Using ACPI (MADT) for SMP configuration information
[    0.000000] SMP: Allowing 2 CPUs, 0 hotplug CPUs
[    0.000000] Allocating PCI resources starting at 80000000 (gap: 7f000000=
:61000000)
[    0.000000] PERCPU: Allocating 49152 bytes of per cpu data
[    0.000000] NR_CPUS: 2, nr_cpu_ids: 2, nr_node_ids 1
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Tota=
l pages: 501145
[    0.000000] Kernel command line: root=3D/dev/sda1 ro=20
[    0.000000] Initializing CPU#0
[    0.000000] PID hash table entries: 4096 (order: 12, 32768 bytes)
[    0.000000] Extended CMOS year: 2000
[    0.000000] Fast TSC calibration using PIT
[    0.000000] Detected 2261.007 MHz processor.
[    0.004000] Console: colour VGA+ 80x25
[    0.004000] console [tty0] enabled
[    0.004000] Dentry cache hash table entries: 262144 (order: 9, 2097152 b=
ytes)
[    0.004000] Inode-cache hash table entries: 131072 (order: 8, 1048576 by=
tes)
[    0.004000] Memory: 2000056k/2041856k available (2662k kernel code, 4068=
k absent, 37004k reserved, 1296k data, 336k init)
[    0.004000] SLUB: Genslabs=3D12, HWalign=3D64, Order=3D0-3, MinObjects=
=3D0, CPUs=3D2, Nodes=3D1
[    0.004000] hpet clockevent registered
[    0.004000] HPET: 4 timers in total, 0 timers will be used for per-cpu t=
imer
[    0.004000] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4522.01 BogoMIPS (lpj=3D9044028)
[    0.004000] Security Framework initialized
[    0.004000] Mount-cache hash table entries: 256
[    0.004000] CPU: L1 I cache: 32K, L1 D cache: 32K
[    0.004000] CPU: L2 cache: 3072K
[    0.004000] CPU: Physical Processor ID: 0
[    0.004000] CPU: Processor Core ID: 0
[    0.004000] CPU0: Thermal monitoring enabled (TM2)
[    0.004000] using mwait in idle threads.
[    0.004000] ACPI: Core revision 20080926
[    0.048079] Setting APIC routing to flat
[    0.048583] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    0.091699] CPU0: Intel(R) Core(TM)2 Duo CPU     P8400  @ 2.26GHz steppi=
ng 06
[    0.092001] Booting processor 1 APIC 0x1 ip 0x6000
[    0.004000] Initializing CPU#1
[    0.004000] Calibrating delay using timer specific routine.. 4522.03 Bog=
oMIPS (lpj=3D9044078)
[    0.004000] CPU: L1 I cache: 32K, L1 D cache: 32K
[    0.004000] CPU: L2 cache: 3072K
[    0.004000] CPU: Physical Processor ID: 0
[    0.004000] CPU: Processor Core ID: 1
[    0.004000] CPU1: Thermal monitoring enabled (TM2)
[    0.177256] CPU1: Intel(R) Core(TM)2 Duo CPU     P8400  @ 2.26GHz steppi=
ng 06
[    0.178486] checking TSC synchronization [CPU#0 -> CPU#1]: passed.
[    0.180024] Brought up 2 CPUs
[    0.180155] Total of 2 processors activated (9044.05 BogoMIPS).
[    0.180389] net_namespace: 1312 bytes
[    0.184030] regulator: core version 0.5
[    0.184183] NET: Registered protocol family 16
[    0.184214] ACPI FADT declares the system doesn't support PCIe ASPM, so =
disable it
[    0.184224] ACPI: bus type pci registered
[    0.184375] PCI: Using configuration type 1 for base access
[    0.194422] ACPI: EC: EC description table is found, configuring boot EC
[    0.214196] ACPI: BIOS _OSI(Linux) query ignored
[    0.214328] ACPI: DMI System Vendor: LENOVO
[    0.214457] ACPI: DMI Product Name: 7458AH8
[    0.214587] ACPI: DMI Product Version: ThinkPad X200
[    0.214717] ACPI: DMI Board Name: 7458AH8
[    0.214845] ACPI: DMI BIOS Vendor: LENOVO
[    0.214974] ACPI: DMI BIOS Date: 07/30/2008
[    0.215102] ACPI: Please send DMI info above to linux-acpi@vger.kernel.o=
rg
[    0.215236] ACPI: If "acpi_osi=3DLinux" works better, please notify linu=
x-acpi@vger.kernel.org
[    0.216022] ACPI: EC: non-query interrupt received, switching to interru=
pt mode
[    0.232763] ACPI: Interpreter enabled
[    0.232902] ACPI: (supports S0 S3 S5)
[    0.236181] ACPI: Using IOAPIC for interrupt routing
[    0.277266] ACPI: EC: GPE =3D 0x11, I/O: command/status =3D 0x66, data =
=3D 0x62
[    0.277266] ACPI: EC: driver started in interrupt mode
[    0.281251] ACPI: ACPI Dock Station Driver: 3 docks/bays found
[    0.284006] ACPI: PCI Root Bridge [PCI0] (0000:00)
[    0.284130] pci 0000:00:02.0: reg 10 64bit mmio: [0xf2000000-0xf23fffff]
[    0.284145] pci 0000:00:02.0: reg 18 64bit mmio: [0xd0000000-0xdfffffff]
[    0.284155] pci 0000:00:02.0: reg 20 io port: [0x1800-0x1807]
[    0.284218] pci 0000:00:02.1: reg 10 64bit mmio: [0xf2400000-0xf24fffff]
[    0.284315] pci 0000:00:03.0: reg 10 64bit mmio: [0xf2826800-0xf282680f]
[    0.284358] pci 0000:00:03.0: PME# supported from D0 D3hot D3cold
[    0.284495] pci 0000:00:03.0: PME# disabled
[    0.284746] pci 0000:00:19.0: reg 10 32bit mmio: [0xf2600000-0xf261ffff]
[    0.284759] pci 0000:00:19.0: reg 14 32bit mmio: [0xf2625000-0xf2625fff]
[    0.284771] pci 0000:00:19.0: reg 18 io port: [0x1840-0x185f]
[    0.284817] pci 0000:00:19.0: PME# supported from D0 D3hot D3cold
[    0.284953] pci 0000:00:19.0: PME# disabled
[    0.284953] pci 0000:00:1a.0: reg 20 io port: [0x1860-0x187f]
[    0.284953] pci 0000:00:1a.1: reg 20 io port: [0x1880-0x189f]
[    0.284953] pci 0000:00:1a.2: reg 20 io port: [0x18a0-0x18bf]
[    0.288006] pci 0000:00:1a.7: reg 10 32bit mmio: [0xf2826c00-0xf2826fff]
[    0.288006] pci 0000:00:1a.7: PME# supported from D0 D3hot D3cold
[    0.288006] pci 0000:00:1a.7: PME# disabled
[    0.288006] pci 0000:00:1b.0: reg 10 64bit mmio: [0xf2620000-0xf2623fff]
[    0.288006] pci 0000:00:1b.0: PME# supported from D0 D3hot D3cold
[    0.288006] pci 0000:00:1b.0: PME# disabled
[    0.288006] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.288006] pci 0000:00:1c.0: PME# disabled
[    0.288006] pci 0000:00:1c.1: PME# supported from D0 D3hot D3cold
[    0.288006] pci 0000:00:1c.1: PME# disabled
[    0.288006] pci 0000:00:1c.3: PME# supported from D0 D3hot D3cold
[    0.288006] pci 0000:00:1c.3: PME# disabled
[    0.288006] pci 0000:00:1d.0: reg 20 io port: [0x18c0-0x18df]
[    0.288006] pci 0000:00:1d.1: reg 20 io port: [0x18e0-0x18ff]
[    0.288006] pci 0000:00:1d.2: reg 20 io port: [0x1c00-0x1c1f]
[    0.288006] pci 0000:00:1d.7: reg 10 32bit mmio: [0xf2827000-0xf28273ff]
[    0.288006] pci 0000:00:1d.7: PME# supported from D0 D3hot D3cold
[    0.288006] pci 0000:00:1d.7: PME# disabled
[    0.288193] pci 0000:00:1f.2: reg 10 io port: [0x1c48-0x1c4f]
[    0.288205] pci 0000:00:1f.2: reg 14 io port: [0x183c-0x183f]
[    0.288216] pci 0000:00:1f.2: reg 18 io port: [0x1c40-0x1c47]
[    0.288228] pci 0000:00:1f.2: reg 1c io port: [0x1838-0x183b]
[    0.288239] pci 0000:00:1f.2: reg 20 io port: [0x1c20-0x1c3f]
[    0.288251] pci 0000:00:1f.2: reg 24 32bit mmio: [0xf2826000-0xf28267ff]
[    0.288278] pci 0000:00:1f.2: PME# supported from D3hot
[    0.288412] pci 0000:00:1f.2: PME# disabled
[    0.288593] pci 0000:00:1f.3: reg 10 64bit mmio: [0xf2827400-0xf28274ff]
[    0.288620] pci 0000:00:1f.3: reg 20 io port: [0x1c60-0x1c7f]
[    0.288839] pci 0000:03:00.0: reg 10 64bit mmio: [0xf2500000-0xf2501fff]
[    0.288924] pci 0000:03:00.0: PME# supported from D0 D3hot D3cold
[    0.289063] pci 0000:03:00.0: PME# disabled
[    0.289280] pci 0000:00:1c.1: bridge 32bit mmio: [0xf2500000-0xf25fffff]
[    0.292004] pci 0000:00:1c.3: bridge io port: [0x2000-0x2fff]
[    0.292004] pci 0000:00:1c.3: bridge 32bit mmio: [0xf0000000-0xf1ffffff]
[    0.292004] pci 0000:00:1c.3: bridge 64bit mmio pref: [0xf2900000-0xf29f=
ffff]
[    0.292004] pci 0000:00:1e.0: transparent bridge
[    0.292004] bus 00 -> node 0
[    0.292004] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0._PRT]
[    0.292004] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP0._PRT]
[    0.292004] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP1._PRT]
[    0.292004] ACPI: PCI Interrupt Routing Table [\_SB_.PCI0.EXP3._PRT]
[    0.304456] ACPI: PCI Interrupt Link [LNKA] (IRQs 3 4 5 6 7 9 10 *11)
[    0.304456] ACPI: PCI Interrupt Link [LNKB] (IRQs 3 4 5 6 7 9 10 *11)
[    0.305404] ACPI: PCI Interrupt Link [LNKC] (IRQs 3 4 5 6 7 9 10 *11)
[    0.306578] ACPI: PCI Interrupt Link [LNKD] (IRQs 3 4 5 6 7 9 10 *11)
[    0.307753] ACPI: PCI Interrupt Link [LNKE] (IRQs 3 4 5 6 7 9 10 *11)
[    0.308902] ACPI: PCI Interrupt Link [LNKF] (IRQs 3 4 5 6 7 9 10 *11)
[    0.310078] ACPI: PCI Interrupt Link [LNKG] (IRQs 3 4 5 6 7 9 10 *11)
[    0.311252] ACPI: PCI Interrupt Link [LNKH] (IRQs 3 4 5 6 7 9 10 *11)
[    0.312199] ACPI: Power Resource [PUBS] (on)
[    0.316631] SCSI subsystem initialized
[    0.316773] libata version 3.00 loaded.
[    0.316773] PCI: Using ACPI for IRQ routing
[    0.328051] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0, 0
[    0.328410] hpet0: 4 comparators, 64-bit 14.318180 MHz counter
[    0.344015] pnp: PnP ACPI init
[    0.344157] ACPI: bus type pnp registered
[    0.414065] pnp: PnP ACPI: found 10 devices
[    0.414197] ACPI: ACPI bus type pnp unregistered
[    0.414345] system 00:00: iomem range 0x0-0x9ffff could not be reserved
[    0.414480] system 00:00: iomem range 0xc0000-0xc3fff has been reserved
[    0.414615] system 00:00: iomem range 0xc4000-0xc7fff has been reserved
[    0.414749] system 00:00: iomem range 0xc8000-0xcbfff has been reserved
[    0.414884] system 00:00: iomem range 0xcc000-0xcffff has been reserved
[    0.415019] system 00:00: iomem range 0xd0000-0xd3fff has been reserved
[    0.415154] system 00:00: iomem range 0xdc000-0xdffff could not be reser=
ved
[    0.415289] system 00:00: iomem range 0xe0000-0xe3fff could not be reser=
ved
[    0.415425] system 00:00: iomem range 0xe4000-0xe7fff could not be reser=
ved
[    0.415560] system 00:00: iomem range 0xe8000-0xebfff could not be reser=
ved
[    0.415695] system 00:00: iomem range 0xec000-0xeffff could not be reser=
ved
[    0.415830] system 00:00: iomem range 0xf0000-0xfffff could not be reser=
ved
[    0.415966] system 00:00: iomem range 0x100000-0x7effffff could not be r=
eserved
[    0.416194] system 00:00: iomem range 0xfec00000-0xfed3ffff could not be=
 reserved
[    0.416407] system 00:00: iomem range 0xfed4c000-0xffffffff could not be=
 reserved
[    0.416630] system 00:02: ioport range 0x164e-0x164f has been reserved
[    0.416765] system 00:02: ioport range 0x1000-0x107f has been reserved
[    0.416900] system 00:02: ioport range 0x1180-0x11ff has been reserved
[    0.417034] system 00:02: ioport range 0x800-0x80f has been reserved
[    0.417169] system 00:02: ioport range 0x15e0-0x15ef has been reserved
[    0.417303] system 00:02: ioport range 0x1600-0x1641 has been reserved
[    0.417438] system 00:02: ioport range 0x1600-0x161b has been reserved
[    0.417574] system 00:02: iomem range 0xe0000000-0xefffffff has been res=
erved
[    0.417710] system 00:02: iomem range 0xfed1c000-0xfed1ffff has been res=
erved
[    0.417845] system 00:02: iomem range 0xfed10000-0xfed13fff has been res=
erved
[    0.417981] system 00:02: iomem range 0xfed18000-0xfed18fff has been res=
erved
[    0.418117] system 00:02: iomem range 0xfed19000-0xfed19fff has been res=
erved
[    0.418253] system 00:02: iomem range 0xfed45000-0xfed4bfff has been res=
erved
[    0.423973] pci 0000:00:1c.0: PCI bridge, secondary bus 0000:02
[    0.424120] pci 0000:00:1c.0:   IO window: disabled
[    0.424256] pci 0000:00:1c.0:   MEM window: disabled
[    0.424390] pci 0000:00:1c.0:   PREFETCH window: disabled
[    0.424530] pci 0000:00:1c.1: PCI bridge, secondary bus 0000:03
[    0.424662] pci 0000:00:1c.1:   IO window: disabled
[    0.424798] pci 0000:00:1c.1:   MEM window: 0xf2500000-0xf25fffff
[    0.424934] pci 0000:00:1c.1:   PREFETCH window: disabled
[    0.425072] pci 0000:00:1c.3: PCI bridge, secondary bus 0000:05
[    0.425206] pci 0000:00:1c.3:   IO window: 0x2000-0x2fff
[    0.425343] pci 0000:00:1c.3:   MEM window: 0xf0000000-0xf1ffffff
[    0.425479] pci 0000:00:1c.3:   PREFETCH window: 0x000000f2900000-0x0000=
00f29fffff
[    0.425698] pci 0000:00:1e.0: PCI bridge, secondary bus 0000:0d
[    0.425830] pci 0000:00:1e.0:   IO window: disabled
[    0.425965] pci 0000:00:1e.0:   MEM window: disabled
[    0.426098] pci 0000:00:1e.0:   PREFETCH window: disabled
[    0.426252] pci 0000:00:1c.0: PCI INT A -> GSI 20 (level, low) -> IRQ 20
[    0.426391] pci 0000:00:1c.0: setting latency timer to 64
[    0.426406] pci 0000:00:1c.1: PCI INT B -> GSI 21 (level, low) -> IRQ 21
[    0.426544] pci 0000:00:1c.1: setting latency timer to 64
[    0.426559] pci 0000:00:1c.3: PCI INT D -> GSI 23 (level, low) -> IRQ 23
[    0.426697] pci 0000:00:1c.3: setting latency timer to 64
[    0.426708] pci 0000:00:1e.0: setting latency timer to 64
[    0.426715] bus: 00 index 0 io port: [0x00-0xffff]
[    0.426847] bus: 00 index 1 mmio: [0x000000-0xffffffffffffffff]
[    0.426980] bus: 02 index 0 mmio: [0x0-0x0]
[    0.427109] bus: 02 index 1 mmio: [0x0-0x0]
[    0.427239] bus: 02 index 2 mmio: [0x0-0x0]
[    0.427368] bus: 02 index 3 mmio: [0x0-0x0]
[    0.427497] bus: 03 index 0 mmio: [0x0-0x0]
[    0.427627] bus: 03 index 1 mmio: [0xf2500000-0xf25fffff]
[    0.427758] bus: 03 index 2 mmio: [0x0-0x0]
[    0.427887] bus: 03 index 3 mmio: [0x0-0x0]
[    0.428030] bus: 05 index 0 io port: [0x2000-0x2fff]
[    0.428161] bus: 05 index 1 mmio: [0xf0000000-0xf1ffffff]
[    0.428293] bus: 05 index 2 mmio: [0xf2900000-0xf29fffff]
[    0.428424] bus: 05 index 3 mmio: [0x0-0x0]
[    0.428553] bus: 0d index 0 mmio: [0x0-0x0]
[    0.428683] bus: 0d index 1 mmio: [0x0-0x0]
[    0.428811] bus: 0d index 2 mmio: [0x0-0x0]
[    0.428941] bus: 0d index 3 io port: [0x00-0xffff]
[    0.429071] bus: 0d index 4 mmio: [0x000000-0xffffffffffffffff]
[    0.429218] NET: Registered protocol family 2
[    0.468103] IP route cache hash table entries: 65536 (order: 7, 524288 b=
ytes)
[    0.469325] TCP established hash table entries: 262144 (order: 10, 41943=
04 bytes)
[    0.472239] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    0.473193] TCP: Hash tables configured (established 262144 bind 65536)
[    0.473328] TCP reno registered
[    0.484177] NET: Registered protocol family 1
[    0.484741] Simple Boot Flag at 0x35 set to 0x1
[    0.486940] Microcode Update Driver: v2.00 <tigran@aivazian.fsnet.co.uk>=
, Peter Oruba
[    0.492791] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.498935] JFS: nTxBlock =3D 8192, nTxLock =3D 65536
[    0.504114] msgmni has been set to 3907
[    0.504646] io scheduler noop registered
[    0.504777] io scheduler anticipatory registered (default)
[    0.504909] io scheduler deadline registered
[    0.505181] io scheduler cfq registered
[    0.505331] pci 0000:00:02.0: Boot video device
[    0.601528] pcieport-driver 0000:00:1c.0: setting latency timer to 64
[    0.601586] pcieport-driver 0000:00:1c.0: found MSI capability
[    0.601763] pcieport-driver 0000:00:1c.0: irq 47 for MSI/MSI-X
[    0.601786] pci_express 0000:00:1c.0:pcie00: allocate port service
[    0.601885] pci_express 0000:00:1c.0:pcie02: allocate port service
[    0.602053] pcieport-driver 0000:00:1c.1: setting latency timer to 64
[    0.602109] pcieport-driver 0000:00:1c.1: found MSI capability
[    0.602280] pcieport-driver 0000:00:1c.1: irq 46 for MSI/MSI-X
[    0.602303] pci_express 0000:00:1c.1:pcie00: allocate port service
[    0.602388] pci_express 0000:00:1c.1:pcie02: allocate port service
[    0.602554] pcieport-driver 0000:00:1c.3: setting latency timer to 64
[    0.602610] pcieport-driver 0000:00:1c.3: found MSI capability
[    0.602791] pcieport-driver 0000:00:1c.3: irq 45 for MSI/MSI-X
[    0.602814] pci_express 0000:00:1c.3:pcie00: allocate port service
[    0.602906] pci_express 0000:00:1c.3:pcie02: allocate port service
[    0.603876] ACPI: AC Adapter [AC] (off-line)
[    0.614693] Switched to high resolution mode on CPU 1
[    0.616004] Switched to high resolution mode on CPU 0
[    0.634497] ACPI Warning (nspredef-0858): \_SB_.PCI0.LPC_.EC__.BAT0._BIF=
: Return Package type mismatch at index 9 - found Buffer, expected String [=
20080926]
[    0.643759] ACPI: Battery Slot [BAT0] (battery present)
[    0.644165] input: Power Button (FF) as /class/input/input0
[    0.644366] ACPI: Power Button (FF) [PWRF]
[    0.644729] input: Lid Switch as /class/input/input1
[    0.646040] ACPI: Lid Switch [LID]
[    0.646343] input: Sleep Button (CM) as /class/input/input2
[    0.646482] ACPI: Sleep Button (CM) [SLPB]
[    0.648567] ACPI: SSDT 7C6D6C20, 02C8 (r1  PmRef  Cpu0Ist     3000 INTL =
20050624)
[    0.650506] ACPI: SSDT 7C6D4020, 087A (r1  PmRef  Cpu0Cst     3001 INTL =
20050624)
[    0.659312] Monitor-Mwait will be used to enter C-1 state
[    0.659318] Monitor-Mwait will be used to enter C-2 state
[    0.659324] Monitor-Mwait will be used to enter C-3 state
[    0.659332] ACPI: CPU0 (power states: C1[C1] C2[C2] C3[C3])
[    0.659835] processor ACPI_CPU:00: registered as cooling_device0
[    0.659979] ACPI: Processor [CPU0] (supports 8 throttling states)
[    0.661838] ACPI: SSDT 7C6D5CA0, 01CF (r1  PmRef    ApIst     3000 INTL =
20050624)
[    0.663551] ACPI: SSDT 7C6D5F20, 008D (r1  PmRef    ApCst     3000 INTL =
20050624)
[    0.668327] ACPI: CPU1 (power states: C1[C1] C2[C2] C3[C3])
[    0.668742] processor ACPI_CPU:01: registered as cooling_device1
[    0.668879] ACPI: Processor [CPU1] (supports 8 throttling states)
[    0.714404] Marking TSC unstable due to possible TSC halt in C2
[    0.720482] thermal LNXTHERM:01: registered as thermal_zone0
[    0.725248] ACPI: Thermal Zone [THM0] (26 C)
[    0.727937] thermal LNXTHERM:02: registered as thermal_zone1
[    0.730954] ACPI: Thermal Zone [THM1] (31 C)
[    0.841581] Linux agpgart interface v0.103
[    1.000079] Clocksource tsc unstable (delta =3D -171011533 ns)
[    3.856119] floppy0: no floppy controllers found
[    3.860808] brd: module loaded
[    3.861214] Uniform Multi-Platform E-IDE driver
[    3.861589] ide-gd driver 1.18
[    3.862174] Driver 'sd' needs updating - please use bus_type methods
[    3.862462] ahci 0000:00:1f.2: version 3.0
[    3.862489] ahci 0000:00:1f.2: PCI INT B -> GSI 16 (level, low) -> IRQ 16
[    3.862707] ahci 0000:00:1f.2: irq 44 for MSI/MSI-X
[    3.862810] ahci 0000:00:1f.2: AHCI 0001.0200 32 slots 4 ports 3 Gbps 0x=
3 impl SATA mode
[    3.863025] ahci 0000:00:1f.2: flags: 64bit ncq sntf stag pm led clo pio=
 slum part=20
[    3.863241] ahci 0000:00:1f.2: setting latency timer to 64
[    3.863624] scsi0 : ahci
[    3.864047] scsi1 : ahci
[    3.864453] scsi2 : ahci
[    3.864801] scsi3 : ahci
[    3.866521] ata1: SATA max UDMA/133 abar m2048@0xf2826000 port 0xf282610=
0 irq 44
[    3.866734] ata2: SATA max UDMA/133 abar m2048@0xf2826000 port 0xf282618=
0 irq 44
[    3.866946] ata3: DUMMY
[    3.867072] ata4: DUMMY
[    4.184130] ata1: SATA link up 1.5 Gbps (SStatus 113 SControl 300)
[    4.222850] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 succeeded
[    4.222857] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 filtered out
[    4.223138] ata1.00: ACPI cmd ef/5f:00:00:00:00:a0 succeeded
[    4.223144] ata1.00: ACPI cmd ef/10:03:00:00:00:a0 filtered out
[    4.224106] ata1.00: ATA-8: ST9250827AS, 3.CMF, max UDMA/100
[    4.226455] ata1.00: 488397168 sectors, multi 16: LBA48 NCQ (depth 31/32)
[    4.256115] ata1.00: ACPI cmd ef/02:00:00:00:00:a0 succeeded
[    4.256121] ata1.00: ACPI cmd f5/00:00:00:00:00:a0 filtered out
[    4.256421] ata1.00: ACPI cmd ef/5f:00:00:00:00:a0 succeeded
[    4.256427] ata1.00: ACPI cmd ef/10:03:00:00:00:a0 filtered out
[    4.257437] ata1.00: configured for UDMA/100
[    4.273676] ata1.00: configured for UDMA/100
[    4.273807] ata1: EH complete
[    4.592087] ata2: SATA link down (SStatus 0 SControl 300)
[    4.624324] scsi 0:0:0:0: Direct-Access     ATA      ST9250827AS      3.=
CM PQ: 0 ANSI: 5
[    4.625031] sd 0:0:0:0: [sda] 488397168 512-byte hardware sectors: (250 =
GB/232 GiB)
[    4.625275] sd 0:0:0:0: [sda] Write Protect is off
[    4.625407] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    4.625455] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[    4.625768] sd 0:0:0:0: [sda] 488397168 512-byte hardware sectors: (250 =
GB/232 GiB)
[    4.626007] sd 0:0:0:0: [sda] Write Protect is off
[    4.626138] sd 0:0:0:0: [sda] Mode Sense: 00 3a 00 00
[    4.626185] sd 0:0:0:0: [sda] Write cache: enabled, read cache: enabled,=
 doesn't support DPO or FUA
[    4.626401]  sda: sda1 sda2 sda3
[    4.667337] sd 0:0:0:0: [sda] Attached SCSI disk
[    4.667896] Fusion MPT base driver 3.04.07
[    4.668043] Copyright (c) 1999-2008 LSI Corporation
[    4.668187] Fusion MPT SPI Host driver 3.04.07
[    4.669474] ieee1394: raw1394: /dev/raw1394 device initialized
[    4.670014] PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x60,0x64 =
irq 1,12
[    4.681156] serio: i8042 KBD port at 0x60,0x64 irq 1
[    4.681296] serio: i8042 AUX port at 0x60,0x64 irq 12
[    4.681855] mice: PS/2 mouse device common for all mice
[    4.721854] oprofile: using NMI interrupt.
[    4.722644] TCP cubic registered
[    4.722778] NET: Registered protocol family 17
[    4.724905] registered taskstats version 1
[    4.727339] input: AT Translated Set 2 keyboard as /class/input/input3
[    4.971058] elantech.c: unexpected magic knock result 0x00, 0x02, 0x64.
[    5.268283] IBM TrackPoint firmware: 0x0e, buttons: 3/3
[    5.285997] input: TPPS/2 IBM TrackPoint as /class/input/input4
[    5.434889] VFS: Mounted root (jfs filesystem) readonly.
[    5.435048] Freeing unused kernel memory: 336k freed
[    8.235701] Non-volatile memory driver v1.2
[    8.435576] thinkpad_acpi: ThinkPad ACPI Extras v0.21
[    8.435682] thinkpad_acpi: http://ibm-acpi.sf.net/
[    8.435785] thinkpad_acpi: ThinkPad BIOS 6DET28WW (1.05 ), EC 7XHT21WW-1=
=2E03
[    8.435891] thinkpad_acpi: Lenovo ThinkPad X200, model 7458AH8
[    8.436713] thinkpad_acpi: radio switch found; radios are disabled
[    8.436931] thinkpad_acpi: This ThinkPad has standard ACPI backlight bri=
ghtness control, supported by the ACPI video driver
[    8.437108] thinkpad_acpi: Disabling thinkpad-acpi brightness events by =
default...
[    8.444491] Registered led device: tpacpi::thinklight
[    8.444633] Registered led device: tpacpi::power
[    8.444751] Registered led device: tpacpi:orange:batt
[    8.444873] Registered led device: tpacpi:green:batt
[    8.444993] Registered led device: tpacpi::dock_active
[    8.445119] Registered led device: tpacpi::bay_active
[    8.445240] Registered led device: tpacpi::dock_batt
[    8.445368] Registered led device: tpacpi::unknown_led
[    8.445488] Registered led device: tpacpi::standby
[    8.447822] thinkpad_acpi: Standard ACPI backlight interface available, =
not loading native one.
[    8.448248] input: ThinkPad Extra Buttons as /class/input/input5
[    8.698471] agpgart-intel 0000:00:00.0: Intel Mobile Intel? GM45 Express=
 Chipset
[    8.699516] agpgart-intel 0000:00:00.0: detected 32764K stolen memory
[    8.702630] agpgart-intel 0000:00:00.0: AGP aperture is 256M @ 0xd0000000
[    8.822428] ACPI: WMI: Mapper loaded
[    8.854880] e1000e: Intel(R) PRO/1000 Network Driver - 0.3.3.3-k6
[    8.854997] e1000e: Copyright (c) 1999-2008 Intel Corporation.
[    8.855133] e1000e 0000:00:19.0: PCI INT A -> GSI 20 (level, low) -> IRQ=
 20
[    8.855243] e1000e 0000:00:19.0: setting latency timer to 64
[    8.855334] e1000e 0000:00:19.0: irq 43 for MSI/MSI-X
[    8.925051] usbcore: registered new interface driver usbfs
[    8.925176] usbcore: registered new interface driver hub
[    8.942380] 0000:00:19.0: eth0: (PCI Express:2.5GB/s:Width x1) 00:1f:16:=
09:46:11
[    8.942544] 0000:00:19.0: eth0: Intel(R) PRO/1000 Network Connection
[    8.942669] 0000:00:19.0: eth0: MAC: 6, PHY: 8, PBA No: 1008ff-0ff
[    8.942889] usbcore: registered new device driver usb
[    9.125998] acpi device:03: registered as cooling_device2
[    9.126334] input: Video Bus as /class/input/input6
[    9.161089] ACPI: Video Device [VID] (multi-head: yes  rom: no  post: no)
[    9.232910] uhci_hcd: USB Universal Host Controller Interface driver
[    9.233542] uhci_hcd 0000:00:1a.0: power state changed by ACPI to D0
[    9.233657] uhci_hcd 0000:00:1a.0: PCI INT A -> GSI 20 (level, low) -> I=
RQ 20
[    9.233768] uhci_hcd 0000:00:1a.0: setting latency timer to 64
[    9.233770] uhci_hcd 0000:00:1a.0: UHCI Host Controller
[    9.233909] uhci_hcd 0000:00:1a.0: new USB bus registered, assigned bus =
number 1
[    9.234102] uhci_hcd 0000:00:1a.0: irq 20, io base 0x00001860
[    9.234317] usb usb1: configuration #1 chosen from 1 choice
[    9.234442] hub 1-0:1.0: USB hub found
[    9.234545] hub 1-0:1.0: 2 ports detected
[    9.234746] uhci_hcd 0000:00:1a.1: PCI INT B -> GSI 21 (level, low) -> I=
RQ 21
[    9.234854] uhci_hcd 0000:00:1a.1: setting latency timer to 64
[    9.234857] uhci_hcd 0000:00:1a.1: UHCI Host Controller
[    9.234975] uhci_hcd 0000:00:1a.1: new USB bus registered, assigned bus =
number 2
[    9.235164] uhci_hcd 0000:00:1a.1: irq 21, io base 0x00001880
[    9.235338] usb usb2: configuration #1 chosen from 1 choice
[    9.235461] hub 2-0:1.0: USB hub found
[    9.235564] hub 2-0:1.0: 2 ports detected
[    9.236374] uhci_hcd 0000:00:1a.2: power state changed by ACPI to D0
[    9.236488] uhci_hcd 0000:00:1a.2: PCI INT C -> GSI 22 (level, low) -> I=
RQ 22
[    9.236604] uhci_hcd 0000:00:1a.2: setting latency timer to 64
[    9.236607] uhci_hcd 0000:00:1a.2: UHCI Host Controller
[    9.236737] uhci_hcd 0000:00:1a.2: new USB bus registered, assigned bus =
number 3
[    9.236935] uhci_hcd 0000:00:1a.2: irq 22, io base 0x000018a0
[    9.237128] usb usb3: configuration #1 chosen from 1 choice
[    9.237255] hub 3-0:1.0: USB hub found
[    9.237361] hub 3-0:1.0: 2 ports detected
[    9.238040] uhci_hcd 0000:00:1d.0: power state changed by ACPI to D0
[    9.238152] uhci_hcd 0000:00:1d.0: PCI INT A -> GSI 16 (level, low) -> I=
RQ 16
[    9.238260] uhci_hcd 0000:00:1d.0: setting latency timer to 64
[    9.238262] uhci_hcd 0000:00:1d.0: UHCI Host Controller
[    9.238382] uhci_hcd 0000:00:1d.0: new USB bus registered, assigned bus =
number 4
[    9.238570] uhci_hcd 0000:00:1d.0: irq 16, io base 0x000018c0
[    9.238735] usb usb4: configuration #1 chosen from 1 choice
[    9.238858] hub 4-0:1.0: USB hub found
[    9.238960] hub 4-0:1.0: 2 ports detected
[    9.239138] uhci_hcd 0000:00:1d.1: PCI INT B -> GSI 17 (level, low) -> I=
RQ 17
[    9.239245] uhci_hcd 0000:00:1d.1: setting latency timer to 64
[    9.239248] uhci_hcd 0000:00:1d.1: UHCI Host Controller
[    9.239365] uhci_hcd 0000:00:1d.1: new USB bus registered, assigned bus =
number 5
[    9.239553] uhci_hcd 0000:00:1d.1: irq 17, io base 0x000018e0
[    9.239716] usb usb5: configuration #1 chosen from 1 choice
[    9.239839] hub 5-0:1.0: USB hub found
[    9.239941] hub 5-0:1.0: 2 ports detected
[    9.240133] uhci_hcd 0000:00:1d.2: PCI INT C -> GSI 18 (level, low) -> I=
RQ 18
[    9.240241] uhci_hcd 0000:00:1d.2: setting latency timer to 64
[    9.240244] uhci_hcd 0000:00:1d.2: UHCI Host Controller
[    9.240362] uhci_hcd 0000:00:1d.2: new USB bus registered, assigned bus =
number 6
[    9.240550] uhci_hcd 0000:00:1d.2: irq 18, io base 0x00001c00
[    9.240714] usb usb6: configuration #1 chosen from 1 choice
[    9.240837] hub 6-0:1.0: USB hub found
[    9.240939] hub 6-0:1.0: 2 ports detected
[    9.305706] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    9.305812] Warning! ehci_hcd should always be loaded before uhci_hcd an=
d ohci_hcd, not after
[    9.307064] ehci_hcd 0000:00:1a.7: power state changed by ACPI to D0
[    9.307174] ehci_hcd 0000:00:1a.7: PCI INT D -> GSI 23 (level, low) -> I=
RQ 23
[    9.307296] ehci_hcd 0000:00:1a.7: setting latency timer to 64
[    9.307299] ehci_hcd 0000:00:1a.7: EHCI Host Controller
[    9.307429] ehci_hcd 0000:00:1a.7: new USB bus registered, assigned bus =
number 7
[    9.311488] ehci_hcd 0000:00:1a.7: debug port 1
[    9.311592] ehci_hcd 0000:00:1a.7: cache line size of 32 is not supported
[    9.311606] ehci_hcd 0000:00:1a.7: irq 23, io mem 0xf2826c00
[    9.325011] ehci_hcd 0000:00:1a.7: USB 2.0 started, EHCI 1.00
[    9.325226] usb usb7: configuration #1 chosen from 1 choice
[    9.325352] hub 7-0:1.0: USB hub found
[    9.325455] hub 7-0:1.0: 6 ports detected
[    9.326103] ehci_hcd 0000:00:1d.7: power state changed by ACPI to D0
[    9.326215] ehci_hcd 0000:00:1d.7: PCI INT D -> GSI 19 (level, low) -> I=
RQ 19
[    9.326336] ehci_hcd 0000:00:1d.7: setting latency timer to 64
[    9.326339] ehci_hcd 0000:00:1d.7: EHCI Host Controller
[    9.326463] ehci_hcd 0000:00:1d.7: new USB bus registered, assigned bus =
number 8
[    9.330531] ehci_hcd 0000:00:1d.7: debug port 1
[    9.330636] ehci_hcd 0000:00:1d.7: cache line size of 32 is not supported
[    9.330650] ehci_hcd 0000:00:1d.7: irq 19, io mem 0xf2827000
[    9.345011] ehci_hcd 0000:00:1d.7: USB 2.0 started, EHCI 1.00
[    9.345224] usb usb8: configuration #1 chosen from 1 choice
[    9.345350] hub 8-0:1.0: USB hub found
[    9.345454] hub 8-0:1.0: 6 ports detected
[    9.349085] Monitor-Mwait will be used to enter C-3 state
[    9.376051] cfg80211: Calling CRDA to update world regulatory domain
[    9.442967] input: PC Speaker as /class/input/input7
[    9.568059] rtc_cmos 00:07: RTC can wake from S4
[    9.568248] rtc_cmos 00:07: rtc core: registered rtc_cmos as rtc0
[    9.568374] rtc0: alarms up to one month, y3k, 114 bytes nvram, hpet irqs
[    9.606910] i801_smbus 0000:00:1f.3: PCI INT A -> GSI 23 (level, low) ->=
 IRQ 23
[    9.749034] usb 7-6: new high speed USB device using ehci_hcd and addres=
s 3
[    9.815916] iwlagn: Intel(R) Wireless WiFi Link AGN driver for Linux, 1.=
3.27ks
[    9.816112] iwlagn: Copyright(c) 2003-2008 Intel Corporation
[    9.816307] iwlagn 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ=
 17
[    9.816424] iwlagn 0000:03:00.0: setting latency timer to 64
[    9.816471] iwlagn: Detected Intel Wireless WiFi Link 5300AGN REV=3D0x24
[    9.845352] iwlagn: Tunable channels: 13 802.11bg, 24 802.11a channels
[    9.845661] iwlagn 0000:03:00.0: PCI INT A disabled
[    9.846057] phy0: Selected rate control algorithm 'iwl-agn-rs'
[    9.885656] usb 7-6: configuration #1 chosen from 1 choice
[    9.952849] HDA Intel 0000:00:1b.0: PCI INT B -> GSI 17 (level, low) -> =
IRQ 17
[    9.953097] HDA Intel 0000:00:1b.0: setting latency timer to 64
[    9.997044] usb 8-2: new high speed USB device using ehci_hcd and addres=
s 2
[   10.149083] usb 8-2: configuration #1 chosen from 1 choice
[   10.294459] usbcore: registered new interface driver libusual
[   10.319472] Initializing USB Mass Storage driver...
[   10.324927] usb-storage: probe of 8-2:1.0 failed with error -5
[   10.325071] usbcore: registered new interface driver usb-storage
[   10.325180] USB Mass Storage support registered.
[   10.389082] usb 2-1: new full speed USB device using uhci_hcd and addres=
s 2
[   10.558552] usb 2-1: configuration #1 chosen from 1 choice
[   10.561713] usb 8-2: USB disconnect, address 2
[   10.800077] usb 8-2: new high speed USB device using ehci_hcd and addres=
s 3
[   10.946545] usb 8-2: configuration #1 chosen from 1 choice
[   11.017508] scsi5 : SCSI emulation for USB Mass Storage devices
[   11.041435] usb-storage: device found at 3
[   11.041440] usb-storage: waiting for device to settle before scanning
[   11.236436] usbcore: registered new interface driver usbserial
[   11.236607] usbserial: USB Serial Driver core
[   11.244437] USB Serial support registered for Sierra USB modem
[   11.244570] sierra 8-2:1.0: Sierra USB modem converter detected
[   11.245349] usb 8-2: Sierra USB modem converter now attached to ttyUSB0
[   11.245470] sierra 8-2:1.1: Sierra USB modem converter detected
[   11.246150] usb 8-2: Sierra USB modem converter now attached to ttyUSB1
[   11.246271] sierra 8-2:1.2: Sierra USB modem converter detected
[   11.247146] usb 8-2: Sierra USB modem converter now attached to ttyUSB2
[   11.247264] sierra 8-2:1.3: Sierra USB modem converter detected
[   11.248123] usb 8-2: Sierra USB modem converter now attached to ttyUSB3
[   11.248239] sierra 8-2:1.4: Sierra USB modem converter detected
[   11.249155] usb 8-2: Sierra USB modem converter now attached to ttyUSB4
[   11.249271] sierra 8-2:1.5: Sierra USB modem converter detected
[   11.250156] usb 8-2: Sierra USB modem converter now attached to ttyUSB5
[   11.250272] sierra 8-2:1.6: Sierra USB modem converter detected
[   11.251182] usb 8-2: Sierra USB modem converter now attached to ttyUSB6
[   11.251305] usbcore: registered new interface driver sierra
[   11.251408] sierra: v.1.3.2:USB Driver for Sierra Wireless USB modems
[   13.575192] loop: module loaded
[   14.151343] device-mapper: ioctl: 4.14.0-ioctl (2008-04-23) initialised:=
 dm-devel@redhat.com
[   16.041722] isa bounce pool size: 16 pages
[   16.043541] scsi 5:0:0:0: Direct-Access     SWI      SD Card          2.=
31 PQ: 0 ANSI: 2
[   16.048830] sd 5:0:0:0: [sdb] Attached SCSI removable disk
[   16.051049] usb-storage: device scan complete
[  211.758878] alg: No test for stdrng (krng)
[  211.801167] alg: No test for stdrng (ansi_cprng)
[  213.628721] Adding 4982032k swap on /dev/mapper/swap.  Priority:-1 exten=
ts:1 across:4982032k
[  216.553472] e1000e 0000:00:19.0: irq 43 for MSI/MSI-X
[  216.609131] e1000e 0000:00:19.0: irq 43 for MSI/MSI-X
[  220.472528] NET: Registered protocol family 10
[  220.473700] lo: Disabled Privacy Extensions
[  220.474826] ADDRCONF(NETDEV_UP): eth0: link is not ready
[  223.334511] thinkpad_acpi: setting the hotkey mask to 0x00ffffff is like=
ly not the best way to go about it
[  223.334735] thinkpad_acpi: please consider using the driver defaults, an=
d refer to up-to-date thinkpad-acpi documentation
[  223.398518] input: /usr/sbin/thinkpad-keys as /class/input/input8
[  229.643535] warning: `avahi-daemon' uses 32-bit capabilities (legacy sup=
port in use)
[  231.689201] Bluetooth: Core ver 2.13
[  231.691510] NET: Registered protocol family 31
[  231.691645] Bluetooth: HCI device and connection manager initialized
[  231.691782] Bluetooth: HCI socket layer initialized
[  231.714432] Bluetooth: L2CAP ver 2.11
[  231.714534] Bluetooth: L2CAP socket layer initialized
[  231.752397] Bluetooth: RFCOMM socket layer initialized
[  231.752530] Bluetooth: RFCOMM TTY layer initialized
[  231.752631] Bluetooth: RFCOMM ver 1.10
[  232.111560] iwlagn 0000:03:00.0: PCI INT A -> GSI 17 (level, low) -> IRQ=
 17
[  232.111785] iwlagn 0000:03:00.0: restoring config space at offset 0x1 (w=
as 0x100102, writing 0x100106)
[  232.111894] iwlagn 0000:03:00.0: irq 42 for MSI/MSI-X
[  232.111973] iwlagn 0000:03:00.0: firmware: requesting iwlwifi-5000-1.uco=
de
[  232.323534] iwlagn: Radio disabled by HW RF Kill switch
[  232.334174] ------------[ cut here ]------------
[  232.334313] WARNING: at net/mac80211/main.c:227 ieee80211_hw_config+0x71=
/0x79 [mac80211]()
[  232.334526] Modules linked in: rfcomm l2cap bluetooth uinput autofs4 ipv=
6 cpufreq_powersave sha256_generic ansi_cprng krng chainiv rng aes_x86_64 a=
es_generic cbc dm_crypt dm_mod md_mod loop sierra usbserial usb_storage lib=
usual arc4 ecb cryptomgr aead crypto_blkcipher snd_hda_intel snd_pcm snd_pa=
ge_alloc snd_hwdep iwlagn iwlcore snd_seq snd_timer snd_seq_device snd mac8=
0211 i2c_i801 rtc_cmos rtc_core rtc_lib pcspkr soundcore i2c_core cfg80211 =
ehci_hcd uhci_hcd video output usbcore e1000e wmi intel_agp thinkpad_acpi r=
fkill hwmon backlight led_class nvram
[  232.338195] Pid: 5463, comm: NetworkManager Not tainted 2.6.28-rc6-wl-de=
nkbrett-21906-g24e8b9a #1
[  232.338409] Call Trace:
[  232.338545]  [<ffffffff80233025>] warn_on_slowpath+0x51/0x75
[  232.338683]  [<ffffffff804322d8>] qdisc_create_dflt+0x34/0x4a
[  232.338830]  [<ffffffffa0154e48>] iwl_mac_config+0x219/0x236 [iwlagn]
[  232.338983]  [<ffffffffa00dc764>] ieee80211_hw_config+0x71/0x79 [mac8021=
1]
[  232.339139]  [<ffffffffa00e79d8>] ieee80211_open+0x5b5/0x6c5 [mac80211]
[  232.339277]  [<ffffffff8043a421>] __nla_reserve+0x1e/0x46
[  232.339412]  [<ffffffff80423176>] dev_open+0x74/0xb0
[  232.339544]  [<ffffffff80422b76>] dev_change_flags+0xab/0x169
[  232.339680]  [<ffffffff8042a295>] do_setlink+0x2b6/0x383
[  232.339815]  [<ffffffff8042b1d2>] rtnetlink_rcv_msg+0x0/0x1ea
[  232.339949]  [<ffffffff8042a4ec>] rtnl_setlink+0x10b/0x10d
[  232.340109]  [<ffffffff8042b1d2>] rtnetlink_rcv_msg+0x0/0x1ea
[  232.340243]  [<ffffffff8043a27d>] netlink_rcv_skb+0x34/0x7f
[  232.340378]  [<ffffffff8042b1cc>] rtnetlink_rcv+0x1f/0x25
[  232.340512]  [<ffffffff80439d7a>] netlink_unicast+0x203/0x274
[  232.340647]  [<ffffffff8041c951>] __alloc_skb+0x61/0x123
[  232.340781]  [<ffffffff8043a056>] netlink_sendmsg+0x26b/0x27e
[  232.340921]  [<ffffffff8047be19>] unix_stream_recvmsg+0x4ef/0x605
[  232.341103]  [<ffffffff80415fe7>] sock_sendmsg+0xe2/0xff
[  232.341246]  [<ffffffff8024567c>] autoremove_wake_function+0x0/0x2e
[  232.341410]  [<ffffffff8026dd05>] __do_fault+0x37e/0x3c6
[  232.341570]  [<ffffffff8026f906>] handle_mm_fault+0x3a3/0x746
[  232.341748]  [<ffffffff80480a76>] wext_handle_ioctl+0x33/0x67
[  232.341894]  [<ffffffff80415118>] move_addr_to_kernel+0x25/0x36
[  232.342041]  [<ffffffff8041621b>] sys_sendmsg+0x217/0x28a
[  232.342192]  [<ffffffff8043910e>] netlink_insert+0xfe/0x121
[  232.342343]  [<ffffffff80416c11>] move_addr_to_user+0x41/0x58
[  232.342493]  [<ffffffff804170cd>] sys_getsockname+0x7a/0xaa
[  232.342647]  [<ffffffff8020b3fb>] system_call_fastpath+0x16/0x1b
[  232.342798] ---[ end trace 9e0d1a6acdac0e1e ]---
[  232.343687] ADDRCONF(NETDEV_UP): wlan0: link is not ready

--5mCyUwZo2JvN/JJP--

--vGgW1X5XWziG23Ko
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk3vZYACgkQuL75KpiFGIxtWwCgkEiYiwJNvUVriLpRCwqR8sZK
8ngAn1/NdoO3KfhKdmZLylPBe6T0S7BE
=HR0e
-----END PGP SIGNATURE-----

--vGgW1X5XWziG23Ko--
