From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ
 related?)
Date: Tue, 26 Apr 2011 05:42:56 -0700
Message-ID: <20110426124256.GI4308@linux.vnet.ibm.com>
References: <BANLkTind84Gf8JA9Fa4QL2GbaF8nMNhDzw@mail.gmail.com>
 <20110423210539.GI2628@linux.vnet.ibm.com>
 <BANLkTimXW2=PYOXkKjnLuH+eN2TjZBqAxw@mail.gmail.com>
 <BANLkTi=ntjm-5D=OD1oFogpNjmJSJiZygQ@mail.gmail.com>
 <BANLkTim9H1k4c7xSZZJ09WXs8WCeCQQJJg@mail.gmail.com>
 <20110424062728.GM2628@linux.vnet.ibm.com>
 <BANLkTinTd10K6Ho6FhuynROT7yDLHNLojw@mail.gmail.com>
 <20110424164331.GN2628@linux.vnet.ibm.com>
 <20110426050612.GA7651@linux.vnet.ibm.com>
 <BANLkTi=uvTkKi2Py5v818PKCDYKoLcDCSw@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e8.ny.us.ibm.com ([32.97.182.138]:53867 "EHLO e8.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751568Ab1DZMnA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 26 Apr 2011 08:43:00 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTi=uvTkKi2Py5v818PKCDYKoLcDCSw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org

On Tue, Apr 26, 2011 at 01:45:31PM +0200, Sedat Dilek wrote:
> On Tue, Apr 26, 2011 at 7:06 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Sun, Apr 24, 2011 at 09:43:31AM -0700, Paul E. McKenney wrote:
> >> On Sun, Apr 24, 2011 at 11:36:44AM +0200, Sedat Dilek wrote:
> >> > On Sun, Apr 24, 2011 at 8:27 AM, Paul E. McKenney
> >> > <paulmck@linux.vnet.ibm.com> wrote:
> >>
> >> [ . . . ]
> >>
> >> > > OK, this looks unrelated, but just in case, could you please t=
ry it
> >> > > again with the following patch? =A0(Not mainlinable, debug onl=
y.)
> >> > >
> >> > > Also, it does look like you are still seeing a grace-period ha=
ng.
> >> > > Could you please send the output of the script? =A0Same one as=
 last time.
> >> > >
> >> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >> > >
> >> > > --------------------------------------------------------------=
----------
> >> > >
> >> > > =A0debugobjects.c | =A0 =A08 +++++---
> >> > > =A01 file changed, 5 insertions(+), 3 deletions(-)
> >> > >
> >> > > diff --git a/lib/debugobjects.c b/lib/debugobjects.c
> >> > > index 9d86e45..10a7c7a 100644
> >> > > --- a/lib/debugobjects.c
> >> > > +++ b/lib/debugobjects.c
> >> > > @@ -289,10 +289,12 @@ static void debug_object_is_on_stack(voi=
d *addr, int onstack)
> >> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> >> > >
> >> > > =A0 =A0 =A0 =A0limit++;
> >> > > - =A0 =A0 =A0 if (is_on_stack)
> >> > > + =A0 =A0 =A0 if (is_on_stack) {
> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct rcu_head *p =3D (struct r=
cu_head *)addr;
> >> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_WARNING
> >> > > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ODEBUG: object i=
s on stack, but not annotated\n");
> >> > > - =A0 =A0 =A0 else
> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"ODEBUG: object i=
s on stack, but not annotated: %p\n",
> >> > > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p->func);
> >> > > + =A0 =A0 =A0 } else
> >> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_WARNING
> >> > > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "ODEBUG: object is=
 not on stack, but annotated\n");
> >> > > =A0 =A0 =A0 =A0WARN_ON(1);
> >> > >
> >> >
> >> > Somehow your attached patch was not applicable.
> >> > As the changes were a few lines I applied it by myself.
> >> > Attached are log, dmesg and patches (orig + mine)
> >>
> >> Hmmm... =A0Does 0xc10231a1 correspond to a function in your build?=
 =A0If so,
> >> could you please let me know which one?
> >>
> >> OK, so according to "ps" the per-CPU kthread is runnable, but it a=
ppears
> >> to never run. =A0You only have one CPU, so it cannot be waiting du=
e to
> >> running on the wrong CPU. =A0The only other loop is in wait_event(=
), and
> >> that code looks good -- besides, if wait_event() was broken, we wo=
uld
> >> be seeing breakage everywhere.
> >>
> >> Peter, any thoughts on what I might have done wrong to get the sch=
eduler
> >> into a state where it was ignoring a runnable realtime task?
> >
> > Hello, Sedat,
> >
> > Here is a diagnostic patch to apply on top of sedat.2011.04.23a fro=
m
> > the -rcu git tree. =A0Could you please try it out, let me know what
> > happens, and run the last collectdebugfs.sh during the test?
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >
> > -------------------------------------------------------------------=
-----
> >
> > diff --git a/kernel/rcutree.c b/kernel/rcutree.c
> > index 6cf6e47..65ae701 100644
> > --- a/kernel/rcutree.c
> > +++ b/kernel/rcutree.c
> > @@ -1524,9 +1524,9 @@ static void rcu_cpu_kthread_setrt(int cpu, in=
t to_rt)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> > =A0 =A0 =A0 =A0if (to_rt) {
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0policy =3D SCHED_NORMAL;
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sp.sched_priority =3D RCU_KTHREAD_PRI=
O;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 sp.sched_priority =3D 0;
> > =A0 =A0 =A0 =A0} else {
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 policy =3D SCHED_FIFO;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 policy =3D SCHED_NORMAL;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sp.sched_priority =3D 0;
> > =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(t, policy, &sp);
> > @@ -1566,8 +1566,8 @@ static void rcu_yield(void (*f)(unsigned long=
), unsigned long arg)
> > =A0 =A0 =A0 =A0sp.sched_priority =3D 0;
> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(current, SCHED_NORMAL, &s=
p);
> > =A0 =A0 =A0 =A0schedule();
> > - =A0 =A0 =A0 sp.sched_priority =3D RCU_KTHREAD_PRIO;
> > - =A0 =A0 =A0 sched_setscheduler_nocheck(current, SCHED_FIFO, &sp);
> > + =A0 =A0 =A0 sp.sched_priority =3D 0;
> > + =A0 =A0 =A0 sched_setscheduler_nocheck(current, SCHED_NORMAL, &sp=
);
> > =A0 =A0 =A0 =A0del_timer(&yield_timer);
> > =A0}
> >
> > @@ -1671,8 +1671,8 @@ static int __cpuinit rcu_spawn_one_cpu_kthrea=
d(int cpu)
> > =A0 =A0 =A0 =A0WARN_ON_ONCE(per_cpu(rcu_cpu_kthread_task, cpu) !=3D=
 NULL);
> > =A0 =A0 =A0 =A0per_cpu(rcu_cpu_kthread_task, cpu) =3D t;
> > =A0 =A0 =A0 =A0wake_up_process(t);
> > - =A0 =A0 =A0 sp.sched_priority =3D RCU_KTHREAD_PRIO;
> > - =A0 =A0 =A0 sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
> > + =A0 =A0 =A0 sp.sched_priority =3D 0;
> > + =A0 =A0 =A0 sched_setscheduler_nocheck(t, SCHED_NORMAL, &sp);
> > =A0 =A0 =A0 =A0return 0;
> > =A0}
> >
> > @@ -1713,8 +1713,8 @@ static int rcu_node_kthread(void *arg)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cont=
inue;
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0per_cpu(rcu_cpu_has_=
work, cpu) =3D 1;
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sp.sched_priority =3D=
 RCU_KTHREAD_PRIO;
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sched_setscheduler_no=
check(t, SCHED_FIFO, &sp);
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sp.sched_priority =3D=
 0;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 sched_setscheduler_no=
check(t, SCHED_NORMAL, &sp);
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0preempt_enable();
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> > =A0 =A0 =A0 =A0}
> > diff --git a/kernel/rcutree_plugin.h b/kernel/rcutree_plugin.h
> > index a21413d..baee185 100644
> > --- a/kernel/rcutree_plugin.h
> > +++ b/kernel/rcutree_plugin.h
> > @@ -1307,8 +1307,8 @@ static int __cpuinit rcu_spawn_one_boost_kthr=
ead(struct rcu_state *rsp,
> > =A0 =A0 =A0 =A0rnp->boost_kthread_task =3D t;
> > =A0 =A0 =A0 =A0raw_spin_unlock_irqrestore(&rnp->lock, flags);
> > =A0 =A0 =A0 =A0wake_up_process(t);
> > - =A0 =A0 =A0 sp.sched_priority =3D RCU_KTHREAD_PRIO;
> > - =A0 =A0 =A0 sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
> > + =A0 =A0 =A0 sp.sched_priority =3D 0;
> > + =A0 =A0 =A0 sched_setscheduler_nocheck(t, SCHED_NORMAL, &sp);
> > =A0 =A0 =A0 =A0return 0;
> > =A0}
> >
> >
>=20
> Hi Paul,
>=20
> I have tested with your patch and kept the kernel-config file from
> previous tests (don't get confused by the new name).
> Hope this helps you.
>=20
> I have some questions to k-c options espcially X86_UP and
> CONFIG_RCU_FANOUT=3D32 options.
> To what extent can they influence our RCU issue?
> The below options were not set for this round of testing, but I would
> like to have a feedback.
> Thanks in advance.
>=20
> Would these settings be more optimal for a UP-machine?
>=20
> # CONFIG_SMP is not set
> # CONFIG_M486 is not set
> CONFIG_M686=3Dy
> CONFIG_NR_CPUS=3D1

These should be fine.

> CONFIG_X86_UP_APIC=3Dy
> CONFIG_X86_UP_IOAPIC=3Dy

These I don't know about.

> CONFIG_HIGHMEM4G=3Dy

This one seems good for allowing the system to go as long as possible.

> Is CONFIG_RCU_FANOUT=3D32 OK?

On a UP system, this one doesn't matter.

> With reverting commit 687d7a960aea46e016182c7ce346d62c4dbd0366 ("rcu:
> restrict TREE_RCU to SMP builds with !PREEMPT").

Thank you for trying this one out!

I don't see any sign of a grace-period hang.  Did your test complete
correctly?

							Thanx, Paul
