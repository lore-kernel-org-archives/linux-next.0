From: Ingo Molnar <mingo@elte.hu>
Subject: Re: linux-next: manual merge of the arm tree with Linus' tree
Date: Tue, 13 Mar 2012 09:36:30 +0100
Message-ID: <20120313083630.GA10131@elte.hu>
References: <20120313110840.7b444deb6b1bb902c15f3cdf@canb.auug.org.au>
 <20120313061622.GA24357@elte.hu>
 <20120313083310.GA27560@flint.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20120313083310.GA27560@flint.arm.linux.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>
List-Id: linux-next.vger.kernel.org


* Russell King <rmk@arm.linux.org.uk> wrote:

> On Tue, Mar 13, 2012 at 07:16:22AM +0100, Ingo Molnar wrote:
> > 
> > * Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > 
> > > Hi Russell,
> > > 
> > > Today's linux-next merge of the arm tree got a conflict in
> > > kernel/sched/core.c between commit 8c79a045fd59 ("sched/events: Revert
> > > trace_sched_stat_sleeptime()") from Linus' tree and commit 1cf00341547a
> > > ("sched: Introduce the finish_arch_post_lock_switch() scheduler hook")
> > > from the arm tree.
> > > 
> > > Just context changes.  I fixed it up (see below) and can carry the fix as
> > > necessary.
> > 
> > This commit seems simple enough and has PeterZ's ack, but if 
> > there are more scheduler patches coming in this area then 
> > please send it to the scheduler tree first: we can create a 
> > pullable, stable topic branch for it which the ARM tree can 
> > then use.
> > 
> > That approach would also avoid conflicts as a side effect.
> 
> Please check your mailbox:

I'm aware of that old thread, I'd just prefer to hear about your 
plans patching the scheduler *before* you commit it to 
linux-next ;-)

Please make sure none of these scheduler patches go to the ARM 
tree without a proper Git space solution that involves the 
scheduler folks.

Thanks,

	Ingo
