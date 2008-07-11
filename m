From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the sched tree
Date: Fri, 11 Jul 2008 10:43:33 +0200
Message-ID: <20080711084333.GA17217@elte.hu>
References: <20080711112146.f7f98434.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:44551 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757946AbYGKInv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 04:43:51 -0400
Content-Disposition: inline
In-Reply-To: <20080711112146.f7f98434.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, linux-next@vger.kernel.org, Nick Piggin <nickpiggin@yahoo.com.au>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>


* Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> Today's linux-next merge of the sched tree got a conflict in 
> kernel/rcupreempt.c between commit 
> 70ff05554f91a1edda1f11684da1dbde09e2feea ("Fix PREEMPT_RCU without 
> HOTPLUG_CPU") from Linus' tree and commit 
> 4446a36ff8c74ac3b32feb009b651048e129c6af ("rcu: add call_rcu_sched()") 
> from the sched tree.
> 
> The former moved rcu_online_cpu() out of the CONFIG_HOTPLUG_CPU ifdef 
> and mode it __cpuinit, while the latter updated it.  I applied the 
> latter updates to the newly positioned function.  This may well not be 
> correct but it does build.  Please check.

yeah, that's how i resolved it too.

	Ingo
