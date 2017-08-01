From: "Huang\, Ying" <ying.huang@intel.com>
Subject: Re: linux-next: build warning after merge of the akpm tree
Date: Tue, 01 Aug 2017 14:15:29 +0800
Message-ID: <87bmnzizjy.fsf@yhuang-dev.intel.com>
References: <20170801160257.0b1306b2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:15762 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750763AbdHAGPb (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 1 Aug 2017 02:15:31 -0400
In-Reply-To: <20170801160257.0b1306b2@canb.auug.org.au> (Stephen Rothwell's
        message of "Tue, 1 Aug 2017 16:02:57 +1000")
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Huang Ying <ying.huang@intel.com>

Hi, Stephen,

Thanks for reporting.

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi Andrew,
>
> After merging the akpm tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
>
> mm/swapfile.c: In function 'reuse_swap_page':
> mm/swapfile.c:1429:16: warning: 'offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   unsigned long offset;
>                 ^
>
> Introduced by commit
>
>   e16cd4930836 ("mm, THP, swap: make reuse_swap_page() works for THP swapped out")

This looks like a false positive reporting and not reported by my
compiler and kbuild compiler (gcc-6).  But anyway, we should silence it.

Best Regards,
Huang, Ying

---------->8----------
>From 7a7ff76d7bcbd7affda169b29abcf3dafa38052e Mon Sep 17 00:00:00 2001
From: Huang Ying <ying.huang@intel.com>
Date: Tue, 1 Aug 2017 14:12:21 +0800
Subject: [PATCH] mm, THP, swap: Silence a compiler warning

To fix the following compiler warning,

mm/swapfile.c: In function 'reuse_swap_page':
mm/swapfile.c:1429:16: warning: 'offset' may be used uninitialized in this function [-Wmaybe-uninitialized]
  unsigned long offset;
                ^

This is a false positive report, but we should silence it anyway.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: "Huang, Ying" <ying.huang@intel.com>
---
 mm/swapfile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/swapfile.c b/mm/swapfile.c
index 32434541cc12..64a94f70e867 100644
--- a/mm/swapfile.c
+++ b/mm/swapfile.c
@@ -1426,7 +1426,7 @@ static int page_trans_huge_map_swapcount(struct page *page, int *total_mapcount,
 					 int *total_swapcount)
 {
 	int i, map_swapcount, _total_mapcount, _total_swapcount;
-	unsigned long offset;
+	unsigned long offset = 0;
 	struct swap_info_struct *si;
 	struct swap_cluster_info *ci = NULL;
 	unsigned char *map = NULL;
-- 
2.13.2
