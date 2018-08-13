From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: linux-next: Tree for Aug 13
Date: Mon, 13 Aug 2018 06:23:25 -0700
Message-ID: <20180813132325.GA28657@roeck-us.net>
References: <20180813193201.2b392cce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180813193201.2b392cce@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Aug 13, 2018 at 07:32:01PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180810:
> 
> The ida tree lost its build failure.
> 
> The akpm-current tree gained conflicts against the block tree and a
> build failure due to an interaction with the userns tree for which I
> applied a merge fix patch.
> 
> Non-merge commits (relative to Linus' tree): 11957
>  10727 files changed, 510277 insertions(+), 209635 deletions(-)
> 
> ----------------------------------------------------------------------------
> 

Complete report, given this is probably the base of v4.19-rc1.

Guenter

---

Build results:
	total: 134 pass: 127 fail: 7
Failed builds: 
	m68k:allmodconfig 
	powerpc:ppc6xx_defconfig
	s390:allmodconfig 
	sparc32:allmodconfig 
	unicore32:defconfig 
	unicore32:allnoconfig 
	xtensa:allmodconfig 
Qemu test results:
	total: 297 pass: 297 fail: 0

---
m68k:allmodconfig, powerpc:ppc6xx_defconfig, xtensa:allmodconfig:

drivers/net/virtio_net.c: In function 'virtnet_set_affinity':
drivers/net/virtio_net.c:1916:10: error: implicit declaration of function 'cpumask_next_wrap'

s390:allmodconfig:

drivers/net/ethernet/microchip/lan743x_ethtool.c:
	In function 'lan743x_ethtool_get_ts_info':
drivers/net/ethernet/microchip/lan743x_ethtool.c:558:19: error:
	'struct lan743x_ptp' has no member named 'ptp_clock'`

[multiple instances in several files]

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
linux/mm_types.h:500: error: flexible array member in otherwise empty struct

[maybe due to gcc version 4.4.2, more recent toolchain not available]

======

Runtime warnings:

arm:smdkc210:exynos_defconfig:exynos4210-smdkv310:

[   10.857719] ------------[ cut here ]------------
[   10.861967] WARNING: CPU: 0 PID: 82 at kernel/locking/lockdep.c:2876 __irq_svc+0x8c/0xb0
[   10.862450] DEBUG_LOCKS_WARN_ON(current->hardirq_context)
...
[   10.869031] [<c0101a0c>] (__irq_svc) from [<c0512004>] (s3c24xx_serial_tx_chars+0x1b8/0x204)
[   10.869369] [<c0512004>] (s3c24xx_serial_tx_chars) from [<c05135a0>] (s3c64xx_serial_handle_irq+0x34/0x60)
[   10.869729] [<c05135a0>] (s3c64xx_serial_handle_irq) from [<c01957a4>] (__handle_irq_event_percpu+0x84/0x46c)
[   10.870093] [<c01957a4>] (__handle_irq_event_percpu) from [<c0195bb8>] (handle_irq_event_percpu+0x2c/0x7c)
[   10.870446] [<c0195bb8>] (handle_irq_event_percpu) from [<c0195c40>] (handle_irq_event+0x38/0x5c)
[   10.870831] [<c0195c40>] (handle_irq_event) from [<c0199684>] (handle_fasteoi_irq+0xb8/0x16c)
[   10.871193] [<c0199684>] (handle_fasteoi_irq) from [<c0194920>] (generic_handle_irq+0x24/0x34)
[   10.871569] [<c0194920>] (generic_handle_irq) from [<c0194f3c>] (__handle_domain_irq+0x7c/0xec)
[   10.871879] [<c0194f3c>] (__handle_domain_irq) from [<c04962d8>] (gic_handle_irq+0x58/0x9c)
[   10.872170] [<c04962d8>] (gic_handle_irq) from [<c01019f0>] (__irq_svc+0x70/0xb0)

---
sh:

WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 ohci_init+0x194/0x2d0
...
Call trace:
 [<(ptrval)>] usb_add_hcd+0x1e8/0x6ec
 [<(ptrval)>] _dev_info+0x0/0x54
 [<(ptrval)>] arch_local_save_flags+0x0/0x8
 [<(ptrval)>] arch_local_irq_restore+0x0/0x24
 [<(ptrval)>] ohci_hcd_sm501_drv_probe+0x114/0x2d8

[several associated instances]

WARNING: CPU: 0 PID: 1 at mm/slab.c:2666 cache_alloc_refill+0x8a/0x594
...
Call trace:
 [<(ptrval)>] arch_local_irq_restore+0x0/0x24
 [<(ptrval)>] arch_local_save_flags+0x0/0x8
 [<(ptrval)>] kmem_cache_alloc+0x72/0xac
 [<(ptrval)>] arch_local_irq_restore+0x0/0x24
 [<(ptrval)>] mm_init.isra.6+0xb4/0x104

---
sparc32:

WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 esp_sbus_probe+0x408/0x6e8

WARNING: CPU: 0 PID: 1 at ./include/linux/dma-mapping.h:516 sparc_lance_probe_one+0x428/0x4f4
