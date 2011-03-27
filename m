From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for March 25 (Call trace:
 RCU|workqueues|block|VFS|ext4 related?)
Date: Sun, 27 Mar 2011 14:32:20 -0700
Message-ID: <20110327213220.GE2322@linux.vnet.ibm.com>
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
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e35.co.us.ibm.com ([32.97.110.153]:36325 "EHLO
	e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750960Ab1C0Vca (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 27 Mar 2011 17:32:30 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTimpbGGcxNJUDMjdg1wijYhvXQ3KySvRYnEsUYsy@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>

On Sun, Mar 27, 2011 at 02:26:15PM +0200, Sedat Dilek wrote:
> On Sun, Mar 27, 2011 at 7:07 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Sat, Mar 26, 2011 at 08:25:29PM -0700, Paul E. McKenney wrote:
> >> On Sun, Mar 27, 2011 at 03:30:34AM +0200, Sedat Dilek wrote:
> >> > On Sun, Mar 27, 2011 at 1:09 AM, Paul E. McKenney
> >> > <paulmck@linux.vnet.ibm.com> wrote:
> >> > > On Sat, Mar 26, 2011 at 11:15:22PM +0100, Sedat Dilek wrote:
> >
> > [ . . . ]
> >
> >> > >> But then came RCU :-(.
> >> > >
> >> > > Well, if it turns out to be a problem in RCU I will certainly =
apologize.
> >> > >
> >> >
> >> > No, that's not so dramatic.
> >> > Dealing with this RCU issue has nice side-effects: I remembered =
(and
> >> > finally did) to use a reduced kernel-config set.
> >> > The base for it I created with 'make localmodconfig' and did som=
e
> >> > manual fine-tuning afterwards (throw out media, rc, dvd, unneede=
d FSs,
> >> > etc.).
> >> > Also, I can use fresh gcc-4.6 (4.6.0-1) from the official Debian=
 repos.
> >> >
> >> > So, I started building with
> >> > "revert-rcu-patches/0001-Revert-rcu-introduce-kfree_rcu.patch".
> >> > I will let you know.
> >>
> >> And please also check for tasks consuming all available CPU.
> >
> > And I still cannot reproduce with the full RCU stack (but based off=
 of
> > 2.6.38 rather than -next). =A0Nevertheless, if you would like to tr=
y a
> > speculative patch, here you go.
>=20
> You are right and my strategy on handling the (possible RCU?) issue i=
s wrong.
> Surely, you tested your RCU stuff in your own repo and everything
> might be OK on top of stable 2.6.38.
> Linux-next gets daily updates from a lot of different trees, so there
> might be interferences with other stuff.
> Please, understand I am interested in finding out what is the cause
> for my issues, my aim is not to blame you.

I am not worried about blame, but rather getting the bug fixed.  The
bug might be in RCU, it might be elsewhere, or it might be a combinatio=
n
of problems in RCU and elsewhere.

So the first priority is locating the bug.

And that is why I have been asking you over and over to PLEASE take
a look at what tasks are consuming CPU while the problem is occuring.
The reason that I have been asking over and over is that the symptoms
you describe are likely caused by a loop in some kernel code.  Yes,
there might be other causes, but this is the most likely.  Given that
TREE_PREEMPT_RCU behaves better than TREE_RCU, it is likely that this
loop is in preemptible code with irqs enabled.  Therefore, the process
accounting code is likely to be able to see the CPU consumption, and
you should be able to see it via the "top" or "ps" commands -- or via
any number of other tools.

=46or example, if the problem is confined to RCU, you would likely see
the "rcuc0" or "rcun0" tasks consuming lots of CPU.  This would narrow
the problem down to a few tens of lines of code.  If the problem was
in some other kthread, then identifying the kthread would very likely
narrow things down as well.

So, please do take a look to see what taks consuming CPU.

> As I was wrong and want to be 99.9% sure it is RCU stuff, I reverted
> all (18) RCU patches from linux-next (next-20110325) by keeping the
> RCU|PREEMPT|HZ settings from last working next-20110323.

Makes sense.

> $ egrep 'RCU|PREEMPT|_HZ' /boot/config-2.6.38-next20110325-7-686-iniz=
a
> # RCU Subsystem
> CONFIG_TREE_RCU=3Dy
> # CONFIG_PREEMPT_RCU is not set
> # CONFIG_RCU_TRACE is not set
> CONFIG_RCU_FANOUT=3D32
> # CONFIG_RCU_FANOUT_EXACT is not set
> CONFIG_RCU_FAST_NO_HZ=3Dy
> # CONFIG_TREE_RCU_TRACE is not set
> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_NO_HZ=3Dy
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> # CONFIG_HZ_100 is not set
> CONFIG_HZ_250=3Dy
> # CONFIG_HZ_300 is not set
> # CONFIG_HZ_1000 is not set
> CONFIG_HZ=3D250
> # CONFIG_SPARSE_RCU_POINTER is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
>=20
> I will work and stress this kernel before doing any step-by-step
> revert of RCU stuff.
>=20
> Thanks for your patch, I applied it on top of "naked" next-20110325,
> but I still see call-traces.

Thank you very much for testing it!

I intend to keep that patch, as it should increase robustness in other
situations.

							Thanx, Paul

> - Sedat -
>=20
>=20
>=20
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >
> > -------------------------------------------------------------------=
-----
> >
> > rcu: further lower priority in rcu_yield()
> >
> > Although rcu_yield() dropped from real-time to normal priority, the=
re
> > is always the possibility that the competing tasks have been niced.
> > So nice to 19 in rcu_yield() to help ensure that other tasks have a
> > better chance of running.
> >
> > =A0 =A0Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> > diff --git a/kernel/rcutree.c b/kernel/rcutree.c
> > index 759f54b..5477764 100644
> > --- a/kernel/rcutree.c
> > +++ b/kernel/rcutree.c
> > @@ -1492,6 +1492,7 @@ static void rcu_yield(void (*f)(unsigned long=
), unsigned long arg)
> > =A0 =A0 =A0 =A0mod_timer(&yield_timer, jiffies + 2);
> > =A0 =A0 =A0 =A0sp.sched_priority =3D 0;
> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(current, SCHED_NORMAL, &s=
p);
> > + =A0 =A0 =A0 set_user_nice(current, 19);
> > =A0 =A0 =A0 =A0schedule();
> > =A0 =A0 =A0 =A0sp.sched_priority =3D RCU_KTHREAD_PRIO;
> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(current, SCHED_FIFO, &sp)=
;
> >
