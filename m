From: Tejun Heo <tj@kernel.org>
Subject: [PATCH wq#for-next] workqueue: fix build problem on !CONFIG_SMP
Date: Tue, 20 Jul 2010 11:17:03 +0200
Message-ID: <4C45698F.9010607@kernel.org>
References: <20100720151030.f874832e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from hera.kernel.org ([140.211.167.34]:59479 "EHLO hera.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1758413Ab0GTJRJ (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 20 Jul 2010 05:17:09 -0400
In-Reply-To: <20100720151030.f874832e.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Commit f3421797 (workqueue: implement unbound workqueue) incorrectly
tested CONFIG_SMP as part of a C expression in alloc/free_cwqs().  As
CONFIG_SMP is not defined in UP, this breaks build.  Fix it by using

Found during linux-next build test.

Signed-off-by: Tejun Heo <tj@kernel.org>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/workqueue.c |   18 ++++++++++++++----
 1 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index aca9472..79a11e4 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -2615,11 +2615,15 @@ static int alloc_cwqs(struct workqueue_struct *wq)
 	const size_t size = sizeof(struct cpu_workqueue_struct);
 	const size_t align = max_t(size_t, 1 << WORK_STRUCT_FLAG_BITS,
 				   __alignof__(unsigned long long));
+#ifdef CONFIG_SMP
+	bool percpu = !(wq->flags & WQ_UNBOUND);
+#else
+	bool percpu = false;
+#endif

-	if (CONFIG_SMP && !(wq->flags & WQ_UNBOUND)) {
-		/* on SMP, percpu allocator can align itself */
+	if (percpu)
 		wq->cpu_wq.pcpu = __alloc_percpu(size, align);
-	} else {
+	else {
 		void *ptr;

 		/*
@@ -2641,7 +2645,13 @@ static int alloc_cwqs(struct workqueue_struct *wq)

 static void free_cwqs(struct workqueue_struct *wq)
 {
-	if (CONFIG_SMP && !(wq->flags & WQ_UNBOUND))
+#ifdef CONFIG_SMP
+	bool percpu = !(wq->flags & WQ_UNBOUND);
+#else
+	bool percpu = false;
+#endif
+
+	if (percpu)
 		free_percpu(wq->cpu_wq.pcpu);
 	else if (wq->cpu_wq.single) {
 		/* the pointer to free is stored right after the cwq */
-- 
1.6.4.2
