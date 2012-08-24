From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: ia64 won't boot because of rcu_sched self-detected stall
Date: Fri, 24 Aug 2012 13:37:15 -0700
Message-ID: <20120824203714.GT2472@linux.vnet.ibm.com>
References: <CA+8MBbKnW=V_ytS-1qF+O9H63YWROhhc7dTru2BOYbS16iS3Tw@mail.gmail.com>
 <20120821232038.GV2456@linux.vnet.ibm.com>
 <3908561D78D1C84285E8C5FCA982C28F19396504@ORSMSX104.amr.corp.intel.com>
 <20120822004608.GW2456@linux.vnet.ibm.com>
 <3908561D78D1C84285E8C5FCA982C28F19397175@ORSMSX104.amr.corp.intel.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e32.co.us.ibm.com ([32.97.110.150]:59204 "EHLO
	e32.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757675Ab2HXUh3 (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Aug 2012 16:37:29 -0400
Received: from /spool/local
	by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 24 Aug 2012 14:37:28 -0600
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com [9.17.195.228])
	by d03dlp02.boulder.ibm.com (Postfix) with ESMTP id 1DCAC3E4003D
	for <linux-next@vger.kernel.org>; Fri, 24 Aug 2012 14:37:25 -0600 (MDT)
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id q7OKbJdA133220
	for <linux-next@vger.kernel.org>; Fri, 24 Aug 2012 14:37:22 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id q7OKbGVE029196
	for <linux-next@vger.kernel.org>; Fri, 24 Aug 2012 14:37:18 -0600
Content-Disposition: inline
In-Reply-To: <3908561D78D1C84285E8C5FCA982C28F19397175@ORSMSX104.amr.corp.intel.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Luck, Tony" <tony.luck@intel.com>
Cc: "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "fweisbec@gmail.com" <fweisbec@gmail.com>

On Thu, Aug 23, 2012 at 07:54:37PM +0000, Luck, Tony wrote:
> > Without the calls to rcu_idle_enter() and rcu_idle_exit(), RCU has no
> > way of knowing that the CPU is idle, so waits forever for a context
> > switch.
> 
> Adding the calls at the places you suggested solves the problem. Thanks.
> 
> Which tree is feeding these changes to linux-next? How do I get
> this ia64 fix into that tree so it will go to Linus in the same merge
> that the changes that required this will be in?
> 
> Do you want me to create a patch (I can do that, but I'm not sure
> that I can write a good commit message). If someone else does,
> then it can be marked:
> 
> Tested-by: Tony Luck <tony.luck@intel.com>

Does the following match what you tested?  I optimistically assumed
that it was, but figured I should check.  ;-)

							Thanx, Paul

------------------------------------------------------------------------

ia64: Add missing RCU idle APIs on idle loop

Traditionally, the entire idle task served as an RCU quiescent state.
But when RCU read side critical sections started appearing within the
idle loop, this traditional strategy became untenable.  The fix was to
create new RCU APIs named rcu_idle_enter() and rcu_idle_exit(), which
must be called by each architecture's idle loop so that RCU can tell
when it is safe to ignore a given idle CPU.

Unfortunately, this fix was never applied to ia64, a shortcoming remedied
by this commit.

Reported by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Paul E. McKenney <paul.mckenney@linaro.org>
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
Tested by: Tony Luck <tony.luck@intel.com>

diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index dd6fc14..3e316ec 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -29,6 +29,7 @@
 #include <linux/kdebug.h>
 #include <linux/utsname.h>
 #include <linux/tracehook.h>
+#include <linux/rcupdate.h>
 
 #include <asm/cpu.h>
 #include <asm/delay.h>
@@ -279,6 +280,7 @@ cpu_idle (void)
 
 	/* endless idle loop with no priority at all */
 	while (1) {
+		rcu_idle_enter();
 		if (can_do_pal_halt) {
 			current_thread_info()->status &= ~TS_POLLING;
 			/*
@@ -309,6 +311,7 @@ cpu_idle (void)
 			normal_xtp();
 #endif
 		}
+		rcu_idle_exit();
 		schedule_preempt_disabled();
 		check_pgt_cache();
 		if (cpu_is_offline(cpu))
