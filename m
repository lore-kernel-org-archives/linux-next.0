From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for March 25 (Call trace:
 RCU|workqueues|block|VFS|ext4 related?)
Date: Mon, 28 Mar 2011 08:11:43 -0700
Message-ID: <20110328151143.GA4859@linux.vnet.ibm.com>
References: <20110327000900.GB2322@linux.vnet.ibm.com>
 <AANLkTikpq2CiSTk9Br7DdkVt=E1p8OFGa+Ls2BzkkhcO@mail.gmail.com>
 <20110327032529.GC2322@linux.vnet.ibm.com>
 <20110327050720.GA31424@linux.vnet.ibm.com>
 <AANLkTimpbGGcxNJUDMjdg1wijYhvXQ3KySvRYnEsUYsy@mail.gmail.com>
 <20110327213220.GE2322@linux.vnet.ibm.com>
 <AANLkTi=ti+PVC8N-3Bt2fzuHHQz6kuMdUPeb3Gudn7EU@mail.gmail.com>
 <20110328040823.GG2322@linux.vnet.ibm.com>
 <AANLkTinQiDSXLP1o-HfdedYOMKtnsbBrcOfuqw9sFf2X@mail.gmail.com>
 <20110328132436.GL2322@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e33.co.us.ibm.com ([32.97.110.151]:40474 "EHLO
	e33.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753819Ab1C1PMC (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2011 11:12:02 -0400
Content-Disposition: inline
In-Reply-To: <20110328132436.GL2322@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>

On Mon, Mar 28, 2011 at 06:24:36AM -0700, Paul E. McKenney wrote:
> On Mon, Mar 28, 2011 at 02:33:36PM +0200, Sedat Dilek wrote:
> > On Mon, Mar 28, 2011 at 6:08 AM, Paul E. McKenney
> > <paulmck@linux.vnet.ibm.com> wrote:
> > > On Sun, Mar 27, 2011 at 11:48:30PM +0200, Sedat Dilek wrote:
> > >> On Sun, Mar 27, 2011 at 11:32 PM, Paul E. McKenney
> > >> <paulmck@linux.vnet.ibm.com> wrote:
> > >> > On Sun, Mar 27, 2011 at 02:26:15PM +0200, Sedat Dilek wrote:
> > >> >> On Sun, Mar 27, 2011 at 7:07 AM, Paul E. McKenney
> > >> >> <paulmck@linux.vnet.ibm.com> wrote:
> > >> >> > On Sat, Mar 26, 2011 at 08:25:29PM -0700, Paul E. McKenney =
wrote:
> > >> >> >> On Sun, Mar 27, 2011 at 03:30:34AM +0200, Sedat Dilek wrot=
e:
> > >> >> >> > On Sun, Mar 27, 2011 at 1:09 AM, Paul E. McKenney
> > >> >> >> > <paulmck@linux.vnet.ibm.com> wrote:
> > >> >> >> > > On Sat, Mar 26, 2011 at 11:15:22PM +0100, Sedat Dilek =
wrote:
> > >> >> >
> > >> >> > [ . . . ]
> > >> >> >
> > >> >> >> > >> But then came RCU :-(.
> > >> >> >> > >
> > >> >> >> > > Well, if it turns out to be a problem in RCU I will ce=
rtainly apologize.
> > >> >> >> > >
> > >> >> >> >
> > >> >> >> > No, that's not so dramatic.
> > >> >> >> > Dealing with this RCU issue has nice side-effects: I rem=
embered (and
> > >> >> >> > finally did) to use a reduced kernel-config set.
> > >> >> >> > The base for it I created with 'make localmodconfig' and=
 did some
> > >> >> >> > manual fine-tuning afterwards (throw out media, rc, dvd,=
 unneeded FSs,
> > >> >> >> > etc.).
> > >> >> >> > Also, I can use fresh gcc-4.6 (4.6.0-1) from the officia=
l Debian repos.
> > >> >> >> >
> > >> >> >> > So, I started building with
> > >> >> >> > "revert-rcu-patches/0001-Revert-rcu-introduce-kfree_rcu.=
patch".
> > >> >> >> > I will let you know.
> > >> >> >>
> > >> >> >> And please also check for tasks consuming all available CP=
U.
> > >> >> >
> > >> >> > And I still cannot reproduce with the full RCU stack (but b=
ased off of
> > >> >> > 2.6.38 rather than -next). =A0Nevertheless, if you would li=
ke to try a
> > >> >> > speculative patch, here you go.
> > >> >>
> > >> >> You are right and my strategy on handling the (possible RCU?)=
 issue is wrong.
> > >> >> Surely, you tested your RCU stuff in your own repo and everyt=
hing
> > >> >> might be OK on top of stable 2.6.38.
> > >> >> Linux-next gets daily updates from a lot of different trees, =
so there
> > >> >> might be interferences with other stuff.
> > >> >> Please, understand I am interested in finding out what is the=
 cause
> > >> >> for my issues, my aim is not to blame you.
> > >> >
> > >> > I am not worried about blame, but rather getting the bug fixed=
=2E =A0The
> > >> > bug might be in RCU, it might be elsewhere, or it might be a c=
ombination
> > >> > of problems in RCU and elsewhere.
> > >> >
> > >> > So the first priority is locating the bug.
> > >> >
> > >> > And that is why I have been asking you over and over to PLEASE=
 take
> > >> > a look at what tasks are consuming CPU while the problem is oc=
curing.
> > >> > The reason that I have been asking over and over is that the s=
ymptoms
> > >> > you describe are likely caused by a loop in some kernel code. =
=A0Yes,
> > >> > there might be other causes, but this is the most likely. =A0G=
iven that
> > >> > TREE_PREEMPT_RCU behaves better than TREE_RCU, it is likely th=
at this
> > >> > loop is in preemptible code with irqs enabled. =A0Therefore, t=
he process
> > >> > accounting code is likely to be able to see the CPU consumptio=
n, and
> > >> > you should be able to see it via the "top" or "ps" commands --=
 or via
> > >> > any number of other tools.
> > >> >
> > >> > For example, if the problem is confined to RCU, you would like=
ly see
> > >> > the "rcuc0" or "rcun0" tasks consuming lots of CPU. =A0This wo=
uld narrow
> > >> > the problem down to a few tens of lines of code. =A0If the pro=
blem was
> > >> > in some other kthread, then identifying the kthread would very=
 likely
> > >> > narrow things down as well.
> > >> >
> > >> > So, please do take a look to see what taks consuming CPU.
> > >> >
> > >> >> As I was wrong and want to be 99.9% sure it is RCU stuff, I r=
everted
> > >> >> all (18) RCU patches from linux-next (next-20110325) by keepi=
ng the
> > >> >> RCU|PREEMPT|HZ settings from last working next-20110323.
> > >> >
> > >> > Makes sense.
> > >> >
> > >> >> $ egrep 'RCU|PREEMPT|_HZ' /boot/config-2.6.38-next20110325-7-=
686-iniza
> > >> >> # RCU Subsystem
> > >> >> CONFIG_TREE_RCU=3Dy
> > >> >> # CONFIG_PREEMPT_RCU is not set
> > >> >> # CONFIG_RCU_TRACE is not set
> > >> >> CONFIG_RCU_FANOUT=3D32
> > >> >> # CONFIG_RCU_FANOUT_EXACT is not set
> > >> >> CONFIG_RCU_FAST_NO_HZ=3Dy
> > >> >> # CONFIG_TREE_RCU_TRACE is not set
> > >> >> CONFIG_PREEMPT_NOTIFIERS=3Dy
> > >> >> CONFIG_NO_HZ=3Dy
> > >> >> # CONFIG_PREEMPT_NONE is not set
> > >> >> CONFIG_PREEMPT_VOLUNTARY=3Dy
> > >> >> # CONFIG_PREEMPT is not set
> > >> >> # CONFIG_HZ_100 is not set
> > >> >> CONFIG_HZ_250=3Dy
> > >> >> # CONFIG_HZ_300 is not set
> > >> >> # CONFIG_HZ_1000 is not set
> > >> >> CONFIG_HZ=3D250
> > >> >> # CONFIG_SPARSE_RCU_POINTER is not set
> > >> >> # CONFIG_RCU_TORTURE_TEST is not set
> > >> >> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
> > >> >>
> > >> >> I will work and stress this kernel before doing any step-by-s=
tep
> > >> >> revert of RCU stuff.
> > >> >>
> > >> >> Thanks for your patch, I applied it on top of "naked" next-20=
110325,
> > >> >> but I still see call-traces.
> > >> >
> > >> > Thank you very much for testing it!
> > >> >
> > >> > I intend to keep that patch, as it should increase robustness =
in other
> > >> > situations.
> > >> >
> > >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> > >> >
> > >> >> - Sedat -
> > >> >>
> > >> >>
> > >> >>
> > >> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> > >> >> >
> > >> >> > -----------------------------------------------------------=
-------------
> > >> >> >
> > >> >> > rcu: further lower priority in rcu_yield()
> > >> >> >
> > >> >> > Although rcu_yield() dropped from real-time to normal prior=
ity, there
> > >> >> > is always the possibility that the competing tasks have bee=
n niced.
> > >> >> > So nice to 19 in rcu_yield() to help ensure that other task=
s have a
> > >> >> > better chance of running.
> > >> >> >
> > >> >> > =A0 =A0Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.=
ibm.com>
> > >> >> >
> > >> >> > diff --git a/kernel/rcutree.c b/kernel/rcutree.c
> > >> >> > index 759f54b..5477764 100644
> > >> >> > --- a/kernel/rcutree.c
> > >> >> > +++ b/kernel/rcutree.c
> > >> >> > @@ -1492,6 +1492,7 @@ static void rcu_yield(void (*f)(unsig=
ned long), unsigned long arg)
> > >> >> > =A0 =A0 =A0 =A0mod_timer(&yield_timer, jiffies + 2);
> > >> >> > =A0 =A0 =A0 =A0sp.sched_priority =3D 0;
> > >> >> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(current, SCHED_NO=
RMAL, &sp);
> > >> >> > + =A0 =A0 =A0 set_user_nice(current, 19);
> > >> >> > =A0 =A0 =A0 =A0schedule();
> > >> >> > =A0 =A0 =A0 =A0sp.sched_priority =3D RCU_KTHREAD_PRIO;
> > >> >> > =A0 =A0 =A0 =A0sched_setscheduler_nocheck(current, SCHED_FI=
=46O, &sp);
> > >>
> > >> Sorry, my attempt was to identify and isolate the culprit commit=
=2E
> > >>
> > >> Reverting all RCU patches resulted in a stable system, the follo=
wing 8
> > >> kernels with reduced k-config setup where all built using this k=
ernel.
> > >>
> > >> All kernels used TREE_RCU (see above), I did not change it (no
> > >> mixing/switching to PREEMPT and TREE_PREEMPT_RCU).
> > >> ( I doubt that TREE_PREEMPT_RCU was some kind of more stable her=
e. )
> > >>
> > >> The culprit commit is bc56163ebd4580199ac7e63f5e160bf139ba0dd6 (=
from
> > >> rcu/next GIT tree):
> > >> "rcu: move TREE_RCU from softirq to kthread"
> > >
> >=20
> > Hi Paul,
> >=20
> > > OK, please accept my apologies for your lost weekend. =A0And than=
k you for
> > > testing this.
> > >
> >=20
> > No worries, it was mostly a rainy day.
> > The only thing I did @ 16:30 was to go to regional election (the ne=
w
> > (regional) prime minister will be the 1st from The German Green
> > party).
>=20
> ;-)
>=20
> > But back to RCU :-):
> > The reduced kernel-config setup decreased the build-time from appro=
x.
> > 2hrs (full, generic build) down to approx. 35mins.
>=20
> Very good!
>=20
> > >> I can do parallelly a tar job, open 20 tabs in firefox and run a=
 flash
> > >> video in one of them (I did this several times).
> > >
> > > How many files in the tar job? =A0Is this creating a tar archive,=
 expanding
> > > it, or both?
> >=20
> > I am doing a simple tar (filesize: 1.6G for full and 1.0G for reduc=
ed build):
> >=20
> > $ tar -cf $archivedir-on-external-usbhdd/$tarfile $kernel-build-dir
>=20
> OK, I was extracting a tarball and then removing the resulting source
> tree.  I will try this.  Though it does seem strange -- I can underst=
and
> how removing a file tree would stress RCU, but not creating a tarball=
=2E
> Ah, well, if I fully understood it, there would not be a bug.
>=20
> > ...plus parallelly opening 20 tabs in firefox.
> > That's normally enough to get my system freaky and see RCU related
> > messages in the logs.
>=20
> Hmmm...  My normal test systems don't have X -- I will need to set
> this up.
>=20
> > > Do you have a script for this? =A0Are all of these running at nor=
mal
> > > priority, or are some of them running at real-time priority?
> > >
> >=20
> > Nothing special.
>=20
> OK.
>=20
> > >> [ setup.log ]
> > >> ...
> > >> =A0 (+) OK =A0 revert-rcu-patches/0001-Revert-rcu-introduce-kfre=
e_rcu.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0002-Revert-rcu-fix-spelling.p=
atch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0003-Revert-rcu-fix-rcu_cpu_kt=
hread_task-synchronization.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0004-Revert-rcu-call-__rcu_rea=
d_unlock-in-exit_rcu-for-tr.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0005-Revert-rcu-Converge-TINY_=
RCU-expedited-and-normal-bo.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0006-Revert-rcu-remove-useless=
-boosted_this_gp-field.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0007-Revert-rcu-code-cleanups-=
in-TINY_RCU-priority-boosti.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0008-Revert-rcu-Switch-to-this=
_cpu-primitives.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0009-Revert-rcu-Use-WARN_ON_ON=
CE-for-DEBUG_OBJECTS_RCU_HE.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0010-Revert-rcu-Enable-DEBUG_O=
BJECTS_RCU_HEAD-from-PREEMP.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0011-Revert-rcu-Add-boosting-t=
o-TREE_PREEMPT_RCU-tracing.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0012-Revert-rcu-eliminate-unus=
ed-boosting-statistics.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0013-Revert-rcu-priority-boost=
ing-for-TREE_PREEMPT_RCU.patch
> > >> =A0 (+) OK =A0 revert-rcu-patches/0014-Revert-rcu-move-TREE_RCU-=
from-softirq-to-kthread.patch
> > >> ...
> > >>
> > >> Hope this helps to narrow down the problem.
> > >>
> > >> As I kept all kernels I can have a look at the tasks consuming h=
igh
> > >> CPU usage tomorrow.
> > >
> > > Could you please?
> >=20
> > I recalled (as you say I requested over and over again from you :-)=
) I
> > looked with top, htop and 'ps axu', but there was nothing special.
> > Sometimes the system got frozen - at this point (or short before) I
> > did not see anything suspicious with top.
>=20
> OK, thank you for the info.
>=20
> > > Also, could you please mount debugfs and list out the files in th=
e
> > > "rcu" directory? =A0The "ql=3D" value from the "rcu/rcudata" file=
 is of
> > > particular interest.
> > >
> >=20
> > Ah, before I forget...
> >=20
> > I used TREE_RCU (was the default before noticing RCU issue) for
> > finding the culprit commit.
> > If it is from your POV more helpful to switch to PREEMPT + PREEMPT_=
RCU
> > + RCU_BOOST, please let me *now* know.
> > ( Both RCU setups freaks up the system. )
>=20
> If TREE_RCU hits problems faster, it is probably best to stay with
> TREE_RCU.

And of course, one exception to this advice is if TREE_RCU hangs so har=
d
and fast that you don't have time to get any diagnostics.  If this is t=
he
case, then TREE_PREEMPT_RCU might be more productive.

							Thanx, Paul

> > I think top & Co. are not enough to track the problem down.
> > I have seen tracing and debugging facililities for RCU.
> >=20
> > Some questions to debug and trace setup:
> >=20
> > Case #1: TREE_RCU
> >=20
> > CONFIG_RCU_TRACE=3Dy
> > CONFIG_TREE_RCU_TRACE=3Dy
>=20
> Yep.
>=20
> > Case #2: PREEMPT + PREEMPT_RCU + RCU_BOOST
> >=20
> > CONFIG_RCU_TRACE=3Dy
> > CONFIG_TREE_RCU_TRACE=3Dy
> > CONFIG_DEBUG_PREEMPT=3Dy <--- Helpful?
> > CONFIG_PREEMPT_TRACER=3Dy <--- Helpful?
> >=20
> > Any other recommends for useful/helpful trace and/or debug options?
> >=20
> > Any other intructions for debugging/tracing?
>=20
> Not at the moment.  I will be looking at diagnostics will going
> through the code, so might have something later.
>=20
> > BTW, today's linux-next (next-20110328) is still freaky, I applied =
the
> > revert-rcu-patches patchset and all is fine.
>=20
> I reverted back to the commit preceding the one you pointed out last =
night
> my time, so the upcoming -next should be less freaky.
>=20
> > - Sedat -
> >=20
> > P.S.: Note to myself
> >=20
> > # mount -t debugfs none /sys/kernel/debug/
> > # ln -s /sys/kernel/debug /debug
> >=20
> > # find /debug -name rcu
>=20
> Or:
>=20
> # cd /debug/rcu
>=20
> then dump out everything except for the .csv file (which is the same
> as the non-.csv equivalent, but in spreadsheet format -- intended
> for systems with 100s or 1000s of CPUs).
>=20
> 							Thanx, Paul
