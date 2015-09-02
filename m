From: Davidlohr Bueso <dave@stgolabs.net>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Tue, 01 Sep 2015 23:40:51 -0700
Message-ID: <1441176051.2038.3.camel@stgolabs.net>
References: <20150901135006.78be270e@canb.auug.org.au>
	 <20150901074946.GF4029@linux.vnet.ibm.com>
	 <20150902135800.068f0f4a@canb.auug.org.au>
	 <20150902052612.GK4029@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50626 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751551AbbIBGk5 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Sep 2015 02:40:57 -0400
In-Reply-To: <20150902052612.GK4029@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>

On Tue, 2015-09-01 at 22:26 -0700, Paul E. McKenney wrote:
> Davidlohr, the error is due to sched_setscheduler_nocheck() not being
> exported, so that Stephen gets this failure when building modules.
> This is 04be76a9b067 (locktorture: Support rtmutex torturing) in -rcu.
> 
> Thoughts?

Right, the below should take care of it. Although I think it makes sense
to get this into at least 4.3 even if we won't use it until 4.4. Simply
because we already export sched_setscheduler(). If you agree I guess we
could route via -tip.

Thanks,
Davidlohr

----8<------------------------------------
Subject: [PATCH -next] sched: Export sched_setscheduler_nocheck

... just like regular sched_setscheduler(). We need this, for locktorture
otherwise we can fail to build modules, ie:

ERROR: "sched_setscheduler_nocheck" [kernel/locking/locktorture.ko] undefined!

Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@kernel.org>
---
 kernel/sched/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 3595403..7b51f64 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -4012,6 +4012,7 @@ int sched_setscheduler_nocheck(struct task_struct *p, int policy,
 {
 	return _sched_setscheduler(p, policy, param, false);
 }
+EXPORT_SYMBOL_GPL(sched_setscheduler_nocheck);
 
 static int
 do_sched_setscheduler(pid_t pid, int policy, struct sched_param __user *param)
-- 
2.1.4
