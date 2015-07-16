From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the rcu tree with the tip tree
Date: Thu, 16 Jul 2015 12:57:46 +1000
Message-ID: <20150716125746.07ab661e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35055 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753504AbbGPC5s (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 15 Jul 2015 22:57:48 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

Hi Paul,

Today's linux-next merge of the rcu tree got a conflict in:

  arch/x86/kernel/traps.c

between commit:

  8c84014f3bbb ("x86/entry: Remove exception_enter() from most trap handlers")

from the tip tree and commit:

  02300fdb3e5f ("rcu: Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()")

from the rcu tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/x86/kernel/traps.c
index 8e65d8a9b8db,c5a5231d1d11..000000000000
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@@ -131,14 -136,19 +131,14 @@@ void ist_enter(struct pt_regs *regs
  	preempt_count_add(HARDIRQ_OFFSET);
  
  	/* This code is a bit fragile.  Test it. */
- 	rcu_lockdep_assert(rcu_is_watching(), "ist_enter didn't work");
+ 	RCU_LOCKDEP_WARN(!rcu_is_watching(), "ist_enter didn't work");
 -
 -	return prev_state;
  }
  
 -void ist_exit(struct pt_regs *regs, enum ctx_state prev_state)
 +void ist_exit(struct pt_regs *regs)
  {
 -	/* Must be before exception_exit. */
  	preempt_count_sub(HARDIRQ_OFFSET);
  
 -	if (user_mode(regs))
 -		return exception_exit(prev_state);
 -	else
 +	if (!user_mode(regs))
  		rcu_nmi_exit();
  }
  
