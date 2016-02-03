From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 3 Feb 2016 15:13:08 +1100
Message-ID: <20160203151308.6292a985@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48973 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755181AbcBCENL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 2 Feb 2016 23:13:11 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

mm/huge_memory.c:1089:9: error: implicit declaration of function 'pud_mkyoung' [-Werror=implicit-function-declaration]
  _pud = pud_mkyoung(pud_mkdirty(*pud));
         ^
mm/huge_memory.c:1089:21: error: implicit declaration of function 'pud_mkdirty' [-Werror=implicit-function-declaration]
  _pud = pud_mkyoung(pud_mkdirty(*pud));
                     ^
mm/huge_memory.c:1089:7: error: incompatible types when assigning to type 'pud_t {aka struct <anonymous>}' from type 'int'
  _pud = pud_mkyoung(pud_mkdirty(*pud));
       ^
mm/huge_memory.c:1090:6: error: implicit declaration of function 'pudp_set_access_flags' [-Werror=implicit-function-declaration]
  if (pudp_set_access_flags(vma, addr & HPAGE_PUD_MASK,
      ^
mm/huge_memory.c:1092:3: error: implicit declaration of function 'update_mmu_cache_pud' [-Werror=implicit-function-declaration]
   update_mmu_cache_pud(vma, addr, pud);
   ^
mm/huge_memory.c: In function 'follow_devmap_pud':
mm/huge_memory.c:1137:22: error: implicit declaration of function 'pud_pfn' [-Werror=implicit-function-declaration]
  unsigned long pfn = pud_pfn(*pud);
                      ^

Caused by commit

  a27da20ed50e ("mm: add support for PUD-sized transparent hugepages")

Some bit have not been protected with
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD ...

I added the following (ugly) patch:


From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Feb 2016 15:07:54 +1100
Subject: [PATCH] mm: add support for PUD-sized transparent hugepages fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/huge_memory.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 1632e02f859c..bad79b236ede 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1074,6 +1074,7 @@ static void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
 		update_mmu_cache_pmd(vma, addr, pmd);
 }
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 		pud_t *pud)
 {
@@ -1091,6 +1092,7 @@ static void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 				pud, _pud,  1))
 		update_mmu_cache_pud(vma, addr, pud);
 }
+#endif	/* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
 struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, int flags)
@@ -1131,6 +1133,7 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 	return page;
 }
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
 		pud_t *pud, int flags)
 {
@@ -1169,6 +1172,7 @@ struct page *follow_devmap_pud(struct vm_area_struct *vma, unsigned long addr,
 
 	return page;
 }
+#endif	/* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
 int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
@@ -1974,6 +1978,7 @@ spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
 	return NULL;
 }
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 /*
  * Returns true if a given pud maps a thp, false otherwise.
  *
@@ -1989,6 +1994,7 @@ spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 	spin_unlock(ptl);
 	return NULL;
 }
+#endif	/* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
 #define VM_NO_THP (VM_SPECIAL | VM_HUGETLB | VM_SHARED | VM_MAYSHARE)
 
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell
