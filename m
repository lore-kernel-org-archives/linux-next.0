From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kvm tree with Linus' tree
Date: Thu, 13 May 2010 13:43:06 +1000
Message-ID: <20100513134306.d6b37362.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56047 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753454Ab0EMDnL (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 12 May 2010 23:43:11 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Avi Kivity <avi@qumranet.com>, Marcelo Tosatti <mtosatti@redhat.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Robin Holt <holt@sgi.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>

Hi all,

Today's linux-next merge of the kvm tree got a conflict in kernel/fork.c
between commit 34441427aab4bdb3069a4ffcda69a99357abcb2e ("revert "procfs:
provide stack information for threads" and its fixup commits") from
Linus' tree and commit faa4602e47690fb11221e00f9b9697c8dc0d4b19 ("x86,
perf, bts, mm: Delete the never used BTS-ptrace code") from the kvm tree (via
a merge of part of the tip tree).

Just context changes.  I fixed it up (see below) and can carry the fix
for a while.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc kernel/fork.c
index 4c14942,5d3592d..0000000
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@@ -1111,9 -1111,8 +1111,7 @@@ static struct task_struct *copy_process
  	p->memcg_batch.do_batch = 0;
  	p->memcg_batch.memcg = NULL;
  #endif
 -	p->stack_start = stack_start;
  
- 	p->bts = NULL;
- 
  	/* Perform scheduler related setup. Assign this task to a CPU. */
  	sched_fork(p, clone_flags);
  
