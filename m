From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ related?)
Date: Tue, 26 Apr 2011 14:50:25 +0200
Message-ID: <BANLkTiko8dcYQtTo2P80nk503vxNabaLPw@mail.gmail.com>
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
	<20110426124256.GI4308@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:62851 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753200Ab1DZMu0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 26 Apr 2011 08:50:26 -0400
In-Reply-To: <20110426124256.GI4308@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, peterz@infradead.org

On Tue, Apr 26, 2011 at 2:42 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Tue, Apr 26, 2011 at 01:45:31PM +0200, Sedat Dilek wrote:
>> On Tue, Apr 26, 2011 at 7:06 AM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Sun, Apr 24, 2011 at 09:43:31AM -0700, Paul E. McKenney wrote:
>> >> On Sun, Apr 24, 2011 at 11:36:44AM +0200, Sedat Dilek wrote:
>> >> > On Sun, Apr 24, 2011 at 8:27 AM, Paul E. McKenney
>> >> > <paulmck@linux.vnet.ibm.com> wrote:
>> >>
>> >> [ . . . ]
>> >>
>> >> > > OK, this looks unrelated, but just in case, could you please =
try it
>> >> > > again with the following patch? =C2=A0(Not mainlinable, debug=
 only.)
>> >> > >
>> >> > > Also, it does look like you are still seeing a grace-period h=
ang.
>> >> > > Could you please send the output of the script? =C2=A0Same on=
e as last time.
>> >> > >
>> >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Pa=
ul
>> >> > >
>> >> > > -------------------------------------------------------------=
-----------
>> >> > >
>> >> > > =C2=A0debugobjects.c | =C2=A0 =C2=A08 +++++---
>> >> > > =C2=A01 file changed, 5 insertions(+), 3 deletions(-)
>> >> > >
>> >> > > diff --git a/lib/debugobjects.c b/lib/debugobjects.c
>> >> > > index 9d86e45..10a7c7a 100644
>> >> > > --- a/lib/debugobjects.c
>> >> > > +++ b/lib/debugobjects.c
>> >> > > @@ -289,10 +289,12 @@ static void debug_object_is_on_stack(vo=
id *addr, int onstack)
>> >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
;
>> >> > >
>> >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0limit++;
>> >> > > - =C2=A0 =C2=A0 =C2=A0 if (is_on_stack)
>> >> > > + =C2=A0 =C2=A0 =C2=A0 if (is_on_stack) {
>> >> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rcu=
_head *p =3D (struct rcu_head *)addr;
>> >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk=
(KERN_WARNING
>> >> > > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0"ODEBUG: object is on stack, but not annotated\n");
>> >> > > - =C2=A0 =C2=A0 =C2=A0 else
>> >> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0"ODEBUG: object is on stack, but not annotated: %p\n",
>> >> > > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0p->func);
>> >> > > + =C2=A0 =C2=A0 =C2=A0 } else
>> >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk=
(KERN_WARNING
>> >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 "ODEBUG: object is not on stack, but annotated\n");
>> >> > > =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON(1);
>> >> > >
>> >> >
>> >> > Somehow your attached patch was not applicable.
>> >> > As the changes were a few lines I applied it by myself.
>> >> > Attached are log, dmesg and patches (orig + mine)
>> >>
>> >> Hmmm... =C2=A0Does 0xc10231a1 correspond to a function in your bu=
ild? =C2=A0If so,
>> >> could you please let me know which one?
>> >>
>> >> OK, so according to "ps" the per-CPU kthread is runnable, but it =
appears
>> >> to never run. =C2=A0You only have one CPU, so it cannot be waitin=
g due to
>> >> running on the wrong CPU. =C2=A0The only other loop is in wait_ev=
ent(), and
>> >> that code looks good -- besides, if wait_event() was broken, we w=
ould
>> >> be seeing breakage everywhere.
>> >>
>> >> Peter, any thoughts on what I might have done wrong to get the sc=
heduler
>> >> into a state where it was ignoring a runnable realtime task?
>> >
>> > Hello, Sedat,
>> >
>> > Here is a diagnostic patch to apply on top of sedat.2011.04.23a fr=
om
>> > the -rcu git tree. =C2=A0Could you please try it out, let me know =
what
>> > happens, and run the last collectdebugfs.sh during the test?
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >
>> > ------------------------------------------------------------------=
------
>> >
>> > diff --git a/kernel/rcutree.c b/kernel/rcutree.c
>> > index 6cf6e47..65ae701 100644
>> > --- a/kernel/rcutree.c
>> > +++ b/kernel/rcutree.c
>> > @@ -1524,9 +1524,9 @@ static void rcu_cpu_kthread_setrt(int cpu, i=
nt to_rt)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if (to_rt) {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0policy =3D =
SCHED_NORMAL;
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp.sched_priori=
ty =3D RCU_KTHREAD_PRIO;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sp.sched_priori=
ty =3D 0;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 policy =3D SCHE=
D_FIFO;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 policy =3D SCHE=
D_NORMAL;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_pr=
iority =3D 0;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_setscheduler_nocheck(t, policy, &=
sp);
>> > @@ -1566,8 +1566,8 @@ static void rcu_yield(void (*f)(unsigned lon=
g), unsigned long arg)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_priority =3D 0;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_setscheduler_nocheck(current, SCH=
ED_NORMAL, &sp);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0schedule();
>> > - =C2=A0 =C2=A0 =C2=A0 sp.sched_priority =3D RCU_KTHREAD_PRIO;
>> > - =C2=A0 =C2=A0 =C2=A0 sched_setscheduler_nocheck(current, SCHED_F=
IFO, &sp);
>> > + =C2=A0 =C2=A0 =C2=A0 sp.sched_priority =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 sched_setscheduler_nocheck(current, SCHED_N=
ORMAL, &sp);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0del_timer(&yield_timer);
>> > =C2=A0}
>> >
>> > @@ -1671,8 +1671,8 @@ static int __cpuinit rcu_spawn_one_cpu_kthre=
ad(int cpu)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0WARN_ON_ONCE(per_cpu(rcu_cpu_kthread_ta=
sk, cpu) !=3D NULL);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0per_cpu(rcu_cpu_kthread_task, cpu) =3D =
t;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_process(t);
>> > - =C2=A0 =C2=A0 =C2=A0 sp.sched_priority =3D RCU_KTHREAD_PRIO;
>> > - =C2=A0 =C2=A0 =C2=A0 sched_setscheduler_nocheck(t, SCHED_FIFO, &=
sp);
>> > + =C2=A0 =C2=A0 =C2=A0 sp.sched_priority =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 sched_setscheduler_nocheck(t, SCHED_NORMAL,=
 &sp);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> > =C2=A0}
>> >
>> > @@ -1713,8 +1713,8 @@ static int rcu_node_kthread(void *arg)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0}
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0per_cpu(rcu_cpu_has_work, cpu) =3D 1;
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sp.sched_priority =3D RCU_KTHREAD_PRIO;
>> > - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sched_setscheduler_nocheck(t, SCHED_FIFO, &sp);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sp.sched_priority =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sched_setscheduler_nocheck(t, SCHED_NORMAL, &sp);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0preempt_enable();
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> > diff --git a/kernel/rcutree_plugin.h b/kernel/rcutree_plugin.h
>> > index a21413d..baee185 100644
>> > --- a/kernel/rcutree_plugin.h
>> > +++ b/kernel/rcutree_plugin.h
>> > @@ -1307,8 +1307,8 @@ static int __cpuinit rcu_spawn_one_boost_kth=
read(struct rcu_state *rsp,
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0rnp->boost_kthread_task =3D t;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0raw_spin_unlock_irqrestore(&rnp->lock, =
flags);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0wake_up_process(t);
>> > - =C2=A0 =C2=A0 =C2=A0 sp.sched_priority =3D RCU_KTHREAD_PRIO;
>> > - =C2=A0 =C2=A0 =C2=A0 sched_setscheduler_nocheck(t, SCHED_FIFO, &=
sp);
>> > + =C2=A0 =C2=A0 =C2=A0 sp.sched_priority =3D 0;
>> > + =C2=A0 =C2=A0 =C2=A0 sched_setscheduler_nocheck(t, SCHED_NORMAL,=
 &sp);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> > =C2=A0}
>> >
>> >
>>
>> Hi Paul,
>>
>> I have tested with your patch and kept the kernel-config file from
>> previous tests (don't get confused by the new name).
>> Hope this helps you.
>>
>> I have some questions to k-c options espcially X86_UP and
>> CONFIG_RCU_FANOUT=3D32 options.
>> To what extent can they influence our RCU issue?
>> The below options were not set for this round of testing, but I woul=
d
>> like to have a feedback.
>> Thanks in advance.
>>
>> Would these settings be more optimal for a UP-machine?
>>
>> # CONFIG_SMP is not set
>> # CONFIG_M486 is not set
>> CONFIG_M686=3Dy
>> CONFIG_NR_CPUS=3D1
>
> These should be fine.
>
>> CONFIG_X86_UP_APIC=3Dy
>> CONFIG_X86_UP_IOAPIC=3Dy
>
> These I don't know about.
>
>> CONFIG_HIGHMEM4G=3Dy
>
> This one seems good for allowing the system to go as long as possible=
=2E
>
>> Is CONFIG_RCU_FANOUT=3D32 OK?
>
> On a UP system, this one doesn't matter.
>
>> With reverting commit 687d7a960aea46e016182c7ce346d62c4dbd0366 ("rcu=
:
>> restrict TREE_RCU to SMP builds with !PREEMPT").
>
> Thank you for trying this one out!
>
> I don't see any sign of a grace-period hang. =C2=A0Did your test comp=
lete
> correctly?
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>

Thanks for the comments.

I let run the script very long (approx. one hour) and did parallelly
my daily work.
Then booted into a known as working kernel.
Did I miss something, should I stress more?

- Sedat -
