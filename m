From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Thu, 2 Nov 2017 18:19:14 +1100
Message-ID: <20171102181914.3121e876@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52901 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750836AbdKBHTR (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Thu, 2 Nov 2017 03:19:17 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pavel Tatashin <pasha.tatashin@oracle.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/x86/mm/kasan_init_64.c

between commit:

  12a8cc7fcf54 ("x86/kasan: Use the same shadow offset for 4- and 5-level paging")

from the tip tree and commit:

  3af83426c380 ("x86/kasan: add and use kasan_map_populate()")

from the akpm-current tree.

I fixed it up (hopefully - see below) and can carry the fix as
necessary. This is now fixed as far as linux-next is concerned, but any
non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc arch/x86/mm/kasan_init_64.c
index fe5760db7b19,9778fec8a5dc..000000000000
--- a/arch/x86/mm/kasan_init_64.c
+++ b/arch/x86/mm/kasan_init_64.c
@@@ -15,8 -15,73 +15,75 @@@
  
  extern struct range pfn_mapped[E820_MAX_ENTRIES];
  
 +static p4d_t tmp_p4d_table[PTRS_PER_P4D] __initdata __aligned(PAGE_SIZE);
 +
+ /* Creates mappings for kasan during early boot. The mapped memory is zeroed */
+ static int __meminit kasan_map_populate(unsigned long start, unsigned long end,
+ 					int node)
+ {
+ 	unsigned long addr, pfn, next;
+ 	unsigned long long size;
+ 	pgd_t *pgd;
+ 	p4d_t *p4d;
+ 	pud_t *pud;
+ 	pmd_t *pmd;
+ 	pte_t *pte;
+ 	int ret;
+ 
+ 	ret = vmemmap_populate(start, end, node);
+ 	/*
+ 	 * We might have partially populated memory, so check for no entries,
+ 	 * and zero only those that actually exist.
+ 	 */
+ 	for (addr = start; addr < end; addr = next) {
+ 		pgd = pgd_offset_k(addr);
+ 		if (pgd_none(*pgd)) {
+ 			next = pgd_addr_end(addr, end);
+ 			continue;
+ 		}
+ 
+ 		p4d = p4d_offset(pgd, addr);
+ 		if (p4d_none(*p4d)) {
+ 			next = p4d_addr_end(addr, end);
+ 			continue;
+ 		}
+ 
+ 		pud = pud_offset(p4d, addr);
+ 		if (pud_none(*pud)) {
+ 			next = pud_addr_end(addr, end);
+ 			continue;
+ 		}
+ 		if (pud_large(*pud)) {
+ 			/* This is PUD size page */
+ 			next = pud_addr_end(addr, end);
+ 			size = PUD_SIZE;
+ 			pfn = pud_pfn(*pud);
+ 		} else {
+ 			pmd = pmd_offset(pud, addr);
+ 			if (pmd_none(*pmd)) {
+ 				next = pmd_addr_end(addr, end);
+ 				continue;
+ 			}
+ 			if (pmd_large(*pmd)) {
+ 				/* This is PMD size page */
+ 				next = pmd_addr_end(addr, end);
+ 				size = PMD_SIZE;
+ 				pfn = pmd_pfn(*pmd);
+ 			} else {
+ 				pte = pte_offset_kernel(pmd, addr);
+ 				next = addr + PAGE_SIZE;
+ 				if (pte_none(*pte))
+ 					continue;
+ 				/* This is base size page */
+ 				size = PAGE_SIZE;
+ 				pfn = pte_pfn(*pte);
+ 			}
+ 		}
+ 		memset(phys_to_virt(PFN_PHYS(pfn)), 0, size);
+ 	}
+ 	return ret;
+ }
+ 
  static int __init map_range(struct range *range)
  {
  	unsigned long start;
