From: Subrata Modak <subrata@linux.vnet.ibm.com>
Subject: Next April 7 : x86_64 randconfig failure
Date: Tue, 07 Apr 2009 18:41:01 +0530
Message-ID: <1239109861.11996.0.camel@subratamodak.linux.ibm.com>
References: <1239106436.5300.33.camel@subratamodak.linux.ibm.com>
Reply-To: subrata@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e4.ny.us.ibm.com ([32.97.182.144]:37434 "EHLO e4.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752154AbZDGNLF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 7 Apr 2009 09:11:05 -0400
In-Reply-To: <1239106436.5300.33.camel@subratamodak.linux.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next <linux-next@vger.kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Sachin P Sant <sachinp@linux.vnet.ibm.com>, Alexander Beregalov <a.beregalov@gmail.com>

Another error observed:

arch/x86/kernel/built-in.o: In function `lapic_suspend':
apic.c:(.text+0x16586): undefined reference to `intr_remapping_enabled'
apic.c:(.text+0x1658e): undefined reference to `disable_intr_remapping'
arch/x86/kernel/built-in.o: In function `lapic_resume':
apic.c:(.text+0x168ac): undefined reference to `intr_remapping_enabled'
apic.c:(.text+0x168b9): undefined reference to `reenable_intr_remapping=
'
arch/x86/kernel/built-in.o: In function `set_ioapic_affinity_irq_desc':
io_apic.c:(.text+0x18c77): undefined reference to `irq_remapped'
arch/x86/kernel/built-in.o: In function
`set_ir_ioapic_affinity_irq_desc':
io_apic.c:(.text+0x19402): undefined reference to `get_irte'
io_apic.c:(.text+0x19453): undefined reference to `modify_irte'
arch/x86/kernel/built-in.o: In function `destroy_irq':
(.text+0x1951b): undefined reference to `free_irte'
arch/x86/kernel/built-in.o: In function `disable_IO_APIC':
(.text+0x198a3): undefined reference to `intr_remapping_enabled'
arch/x86/kernel/built-in.o: In function `disable_IO_APIC':
(.text+0x198df): undefined reference to `intr_remapping_enabled'
arch/x86/kernel/built-in.o: In function `setup_ioapic_entry':
(.text+0x19951): undefined reference to `intr_remapping_enabled'
arch/x86/kernel/built-in.o: In function `setup_ioapic_entry':
(.text+0x19974): undefined reference to `map_ioapic_to_ir'
arch/x86/kernel/built-in.o: In function `setup_ioapic_entry':
(.text+0x19995): undefined reference to `alloc_irte'
arch/x86/kernel/built-in.o: In function `setup_ioapic_entry':
(.text+0x19a06): undefined reference to `modify_irte'
arch/x86/kernel/built-in.o: In function `setup_IO_APIC_irq':
io_apic.c:(.text+0x19c23): undefined reference to `irq_remapped'
arch/x86/kernel/built-in.o: In function `pci_iommu_init':
pci-dma.c:(.init.text+0x312c): undefined reference to
`dmar_dev_scope_init'
arch/x86/kernel/built-in.o: In function `pci_iommu_alloc':
(.init.text+0x31ac): undefined reference to `detect_intel_iommu'
arch/x86/kernel/built-in.o: In function `enable_IR_x2apic':
(.init.text+0x8de4): undefined reference to `dmar_table_init'
arch/x86/kernel/built-in.o: In function `enable_IR_x2apic':
(.init.text+0x8e73): undefined reference to `enable_intr_remapping'
arch/x86/kernel/built-in.o: In function `default_setup_apic_routing':
(.init.text+0x9512): undefined reference to `intr_remapping_enabled'
arch/x86/kernel/built-in.o: In function `default_setup_apic_routing':
(.init.text+0x951a): undefined reference to `enable_drhd_fault_handling=
'
arch/x86/kernel/built-in.o: In function `setup_timer_IRQ0_pin':
io_apic.c:(.init.text+0xab52): undefined reference to
`intr_remapping_enabled'
arch/x86/kernel/built-in.o: In function `setup_ioapic_dest':
(.init.text+0xadbf): undefined reference to `intr_remapping_enabled'
arch/x86/kernel/built-in.o: In function `setup_IO_APIC':
(.init.text+0xb1b6): undefined reference to `intr_remapping_enabled'
arch/x86/kernel/built-in.o: In function `setup_IO_APIC':
(.init.text+0xb294): undefined reference to `intr_remapping_enabled'
make: *** [.tmp_vmlinux1] Error 1

Regards--
Subrata

On Tue, 2009-04-07 at 17:44 +0530, Subrata Modak wrote:
> Hi,
>=20
> Reporting another build error for x86_64 with April 07 next tree
> configured for randconfig.
>=20
> aicasm_symbol.c:48:19: error: aicdb.h: No such file or directory
> aicasm_symbol.c:63: error: expected =E2=80=98=3D=E2=80=99, =E2=80=98,=
=E2=80=99, =E2=80=98;=E2=80=99, =E2=80=98asm=E2=80=99 or
> =E2=80=98__attribute__=E2=80=99 before =E2=80=98*=E2=80=99 token
> aicasm_symbol.c: In function =E2=80=98symbol_delete=E2=80=99:
> aicasm_symbol.c:87: error: =E2=80=98symtable=E2=80=99 undeclared (fir=
st use in this
> function)
> aicasm_symbol.c:87: error: (Each undeclared identifier is reported on=
ly
> once
> aicasm_symbol.c:87: error: for each function it appears in.)
> aicasm_symbol.c:88: error: =E2=80=98DBT=E2=80=99 undeclared (first us=
e in this function)
> aicasm_symbol.c:88: error: expected =E2=80=98;=E2=80=99 before =E2=80=
=98key=E2=80=99
> aicasm_symbol.c:90: error: =E2=80=98key=E2=80=99 undeclared (first us=
e in this function)
> aicasm_symbol.c: In function =E2=80=98symtable_open=E2=80=99:
> aicasm_symbol.c:134: error: =E2=80=98symtable=E2=80=99 undeclared (fi=
rst use in this
> function)
> aicasm_symbol.c:135: error: =E2=80=98DB_HASH=E2=80=99 undeclared (fir=
st use in this
> function)
> aicasm_symbol.c: In function =E2=80=98symtable_close=E2=80=99:
> aicasm_symbol.c:148: error: =E2=80=98symtable=E2=80=99 undeclared (fi=
rst use in this
> function)
> aicasm_symbol.c:149: error: =E2=80=98DBT=E2=80=99 undeclared (first u=
se in this
> function)
> aicasm_symbol.c:149: error: expected =E2=80=98;=E2=80=99 before =E2=80=
=98key=E2=80=99
> aicasm_symbol.c:150: error: expected =E2=80=98;=E2=80=99 before =E2=80=
=98data=E2=80=99
> aicasm_symbol.c:152: error: =E2=80=98key=E2=80=99 undeclared (first u=
se in this
> function)
> aicasm_symbol.c:152: error: =E2=80=98data=E2=80=99 undeclared (first =
use in this
> function)
> aicasm_symbol.c:152: error: =E2=80=98R_FIRST=E2=80=99 undeclared (fir=
st use in this
> function)
> aicasm_symbol.c: In function =E2=80=98symtable_get=E2=80=99:
> aicasm_symbol.c:170: error: =E2=80=98DBT=E2=80=99 undeclared (first u=
se in this
> function)
> aicasm_symbol.c:170: error: expected =E2=80=98;=E2=80=99 before =E2=80=
=98key=E2=80=99
> aicasm_symbol.c:171: error: expected =E2=80=98;=E2=80=99 before =E2=80=
=98data=E2=80=99
> aicasm_symbol.c:174: error: =E2=80=98key=E2=80=99 undeclared (first u=
se in this
> function)
> aicasm_symbol.c:177: error: =E2=80=98symtable=E2=80=99 undeclared (fi=
rst use in this
> function)
> aicasm_symbol.c:177: error: =E2=80=98data=E2=80=99 undeclared (first =
use in this
> function)
> aicasm_symbol.c: In function =E2=80=98symtable_dump=E2=80=99:
> aicasm_symbol.c:479: error: =E2=80=98DBT=E2=80=99 undeclared (first u=
se in this
> function)
> aicasm_symbol.c:479: error: expected =E2=80=98;=E2=80=99 before =E2=80=
=98key=E2=80=99
> aicasm_symbol.c:480: error: expected =E2=80=98;=E2=80=99 before =E2=80=
=98data=E2=80=99
> aicasm_symbol.c:485: error: =E2=80=98symtable=E2=80=99 undeclared (fi=
rst use in this
> function)
> aicasm_symbol.c:494: error: =E2=80=98R_FIRST=E2=80=99 undeclared (fir=
st use in this
> function)
> aicasm_symbol.c:495: error: =E2=80=98key=E2=80=99 undeclared (first u=
se in this
> function)
> aicasm_symbol.c:495: error: =E2=80=98data=E2=80=99 undeclared (first =
use in this
> function)
> aicasm_symbol.c:532: error: =E2=80=98R_NEXT=E2=80=99 undeclared (firs=
t use in this
> function)
> make[4]: *** [aicasm] Error 1
> make[3]: *** [drivers/scsi/aic7xxx/aicasm/aicasm] Error 2
> make[2]: *** [drivers/scsi/aic7xxx] Error 2
> make[1]: *** [drivers/scsi] Error 2
> make: *** [drivers] Error 2
>=20
> Regards--
> Subrata
>=20
