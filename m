From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 25 Feb 2016 15:55:36 +1100
Message-ID: <20160225155536.421a0604@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33114 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757934AbcBYEzj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 24 Feb 2016 23:55:39 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Russell King <linux@arm.linux.org.uk>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mm/mmu.c:737:37: error: macro "pte_alloc" passed 4 arguments, but takes just 3
     void *(*alloc)(unsigned long sz))
                                     ^
arch/arm/mm/mmu.c:738:1: error: expected '=', ',', ';', 'asm' or '__attribute__' before '{' token
 {
 ^
arch/arm/mm/mmu.c: In function 'early_pte_alloc':
arch/arm/mm/mmu.c:750:47: error: macro "pte_alloc" passed 4 arguments, but takes just 3
  return pte_alloc(pmd, addr, prot, early_alloc);
                                               ^
arch/arm/mm/mmu.c:750:9: error: 'pte_alloc' undeclared (first use in this function)
  return pte_alloc(pmd, addr, prot, early_alloc);
         ^
arch/arm/mm/mmu.c:750:9: note: each undeclared identifier is reported only once for each function it appears in
arch/arm/mm/mmu.c: In function 'alloc_init_pte':
arch/arm/mm/mmu.c:759:56: error: macro "pte_alloc" passed 4 arguments, but takes just 3
  pte_t *pte = pte_alloc(pmd, addr, type->prot_l1, alloc);
                                                        ^
arch/arm/mm/mmu.c:759:15: error: 'pte_alloc' undeclared (first use in this function)
  pte_t *pte = pte_alloc(pmd, addr, type->prot_l1, alloc);
               ^
arch/arm/mm/mmu.c: In function 'early_pte_alloc':
arch/arm/mm/mmu.c:751:1: warning: control reaches end of non-void function [-Wreturn-type]
 }
 ^

Caused by commit

  b9c9252f278d ("mm: cleanup *pte_alloc* interfaces")

grep is your friend ...

I applied this fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 25 Feb 2016 15:36:59 +1100
Subject: [PATCH] mm: cleanup *pte_alloc* interfaces fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/arm/mm/mmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mm/mmu.c b/arch/arm/mm/mmu.c
index e4b681aafd6d..62f4d01941f7 100644
--- a/arch/arm/mm/mmu.c
+++ b/arch/arm/mm/mmu.c
@@ -732,7 +732,7 @@ static void *__init late_alloc(unsigned long sz)
 	return ptr;
 }
 
-static pte_t * __init pte_alloc(pmd_t *pmd, unsigned long addr,
+static pte_t * __init arm_pte_alloc(pmd_t *pmd, unsigned long addr,
 				unsigned long prot,
 				void *(*alloc)(unsigned long sz))
 {
@@ -747,7 +747,7 @@ static pte_t * __init pte_alloc(pmd_t *pmd, unsigned long addr,
 static pte_t * __init early_pte_alloc(pmd_t *pmd, unsigned long addr,
 				      unsigned long prot)
 {
-	return pte_alloc(pmd, addr, prot, early_alloc);
+	return arm_pte_alloc(pmd, addr, prot, early_alloc);
 }
 
 static void __init alloc_init_pte(pmd_t *pmd, unsigned long addr,
@@ -756,7 +756,7 @@ static void __init alloc_init_pte(pmd_t *pmd, unsigned long addr,
 				  void *(*alloc)(unsigned long sz),
 				  bool ng)
 {
-	pte_t *pte = pte_alloc(pmd, addr, type->prot_l1, alloc);
+	pte_t *pte = arm_pte_alloc(pmd, addr, type->prot_l1, alloc);
 	do {
 		set_pte_ext(pte, pfn_pte(pfn, __pgprot(type->prot_pte)),
 			    ng ? PTE_EXT_NG : 0);
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
