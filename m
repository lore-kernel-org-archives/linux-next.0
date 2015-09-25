From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the cgroup tree
Date: Fri, 25 Sep 2015 13:26:00 +1000
Message-ID: <20150925132600.4b344b30@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Davydov <vdavydov@parallels.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Tejun,

After merging the cgroup tree, today's linux-next build (x86_64
allmodconfig) failed like this:

mm/vmscan.c: In function 'sane_reclaim':
mm/vmscan.c:178:2: error: implicit declaration of function 'cgroup_on_dfl' [-Werror=implicit-function-declaration]
  if (cgroup_on_dfl(memcg->css.cgroup))
  ^

Caused by commit

  d5028f9f7d8d ("vmscan: fix sane_reclaim helper for legacy memcg")

from Linus' tree interacting with commit

  9e10a130d9b6 ("cgroup: replace cgroup_on_dfl() tests in controllers with cgroup_subsys_on_dfl()")

from the cgroup tree.

We new this was coming, so I have applied the following merge fix patch from Andrew's tree and can carry it as necessary:

From: Michal Hocko <mhocko@kernel.org>
Subject: vmscan build fix



Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/vmscan.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN mm/vmscan.c~vmscan-build-fix mm/vmscan.c
--- a/mm/vmscan.c~vmscan-build-fix
+++ a/mm/vmscan.c
@@ -175,7 +175,7 @@ static bool sane_reclaim(struct scan_con
 	if (!memcg)
 		return true;
 #ifdef CONFIG_CGROUP_WRITEBACK
-	if (cgroup_on_dfl(memcg->css.cgroup))
+	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
 		return true;
 #endif
 	return false;
_

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
