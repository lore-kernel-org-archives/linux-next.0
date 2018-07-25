From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Jul 25
Date: Wed, 25 Jul 2018 06:32:57 -0700
Message-ID: <20180725133257.GA29961@roeck-us.net>
References: <20180725164408.371c73fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180725164408.371c73fb@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Wed, Jul 25, 2018 at 04:44:08PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180724:
> 
> Dropped trees: xarray, ida (complex conflicts)
> 
> The xarray tree still had its complex conflicts against the nvdimm tree
> so I have dropped it again for today (along with the ida tree that is
> built on top of it).
> 
> The akpm-current tree still had its build failure for which I reverted
> a commit.
> 
> Non-merge commits (relative to Linus' tree): 8119
>  7489 files changed, 334256 insertions(+), 150745 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Build results:
	total: 134 pass: 125 fail: 9
Failed builds: 
	alpha:allmodconfig 
	arm:axm55xx_defconfig
	arm:keystone_defconfig
	parisc:allmodconfig 
	s390:allmodconfig 
	sparc32:allmodconfig 
	sparc64:allmodconfig 
	unicore32:defconfig 
	unicore32:allnoconfig 
Qemu test results:
	total: 172 pass: 172 fail: 0

---
alpha:allmodconfig, parisc:allmodconfig, sparc64:allmodconfig:

drivers/mtd/nand/raw/s3c2410.c: In function 's3c2410_nand_read_buf':
drivers/mtd/nand/raw/s3c2410.c:674:2: error:
	implicit declaration of function 'readsb'; did you mean 'readb'?
drivers/mtd/nand/raw/s3c2410.c: In function 's3c2440_nand_read_buf':
drivers/mtd/nand/raw/s3c2410.c:681:2: error:
	implicit declaration of function 'readsl'; did you mean 'readl'?
drivers/mtd/nand/raw/s3c2410.c: In function 's3c2410_nand_write_buf':
drivers/mtd/nand/raw/s3c2410.c:696:2: error:
	implicit declaration of function 'writesb'; did you mean 'writeb'?
drivers/mtd/nand/raw/s3c2410.c: In function 's3c2440_nand_write_buf':
drivers/mtd/nand/raw/s3c2410.c:704:2: error:
	implicit declaration of function 'writesl'; did you mean 'writel'

---
arm:axm55xx_defconfig, arm:keystone_defconfig:

mm/memory.c: In function 'tlb_remove_table_smp_sync':
mm/memory.c:339:2: error:
	implicit declaration of function 'tlb_flush_remove_tables_local'; did you mean 'tlb_remove_table'?
mm/memory.c: In function 'tlb_table_flush':
mm/memory.c:372:2: error:
	implicit declaration of function 'tlb_flush_remove_tables'; did you mean 'tlb_remove_table'?

---
s390:allmodconfig:

drivers/fsi/fsi-master-ast-cf.c:440:13: error: conflicting types for 'dump_trace'
 static void dump_trace(struct fsi_master_acf *master)
              ^~~~~~~~~~
In file included from include/linux/mutex.h:19:0,
	from include/linux/kernfs.h:13,
	from include/linux/sysfs.h:16,
	from include/linux/kobject.h:20,
	from include/linux/device.h:16,
	from drivers/fsi/fsi-master-ast-cf.c:9:
arch/s390/include/asm/processor.h:216:6: note:
	previous declaration of 'dump_trace' was here
void dump_trace(dump_trace_func_t func, void *data,

---
sparc32:allmodconfig:

arch/sparc/kernel/head_32.o: In function `current_pc':
arch/sparc/kernel/.tmp_head_32.o:(.head.text+0x5040): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
arch/sparc/kernel/head_32.o: In function `halt_notsup':
arch/sparc/kernel/.tmp_head_32.o:(.head.text+0x5100): relocation truncated to fit: R_SPARC_WDISP22 against `.init.text'
arch/sparc/kernel/head_32.o: In function `leon_init':
arch/sparc/kernel/.tmp_head_32.o:(.init.text+0xa4): relocation truncated to fit: R_SPARC_WDISP22 against symbol `leon_smp_cpu_startup' defined in .text section
in arch/sparc/kernel/trampoline_32.o
arch/sparc/kernel/process_32.o:(.fixup+0x4): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/process_32.o:(.fixup+0xc): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/signal_32.o:(.fixup+0x0): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/signal_32.o:(.fixup+0x8): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/signal_32.o:(.fixup+0x10): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/signal_32.o:(.fixup+0x18): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/signal_32.o:(.fixup+0x20): relocation truncated to fit: R_SPARC_WDISP22 against `.text'
arch/sparc/kernel/signal_32.o:(.fixup+0x28): additional relocation overflows omitted from the output

---
unicore32:defconfig, unicore32:allnoconfig:

In file included from include/linux/mm.h:17,
                 from arch/unicore32/kernel/asm-offsets.c:17:
include/linux/mm_types.h:497: error:
	flexible array member in otherwise empty struct

---
>From qemu log for arm:integratorcp:integrator_defconfig:

Console: colour dummy device 80x30
------------[ cut here ]------------
WARNING: CPU: 0 PID: 0 at kernel/time/sched_clock.c:180
sched_clock_register+0x44/0x278
Modules linked in:
CPU: 0 PID: 0 Comm: swapper Not tainted 4.18.0-rc6-next-20180725 #1
Hardware name: ARM Integrator/CP (Device Tree)
[<c0010cb4>] (unwind_backtrace) from [<c000dc24>] (show_stack+0x10/0x18)
[<c000dc24>] (show_stack) from [<c03ff6d4>] (dump_stack+0x18/0x24)
[<c03ff6d4>] (dump_stack) from [<c001a000>] (__warn+0xc8/0xf0)
[<c001a000>] (__warn) from [<c001a13c>] (warn_slowpath_null+0x3c/0x4c)
[<c001a13c>] (warn_slowpath_null) from [<c052367c>] (sched_clock_register+0x44/0x278)
[<c052367c>] (sched_clock_register) from [<c05238d8>] (generic_sched_clock_init+0x28/0x88)
[<c05238d8>] (generic_sched_clock_init) from [<c0521a00>] (sched_clock_init+0x54/0x74)
[<c0521a00>] (sched_clock_init) from [<c0519c18>] (start_kernel+0x310/0x3e4)
[<c0519c18>] (start_kernel) from [<00000000>] (  (null))
---[ end trace 08080eb81afa002c ]---

---

Complete daily logs are available at http://kerneltests.org/builders.

Guenter
