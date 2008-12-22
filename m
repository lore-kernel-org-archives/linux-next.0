From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the sched tree
Date: Mon, 22 Dec 2008 12:05:43 +1100
Message-ID: <20081222120543.92004d90.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:38438 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750744AbYLVBFy (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 21 Dec 2008 20:05:54 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-next@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>

Hi all,

Today's linux-next merge of the sched tree got a conflict in
include/linux/hardirq.h between commit
17666f02b118099028522dfc3df00a235700e216 ("ftrace: nmi safe code
modification") from the ftrace tree and commit
64db4cfff99c04cd5f550357edcc8780f96b54a2 (""Tree RCU": scalable classic
RCU implementation") from the sched tree.

I fixed it up (see below) and can carry the fix as necessary.
-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

diff --cc include/linux/hardirq.h
index 89a56d7,9b70b92..0000000
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@@ -162,17 -163,7 +164,19 @@@ extern void irq_enter(void)
   */
  extern void irq_exit(void);
  
 -#define nmi_enter()		do { lockdep_off(); rcu_nmi_enter(); __irq_enter(); } while (0)
 -#define nmi_exit()		do { __irq_exit(); rcu_nmi_exit(); lockdep_on(); } while (0)
 +#define nmi_enter()				\
 +	do {					\
 +		ftrace_nmi_enter();		\
 +		lockdep_off();			\
++		rcu_nmi_enter();		\
 +		__irq_enter();			\
 +	} while (0)
 +#define nmi_exit()				\
 +	do {					\
 +		__irq_exit();			\
++		rcu_nmi_exit();			\
 +		lockdep_on();			\
 +		ftrace_nmi_exit();		\
 +	} while (0)
  
  #endif /* LINUX_HARDIRQ_H */
