From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Fri, 18 Dec 2015 18:45:38 +1100
Message-ID: <20151218184538.1bcc19d7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:39964 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752767AbbLRHpk (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 18 Dec 2015 02:45:40 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
pseries_le_defconfig) failed like this:

mm/huge_memory.c: In function 'insert_pfn_pmd':
mm/huge_memory.c:970:21: error: implicit declaration of func
tion 'pfn_t_pmd' [-Werror=implicit-function-declaration]
  entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
                     ^

Caused by commit

  e6cf6e9a2686 ("mm, dax: convert vmf_insert_pfn_pmd() to pfn_t")

I added this patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 18 Dec 2015 17:37:30 +1100
Subject: [PATCH] mm, dax: convert vmf_insert_pfn_pmd() to pfn_t fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 03c1a5a21c0c..835fb5ec1de1 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -186,6 +186,7 @@ void pgtable_cache_init(void);
 struct page *realmode_pfn_to_page(unsigned long pfn);
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#define pfn_pmd pfn_pmd
 extern pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot);
 extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
 extern pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot);
-- 
2.6.2

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
