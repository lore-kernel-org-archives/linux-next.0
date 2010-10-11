From: Andi Kleen <ak@linux.intel.com>
Subject: Re: linux-next: "hugetlb: hugepage migration core" breaks
 compilation on s390
Date: Mon, 11 Oct 2010 16:08:34 +0200
Message-ID: <20101011140834.GA7962@gargoyle.fritz.box>
References: <20101011111131.GA10270@osiris.boeblingen.de.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:30037 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754602Ab0JKOGY (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 11 Oct 2010 10:06:24 -0400
Content-Disposition: inline
In-Reply-To: <20101011111131.GA10270@osiris.boeblingen.de.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Heiko Carstens <heiko.carstens@de.ibm.com>
Cc: Naoya Horiguchi <n-horiguchi@ah.jp.nec.com>, linux-next@vger.kernel.org, Jun'ichi Nomura <j-nomura@ce.jp.nec.com>, Mel Gorman <mel@csn.ul.ie>, Martin Schwidefsky <schwidefsky@de.ibm.com>

On Mon, Oct 11, 2010 at 01:11:31PM +0200, Heiko Carstens wrote:
> "hugetlb: hugepage migration core" in linux-next breaks compilation on s390:
> 
>   CC      mm/migrate.o
> mm/migrate.c: In function 'remove_migration_pte':
> mm/migrate.c:143:3: error: implicit declaration of function 'pte_mkhuge'
> mm/migrate.c:143:7: error: incompatible types when assigning to type 'pte_t' from type 'int'
> make[1]: *** [mm/migrate.o] Error 1
> make: *** [mm/migrate.o] Error 2
> 
> This is simply because a lot of CONFIG_HUGETLB_PAGE dependent code was added
> to mm/migration.c which does not depend on that config option. Please fix.

Most of the functions have inline dummies, just pte_mkhuge() doesn't.
Anyways the easiest fix would be a simple #ifdef. Does this patch
work for you?

-Andi

From: Andi Kleen <ak@linux.intel.com>
Subject: [PATCH] Fix migration.c compilation on s390

s390 doesn't have huge pages and failed with

> mm/migrate.c: In function 'remove_migration_pte':
> mm/migrate.c:143:3: error: implicit declaration of function 'pte_mkhuge'
> mm/migrate.c:143:7: error: incompatible types when assigning to type 'pte_t' from type 'int'

Put that code into a ifdef.

Reported by Heiko Carstens

Signed-off-by: Andi Kleen <ak@linux.intel.com>

diff --git a/mm/migrate.c b/mm/migrate.c
index 55dbc45..f8c9bcc 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -139,8 +139,10 @@ static int remove_migration_pte(struct page *new, struct vm_area_struct *vma,
 	pte = pte_mkold(mk_pte(new, vma->vm_page_prot));
 	if (is_write_migration_entry(entry))
 		pte = pte_mkwrite(pte);
+#ifdef CONFIG_HUGETLB_PAGE
 	if (PageHuge(new))
 		pte = pte_mkhuge(pte);
+#endif
 	flush_cache_page(vma, addr, pte_pfn(pte));
 	set_pte_at(mm, addr, ptep, pte);
 
