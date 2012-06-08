From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Jun 7 (fs / block / rcu)
Date: Thu, 7 Jun 2012 21:07:15 -0700
Message-ID: <20120608040715.GA868@linux.vnet.ibm.com>
References: <20120607131802.d90de854f06c5530c5fb2b33@canb.auug.org.au>
 <4FD0DD9F.5040206@xenotime.net>
 <20120607200007.GA3352@codeaurora.org>
 <20120607223107.GA21150@sirena.org.uk>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e6.ny.us.ibm.com ([32.97.182.146]:57096 "EHLO e6.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750817Ab2FHEH7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 8 Jun 2012 00:07:59 -0400
Received: from /spool/local
	by e6.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 8 Jun 2012 00:07:58 -0400
Content-Disposition: inline
In-Reply-To: <20120607223107.GA21150@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: David Brown <davidb@codeaurora.org>, Randy Dunlap <rdunlap@xenotime.net>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Thu, Jun 07, 2012 at 11:31:07PM +0100, Mark Brown wrote:
> On Thu, Jun 07, 2012 at 01:00:07PM -0700, David Brown wrote:
> > On Thu, Jun 07, 2012 at 09:58:07AM -0700, Randy Dunlap wrote:
> 
> > net/built-in.o:/home/davidb/upstream/kdev/kernel/include/linux/rcupdate.h:312: more undefined references to `rcu_is_cpu_idle' follow
> 
> This is because rcu_is_cpu_idle() is only defined if PROVE_RCU but it's
> used in a bunch of other cases.

The following should clear it up, please accept my apologies for the
hassle.

							Thanx, Paul

------------------------------------------------------------------------

rcu: Fix rcu_is_cpu_idle() #ifdef in TINY_RCU

The rcu_is_cpu_idle() function is used if CONFIG_DEBUG_LOCK_ALLOC,
but TINY_RCU defines it only when CONFIG_PROVE_RCU.  This causes
build failures when CONFIG_DEBUG_LOCK_ALLOC=y but CONFIG_PROVE_RCU=n.
This commit therefore adjusts the #ifdefs for rcu_is_cpu_idle() so
that it is defined when CONFIG_DEBUG_LOCK_ALLOC=y.

Signed-off-by: Paul E. McKenney <paul.mckenney@linaro.org>
Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>

diff --git a/kernel/rcutiny.c b/kernel/rcutiny.c
index 37a5444..547b1fe 100644
--- a/kernel/rcutiny.c
+++ b/kernel/rcutiny.c
@@ -172,7 +172,7 @@ void rcu_irq_enter(void)
 	local_irq_restore(flags);
 }
 
-#ifdef CONFIG_PROVE_RCU
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
 
 /*
  * Test whether RCU thinks that the current CPU is idle.
@@ -183,7 +183,7 @@ int rcu_is_cpu_idle(void)
 }
 EXPORT_SYMBOL(rcu_is_cpu_idle);
 
-#endif /* #ifdef CONFIG_PROVE_RCU */
+#endif /* #ifdef CONFIG_DEBUG_LOCK_ALLOC */
 
 /*
  * Test whether the current CPU was interrupted from idle.  Nested
