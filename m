From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 11 Dec 2017 16:05:54 +1100
Message-ID: <20171211160554.00c79749@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41769 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751274AbdLKFF5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 11 Dec 2017 00:05:57 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/hugetlb.h:451:0,
                 from arch/powerpc/mm/hugetlbpage.c:14:
arch/powerpc/include/asm/hugetlb.h:125:26: error: redefinition of 'vma_mmu_pagesize'
 #define vma_mmu_pagesize vma_mmu_pagesize
                          ^
arch/powerpc/mm/hugetlbpage.c:563:15: note: in expansion of macro 'vma_mmu_pagesize'
 unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
               ^
In file included from arch/powerpc/mm/hugetlbpage.c:14:0:
include/linux/hugetlb.h:274:29: note: previous definition of 'vma_mmu_pagesize' was here
 static inline unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
                             ^

Caused by commit

  ac9284a6b670 ("mm, hugetlbfs: introduce ->pagesize() to vm_operations_struct")

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 11 Dec 2017 15:51:41 +1100
Subject: [PATCH] mm, hugetlbfs: move testing of vma_mmu_pagesize to after
 inclusion of asm/hugetlb.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/hugetlb.h |  1 +
 include/linux/hugetlb.h            | 26 +++++++++++++-------------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index 14c9d44f355b..3cc6ca1bdaf2 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -123,6 +123,7 @@ void hugetlb_free_pgd_range(struct mmu_gather *tlb, unsigned long addr,
  * to override the version in mm/hugetlb.c
  */
 #define vma_mmu_pagesize vma_mmu_pagesize
+unsigned long vma_mmu_pagesize(struct vm_area_struct *vma);
 
 /*
  * If the arch doesn't supply something else, assume that hugepage
diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index c354befab724..b0f1f6768336 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -264,19 +264,6 @@ static inline unsigned long vma_kernel_pagesize(struct vm_area_struct *vma)
 	return PAGE_SIZE;
 }
 
-/*
- * Return the page size being used by the MMU to back a VMA. In the majority
- * of cases, the page size used by the kernel matches the MMU size. On
- * architectures where it differs, an architecture-specific version of this
- * function is required.
- */
-#ifndef vma_mmu_pagesize
-static inline unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
-{
-	return vma_kernel_pagesize(vma);
-}
-#endif
-
 #ifdef CONFIG_HUGETLBFS
 struct hugetlbfs_sb_info {
 	long	max_inodes;   /* inodes allowed */
@@ -615,6 +602,19 @@ static inline void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr
 }
 #endif	/* CONFIG_HUGETLB_PAGE */
 
+/*
+ * Return the page size being used by the MMU to back a VMA. In the majority
+ * of cases, the page size used by the kernel matches the MMU size. On
+ * architectures where it differs, an architecture-specific version of this
+ * function is required.
+ */
+#ifndef vma_mmu_pagesize
+static inline unsigned long vma_mmu_pagesize(struct vm_area_struct *vma)
+{
+	return vma_kernel_pagesize(vma);
+}
+#endif
+
 static inline spinlock_t *huge_pte_lock(struct hstate *h,
 					struct mm_struct *mm, pte_t *pte)
 {
-- 
2.15.0

-- 
Cheers,
Stephen Rothwell
