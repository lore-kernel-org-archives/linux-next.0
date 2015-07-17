From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build failure after merge of the rcu tree
Date: Fri, 17 Jul 2015 10:35:29 -0700
Message-ID: <20150717173528.GH3717@linux.vnet.ibm.com>
References: <20150716131423.4c849184@canb.auug.org.au>
 <20150716035138.GQ3717@linux.vnet.ibm.com>
 <20150717114046.GB5396@gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e34.co.us.ibm.com ([32.97.110.152]:40849 "EHLO
	e34.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753079AbbGQRfe (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 17 Jul 2015 13:35:34 -0400
Received: from /spool/local
	by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-next@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
	Fri, 17 Jul 2015 11:35:34 -0600
Content-Disposition: inline
In-Reply-To: <20150717114046.GB5396@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Lutomirski <luto@kernel.org>

On Fri, Jul 17, 2015 at 01:40:46PM +0200, Ingo Molnar wrote:
> 
> * Paul E. McKenney <paulmck@linux.vnet.ibm.com> wrote:
> 
> > On Thu, Jul 16, 2015 at 01:14:23PM +1000, Stephen Rothwell wrote:
> > > Hi Paul,
> > > 
> > > After merging the rcu tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > > 
> > > kernel/notifier.c: In function 'notify_die':
> > > kernel/notifier.c:547:2: error: implicit declaration of function 'rcu_lockdep_assert' [-Werror=implicit-function-declaration]
> > >   rcu_lockdep_assert(rcu_is_watching(),
> > >   ^
> > > 
> > > Caused by commit
> > > 
> > >   02300fdb3e5f ("rcu: Rename rcu_lockdep_assert() to RCU_LOCKDEP_WARN()")
> > > 
> > > interacting with commit
> > > 
> > >   e727c7d7a11e ("notifiers, RCU: Assert that RCU is watching in notify_die()")
> > > 
> > > [ and I also noted
> > >   0333a209cbf6 ("x86/irq, context_tracking: Document how IRQ context tracking works and add an RCU assertion")
> > > ]
> > > 
> > > from the tip tree.
> > 
> > Thank you in both cases!  I suspect that more will follow, so is there
> > something I can do to make this easier?  (Hard for me to patch stuff
> > that is not yet in the tree...)
> 
> So we could keep the old macro around as well for such cases, and then remove it 
> in v4.4 or so?

Works for me!  Will do.

							Thanx, Paul
