From: Tejun Heo <tj@kernel.org>
Subject: [PATCH wq/for-3.10] workqueue: define workqueue_freezing static
 variable iff CONFIG_FREEZER
Date: Tue, 19 Mar 2013 14:01:51 -0700
Message-ID: <20130319210151.GM3042@htj.dyndns.org>
References: <20130319145804.7af0b995413adb35d16992ef@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-da0-f45.google.com ([209.85.210.45]:49358 "EHLO
	mail-da0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933041Ab3CSVB4 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 19 Mar 2013 17:01:56 -0400
Content-Disposition: inline
In-Reply-To: <20130319145804.7af0b995413adb35d16992ef@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

>From a0265a7f5161b6cb55e82b71edb236bbe0d9b3ae Mon Sep 17 00:00:00 2001
From: Tejun Heo <tj@kernel.org>
Date: Tue, 19 Mar 2013 13:55:42 -0700

699ce097efe ("workqueue: implement and use pwq_adjust_max_active()")
replaced the only workqueue_freezing usage outside freezer callbacks
with a POOL_FREEZING test.  This makes workqueue_freezing unused when
!CONFIG_FREEZER leading to a compiler warning.  Define
workqueue_freezing iff CONFIG_FREEZER.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: Fengguang Wu <fengguang.wu@intel.com>
Signed-off-by: Tejun Heo <tj@kernel.org>
---
 kernel/workqueue.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index e38d035..775c2f4 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -261,7 +261,9 @@ static DEFINE_SPINLOCK(pwq_lock);	/* protects pool_workqueues */
 static DEFINE_SPINLOCK(wq_mayday_lock);	/* protects wq->maydays list */
 
 static LIST_HEAD(workqueues);		/* WQ: list of all workqueues */
+#ifdef CONFIG_FREEZER
 static bool workqueue_freezing;		/* WQ: have wqs started freezing? */
+#endif
 
 /* the per-cpu worker pools */
 static DEFINE_PER_CPU_SHARED_ALIGNED(struct worker_pool [NR_STD_WORKER_POOLS],
-- 
1.8.1.4
