From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [tip:sched/core] sched/core: Add debugging code to catch missing
 update_rq_clock() calls
Date: Fri, 3 Feb 2017 07:54:53 -0800
Message-ID: <20170203155453.GA23760@linux.vnet.ibm.com>
References: <20170130213435.GM31613@codeblueprint.co.uk>
 <33118425-8548-475A-8DED-9A2424C0BCCC@linux.vnet.ibm.com>
 <1485863317.4498.2.camel@gmx.de>
 <CAOxpaSW_GnndoxLBPtyTrqPJ9XOWvgXOQNDf8D+6OohWeObn5Q@mail.gmail.com>
 <20170202155506.GX6515@twins.programming.kicks-ass.net>
 <3BAB5673-2BF8-46E0-8018-6A0F3DEEC9F7@linux.vnet.ibm.com>
 <20170203085301.GA6515@twins.programming.kicks-ass.net>
 <1486126774.4277.6.camel@gmx.de>
 <20170203133748.GB6515@twins.programming.kicks-ass.net>
 <20170203154457.GJ30506@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170203154457.GJ30506@linux.vnet.ibm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mike Galbraith <efault@gmx.de>, Sachin Sant <sachinp@linux.vnet.ibm.com>, Ross Zwisler <zwisler@gmail.com>, Matt Fleming <matt@codeblueprint.co.uk>, Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Fri, Feb 03, 2017 at 07:44:57AM -0800, Paul E. McKenney wrote:
> On Fri, Feb 03, 2017 at 02:37:48PM +0100, Peter Zijlstra wrote:
> > On Fri, Feb 03, 2017 at 01:59:34PM +0100, Mike Galbraith wrote:
> > > On Fri, 2017-02-03 at 09:53 +0100, Peter Zijlstra wrote:
> > > > On Fri, Feb 03, 2017 at 10:03:14AM +0530, Sachin Sant wrote:
> > > 
> > > > > I ran few cycles of cpu hot(un)plug tests. In most cases it works except one
> > > > > where I ran into rcu stall:
> > > > > 
> > > > > [  173.493453] INFO: rcu_sched detected stalls on CPUs/tasks:
> > > > > [  173.493473] > > 	> > 8-...: (2 GPs behind) idle=006/140000000000000/0 softirq=0/0 fqs=2996 
> > > > > [  173.493476] > > 	> > (detected by 0, t=6002 jiffies, g=885, c=884, q=6350)
> > > > 
> > > > Right, I actually saw that too, but I don't think that would be related
> > > > to my patch. I'll see if I can dig into this though, ought to get fixed
> > > > regardless.
> > > 
> > > FWIW, I'm not seeing stalls/hangs while beating hotplug up in tip. (so
> > > next grew a wart?)
> > 
> > I've seen it on tip. It looks like hot unplug goes really slow when
> > there's running tasks on the CPU being taken down.
> > 
> > What I did was something like:
> > 
> >   taskset -p $((1<<1)) $$
> >   for ((i=0; i<20; i++)) do while :; do :; done & done
> > 
> >   taskset -p $((1<<0)) $$
> >   echo 0 > /sys/devices/system/cpu/cpu1/online
> > 
> > And with those 20 tasks stuck sucking cycles on CPU1, the unplug goes
> > _really_ slow and the RCU stall triggers. What I suspect happens is that
> > hotplug stops participating in the RCU state machine early, but only
> > tells RCU about it really late, and in between it gets suspicious it
> > takes too long.
> > 
> > I've yet to dig through the RCU code to figure out the exact sequence of
> > events, but found the above to be fairly reliable in triggering the
> > issue.

> If you send me the full splat from the dmesg and the RCU portions of
> .config, I will take a look.  Is this new behavior, or a new test?

If new behavior, I would be most suspicious of these commits in -rcu which
recently entered -tip:

19e4d983cda1 rcu: Place guard on rcu_all_qs() and rcu_note_context_switch() actions
913324b1364f rcu: Eliminate flavor scan in rcu_momentary_dyntick_idle()
fcdcfefafa45 rcu: Pull rcu_qs_ctr into rcu_dynticks structure
0919a0b7e7a5 rcu: Pull rcu_sched_qs_mask into rcu_dynticks structure
caa7c8e34293 rcu: Make rcu_note_context_switch() do deferred NOCB wakeups
41e4b159d516 rcu: Make rcu_all_qs() do deferred NOCB wakeups
b457a3356a68 rcu: Make call_rcu() do deferred NOCB wakeups

Does reverting any of these help?

							Thanx, Paul
