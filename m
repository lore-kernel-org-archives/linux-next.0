From: Minchan Kim <minchan@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Wed, 21 Oct 2015 15:47:56 +0900
Message-ID: <20151021064756.GA23631@bbox>
References: <20151021173438.08f16380@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:33650 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbbJUGsB (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 21 Oct 2015 02:48:01 -0400
Content-Disposition: inline
In-Reply-To: <20151021173438.08f16380@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

On Wed, Oct 21, 2015 at 05:34:38PM +1100, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (arm
> allnoconfig and others) failed like this:
> 
> In file included from init/main.c:50:0:
> include/linux/rmap.h:274:1: error: expected declaration specifiers or '...' before '{' token
> 
> Caused by commit
> 
>   e4f28388eb72 ("mm: simplify reclaim path for MADV_FREE")
> 
> Discovered after the linux-next release.

It was my bad. Sorry about that.
Here patch goes. Maybe Andrew want to fold it to e4f28388eb72.

Thanks.

>From 1062bfcfcc65b4a019666ada3786e95e4b299df6 Mon Sep 17 00:00:00 2001
From: Minchan Kim <minchan@kernel.org>
Date: Wed, 21 Oct 2015 15:41:49 +0900
Subject: [PATCH] mm: fix compile error caused omitting parentheses

This patch fixes build error introudced by
e4f28388eb72 ("mm: simplify reclaim path for MADV_FREE").

Signed-off-by: Minchan Kim <minchan@kernel.org>
---
 include/linux/rmap.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 978f65066fd5..853f4f3c6742 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -270,7 +270,7 @@ int rmap_walk(struct page *page, struct rmap_walk_control *rwc);
 
 static inline int page_referenced(struct page *page, int is_locked,
 				  struct mem_cgroup *memcg,
-				  unsigned long *vm_flags,
+				  unsigned long *vm_flags)
 {
 	*vm_flags = 0;
 	return 0;
-- 
1.9.1


> 
> -- 
> Cheers,
> Stephen Rothwell                    sfr@canb.auug.org.au
