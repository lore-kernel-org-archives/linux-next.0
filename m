From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 17 Sep 2015 12:15:36 +1000
Message-ID: <20150917121536.18cc9325@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41150 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753141AbbIQCPj (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 16 Sep 2015 22:15:39 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Andrea Arcangeli <aarcange@redhat.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

mm/page_alloc.c:184:14: error: conflicting types for 'pageblock_order'
 unsigned int pageblock_order __read_mostly;
              ^
In file included from include/linux/mmzone.h:17:0,
                 from include/linux/gfp.h:5,
                 from include/linux/mm.h:9,
                 from mm/page_alloc.c:18:
include/linux/pageblock-flags.h:47:12: note: previous declaration of 'pageblock_order' was here
 extern int pageblock_order; 
            ^

Caused by commit

  b3c625d32a04 ("mm: use 'unsigned int' for page order")

I assume that this was never built with CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
set (or the hunk that updated include/linux/pageblock-flags.h was missed).

I have added the following fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 17 Sep 2015 11:58:50 +1000
Subject: [PATCH] mm-use-unsigned-int-for-page-order-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/linux/pageblock-flags.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/pageblock-flags.h b/include/linux/pageblock-flags.h
index 2baeee12f48e..e942558b3585 100644
--- a/include/linux/pageblock-flags.h
+++ b/include/linux/pageblock-flags.h
@@ -44,7 +44,7 @@ enum pageblock_bits {
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
 
 /* Huge page sizes are variable */
-extern int pageblock_order;
+extern unsigned int pageblock_order;
 
 #else /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
 
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
