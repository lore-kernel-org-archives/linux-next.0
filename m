From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the arm64 tree with Linus' tree
Date: Tue, 22 Mar 2016 10:15:49 +1100
Message-ID: <20160322101549.48ee810d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58373 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751007AbcCUXPx (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Mar 2016 19:15:53 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Will Deacon <will.deacon@arm.com>

Hi Catalin,

Today's linux-next merge of the arm64 tree got a conflict in:

  arch/arm64/mm/init.c

between commit:

  dfd55ad85e4a ("arm64: vmemmap: use virtual projection of linear region")

from Linus' tree and commit:

  f09f1bacfe2b ("arm64: Split pr_notice("Virtual kernel memory layout...") into multiple pr_cont()")

from the arm64 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/arm64/mm/init.c
index 61a38eaf0895,d09603d0e5e9..000000000000
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@@ -362,42 -362,38 +362,38 @@@ void __init mem_init(void
  #define MLG(b, t) b, t, ((t) - (b)) >> 30
  #define MLK_ROUNDUP(b, t) b, t, DIV_ROUND_UP(((t) - (b)), SZ_1K)
  
- 	pr_notice("Virtual kernel memory layout:\n"
+ 	pr_notice("Virtual kernel memory layout:\n");
  #ifdef CONFIG_KASAN
- 		  "    kasan   : 0x%16lx - 0x%16lx   (%6ld GB)\n"
+ 	pr_cont("    kasan   : 0x%16lx - 0x%16lx   (%6ld GB)\n",
+ 		MLG(KASAN_SHADOW_START, KASAN_SHADOW_END));
  #endif
- 		  "    modules : 0x%16lx - 0x%16lx   (%6ld MB)\n"
- 		  "    vmalloc : 0x%16lx - 0x%16lx   (%6ld GB)\n"
- 		  "      .text : 0x%p" " - 0x%p" "   (%6ld KB)\n"
- 		  "    .rodata : 0x%p" " - 0x%p" "   (%6ld KB)\n"
- 		  "      .init : 0x%p" " - 0x%p" "   (%6ld KB)\n"
- 		  "      .data : 0x%p" " - 0x%p" "   (%6ld KB)\n"
+ 	pr_cont("    modules : 0x%16lx - 0x%16lx   (%6ld MB)\n",
+ 		MLM(MODULES_VADDR, MODULES_END));
+ 	pr_cont("    vmalloc : 0x%16lx - 0x%16lx   (%6ld GB)\n",
+ 		MLG(VMALLOC_START, VMALLOC_END));
+ 	pr_cont("      .text : 0x%p" " - 0x%p" "   (%6ld KB)\n"
+ 		"    .rodata : 0x%p" " - 0x%p" "   (%6ld KB)\n"
+ 		"      .init : 0x%p" " - 0x%p" "   (%6ld KB)\n"
+ 		"      .data : 0x%p" " - 0x%p" "   (%6ld KB)\n",
+ 		MLK_ROUNDUP(_text, __start_rodata),
+ 		MLK_ROUNDUP(__start_rodata, _etext),
+ 		MLK_ROUNDUP(__init_begin, __init_end),
+ 		MLK_ROUNDUP(_sdata, _edata));
  #ifdef CONFIG_SPARSEMEM_VMEMMAP
- 		  "    vmemmap : 0x%16lx - 0x%16lx   (%6ld GB maximum)\n"
- 		  "              0x%16lx - 0x%16lx   (%6ld MB actual)\n"
+ 	pr_cont("    vmemmap : 0x%16lx - 0x%16lx   (%6ld GB maximum)\n"
+ 		"              0x%16lx - 0x%16lx   (%6ld MB actual)\n",
 -		MLG((unsigned long)vmemmap,
 -		    (unsigned long)vmemmap + VMEMMAP_SIZE),
++		MLG(VMEMMAP_START,
++		    VMEMMAP_START + VMEMMAP_SIZE),
+ 		MLM((unsigned long)phys_to_page(memblock_start_of_DRAM()),
+ 		    (unsigned long)virt_to_page(high_memory)));
  #endif
- 		  "    fixed   : 0x%16lx - 0x%16lx   (%6ld KB)\n"
- 		  "    PCI I/O : 0x%16lx - 0x%16lx   (%6ld MB)\n"
- 		  "    memory  : 0x%16lx - 0x%16lx   (%6ld MB)\n",
- #ifdef CONFIG_KASAN
- 		  MLG(KASAN_SHADOW_START, KASAN_SHADOW_END),
- #endif
- 		  MLM(MODULES_VADDR, MODULES_END),
- 		  MLG(VMALLOC_START, VMALLOC_END),
- 		  MLK_ROUNDUP(_text, __start_rodata),
- 		  MLK_ROUNDUP(__start_rodata, _etext),
- 		  MLK_ROUNDUP(__init_begin, __init_end),
- 		  MLK_ROUNDUP(_sdata, _edata),
- #ifdef CONFIG_SPARSEMEM_VMEMMAP
- 		  MLG(VMEMMAP_START,
- 		      VMEMMAP_START + VMEMMAP_SIZE),
- 		  MLM((unsigned long)phys_to_page(memblock_start_of_DRAM()),
- 		      (unsigned long)virt_to_page(high_memory)),
- #endif
- 		  MLK(FIXADDR_START, FIXADDR_TOP),
- 		  MLM(PCI_IO_START, PCI_IO_END),
- 		  MLM(__phys_to_virt(memblock_start_of_DRAM()),
- 		      (unsigned long)high_memory));
+ 	pr_cont("    fixed   : 0x%16lx - 0x%16lx   (%6ld KB)\n",
+ 		MLK(FIXADDR_START, FIXADDR_TOP));
+ 	pr_cont("    PCI I/O : 0x%16lx - 0x%16lx   (%6ld MB)\n",
+ 		MLM(PCI_IO_START, PCI_IO_END));
+ 	pr_cont("    memory  : 0x%16lx - 0x%16lx   (%6ld MB)\n",
+ 		MLM(__phys_to_virt(memblock_start_of_DRAM()),
+ 		    (unsigned long)high_memory));
  
  #undef MLK
  #undef MLM
