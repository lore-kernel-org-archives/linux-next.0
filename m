From: Michal Hocko <mhocko@kernel.org>
Subject: Re: linux-next: build failure after merge of the akpm-current tree
Date: Mon, 21 Sep 2015 09:58:53 +0200
Message-ID: <20150921075853.GA19811@dhcp22.suse.cz>
References: <20150921141039.5bfbb9ca@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:36595 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755990AbbIUH65 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 21 Sep 2015 03:58:57 -0400
Content-Disposition: inline
In-Reply-To: <20150921141039.5bfbb9ca@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Davydov <vdavydov@parallels.com>

On Mon 21-09-15 14:10:39, Stephen Rothwell wrote:
> Hi Andrew,
> 
> After merging the akpm-current tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> mm/vmscan.c: In function 'sane_reclaim':
> mm/vmscan.c:178:2: error: implicit declaration of function 'cgroup_on_dfl' [-Werror=implicit-function-declaration]
>   if (cgroup_on_dfl(memcg->css.cgroup))
>   ^
> 
> Caused by commit
> 
>   d08255ab4d66 ("vmscan: fix sane_reclaim helper for legacy memcg")
> 
> interacting with commit
> 
>   9e10a130d9b6 ("cgroup: replace cgroup_on_dfl() tests in controllers with cgroup_subsys_on_dfl()")
> 
> from the cgroup tree.
> 
> I don't know what the correct firx is here (help, please) so I have just
> open coded the cgroup_on_dfl() call for now:

AFAIU your fix is correct but using
cgroup_subsys_on_dfl(memory_cgrp_subsys) is more appropriate:
diff --git a/mm/vmscan.c b/mm/vmscan.c
index d62924ee8022..c3df03add73e 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -176,7 +176,7 @@ static bool sane_reclaim(struct scan_control *sc)
 	if (!memcg)
 		return true;
 #ifdef CONFIG_CGROUP_WRITEBACK
-	if (cgroup_on_dfl(memcg->css.cgroup))
+	if (cgroup_subsys_on_dfl(memory_cgrp_subsys))
 		return true;
 #endif
 	return false;

-- 
Michal Hocko
SUSE Labs
