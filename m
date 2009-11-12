From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: rr/sparc tree build failure
Date: Thu, 12 Nov 2009 19:30:58 +1100
Message-ID: <20091112193058.73942a58.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45705 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752583AbZKLIay (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 12 Nov 2009 03:30:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>

Hi Rusty, Dave,

Today's linux-next build (sparc64 defconfig) failed like this:

.tmp_exports-asm.o: In function `__ksymtab_pci_alloc_consistent':
(__ksymtab_sorted+0x6650): undefined reference to `pci_alloc_consistent'
.tmp_exports-asm.o: In function `__ksymtab_pci_dma_supported':
(__ksymtab_sorted+0x6810): undefined reference to `pci_dma_supported'
.tmp_exports-asm.o: In function `__ksymtab_pci_dma_sync_sg_for_cpu':
(__ksymtab_sorted+0x6820): undefined reference to `pci_dma_sync_sg_for_cpu'
.tmp_exports-asm.o: In function `__ksymtab_pci_dma_sync_single_for_cpu':
(__ksymtab_sorted+0x6830): undefined reference to `pci_dma_sync_single_for_cpu'
.tmp_exports-asm.o: In function `__ksymtab_pci_free_consistent':
(__ksymtab_sorted+0x6910): undefined reference to `pci_free_consistent'
.tmp_exports-asm.o: In function `__ksymtab_pci_map_sg':
(__ksymtab_sorted+0x69b0): undefined reference to `pci_map_sg'
.tmp_exports-asm.o: In function `__ksymtab_pci_map_single':
(__ksymtab_sorted+0x69c0): undefined reference to `pci_map_single'
.tmp_exports-asm.o: In function `__ksymtab_pci_unmap_sg':
(__ksymtab_sorted+0x6c40): undefined reference to `pci_unmap_sg'
.tmp_exports-asm.o: In function `__ksymtab_pci_unmap_single':
(__ksymtab_sorted+0x6c50): undefined reference to `pci_unmap_single'

Caused by sparc64 exporting static inline functions.  This has interacted
with changes in the rr tree to produce these errors.

I have applied this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 12 Nov 2009 19:26:14 +1100
Subject: [PATCH] sparc64: don't export static inline pci_ functions

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/sparc/kernel/pci.c            |    1 -
 arch/sparc/kernel/sparc_ksyms_64.c |   12 ------------
 2 files changed, 0 insertions(+), 13 deletions(-)

diff --git a/arch/sparc/kernel/pci.c b/arch/sparc/kernel/pci.c
index b85374f..539e83f 100644
--- a/arch/sparc/kernel/pci.c
+++ b/arch/sparc/kernel/pci.c
@@ -1064,7 +1064,6 @@ int pci64_dma_supported(struct pci_dev *pdev, u64 device_mask)
 
 	return (device_mask & dma_addr_mask) == dma_addr_mask;
 }
-EXPORT_SYMBOL(pci_dma_supported);
 
 void pci_resource_to_user(const struct pci_dev *pdev, int bar,
 			  const struct resource *rp, resource_size_t *start,
diff --git a/arch/sparc/kernel/sparc_ksyms_64.c b/arch/sparc/kernel/sparc_ksyms_64.c
index 0f26066..372ad59 100644
--- a/arch/sparc/kernel/sparc_ksyms_64.c
+++ b/arch/sparc/kernel/sparc_ksyms_64.c
@@ -38,17 +38,5 @@ EXPORT_SYMBOL(sun4v_niagara_setperf);
 EXPORT_SYMBOL(sun4v_niagara2_getperf);
 EXPORT_SYMBOL(sun4v_niagara2_setperf);
 
-#ifdef CONFIG_PCI
-/* inline functions in asm/pci_64.h */
-EXPORT_SYMBOL(pci_alloc_consistent);
-EXPORT_SYMBOL(pci_free_consistent);
-EXPORT_SYMBOL(pci_map_single);
-EXPORT_SYMBOL(pci_unmap_single);
-EXPORT_SYMBOL(pci_map_sg);
-EXPORT_SYMBOL(pci_unmap_sg);
-EXPORT_SYMBOL(pci_dma_sync_single_for_cpu);
-EXPORT_SYMBOL(pci_dma_sync_sg_for_cpu);
-#endif
-
 /* Exporting a symbol from /init/main.c */
 EXPORT_SYMBOL(saved_command_line);
-- 
1.6.5.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
