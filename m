From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Thu, 9 Jun 2016 15:14:41 +1000
Message-ID: <20160609151441.7b4ff455@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:33404 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1946275AbcFIFOn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 9 Jun 2016 01:14:43 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree.c

between commit:

  6428671bae97 ("locking/mutex: Optimize mutex_trylock() fast-path")

from the tip tree and commit:

  3991b105efd5 ("rcu: Move expedited code from tree.c to tree_exp.h")

from the rcu tree.

I fixed it up (I used tree.c from the rcu tree and then applied the
following fic up patch) and can carry the fix as necessary. This is now
fixed as far as linux-next is concerned, but any non trivial conflicts
should be mentioned to your upstream maintainer when your tree is
submitted for merging.  You may also want to consider cooperating with
the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 9 Jun 2016 15:01:10 +1000
Subject: [PATCH] rcu: merge fix for kernel/rcu/tree_exp.h

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 kernel/rcu/tree_exp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/rcu/tree_exp.h b/kernel/rcu/tree_exp.h
index d400434af6b2..6d86ab6ec2c9 100644
--- a/kernel/rcu/tree_exp.h
+++ b/kernel/rcu/tree_exp.h
@@ -253,7 +253,6 @@ static bool exp_funnel_lock(struct rcu_state *rsp, unsigned long s)
 	if (ULONG_CMP_LT(READ_ONCE(rnp->exp_seq_rq), s) &&
 	    (rnp == rnp_root ||
 	     ULONG_CMP_LT(READ_ONCE(rnp_root->exp_seq_rq), s)) &&
-	    !mutex_is_locked(&rsp->exp_mutex) &&
 	    mutex_trylock(&rsp->exp_mutex))
 		goto fastpath;
 
-- 
2.8.1

-- 
Cheers,
Stephen Rothwell
