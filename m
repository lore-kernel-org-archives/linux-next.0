From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [PATCH linux-next]cgroup: move list add after list head
 initilization
Date: Wed, 28 Nov 2012 17:15:21 +0800
Message-ID: <1354094121.3054.28.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e28smtp01.in.ibm.com ([122.248.162.1]:37946 "EHLO
	e28smtp01.in.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752845Ab2K1JPf (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Wed, 28 Nov 2012 04:15:35 -0500
Received: from /spool/local
	by e28smtp01.in.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Wed, 28 Nov 2012 14:45:31 +0530
Received: from d28av05.in.ibm.com (d28av05.in.ibm.com [9.184.220.67])
	by d28relay02.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id qAS9FT1729556880
	for <linux-next@vger.kernel.org>; Wed, 28 Nov 2012 14:45:29 +0530
Received: from d28av05.in.ibm.com (loopback [127.0.0.1])
	by d28av05.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id qASEj8ds016426
	for <linux-next@vger.kernel.org>; Thu, 29 Nov 2012 01:45:09 +1100
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next list <linux-next@vger.kernel.org>
Cc: tj@kernel.org, lizefan@huawei.com

commit 2243076ad128d0cc196cf6597e6ddcf6bc907676 initialize
cgrp->allcg_node in init_cgroup_housekeeping(). Then in
init_cgroup_root(), we should call init_cgroup_housekeeping() before
adding it to &root->allcg_list. Otherwise, we are initializing an entry
already in a list. 

Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
---
 kernel/cgroup.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cgroup.c b/kernel/cgroup.c
index 01d5342..35133cf 100644
--- a/kernel/cgroup.c
+++ b/kernel/cgroup.c
@@ -1400,8 +1400,8 @@ static void init_cgroup_root(struct cgroupfs_root *root)
 	root->number_of_cgroups = 1;
 	cgrp->root = root;
 	cgrp->top_cgroup = cgrp;
-	list_add_tail(&cgrp->allcg_node, &root->allcg_list);
 	init_cgroup_housekeeping(cgrp);
+	list_add_tail(&cgrp->allcg_node, &root->allcg_list);
 }
 
 static bool init_root_id(struct cgroupfs_root *root)
-- 
1.7.9.5
