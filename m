From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for March 25 (Call trace:
 RCU|workqueues|block|VFS|ext4 related?)
Date: Mon, 28 Mar 2011 06:24:36 -0700
Message-ID: <20110328132436.GL2322@linux.vnet.ibm.com>
References: <AANLkTikzLm+ArYkG20F41JOgfNygfdhxC0+A4tV4ez-R@mail.gmail.com>
 <20110327000900.GB2322@linux.vnet.ibm.com>
 <AANLkTikpq2CiSTk9Br7DdkVt=E1p8OFGa+Ls2BzkkhcO@mail.gmail.com>
 <20110327032529.GC2322@linux.vnet.ibm.com>
 <20110327050720.GA31424@linux.vnet.ibm.com>
 <AANLkTimpbGGcxNJUDMjdg1wijYhvXQ3KySvRYnEsUYsy@mail.gmail.com>
 <20110327213220.GE2322@linux.vnet.ibm.com>
 <AANLkTi=ti+PVC8N-3Bt2fzuHHQz6kuMdUPeb3Gudn7EU@mail.gmail.com>
 <20110328040823.GG2322@linux.vnet.ibm.com>
 <AANLkTinQiDSXLP1o-HfdedYOMKtnsbBrcOfuqw9sFf2X@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e3.ny.us.ibm.com ([32.97.182.143]:33745 "EHLO e3.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752443Ab1C1NYz (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 28 Mar 2011 09:24:55 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTinQiDSXLP1o-HfdedYOMKtnsbBrcOfuqw9sFf2X@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>

On Mon, Mar 28, 2011 at 02:33:36PM +0200, Sedat Dilek wrote:
> On Mon, Mar 28, 2011 at 6:08 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Sun, Mar 27, 2011 at 11:48:30PM +0200, Sedat Dilek wrote:
> >> On Sun, Mar 27, 2011 at 11:32 PM, Paul E. McKenney
> >> <paulmck@linux.vnet.ibm.com> wrote:
> >> > On Sun, Mar 27, 2011 at 02:26:15PM +0200, Sedat Dilek wrote:
> >> >> On Sun, Mar 27, 2011 at 7:07 AM, Paul E. McKenney
> >> >> <paulmck@linux.vnet.ibm.com> wrote:
> >> >> > On Sat, Mar 26, 2011 at 08:25:29PM -0700, Paul E. McKenney wr=
ote:
> >> >> >> On Sun, Mar 27, 2011 at 03:30:34AM +0200, Sedat Dilek wrote:
> >> >> >> > On Sun, Mar 27, 2011 at 1:09 AM, Paul E. McKenney
> >> >> >> > <paulmck@linux.vnet.ibm.com> wrote:
> >> >> >> > > On Sat, Mar 26, 2011 at 11:15:22PM +0100, Sedat Dilek wr=
ote:
> >> >> >
> >> >> > [ . . . ]
> >> >> >
> >> >> >> > >> But then came RCU :-(.
> >> >> >> > >
> >> >> >> > > Well, if it turns out to be a problem in RCU I will cert=
ainly apologize.
> >> >> >> > >
> >> >> >> >
> >> >> >> > No, that's not so dramatic.
> >> >> >> > Dealing with this RCU issue has nice side-effects: I remem=
bered (and
> >> >> >> > finally did) to use a reduced kernel-config set.
> >> >> >> > The base for it I created with 'make localmodconfig' and d=
id some
> >> >> >> > manual fine-tuning afterwards (throw out media, rc, dvd, u=
nneeded FSs,
> >> >> >> > etc.).
> >> >> >> > Also, I can use fresh gcc-4.6 (4.6.0-1) from the official =
Debian repos.
> >> >> >> >
> >> >> >> > So, I started building with
> >> >> >> > "revert-rcu-patches/0001-Revert-rcu-introduce-kfree_rcu.pa=
tch".
> >> >> >> > I will let you know.
> >> >> >>
> >> >> >> And please also check for tasks consuming all available CPU.
> >> >> >
> >> >> > And I still cannot reproduce with the full RCU stack (but bas=
ed off of
> >> >> > 2.6.38 rather than -next). =A0Nevertheless, if you would like=
 to try a
> >> >> > speculative patch, here you go.
> >> >>
> >> >> You are right and my strategy on handling the (possible RCU?) i=
ssue is wrong.
> >> >> Surely, you tested your RCU stuff in your own repo and everythi=
ng
> >> >> might be OK on top of stable 2.6.38.
> >> >> Linux-next gets daily updates from a lot of different trees, so=
 there
> >> >> might be interferences with other stuff.
> >> >> Please, understand I am interested in finding out what is the c=
ause
> >> >> for my issues, my aim is not to blame you.
> >> >
> >> > I am not worried about blame, but rather getting the bug fixed. =
=A0The
> >> > bug might be in RCU, it might be elsewhere, or it might be a com=
bination
> >> > of problems in RCU and elsewhere.
> >> >
> >> > So the first priority is locating the bug.
> >> >
> >> > And that is why I have been asking you over and over to PLEASE t=
ake
> >> > a look at what tasks are consuming CPU while the problem is occu=
ring.
> >> > The reason that I have been asking over and over is that the sym=
ptoms
> >> > you describe are likely caused by a loop in some kernel code. =A0=
Yes,
> >> > there might be other causes, but this is the most likely. =A0Giv=
en that
> >> > TREE_PREEMPT_RCU behaves better than TREE_RCU, it is likely that=
 this
> >> > loop is in preemptible code with irqs enabled. =A0Therefore, the=
 process
> >> > accounting code is likely to be able to see the CPU consumption,=
 and
> >> > you should be able to see it via the "top" or "ps" commands -- o=
r via
> >> > any number of other tools.
> >> >
> >> > For example, if the problem is confined to RCU, you would likely=
 see
> >> > the "rcuc0" or "rcun0" tasks consuming lots of CPU. =A0This woul=
d narrow
> >> > the problem down to a few tens of lines of code. =A0If the probl=
em was
> >> > in some other kthread, then identifying the kthread would very l=
ikely
> >> > narrow things down as well.
> >> >
> >> > So, please do take a look to see what taks consuming CPU.
> >> >
> >> >> As I was wrong and want to be 99.9% sure it is RCU stuff, I rev=
erted
> >> >> all (18) RCU patches from linux-next (next-20110325) by keeping=
 the
> >> >> RCU|PREEMPT|HZ settings from last working next-20110323.
> >> >
> >> > Makes sense.
> >> >
> >> >> $ egrep 'RCU|PREEMPT|_HZ' /boot/config-2.6.38-next20110325-7-68=
6-iniza
> >> >> # RCU Subsystem
> >> >> CONFIG_TREE_RCU=3Dy
> >> >> # CONFIG_PREEMPT_RCU is not set
> >> >> # CONFIG_RCU_TRACE is not set
> >> >> CONFIG_RCU_FANOUT=3D32
> >> >> # CONFIG_RCU_FANOUT_EXACT is not set
> >> >> CONFIG_RCU_FAST_NO_HZ=3Dy
> >> >> # CONFIG_TREE_RCU_TRACE is not set
> >> >> CONFIG_PREEMPT_NOTIFIERS=3Dy
> >> >> CONFIG_NO_HZ=3Dy
> >> >> # CONFIG_PREEMPT_NONE is not set
> >> >> CONFIG_PREEMPT_VOLUNTARY=3Dy
> >> >> # CONFIG_PREEMPT is not set
> >> >> # CONFIG_HZ_100 is not set
> >> >> CONFIG_HZ_250=3Dy
> >> >> # CONFIG_HZ_300 is not set
> >> >> # CONFIG_HZ_1000 is not set
> >> >> CONFIG_HZ=3D250
> >> >> # CONFIG_SPARSE_RCU_POINTER is not set
> >> >> # CONFIG_RCU_TORTURE_TEST is not set
> >> >> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
> >> >>
> >> >> I will work and stress this kernel before doing any step-by-ste=
p
> >> >> revert of RCU stuff.
> >> >>
> >> >> Thanks for your patch, I applied it on top of "naked" next-2011=
0325,
> >> >> but I still see call-traces.
> >> >
> >> > Thank you very much for testing it!
> >> >
> >> > I intend to keep that patch, as it should increase robustness in=
 other
> >> > situations.
> >> >
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >> >
> >> >> - Sedat -
> >> >>
> >> >>
> >> >>
> >> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >> >> >
> >> >> > -------------------------------------------------------------=
-----------
> >> >> >
> >> >> > rcu: further lower priority in rcu_yield()
> >> >> >
> >> >> > Although rcu_yield() dropped from real-time to normal priorit=
y, there
> >> >> > is always the possibility that the competing tasks have been =
niced.
> >> >> > So nice to 19 in rcu_yield() to help ensure that other tasks =
have a
> >> >> > better chance of running.
> >> >> >
> >> >> > =A0 =A0Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ib=
m.com>
> >> >> >
> >> >> > diff --git a/kernel/rcutree.c b/kernel/rcutree.c
> >> >> > index 759f54b..5477764 100644
> >> >> > --- a/kernel/rcutree.c
> >> >> > +++ b/kernel/rcutree.c
> >> >> > @@ -1492,6 +1492,7 @@ static void rcu_yield(void (*f)(unsigne=
d long), unsigned long arg)
> >> >> > =A0 =A0 =A0 =A0mod_timer(&yield_timer, jiffies + 2);
> >> >> > =A0 =A0 =A0 =A0sp.sched_priority =3D 0;
> >> >> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(current, SCHED_NORM=
AL, &sp);
> >> >> > + =A0 =A0 =A0 set_user_nice(current, 19);
> >> >> > =A0 =A0 =A0 =A0schedule();
> >> >> > =A0 =A0 =A0 =A0sp.sched_priority =3D RCU_KTHREAD_PRIO;
> >> >> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(current, SCHED_FIFO=
, &sp);
> >>
> >> Sorry, my attempt was to identify and isolate the culprit commit.
> >>
> >> Reverting all RCU patches resulted in a stable system, the followi=
ng 8
> >> kernels with reduced k-config setup where all built using this ker=
nel.
> >>
> >> All kernels used TREE_RCU (see above), I did not change it (no
> >> mixing/switching to PREEMPT and TREE_PREEMPT_RCU).
> >> ( I doubt that TREE_PREEMPT_RCU was some kind of more stable here.=
 )
> >>
> >> The culprit commit is bc56163ebd4580199ac7e63f5e160bf139ba0dd6 (fr=
om
> >> rcu/next GIT tree):
> >> "rcu: move TREE_RCU from softirq to kthread"
> >
>=20
> Hi Paul,
>=20
> > OK, please accept my apologies for your lost weekend. =A0And thank =
you for
> > testing this.
> >
>=20
> No worries, it was mostly a rainy day.
> The only thing I did @ 16:30 was to go to regional election (the new
> (regional) prime minister will be the 1st from The German Green
> party).

;-)

> But back to RCU :-):
> The reduced kernel-config setup decreased the build-time from approx.
> 2hrs (full, generic build) down to approx. 35mins.

Very good!

> >> I can do parallelly a tar job, open 20 tabs in firefox and run a f=
lash
> >> video in one of them (I did this several times).
> >
> > How many files in the tar job? =A0Is this creating a tar archive, e=
xpanding
> > it, or both?
>=20
> I am doing a simple tar (filesize: 1.6G for full and 1.0G for reduced=
 build):
>=20
> $ tar -cf $archivedir-on-external-usbhdd/$tarfile $kernel-build-dir

OK, I was extracting a tarball and then removing the resulting source
tree.  I will try this.  Though it does seem strange -- I can understan=
d
how removing a file tree would stress RCU, but not creating a tarball.
Ah, well, if I fully understood it, there would not be a bug.

> ...plus parallelly opening 20 tabs in firefox.
> That's normally enough to get my system freaky and see RCU related
> messages in the logs.

Hmmm...  My normal test systems don't have X -- I will need to set
this up.

> > Do you have a script for this? =A0Are all of these running at norma=
l
> > priority, or are some of them running at real-time priority?
> >
>=20
> Nothing special.

OK.

> >> [ setup.log ]
> >> ...
> >> =A0 (+) OK =A0 revert-rcu-patches/0001-Revert-rcu-introduce-kfree_=
rcu.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0002-Revert-rcu-fix-spelling.pat=
ch
> >> =A0 (+) OK =A0 revert-rcu-patches/0003-Revert-rcu-fix-rcu_cpu_kthr=
ead_task-synchronization.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0004-Revert-rcu-call-__rcu_read_=
unlock-in-exit_rcu-for-tr.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0005-Revert-rcu-Converge-TINY_RC=
U-expedited-and-normal-bo.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0006-Revert-rcu-remove-useless-b=
oosted_this_gp-field.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0007-Revert-rcu-code-cleanups-in=
-TINY_RCU-priority-boosti.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0008-Revert-rcu-Switch-to-this_c=
pu-primitives.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0009-Revert-rcu-Use-WARN_ON_ONCE=
-for-DEBUG_OBJECTS_RCU_HE.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0010-Revert-rcu-Enable-DEBUG_OBJ=
ECTS_RCU_HEAD-from-PREEMP.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0011-Revert-rcu-Add-boosting-to-=
TREE_PREEMPT_RCU-tracing.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0012-Revert-rcu-eliminate-unused=
-boosting-statistics.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0013-Revert-rcu-priority-boostin=
g-for-TREE_PREEMPT_RCU.patch
> >> =A0 (+) OK =A0 revert-rcu-patches/0014-Revert-rcu-move-TREE_RCU-fr=
om-softirq-to-kthread.patch
> >> ...
> >>
> >> Hope this helps to narrow down the problem.
> >>
> >> As I kept all kernels I can have a look at the tasks consuming hig=
h
> >> CPU usage tomorrow.
> >
> > Could you please?
>=20
> I recalled (as you say I requested over and over again from you :-)) =
I
> looked with top, htop and 'ps axu', but there was nothing special.
> Sometimes the system got frozen - at this point (or short before) I
> did not see anything suspicious with top.

OK, thank you for the info.

> > Also, could you please mount debugfs and list out the files in the
> > "rcu" directory? =A0The "ql=3D" value from the "rcu/rcudata" file i=
s of
> > particular interest.
> >
>=20
> Ah, before I forget...
>=20
> I used TREE_RCU (was the default before noticing RCU issue) for
> finding the culprit commit.
> If it is from your POV more helpful to switch to PREEMPT + PREEMPT_RC=
U
> + RCU_BOOST, please let me *now* know.
> ( Both RCU setups freaks up the system. )

If TREE_RCU hits problems faster, it is probably best to stay with
TREE_RCU.

> I think top & Co. are not enough to track the problem down.
> I have seen tracing and debugging facililities for RCU.
>=20
> Some questions to debug and trace setup:
>=20
> Case #1: TREE_RCU
>=20
> CONFIG_RCU_TRACE=3Dy
> CONFIG_TREE_RCU_TRACE=3Dy

Yep.

> Case #2: PREEMPT + PREEMPT_RCU + RCU_BOOST
>=20
> CONFIG_RCU_TRACE=3Dy
> CONFIG_TREE_RCU_TRACE=3Dy
> CONFIG_DEBUG_PREEMPT=3Dy <--- Helpful?
> CONFIG_PREEMPT_TRACER=3Dy <--- Helpful?
>=20
> Any other recommends for useful/helpful trace and/or debug options?
>=20
> Any other intructions for debugging/tracing?

Not at the moment.  I will be looking at diagnostics will going
through the code, so might have something later.

> BTW, today's linux-next (next-20110328) is still freaky, I applied th=
e
> revert-rcu-patches patchset and all is fine.

I reverted back to the commit preceding the one you pointed out last ni=
ght
my time, so the upcoming -next should be less freaky.

> - Sedat -
>=20
> P.S.: Note to myself
>=20
> # mount -t debugfs none /sys/kernel/debug/
> # ln -s /sys/kernel/debug /debug
>=20
> # find /debug -name rcu

Or:

# cd /debug/rcu

then dump out everything except for the .csv file (which is the same
as the non-.csv equivalent, but in spreadsheet format -- intended
for systems with 100s or 1000s of CPUs).

							Thanx, Paul
