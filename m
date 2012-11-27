From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH] Fix abnormal rcu dynticks_nesting values related to
 async page fault
Date: Tue, 27 Nov 2012 07:25:50 -0800
Message-ID: <20121127152550.GV2474@linux.vnet.ibm.com>
References: <1353993325.14050.49.camel@ThinkPad-T5421.cn.ibm.com>
 <20121127130703.GW25516@redhat.com>
 <50B4C7BD.90807@oracle.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e36.co.us.ibm.com ([32.97.110.154]:41277 "EHLO
	e36.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755373Ab2K0P0I (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 27 Nov 2012 10:26:08 -0500
Received: from /spool/local
	by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Tue, 27 Nov 2012 08:26:07 -0700
Content-Disposition: inline
In-Reply-To: <50B4C7BD.90807@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Sasha Levin <sasha.levin@oracle.com>
Cc: Gleb Natapov <gleb@redhat.com>, Li Zhong <zhong@linux.vnet.ibm.com>, linux-next list <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, avi@redhat.com, fweisbec@gmail.com

On Tue, Nov 27, 2012 at 09:01:33AM -0500, Sasha Levin wrote:
> On 11/27/2012 08:07 AM, Gleb Natapov wrote:
> > Those rcu_irq_enter()/rcu_irq_exit() were introduced by commit
> > c5e015d4949aa665 "KVM guest: exit idleness when handling
> > KVM_PV_REASON_PAGE_NOT_PRESENT", but now I am starting to question this
> > commit. KVM_PV_REASON_PAGE_NOT_PRESENT should not kick cpu out of
> > idleness. kvm_async_pf_task_wait() checks that cpu is idle and calls
> > halt if it is. After that commit schedule() may be called between
> > rcu_irq_enter()/rcu_irq_exit() which is probably illegal. Paul?

It is legal to call rcu_irq_enter() and then schedule().

In fact, it turns out that it -has- to be legal, due to some
architectures' quaint habit of entering interrupt/exception handlers
that they never leave, and possibly vice versa.

> otoh, calling schedule() apparently kicks cpu out of idleness now.

But if you call rcu_irq_enter() and then schedule(), and if schedule()
switches to the idle thread, and if execution proceeds to the point
where rcu_idle_enter() is called, then, RCU will quite naturally
decide that it is fully idle.  At that point, it is illegal to invoke
rcu_irq_exit() unless/until you have either: (1) exited the idle loop
(as in called rcu_idle_exit()) or (2) taken an interrupt, which will
call rcu_irq_enter().

And to think that when I started coding RCU's dyntick-idle funtionality,
I was thinking in terms of a simple nesting counter.  Silly me!  ;-)

							Thanx, Paul
