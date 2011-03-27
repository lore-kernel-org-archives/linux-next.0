From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 25 (Call trace: RCU|workqueues|block|VFS|ext4
 related?)
Date: Sun, 27 Mar 2011 23:48:30 +0200
Message-ID: <AANLkTi=ti+PVC8N-3Bt2fzuHHQz6kuMdUPeb3Gudn7EU@mail.gmail.com>
References: <AANLkTin9HxOTwavbtbsMd0quYsEvhDNmuO5kOpquqoF=@mail.gmail.com>
	<20110326034210.GX2322@linux.vnet.ibm.com>
	<AANLkTi=zJZ26i14D-kyWQ1uqUPifrv+DN4So4+fC5V=d@mail.gmail.com>
	<20110326160229.GZ2322@linux.vnet.ibm.com>
	<AANLkTikzLm+ArYkG20F41JOgfNygfdhxC0+A4tV4ez-R@mail.gmail.com>
	<20110327000900.GB2322@linux.vnet.ibm.com>
	<AANLkTikpq2CiSTk9Br7DdkVt=E1p8OFGa+Ls2BzkkhcO@mail.gmail.com>
	<20110327032529.GC2322@linux.vnet.ibm.com>
	<20110327050720.GA31424@linux.vnet.ibm.com>
	<AANLkTimpbGGcxNJUDMjdg1wijYhvXQ3KySvRYnEsUYsy@mail.gmail.com>
	<20110327213220.GE2322@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:52271 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882Ab1C0Vsc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 27 Mar 2011 17:48:32 -0400
In-Reply-To: <20110327213220.GE2322@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>

On Sun, Mar 27, 2011 at 11:32 PM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sun, Mar 27, 2011 at 02:26:15PM +0200, Sedat Dilek wrote:
>> On Sun, Mar 27, 2011 at 7:07 AM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Sat, Mar 26, 2011 at 08:25:29PM -0700, Paul E. McKenney wrote:
>> >> On Sun, Mar 27, 2011 at 03:30:34AM +0200, Sedat Dilek wrote:
>> >> > On Sun, Mar 27, 2011 at 1:09 AM, Paul E. McKenney
>> >> > <paulmck@linux.vnet.ibm.com> wrote:
>> >> > > On Sat, Mar 26, 2011 at 11:15:22PM +0100, Sedat Dilek wrote:
>> >
>> > [ . . . ]
>> >
>> >> > >> But then came RCU :-(.
>> >> > >
>> >> > > Well, if it turns out to be a problem in RCU I will certainly=
 apologize.
>> >> > >
>> >> >
>> >> > No, that's not so dramatic.
>> >> > Dealing with this RCU issue has nice side-effects: I remembered=
 (and
>> >> > finally did) to use a reduced kernel-config set.
>> >> > The base for it I created with 'make localmodconfig' and did so=
me
>> >> > manual fine-tuning afterwards (throw out media, rc, dvd, unneed=
ed FSs,
>> >> > etc.).
>> >> > Also, I can use fresh gcc-4.6 (4.6.0-1) from the official Debia=
n repos.
>> >> >
>> >> > So, I started building with
>> >> > "revert-rcu-patches/0001-Revert-rcu-introduce-kfree_rcu.patch".
>> >> > I will let you know.
>> >>
>> >> And please also check for tasks consuming all available CPU.
>> >
>> > And I still cannot reproduce with the full RCU stack (but based of=
f of
>> > 2.6.38 rather than -next). =C2=A0Nevertheless, if you would like t=
o try a
>> > speculative patch, here you go.
>>
>> You are right and my strategy on handling the (possible RCU?) issue =
is wrong.
>> Surely, you tested your RCU stuff in your own repo and everything
>> might be OK on top of stable 2.6.38.
>> Linux-next gets daily updates from a lot of different trees, so ther=
e
>> might be interferences with other stuff.
>> Please, understand I am interested in finding out what is the cause
>> for my issues, my aim is not to blame you.
>
> I am not worried about blame, but rather getting the bug fixed. =C2=A0=
The
> bug might be in RCU, it might be elsewhere, or it might be a combinat=
ion
> of problems in RCU and elsewhere.
>
> So the first priority is locating the bug.
>
> And that is why I have been asking you over and over to PLEASE take
> a look at what tasks are consuming CPU while the problem is occuring.
> The reason that I have been asking over and over is that the symptoms
> you describe are likely caused by a loop in some kernel code. =C2=A0Y=
es,
> there might be other causes, but this is the most likely. =C2=A0Given=
 that
> TREE_PREEMPT_RCU behaves better than TREE_RCU, it is likely that this
> loop is in preemptible code with irqs enabled. =C2=A0Therefore, the p=
rocess
> accounting code is likely to be able to see the CPU consumption, and
> you should be able to see it via the "top" or "ps" commands -- or via
> any number of other tools.
>
> For example, if the problem is confined to RCU, you would likely see
> the "rcuc0" or "rcun0" tasks consuming lots of CPU. =C2=A0This would =
narrow
> the problem down to a few tens of lines of code. =C2=A0If the problem=
 was
> in some other kthread, then identifying the kthread would very likely
> narrow things down as well.
>
> So, please do take a look to see what taks consuming CPU.
>
>> As I was wrong and want to be 99.9% sure it is RCU stuff, I reverted
>> all (18) RCU patches from linux-next (next-20110325) by keeping the
>> RCU|PREEMPT|HZ settings from last working next-20110323.
>
> Makes sense.
>
>> $ egrep 'RCU|PREEMPT|_HZ' /boot/config-2.6.38-next20110325-7-686-ini=
za
>> # RCU Subsystem
>> CONFIG_TREE_RCU=3Dy
>> # CONFIG_PREEMPT_RCU is not set
>> # CONFIG_RCU_TRACE is not set
>> CONFIG_RCU_FANOUT=3D32
>> # CONFIG_RCU_FANOUT_EXACT is not set
>> CONFIG_RCU_FAST_NO_HZ=3Dy
>> # CONFIG_TREE_RCU_TRACE is not set
>> CONFIG_PREEMPT_NOTIFIERS=3Dy
>> CONFIG_NO_HZ=3Dy
>> # CONFIG_PREEMPT_NONE is not set
>> CONFIG_PREEMPT_VOLUNTARY=3Dy
>> # CONFIG_PREEMPT is not set
>> # CONFIG_HZ_100 is not set
>> CONFIG_HZ_250=3Dy
>> # CONFIG_HZ_300 is not set
>> # CONFIG_HZ_1000 is not set
>> CONFIG_HZ=3D250
>> # CONFIG_SPARSE_RCU_POINTER is not set
>> # CONFIG_RCU_TORTURE_TEST is not set
>> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
>>
>> I will work and stress this kernel before doing any step-by-step
>> revert of RCU stuff.
>>
>> Thanks for your patch, I applied it on top of "naked" next-20110325,
>> but I still see call-traces.
>
> Thank you very much for testing it!
>
> I intend to keep that patch, as it should increase robustness in othe=
r
> situations.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>
>> - Sedat -
>>
>>
>>
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >
>> > ------------------------------------------------------------------=
------
>> >
>> > rcu: further lower priority in rcu_yield()
>> >
>> > Although rcu_yield() dropped from real-time to normal priority, th=
ere
>> > is always the possibility that the competing tasks have been niced=
=2E
>> > So nice to 19 in rcu_yield() to help ensure that other tasks have =
a
>> > better chance of running.
>> >
>> > =C2=A0 =C2=A0Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.i=
bm.com>
>> >
>> > diff --git a/kernel/rcutree.c b/kernel/rcutree.c
>> > index 759f54b..5477764 100644
>> > --- a/kernel/rcutree.c
>> > +++ b/kernel/rcutree.c
>> > @@ -1492,6 +1492,7 @@ static void rcu_yield(void (*f)(unsigned lon=
g), unsigned long arg)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0mod_timer(&yield_timer, jiffies + 2);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_priority =3D 0;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_setscheduler_nocheck(current, SCH=
ED_NORMAL, &sp);
>> > + =C2=A0 =C2=A0 =C2=A0 set_user_nice(current, 19);
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0schedule();
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_priority =3D RCU_KTHREAD_PRIO;
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_setscheduler_nocheck(current, SCH=
ED_FIFO, &sp);
>> >
>

Sorry, my attempt was to identify and isolate the culprit commit.

Reverting all RCU patches resulted in a stable system, the following 8
kernels with reduced k-config setup where all built using this kernel.

All kernels used TREE_RCU (see above), I did not change it (no
mixing/switching to PREEMPT and TREE_PREEMPT_RCU).
( I doubt that TREE_PREEMPT_RCU was some kind of more stable here. )

The culprit commit is bc56163ebd4580199ac7e63f5e160bf139ba0dd6 (from
rcu/next GIT tree):
"rcu: move TREE_RCU from softirq to kthread"

I can do parallelly a tar job, open 20 tabs in firefox and run a flash
video in one of them (I did this several times).

[ setup.log ]
=2E..
  (+) OK   revert-rcu-patches/0001-Revert-rcu-introduce-kfree_rcu.patch
  (+) OK   revert-rcu-patches/0002-Revert-rcu-fix-spelling.patch
  (+) OK   revert-rcu-patches/0003-Revert-rcu-fix-rcu_cpu_kthread_task-=
synchronization.patch
  (+) OK   revert-rcu-patches/0004-Revert-rcu-call-__rcu_read_unlock-in=
-exit_rcu-for-tr.patch
  (+) OK   revert-rcu-patches/0005-Revert-rcu-Converge-TINY_RCU-expedit=
ed-and-normal-bo.patch
  (+) OK   revert-rcu-patches/0006-Revert-rcu-remove-useless-boosted_th=
is_gp-field.patch
  (+) OK   revert-rcu-patches/0007-Revert-rcu-code-cleanups-in-TINY_RCU=
-priority-boosti.patch
  (+) OK   revert-rcu-patches/0008-Revert-rcu-Switch-to-this_cpu-primit=
ives.patch
  (+) OK   revert-rcu-patches/0009-Revert-rcu-Use-WARN_ON_ONCE-for-DEBU=
G_OBJECTS_RCU_HE.patch
  (+) OK   revert-rcu-patches/0010-Revert-rcu-Enable-DEBUG_OBJECTS_RCU_=
HEAD-from-PREEMP.patch
  (+) OK   revert-rcu-patches/0011-Revert-rcu-Add-boosting-to-TREE_PREE=
MPT_RCU-tracing.patch
  (+) OK   revert-rcu-patches/0012-Revert-rcu-eliminate-unused-boosting=
-statistics.patch
  (+) OK   revert-rcu-patches/0013-Revert-rcu-priority-boosting-for-TRE=
E_PREEMPT_RCU.patch
  (+) OK   revert-rcu-patches/0014-Revert-rcu-move-TREE_RCU-from-softir=
q-to-kthread.patch
=2E..

Hope this helps to narrow down the problem.

As I kept all kernels I can have a look at the tasks consuming high
CPU usage tomorrow.

- Sedat -
