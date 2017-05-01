From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the ftrace tree
Date: Mon, 1 May 2017 13:18:51 +1000
Message-ID: <20170501131851.677c8799@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41997 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1164162AbdEADSy (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 30 Apr 2017 23:18:54 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  kernel/rcu/tree.c

between commit:

  a278d4718988 ("rcu: Fix dyntick-idle tracing")

from the ftrace tree and commit:

  e83d58dc7de2 ("rcu: Add lockdep_assert_held() teeth to tree.c")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

-- 
Cheers,
Stephen Rothwell

diff --cc kernel/rcu/tree.c
index ea2da0b22a6f,e180eea5061e..000000000000
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@@ -792,9 -785,10 +799,10 @@@ static void rcu_eqs_enter_common(bool u
  {
  	struct rcu_state *rsp;
  	struct rcu_data *rdp;
 -	RCU_TRACE(struct rcu_dynticks *rdtp = this_cpu_ptr(&rcu_dynticks);)
 +	struct rcu_dynticks *rdtp = this_cpu_ptr(&rcu_dynticks);
  
+ 	RCU_LOCKDEP_WARN(!irqs_disabled(), "rcu_eqs_enter_common() invoked with irqs enabled!!!");
 -	trace_rcu_dyntick(TPS("Start"), oldval, rdtp->dynticks_nesting);
 +	trace_rcu_dyntick(TPS("Start"), rdtp->dynticks_nesting, 0);
  	if (IS_ENABLED(CONFIG_RCU_EQS_DEBUG) &&
  	    !user && !is_idle_task(current)) {
  		struct task_struct *idle __maybe_unused =
