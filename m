From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the tip tree
Date: Wed, 15 Jun 2016 15:23:18 +1000
Message-ID: <20160615152318.164b1ebd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:36266 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750801AbcFOFXU (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jun 2016 01:23:20 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Manfred Spraul <manfred@colorfullife.com>

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  ipc/sem.c

between commit:

  33ac279677dc ("locking/barriers: Introduce smp_acquire__after_ctrl_dep()")

from the tip tree and commit:

  a1c58ea067cb ("ipc/sem.c: Fix complex_count vs. simple op race")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc ipc/sem.c
index ae72b3cddc8d,11d9e605a619..000000000000
--- a/ipc/sem.c
+++ b/ipc/sem.c
@@@ -260,13 -267,20 +267,10 @@@ static void sem_rcu_free(struct rcu_hea
  }
  
  /*
-  * Wait until all currently ongoing simple ops have completed.
 - * spin_unlock_wait() and !spin_is_locked() are not memory barriers, they
 - * are only control barriers.
 - * The code must pair with spin_unlock(&sem->lock) or
 - * spin_unlock(&sem_perm.lock), thus just the control barrier is insufficient.
 - *
 - * smp_rmb() is sufficient, as writes cannot pass the control barrier.
 - */
 -#define ipc_smp_acquire__after_spin_is_unlocked()	smp_rmb()
 -
 -/*
+  * Enter the mode suitable for non-simple operations:
   * Caller must own sem_perm.lock.
-  * New simple ops cannot start, because simple ops first check
-  * that sem_perm.lock is free.
-  * that a) sem_perm.lock is free and b) complex_count is 0.
   */
- static void sem_wait_array(struct sem_array *sma)
+ static void complexmode_enter(struct sem_array *sma)
  {
  	int i;
  	struct sem *sem;
