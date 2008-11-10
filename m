From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the cputime tree
Date: Mon, 10 Nov 2008 17:09:43 +1100
Message-ID: <20081110170943.114a7786.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:58685 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750721AbYKJGJs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 10 Nov 2008 01:09:48 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: linux-next@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>

Hi Martin,

Today's linux-next merge of the cputime tree got a conflict in
arch/s390/kernel/process.c between commit
2933aa2758dc5e520f83a5f4c3f255aea297bd3f ("[S390] ftrace: disable tracing
on idle psw") from the s390 tree and commit
bbda3e73a200e966955b15a08a8be05a7c1d430e ("[PATCH] improve precision of
idle accounting") from the cputime tree.

I attempted a fix (see below) but please either provide me with a better
patch or fix this conflict in one or the other tree.  You could do this
by merging the s390 tree into the cputime tree (but you would need to be
careful to keep the consistent) and fixing this in the merge commit.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc arch/s390/kernel/process.c
index 04f8c67,9334ca3..0000000
--- a/arch/s390/kernel/process.c
+++ b/arch/s390/kernel/process.c
@@@ -136,12 -133,42 +133,45 @@@ static void default_idle(void
  		return;
  	}
  	trace_hardirqs_on();
 +	/* Don't trace preempt off for idle. */
 +	stop_critical_timings();
+ 	vtime_stop_cpu_timer();
+ 
+ 	/*
+ 	 * The inline assembly is equivalent to
+ 	 * 	idle->idle_enter = get_clock();
+ 	 * 	__load_psw_mask(psw_kernel_bits | PSW_MASK_WAIT |
+ 	 *			   PSW_MASK_IO | PSW_MASK_EXT);
+ 	 * The difference is that the inline assembly makes sure that
+ 	 * the stck instruction is right before the lpsw instruction.
+ 	 * This is done to increase the precision.
+ 	 */
+ 
  	/* Wait for external, I/O or machine check interrupt. */
- 	__load_psw_mask(psw_kernel_bits | PSW_MASK_WAIT |
- 			PSW_MASK_IO | PSW_MASK_EXT);
+ 	psw.mask = psw_kernel_bits|PSW_MASK_WAIT|PSW_MASK_IO|PSW_MASK_EXT;
+ #ifndef __s390x__
+ 	asm volatile(
+ 		"	basr	%0,0\n"
+ 		"0:	ahi	%0,1f-0b\n"
+ 		"	st	%0,4(%2)\n"
+ 		"	stck	0(%3)\n"
+ 		"	lpsw	0(%2)\n"
+ 		"1:"
+ 		: "=&d" (addr), "=m" (idle->idle_enter)
+ 		: "a" (&psw), "a" (&idle->idle_enter), "m" (psw)
+ 		: "memory", "cc");
+ #else /* __s390x__ */
+ 	asm volatile(
+ 		"	larl	%0,1f\n"
+ 		"	stg	%0,8(%2)\n"
+ 		"	stck	0(%3)\n"
+ 		"	lpswe	0(%2)\n"
+ 		"1:"
+ 		: "=&d" (addr), "=m" (idle->idle_enter)
+ 		: "a" (&psw), "a" (&idle->idle_enter), "m" (psw)
+ 		: "memory", "cc");
+ #endif /* __s390x__ */
 +	start_critical_timings();
  }
  
  void cpu_idle(void)
