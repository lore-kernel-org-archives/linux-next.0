From: Sedat Dilek <sedat.dilek@googlemail.com>
Subject: Re: linux-next: Tree for March 25 (Call trace: RCU|workqueues|block|VFS|ext4
 related?)
Date: Mon, 28 Mar 2011 14:33:36 +0200
Message-ID: <AANLkTinQiDSXLP1o-HfdedYOMKtnsbBrcOfuqw9sFf2X@mail.gmail.com>
References: <AANLkTi=zJZ26i14D-kyWQ1uqUPifrv+DN4So4+fC5V=d@mail.gmail.com>
	<20110326160229.GZ2322@linux.vnet.ibm.com>
	<AANLkTikzLm+ArYkG20F41JOgfNygfdhxC0+A4tV4ez-R@mail.gmail.com>
	<20110327000900.GB2322@linux.vnet.ibm.com>
	<AANLkTikpq2CiSTk9Br7DdkVt=E1p8OFGa+Ls2BzkkhcO@mail.gmail.com>
	<20110327032529.GC2322@linux.vnet.ibm.com>
	<20110327050720.GA31424@linux.vnet.ibm.com>
	<AANLkTimpbGGcxNJUDMjdg1wijYhvXQ3KySvRYnEsUYsy@mail.gmail.com>
	<20110327213220.GE2322@linux.vnet.ibm.com>
	<AANLkTi=ti+PVC8N-3Bt2fzuHHQz6kuMdUPeb3Gudn7EU@mail.gmail.com>
	<20110328040823.GG2322@linux.vnet.ibm.com>
Reply-To: sedat.dilek@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-qy0-f181.google.com ([209.85.216.181]:54401 "EHLO
	mail-qy0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753210Ab1C1Mdh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2011 08:33:37 -0400
In-Reply-To: <20110328040823.GG2322@linux.vnet.ibm.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>

On Mon, Mar 28, 2011 at 6:08 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Sun, Mar 27, 2011 at 11:48:30PM +0200, Sedat Dilek wrote:
>> On Sun, Mar 27, 2011 at 11:32 PM, Paul E. McKenney
>> <paulmck@linux.vnet.ibm.com> wrote:
>> > On Sun, Mar 27, 2011 at 02:26:15PM +0200, Sedat Dilek wrote:
>> >> On Sun, Mar 27, 2011 at 7:07 AM, Paul E. McKenney
>> >> <paulmck@linux.vnet.ibm.com> wrote:
>> >> > On Sat, Mar 26, 2011 at 08:25:29PM -0700, Paul E. McKenney wrot=
e:
>> >> >> On Sun, Mar 27, 2011 at 03:30:34AM +0200, Sedat Dilek wrote:
>> >> >> > On Sun, Mar 27, 2011 at 1:09 AM, Paul E. McKenney
>> >> >> > <paulmck@linux.vnet.ibm.com> wrote:
>> >> >> > > On Sat, Mar 26, 2011 at 11:15:22PM +0100, Sedat Dilek wrot=
e:
>> >> >
>> >> > [ . . . ]
>> >> >
>> >> >> > >> But then came RCU :-(.
>> >> >> > >
>> >> >> > > Well, if it turns out to be a problem in RCU I will certai=
nly apologize.
>> >> >> > >
>> >> >> >
>> >> >> > No, that's not so dramatic.
>> >> >> > Dealing with this RCU issue has nice side-effects: I remembe=
red (and
>> >> >> > finally did) to use a reduced kernel-config set.
>> >> >> > The base for it I created with 'make localmodconfig' and did=
 some
>> >> >> > manual fine-tuning afterwards (throw out media, rc, dvd, unn=
eeded FSs,
>> >> >> > etc.).
>> >> >> > Also, I can use fresh gcc-4.6 (4.6.0-1) from the official De=
bian repos.
>> >> >> >
>> >> >> > So, I started building with
>> >> >> > "revert-rcu-patches/0001-Revert-rcu-introduce-kfree_rcu.patc=
h".
>> >> >> > I will let you know.
>> >> >>
>> >> >> And please also check for tasks consuming all available CPU.
>> >> >
>> >> > And I still cannot reproduce with the full RCU stack (but based=
 off of
>> >> > 2.6.38 rather than -next). =C2=A0Nevertheless, if you would lik=
e to try a
>> >> > speculative patch, here you go.
>> >>
>> >> You are right and my strategy on handling the (possible RCU?) iss=
ue is wrong.
>> >> Surely, you tested your RCU stuff in your own repo and everything
>> >> might be OK on top of stable 2.6.38.
>> >> Linux-next gets daily updates from a lot of different trees, so t=
here
>> >> might be interferences with other stuff.
>> >> Please, understand I am interested in finding out what is the cau=
se
>> >> for my issues, my aim is not to blame you.
>> >
>> > I am not worried about blame, but rather getting the bug fixed. =C2=
=A0The
>> > bug might be in RCU, it might be elsewhere, or it might be a combi=
nation
>> > of problems in RCU and elsewhere.
>> >
>> > So the first priority is locating the bug.
>> >
>> > And that is why I have been asking you over and over to PLEASE tak=
e
>> > a look at what tasks are consuming CPU while the problem is occuri=
ng.
>> > The reason that I have been asking over and over is that the sympt=
oms
>> > you describe are likely caused by a loop in some kernel code. =C2=A0=
Yes,
>> > there might be other causes, but this is the most likely. =C2=A0Gi=
ven that
>> > TREE_PREEMPT_RCU behaves better than TREE_RCU, it is likely that t=
his
>> > loop is in preemptible code with irqs enabled. =C2=A0Therefore, th=
e process
>> > accounting code is likely to be able to see the CPU consumption, a=
nd
>> > you should be able to see it via the "top" or "ps" commands -- or =
via
>> > any number of other tools.
>> >
>> > For example, if the problem is confined to RCU, you would likely s=
ee
>> > the "rcuc0" or "rcun0" tasks consuming lots of CPU. =C2=A0This wou=
ld narrow
>> > the problem down to a few tens of lines of code. =C2=A0If the prob=
lem was
>> > in some other kthread, then identifying the kthread would very lik=
ely
>> > narrow things down as well.
>> >
>> > So, please do take a look to see what taks consuming CPU.
>> >
>> >> As I was wrong and want to be 99.9% sure it is RCU stuff, I rever=
ted
>> >> all (18) RCU patches from linux-next (next-20110325) by keeping t=
he
>> >> RCU|PREEMPT|HZ settings from last working next-20110323.
>> >
>> > Makes sense.
>> >
>> >> $ egrep 'RCU|PREEMPT|_HZ' /boot/config-2.6.38-next20110325-7-686-=
iniza
>> >> # RCU Subsystem
>> >> CONFIG_TREE_RCU=3Dy
>> >> # CONFIG_PREEMPT_RCU is not set
>> >> # CONFIG_RCU_TRACE is not set
>> >> CONFIG_RCU_FANOUT=3D32
>> >> # CONFIG_RCU_FANOUT_EXACT is not set
>> >> CONFIG_RCU_FAST_NO_HZ=3Dy
>> >> # CONFIG_TREE_RCU_TRACE is not set
>> >> CONFIG_PREEMPT_NOTIFIERS=3Dy
>> >> CONFIG_NO_HZ=3Dy
>> >> # CONFIG_PREEMPT_NONE is not set
>> >> CONFIG_PREEMPT_VOLUNTARY=3Dy
>> >> # CONFIG_PREEMPT is not set
>> >> # CONFIG_HZ_100 is not set
>> >> CONFIG_HZ_250=3Dy
>> >> # CONFIG_HZ_300 is not set
>> >> # CONFIG_HZ_1000 is not set
>> >> CONFIG_HZ=3D250
>> >> # CONFIG_SPARSE_RCU_POINTER is not set
>> >> # CONFIG_RCU_TORTURE_TEST is not set
>> >> # CONFIG_RCU_CPU_STALL_DETECTOR is not set
>> >>
>> >> I will work and stress this kernel before doing any step-by-step
>> >> revert of RCU stuff.
>> >>
>> >> Thanks for your patch, I applied it on top of "naked" next-201103=
25,
>> >> but I still see call-traces.
>> >
>> > Thank you very much for testing it!
>> >
>> > I intend to keep that patch, as it should increase robustness in o=
ther
>> > situations.
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >
>> >> - Sedat -
>> >>
>> >>
>> >>
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Thanx, Paul
>> >> >
>> >> > ---------------------------------------------------------------=
---------
>> >> >
>> >> > rcu: further lower priority in rcu_yield()
>> >> >
>> >> > Although rcu_yield() dropped from real-time to normal priority,=
 there
>> >> > is always the possibility that the competing tasks have been ni=
ced.
>> >> > So nice to 19 in rcu_yield() to help ensure that other tasks ha=
ve a
>> >> > better chance of running.
>> >> >
>> >> > =C2=A0 =C2=A0Signed-off-by: Paul E. McKenney <paulmck@linux.vne=
t.ibm.com>
>> >> >
>> >> > diff --git a/kernel/rcutree.c b/kernel/rcutree.c
>> >> > index 759f54b..5477764 100644
>> >> > --- a/kernel/rcutree.c
>> >> > +++ b/kernel/rcutree.c
>> >> > @@ -1492,6 +1492,7 @@ static void rcu_yield(void (*f)(unsigned =
long), unsigned long arg)
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0mod_timer(&yield_timer, jiffies + 2)=
;
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_priority =3D 0;
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_setscheduler_nocheck(current, =
SCHED_NORMAL, &sp);
>> >> > + =C2=A0 =C2=A0 =C2=A0 set_user_nice(current, 19);
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0schedule();
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sp.sched_priority =3D RCU_KTHREAD_PR=
IO;
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0sched_setscheduler_nocheck(current, =
SCHED_FIFO, &sp);
>>
>> Sorry, my attempt was to identify and isolate the culprit commit.
>>
>> Reverting all RCU patches resulted in a stable system, the following=
 8
>> kernels with reduced k-config setup where all built using this kerne=
l.
>>
>> All kernels used TREE_RCU (see above), I did not change it (no
>> mixing/switching to PREEMPT and TREE_PREEMPT_RCU).
>> ( I doubt that TREE_PREEMPT_RCU was some kind of more stable here. )
>>
>> The culprit commit is bc56163ebd4580199ac7e63f5e160bf139ba0dd6 (from
>> rcu/next GIT tree):
>> "rcu: move TREE_RCU from softirq to kthread"
>

Hi Paul,

> OK, please accept my apologies for your lost weekend. =C2=A0And thank=
 you for
> testing this.
>

No worries, it was mostly a rainy day.
The only thing I did @ 16:30 was to go to regional election (the new
(regional) prime minister will be the 1st from The German Green
party).

But back to RCU :-):
The reduced kernel-config setup decreased the build-time from approx.
2hrs (full, generic build) down to approx. 35mins.

>> I can do parallelly a tar job, open 20 tabs in firefox and run a fla=
sh
>> video in one of them (I did this several times).
>
> How many files in the tar job? =C2=A0Is this creating a tar archive, =
expanding
> it, or both?
>

I am doing a simple tar (filesize: 1.6G for full and 1.0G for reduced b=
uild):

$ tar -cf $archivedir-on-external-usbhdd/$tarfile $kernel-build-dir

=2E..plus parallelly opening 20 tabs in firefox.
That's normally enough to get my system freaky and see RCU related
messages in the logs.

> Do you have a script for this? =C2=A0Are all of these running at norm=
al
> priority, or are some of them running at real-time priority?
>

Nothing special.

>> [ setup.log ]
>> ...
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0001-Revert-rcu-introduce-kf=
ree_rcu.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0002-Revert-rcu-fix-spelling=
=2Epatch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0003-Revert-rcu-fix-rcu_cpu_=
kthread_task-synchronization.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0004-Revert-rcu-call-__rcu_r=
ead_unlock-in-exit_rcu-for-tr.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0005-Revert-rcu-Converge-TIN=
Y_RCU-expedited-and-normal-bo.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0006-Revert-rcu-remove-usele=
ss-boosted_this_gp-field.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0007-Revert-rcu-code-cleanup=
s-in-TINY_RCU-priority-boosti.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0008-Revert-rcu-Switch-to-th=
is_cpu-primitives.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0009-Revert-rcu-Use-WARN_ON_=
ONCE-for-DEBUG_OBJECTS_RCU_HE.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0010-Revert-rcu-Enable-DEBUG=
_OBJECTS_RCU_HEAD-from-PREEMP.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0011-Revert-rcu-Add-boosting=
-to-TREE_PREEMPT_RCU-tracing.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0012-Revert-rcu-eliminate-un=
used-boosting-statistics.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0013-Revert-rcu-priority-boo=
sting-for-TREE_PREEMPT_RCU.patch
>> =C2=A0 (+) OK =C2=A0 revert-rcu-patches/0014-Revert-rcu-move-TREE_RC=
U-from-softirq-to-kthread.patch
>> ...
>>
>> Hope this helps to narrow down the problem.
>>
>> As I kept all kernels I can have a look at the tasks consuming high
>> CPU usage tomorrow.
>
> Could you please?
>

I recalled (as you say I requested over and over again from you :-)) I
looked with top, htop and 'ps axu', but there was nothing special.
Sometimes the system got frozen - at this point (or short before) I
did not see anything suspicious with top.

> Also, could you please mount debugfs and list out the files in the
> "rcu" directory? =C2=A0The "ql=3D" value from the "rcu/rcudata" file =
is of
> particular interest.
>

Ah, before I forget...

I used TREE_RCU (was the default before noticing RCU issue) for
finding the culprit commit.
If it is from your POV more helpful to switch to PREEMPT + PREEMPT_RCU
+ RCU_BOOST, please let me *now* know.
( Both RCU setups freaks up the system. )

I think top & Co. are not enough to track the problem down.
I have seen tracing and debugging facililities for RCU.

Some questions to debug and trace setup:

Case #1: TREE_RCU

CONFIG_RCU_TRACE=3Dy
CONFIG_TREE_RCU_TRACE=3Dy

Case #2: PREEMPT + PREEMPT_RCU + RCU_BOOST

CONFIG_RCU_TRACE=3Dy
CONFIG_TREE_RCU_TRACE=3Dy
CONFIG_DEBUG_PREEMPT=3Dy <--- Helpful?
CONFIG_PREEMPT_TRACER=3Dy <--- Helpful?

Any other recommends for useful/helpful trace and/or debug options?

Any other intructions for debugging/tracing?

BTW, today's linux-next (next-20110328) is still freaky, I applied the
revert-rcu-patches patchset and all is fine.

- Sedat -

P.S.: Note to myself

# mount -t debugfs none /sys/kernel/debug/
# ln -s /sys/kernel/debug /debug

# find /debug -name rcu
