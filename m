From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the slab tree with Linus' tree
Date: Thu, 5 Mar 2009 16:18:16 +1100
Message-ID: <20090305161816.ca8ac8e4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:50023 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750919AbZCEFS0 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 5 Mar 2009 00:18:26 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Pekka Enberg <penberg@cs.helsinki.fi>, Christoph Lameter <cl@linux-foundation.org>
Cc: linux-next@vger.kernel.org, Nick Piggin <npiggin@suse.de>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

Hi all,

Today's linux-next merge of the slab tree got a conflict in
include/linux/rcupdate.h between commit
a682604838763981613e42015cd0e39f2989d6bb ("rcu: Teach RCU that idle task
is not quiscent state at boot") from Linus' tree and commit
32efb35b328d0e87fa5358239c54c889226cc6e7 ("SLQB slab allocator (try 2)")
from the slab tree.

Just a context change.  I fixed it up (see below) and can carry the fix
as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/rcupdate.h
index 528343e,e2917ee..0000000
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@@ -42,19 -43,6 +43,9 @@@
  #include <linux/lockdep.h>
  #include <linux/completion.h>
  
- /**
-  * struct rcu_head - callback structure for use with RCU
-  * @next: next update requests in a list
-  * @func: actual update function to call after the grace period.
-  */
- struct rcu_head {
- 	struct rcu_head *next;
- 	void (*func)(struct rcu_head *head);
- };
- 
 +/* Internal to kernel, but needed by rcupreempt.h. */
 +extern int rcu_scheduler_active;
 +
  #if defined(CONFIG_CLASSIC_RCU)
  #include <linux/rcuclassic.h>
  #elif defined(CONFIG_TREE_RCU)
