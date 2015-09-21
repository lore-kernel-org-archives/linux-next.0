From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 21 Sep 2015 14:10:39 +1000
Message-ID: <20150921141039.5bfbb9ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35915 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750701AbbIUEKm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 21 Sep 2015 00:10:42 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Davydov <vdavydov@parallels.com>

Hi Andrew,

After merging the akpm-current tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/vmscan.c: In function 'sane_reclaim':
mm/vmscan.c:178:2: error: implicit declaration of function 'cgroup_on_dfl' [-Werror=implicit-function-declaration]
  if (cgroup_on_dfl(memcg->css.cgroup))
  ^

Caused by commit

  d08255ab4d66 ("vmscan: fix sane_reclaim helper for legacy memcg")

interacting with commit

  9e10a130d9b6 ("cgroup: replace cgroup_on_dfl() tests in controllers with cgroup_subsys_on_dfl()")

from the cgroup tree.

I don't know what the correct firx is here (help, please) so I have just
open coded the cgroup_on_dfl() call for now:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 21 Sep 2015 14:06:17 +1000
Subject: [PATCH] vmscan-fix-sane_reclaim-helper-for-legacy-memcg-fix

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 6ad68edbd260..8c7b1f5c6a6d 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -175,7 +175,7 @@ static bool sane_reclaim(struct scan_control *sc)
 	if (!memcg)
 		return true;
 #ifdef CONFIG_CGROUP_WRITEBACK
-	if (cgroup_on_dfl(memcg->css.cgroup))
+	if (memcg->css.cgroup->root == &cgrp_dfl_root)
 		return true;
 #endif
 	return false;
-- 
2.5.1

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
