From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ftrace tree with Linus' tree
Date: Thu, 5 Nov 2015 13:51:40 +1100
Message-ID: <20151105135140.2399976f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40756 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756055AbbKECvn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 4 Nov 2015 21:51:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Steven,

Today's linux-next merge of the ftrace tree got a conflict in:

  kernel/trace/trace_stack.c

between commit:

  a2d762904832 ("tracing: Have stack tracer force RCU to be watching")

from Linus' tree and commit:

  d332736df0c2 ("tracing: Rename max_stack_lock to stack_trace_max_lock")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/trace/trace_stack.c
index 8abf1ba18085,0bd212af406c..000000000000
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@@ -85,19 -91,9 +91,19 @@@ check_stack(unsigned long ip, unsigned 
  	if (!object_is_on_stack(stack))
  		return;
  
 +	/* Can't do this from NMI context (can cause deadlocks) */
 +	if (in_nmi())
 +		return;
 +
  	local_irq_save(flags);
- 	arch_spin_lock(&max_stack_lock);
+ 	arch_spin_lock(&stack_trace_max_lock);
  
 +	/*
 +	 * RCU may not be watching, make it see us.
 +	 * The stack trace code uses rcu_sched.
 +	 */
 +	rcu_irq_enter();
 +
  	/* In case another CPU set the tracer_frame on us */
  	if (unlikely(!frame_size))
  		this_size -= tracer_frame;
@@@ -179,8 -175,7 +185,8 @@@
  	}
  
   out:
 +	rcu_irq_exit();
- 	arch_spin_unlock(&max_stack_lock);
+ 	arch_spin_unlock(&stack_trace_max_lock);
  	local_irq_restore(flags);
  }
  
