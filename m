From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Thu, 7 Apr 2016 15:12:01 +1000
Message-ID: <20160407151201.0afc790f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:34987 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750963AbcDGFMF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 7 Apr 2016 01:12:05 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Hugh Dickins <hughd@google.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

In file included from include/linux/linkage.h:4:0,
                 from include/linux/fs.h:4,
                 from mm/shmem.c:24:
In function 'shmem_disband_hugeteam',
    inlined from 'shmem_getpage_gfp' at mm/shmem.c:3075:3:
include/linux/compiler.h:510:38: error: call to '__compiletime_assert_1747' declared with attribute error: BUILD_BUG failed
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
                                      ^
include/linux/compiler.h:493:4: note: in definition of macro '__compiletime_assert'
    prefix ## suffix();    \
    ^
include/linux/compiler.h:510:2: note: in expansion of macro '_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __LINE__)
  ^
include/linux/bug.h:51:37: note: in expansion of macro 'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^
include/linux/bug.h:85:21: note: in expansion of macro 'BUILD_BUG_ON_MSG'
 #define BUILD_BUG() BUILD_BUG_ON_MSG(1, "BUILD_BUG failed")
                     ^
mm/shmem.c:1747:2: note: in expansion of macro 'BUILD_BUG'
  BUILD_BUG();
  ^

Caused by commit

  ab61a0a665d8 ("huge tmpfs: try to allocate huge pages, split into a team")

I added the following (hacky, but builds for my compiler at least)
patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 7 Apr 2016 14:57:45 +1000
Subject: [PATCH] huge tmpfs: fix build problem on arm

allocated_huge will never be non-NULL if CONFIG_TRANSPARENT_HUGEPAGE is not.

Fixes: ab61a0a665d8 ("huge tmpfs: try to allocate huge pages, split into a team")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/shmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 5b9fecc9ce72..f2307d9630aa 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -3071,7 +3071,7 @@ unlock:
 		unlock_page(page);
 		put_page(page);
 	}
-	if (alloced_huge) {
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && alloced_huge) {
 		shmem_disband_hugeteam(alloced_huge);
 		alloced_huge = NULL;
 	}
-- 
2.7.0

-- 
Cheers,
Stephen Rothwell
