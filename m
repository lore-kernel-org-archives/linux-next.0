From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure
Date: Fri, 25 Jul 2008 16:45:33 +1000
Message-ID: <20080725164533.808c209a.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45424 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751477AbYGYGph (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 25 Jul 2008 02:45:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>

Hi all,

Today's linux-next build (powerpc ppc44x_config) failed like this:

mm/migrate.c: In function 'remove_migration_pte':
mm/migrate.c:195: error: implicit declaration of function 'update_mmu_cache'

I applied the patch below from Benjamin Herrenschmidt (which he will send
to Linus).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

>From 1e3519f8e1baec0b733cd42684fcd3d9681662f1 Mon Sep 17 00:00:00 2001
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Fri, 25 Jul 2008 16:21:11 +1000
Subject: [PATCH] Move update_mmu_cache() declaration from tlbflush.h to pgtable.h
where it belongs. This fixes some build problems on some configs

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 include/asm-powerpc/pgtable.h  |   13 +++++++++++++
 include/asm-powerpc/tlbflush.h |   11 -----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/include/asm-powerpc/pgtable.h b/include/asm-powerpc/pgtable.h
index d18ffe7..dbb8ca1 100644
--- a/include/asm-powerpc/pgtable.h
+++ b/include/asm-powerpc/pgtable.h
@@ -38,6 +38,19 @@ extern void paging_init(void);
 		remap_pfn_range(vma, vaddr, pfn, size, prot)
 
 #include <asm-generic/pgtable.h>
+
+
+/*
+ * This gets called at the end of handling a page fault, when
+ * the kernel has put a new PTE into the page table for the process.
+ * We use it to ensure coherency between the i-cache and d-cache
+ * for the page which has just been mapped in.
+ * On machines which use an MMU hash table, we use this to put a
+ * corresponding HPTE into the hash table ahead of time, instead of
+ * waiting for the inevitable extra hash-table miss exception.
+ */
+extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __KERNEL__ */
diff --git a/include/asm-powerpc/tlbflush.h b/include/asm-powerpc/tlbflush.h
index 5c91081..361cd5c 100644
--- a/include/asm-powerpc/tlbflush.h
+++ b/include/asm-powerpc/tlbflush.h
@@ -162,16 +162,5 @@ extern void __flush_hash_table_range(struct mm_struct *mm, unsigned long start,
 
 #endif
 
-/*
- * This gets called at the end of handling a page fault, when
- * the kernel has put a new PTE into the page table for the process.
- * We use it to ensure coherency between the i-cache and d-cache
- * for the page which has just been mapped in.
- * On machines which use an MMU hash table, we use this to put a
- * corresponding HPTE into the hash table ahead of time, instead of
- * waiting for the inevitable extra hash-table miss exception.
- */
-extern void update_mmu_cache(struct vm_area_struct *, unsigned long, pte_t);
-
 #endif /*__KERNEL__ */
 #endif /* _ASM_POWERPC_TLBFLUSH_H */
-- 
1.5.2.4122.g5cc8f-dirty
