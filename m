From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the rcu tree
Date: Fri, 11 Aug 2017 14:43:52 +1000
Message-ID: <20170811144352.585085e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50525 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750815AbdHKEny (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Fri, 11 Aug 2017 00:43:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Paul,

After merging the rcu tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

kernel/sched/core.c: In function 'do_task_dead':
kernel/sched/core.c:3385:2: error: implicit declaration of function 'smp_mb__before_spinlock' [-Werror=implicit-function-declaration]
  smp_mb__before_spinlock();
  ^
cc1: some warnings being treated as errors

Caused by commit

  4a6fc6107e90 ("sched: Replace spin_unlock_wait() with lock/unlock pair")

Interacting with commit

  a9668cd6ee28 ("locking: Remove smp_mb__before_spinlock()")

from the tip tree.

I applied this patch for now, but I assume something better is required.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 11 Aug 2017 14:32:10 +1000
Subject: [PATCH] sched: temporary hack for locking: Remove smp_mb__before_spinlock()

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 2bd00feaea15..a4f4ba2e3be6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -3382,7 +3382,7 @@ void __noreturn do_task_dead(void)
 	 * To avoid it, we have to wait for releasing tsk->pi_lock which
 	 * is held by try_to_wake_up()
 	 */
-	smp_mb__before_spinlock();
+	smp_mb();
 	raw_spin_lock_irq(&current->pi_lock);
 	raw_spin_unlock_irq(&current->pi_lock);
 
-- 
Cheers,
Stephen Rothwell
