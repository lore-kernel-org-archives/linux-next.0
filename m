From: Li Zhong <zhong@linux.vnet.ibm.com>
Subject: [PATCH rcu] use new nesting value for rcu_dyntick trace in
 rcu_eqs_enter_common
Date: Tue, 27 Nov 2012 13:58:27 +0800
Message-ID: <1353995907.14050.60.camel@ThinkPad-T5421.cn.ibm.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e23smtp02.au.ibm.com ([202.81.31.144]:57911 "EHLO
	e23smtp02.au.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753497Ab2K0F6g (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 00:58:36 -0500
Received: from /spool/local
	by e23smtp02.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <zhong@linux.vnet.ibm.com>;
	Tue, 27 Nov 2012 15:54:52 +1000
In-Reply-To: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, dipankar@in.ibm.com

This patch uses the real new value of dynticks_nesting instead of 0 in
rcu_eqs_enter_common(). 

Signed-off-by: Li Zhong <zhong@linux.vnet.ibm.com>
---
 kernel/rcutree.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/rcutree.c b/kernel/rcutree.c
index 7733eb5..6b7e314 100644
--- a/kernel/rcutree.c
+++ b/kernel/rcutree.c
@@ -339,7 +339,7 @@ static struct rcu_node *rcu_get_root(struct rcu_state *rsp)
 static void rcu_eqs_enter_common(struct rcu_dynticks *rdtp, long long oldval,
 				bool user)
 {
-	trace_rcu_dyntick("Start", oldval, 0);
+	trace_rcu_dyntick("Start", oldval, rdtp->dynticks_nesting);
 	if (!user && !is_idle_task(current)) {
 		struct task_struct *idle = idle_task(smp_processor_id());
 
-- 
1.7.11.4
