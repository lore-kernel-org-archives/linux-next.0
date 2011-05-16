From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the namespace tree with Linus' tree
Date: Mon, 16 May 2011 13:47:33 +1000
Message-ID: <20110516134733.e448f6fe.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:56113 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753205Ab1EPDrh (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 15 May 2011 23:47:37 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Cree <mcree@orcon.net.nz>, Matt Turner <mattst88@gmail.com>

Hi Eric,

Today's linux-next merge of the namespace tree got a conflict in
arch/alpha/include/asm/unistd.h arch/alpha/kernel/systbls.S between
commit 90b57f35164a ("alpha: Wire up syscalls new to 2.6.39") from Linus'
tree and commit e975ee91dcc1 ("ns: Wire up the setns system call") from
the namespace tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc arch/alpha/include/asm/unistd.h
index b183416,664383d..0000000
--- a/arch/alpha/include/asm/unistd.h
+++ b/arch/alpha/include/asm/unistd.h
@@@ -452,14 -452,11 +452,15 @@@
  #define __NR_fanotify_init		494
  #define __NR_fanotify_mark		495
  #define __NR_prlimit64			496
 -#define __NR_setns                      497
 +#define __NR_name_to_handle_at		497
 +#define __NR_open_by_handle_at		498
 +#define __NR_clock_adjtime		499
 +#define __NR_syncfs			500
++#define __NR_setns			501
  
  #ifdef __KERNEL__
  
- #define NR_SYSCALLS			501
 -#define NR_SYSCALLS			498
++#define NR_SYSCALLS			502
  
  #define __ARCH_WANT_IPC_PARSE_VERSION
  #define __ARCH_WANT_OLD_READDIR
diff --cc arch/alpha/kernel/systbls.S
index 15f999d,4663fd5..0000000
--- a/arch/alpha/kernel/systbls.S
+++ b/arch/alpha/kernel/systbls.S
@@@ -513,12 -513,9 +513,13 @@@ sys_call_table
  	.quad sys_rt_tgsigqueueinfo
  	.quad sys_perf_event_open
  	.quad sys_fanotify_init
 -	.quad sys_fanotify_mark				/* 495 */
 +	.quad sys_fanotify_mark			/* 495 */
  	.quad sys_prlimit64
 +	.quad sys_name_to_handle_at
 +	.quad sys_open_by_handle_at
 +	.quad sys_clock_adjtime
 +	.quad sys_syncfs			/* 500 */
+ 	.quad sys_setns
  
  	.size sys_call_table, . - sys_call_table
  	.type sys_call_table, @object
