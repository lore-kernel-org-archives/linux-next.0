From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: PCI failure with virtual machine (new as of the past few days
 -next)
Date: Thu, 3 Dec 2009 17:14:21 +0000
Message-ID: <20091203171421.59f85d8b@lxorguk.ukuu.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
Sender: linux-pci-owner@vger.kernel.org
To: jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org


8139cp: 10/100 PCI Ethernet driver v1.3 (Mar 22, 2004)
8139cp 0000:00:03.0: PCI INT A -> Link[LNKC] -> GSI 11 (level, high) -> IRQ 11
8139cp 0000:00:03.0: PCI INT A disabled
8139cp: probe of 0000:00:03.0 failed with error -22

The PCI configuration looks like this (with an older working kernel)

00:00.0 Host bridge: Intel Corporation 440FX - 82441FX PMC [Natoma] (rev 02)
	Subsystem: Qumranet, Inc. Qemu virtual machine
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
00: 86 80 37 12 00 00 00 00 02 00 00 06 00 00 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:01.0 ISA bridge: Intel Corporation 82371SB PIIX3 ISA [Natoma/Triton II]
	Subsystem: Qumranet, Inc. Qemu virtual machine
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
00: 86 80 00 70 07 00 00 02 00 00 01 06 00 00 80 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:01.1 IDE interface: Intel Corporation 82371SB PIIX3 IDE [Natoma/Triton II] (prog-if 80 [Master])
	Subsystem: Qumranet, Inc. Qemu virtual machine
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Region 0: [virtual] Memory at 000001f0 (32-bit, non-prefetchable) [size=8]
	Region 1: [virtual] Memory at 000003f0 (type 3, non-prefetchable) [size=1]
	Region 2: [virtual] Memory at 00000170 (32-bit, non-prefetchable) [size=8]
	Region 3: [virtual] Memory at 00000370 (type 3, non-prefetchable) [size=1]
	Region 4: I/O ports at c000 [size=16]
	Kernel driver in use: ata_piix
	Kernel modules: ata_generic, pata_acpi
00: 86 80 10 70 05 00 80 02 00 80 01 01 00 00 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 01 c0 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:01.2 USB Controller: Intel Corporation 82371SB PIIX3 USB [Natoma/Triton II] (rev 01) (prog-if 00 [UHCI])
	Subsystem: Qumranet, Inc. Qemu virtual machine
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0
	Interrupt: pin D routed to IRQ 11
	Region 4: I/O ports at c020 [size=32]
	Kernel driver in use: uhci_hcd
00: 86 80 20 70 05 00 00 00 01 00 03 0c 00 00 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 21 c0 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 04 00 00

00:01.3 Bridge: Intel Corporation 82371AB/EB/MB PIIX4 ACPI (rev 03)
	Subsystem: Qumranet, Inc. Qemu virtual machine
	Physical Slot: 1
	Control: I/O- Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 9
	Kernel driver in use: piix4_smbus
	Kernel modules: i2c-piix4
00: 86 80 13 71 00 00 80 02 03 00 80 06 00 00 00 00
10: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 00 00 00 00 00 00 00 00 09 01 00 00

00:02.0 VGA compatible controller: Cirrus Logic GD 5446 (prog-if 00 [VGA controller])
	Subsystem: Qumranet, Inc. Device 1100
	Physical Slot: 2
	Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Region 0: Memory at f0000000 (32-bit, prefetchable) [size=32M]
	Region 1: Memory at f2000000 (32-bit, non-prefetchable) [size=4K]
	Expansion ROM at <unassigned> [disabled]
	Kernel modules: cirrusfb
00: 13 10 b8 00 03 00 00 00 00 00 00 03 00 00 00 00
10: 08 00 00 f0 00 00 00 f2 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00

00:03.0 Ethernet controller: Realtek Semiconductor Co., Ltd. RTL-8139/8139C/8139C+ (rev 20)
	Subsystem: Qumranet, Inc. Device 1100
	Physical Slot: 3
	Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0, Cache Line Size: 32 bytes
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at c100 [size=256]
	Region 1: Memory at f2001000 (32-bit, non-prefetchable) [size=256]
	Kernel driver in use: 8139cp
	Kernel modules: 8139too, 8139cp
00: ec 10 39 81 07 00 00 00 20 00 00 02 08 00 00 00
10: 01 c1 00 00 00 10 00 f2 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 00 11
30: 00 00 00 00 dc 00 00 00 00 00 00 00 0b 01 00 00

00:04.0 Multimedia audio controller: Ensoniq ES1370 [AudioPCI]
	Subsystem: Device 4942:4c4c
	Physical Slot: 4
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=slow >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Latency: 0 (3000ns min, 32000ns max)
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at c200 [size=256]
	Kernel driver in use: ENS1370
	Kernel modules: snd-ens1370
00: 74 12 00 50 05 00 00 04 00 00 01 04 00 00 00 00
10: 01 c2 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 42 49 4c 4c
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 01 0c 80

00:05.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 5
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	Region 0: I/O ports at c400 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 c4 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0a 01 00 00

00:06.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 6
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	Region 0: I/O ports at c800 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 c8 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0a 01 00 00

00:07.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 7
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at cc00 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 cc 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 01 00 00

00:08.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 8
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at d000 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 d0 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 01 00 00

00:09.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 9
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	Region 0: I/O ports at d400 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 d4 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0a 01 00 00

00:0a.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 10
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	Region 0: I/O ports at d800 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 d8 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0a 01 00 00

00:0b.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 11
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at dc00 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 dc 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 01 00 00

00:0c.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 12
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at e000 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 e0 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 01 00 00

00:0d.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 13
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	Region 0: I/O ports at e400 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 e4 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0a 01 00 00

00:0e.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 14
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 10
	Region 0: I/O ports at e800 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 e8 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0a 01 00 00

00:0f.0 SCSI storage controller: Qumranet, Inc. Virtio block device
	Subsystem: Qumranet, Inc. Device 0002
	Physical Slot: 15
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at ec00 [size=1K]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 01 10 01 00 00 00 00 00 00 01 00 00 00 00
10: 01 ec 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 02 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 01 00 00

00:10.0 RAM memory: Qumranet, Inc. Virtio memory balloon
	Subsystem: Qumranet, Inc. Device 0005
	Physical Slot: 16
	Control: I/O+ Mem- BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
	Status: Cap- 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
	Interrupt: pin A routed to IRQ 11
	Region 0: I/O ports at f000 [size=32]
	Kernel driver in use: virtio-pci
	Kernel modules: virtio_pci
00: f4 1a 02 10 01 00 00 00 00 00 00 05 00 00 00 00
10: 01 f0 00 00 00 00 00 00 00 00 00 00 00 00 00 00
20: 00 00 00 00 00 00 00 00 00 00 00 00 f4 1a 05 00
30: 00 00 00 00 00 00 00 00 00 00 00 00 0b 01 00 00
