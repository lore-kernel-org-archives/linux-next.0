From: Bob Liu <lliubbo@gmail.com>
Subject: [PATCH] mm: rmap: fix build warning
Date: Thu, 25 Oct 2012 16:50:50 +0800
Message-ID: <1351155050-4055-1-git-send-email-lliubbo@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ch1ehsobe006.messaging.microsoft.com ([216.32.181.186]:42860
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933663Ab2JYIvY (ORCPT
	<rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Oct 2012 04:51:24 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: fengguang.wu@intel.com, yuanhan.liu@linux.intel.com, sfr@canb.auug.org.au, linux-next@vger.kernel.org, linux-mm@kvack.org, Bob Liu <lliubbo@gmail.com>

mm/rmap.c: In function 'try_to_unmap_cluster':
mm/rmap.c:1361:9: warning: unused variable 'pud' [-Wunused-variable]
mm/rmap.c:1360:9: warning: unused variable 'pgd' [-Wunused-variable]

I forgot to del these variable in my commit:
0981230ec3206f98dcc58febfef9fd35b540d25a mm: introduce mm_find_pmd()

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Yuanhan Liu <yuanhan.liu@linux.intel.com>
Signed-off-by: Bob Liu <lliubbo@gmail.com>
---
 mm/rmap.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index 6c686c2..98b100e 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1360,8 +1360,6 @@ static int try_to_unmap_cluster(unsigned long cursor, unsigned int *mapcount,
 		struct vm_area_struct *vma, struct page *check_page)
 {
 	struct mm_struct *mm = vma->vm_mm;
-	pgd_t *pgd;
-	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
 	pte_t pteval;
-- 
1.7.9.5
