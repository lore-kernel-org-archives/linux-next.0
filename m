From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 3 Feb 2016 16:10:30 +1100
Message-ID: <20160203161030.459d5c26@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:56708 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750742AbcBCFKc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 3 Feb 2016 00:10:32 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Wilcox <willy@linux.intel.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (i386
defconfig) failed like this:

In file included from include/linux/mm.h:67:0,
                 from include/linux/suspend.h:8,
                 from arch/x86/kernel/asm-offsets.c:12:
arch/x86/include/asm/pgtable.h:212:24: error: redefinition of 'pud_trans_huge'
 #define pud_trans_huge pud_trans_huge
                        ^
include/asm-generic/pgtable.h:696:19: note: in expansion of macro 'pud_trans_huge'
 static inline int pud_trans_huge(pud_t pud)
                   ^
arch/x86/include/asm/pgtable.h:208:19: note: previous definition of 'pud_trans_huge' was here
 static inline int pud_trans_huge(pud_t pud)
                   ^

Caused by commit

  42416e8d1a10 ("x86-add-support-for-pud-sized-transparent-hugepages-fix")

Which, it turns out, is "wrong/hacky" :-)

I have reverted that patch for today and added this (also maybe
wrong/hacky) patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 3 Feb 2016 15:48:49 +1100
Subject: [PATCH] mm: fix 2 for add support for PUD-sized transparent hugepages

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/asm-generic/pgtable.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 52c91858c194..7a2a969e7dea 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -692,7 +692,7 @@ static inline int pmd_write(pmd_t pmd)
 #endif /* __HAVE_ARCH_PMD_WRITE */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-#ifndef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
+#if !defined(CONFIG_TRANSPARENT_HUGEPAGE) || !defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
 static inline int pud_trans_huge(pud_t pud)
 {
 	return 0;
-- 
2.6.4

-- 
Cheers,
Stephen Rothwell
