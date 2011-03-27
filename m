From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for March 25 (Call trace:
 RCU|workqueues|block|VFS|ext4 related?)
Date: Sat, 26 Mar 2011 20:25:29 -0700
Message-ID: <20110327032529.GC2322@linux.vnet.ibm.com>
References: <AANLkTim08Ff==7mY9fuU8tUJrTmEhZ+PrsJSQO5PKOH6@mail.gmail.com>
 <AANLkTi=N6Z0bDg1YXVFkUbv7phM8XvQ5U3=vS6Ej8Af5@mail.gmail.com>
 <20110325174855.GR2322@linux.vnet.ibm.com>
 <AANLkTin9HxOTwavbtbsMd0quYsEvhDNmuO5kOpquqoF=@mail.gmail.com>
 <20110326034210.GX2322@linux.vnet.ibm.com>
 <AANLkTi=zJZ26i14D-kyWQ1uqUPifrv+DN4So4+fC5V=d@mail.gmail.com>
 <20110326160229.GZ2322@linux.vnet.ibm.com>
 <AANLkTikzLm+ArYkG20F41JOgfNygfdhxC0+A4tV4ez-R@mail.gmail.com>
 <20110327000900.GB2322@linux.vnet.ibm.com>
 <AANLkTikpq2CiSTk9Br7DdkVt=E1p8OFGa+Ls2BzkkhcO@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e39.co.us.ibm.com ([32.97.110.160]:49539 "EHLO
	e39.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752585Ab1C0DZl (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 26 Mar 2011 23:25:41 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTikpq2CiSTk9Br7DdkVt=E1p8OFGa+Ls2BzkkhcO@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Josh Triplett <josh@joshtriplett.org>, linux-next <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Randy Dunlap <randy.dunlap@oracle.com>, Theodore Ts'o <tytso@mit.edu>, Jens Axboe <axboe@kernel.dk>, Tejun Heo <tj@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Nick Piggin <npiggin@kernel.dk>

On Sun, Mar 27, 2011 at 03:30:34AM +0200, Sedat Dilek wrote:
> On Sun, Mar 27, 2011 at 1:09 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Sat, Mar 26, 2011 at 11:15:22PM +0100, Sedat Dilek wrote:
> >> On Sat, Mar 26, 2011 at 5:02 PM, Paul E. McKenney
> >> <paulmck@linux.vnet.ibm.com> wrote:
> >> > On Sat, Mar 26, 2011 at 01:34:53PM +0100, Sedat Dilek wrote:
> >> [...]
> >> >> Just FYI: Changed to the following settings:
> >> >>
> >> >> - Enable Preemptible Kernel (Low-Latency Desktop)
> >> >> - Enable Preemptible tree-based hierarchical RCU
> >> >> - Enable RCU priority boosting
> >> >> - Reset RCU CPU stall timeout to default (60 seconds)
> >> >>
> >> >> So far I see no RCU stalls in the logs and my system runs as ex=
pected.
> >> >> ( I have noticed here some "stalling" in the webbrowser, but I =
can do
> >> >> my daily business. )
> >> >
> >> > OK, good to see some progress!
> >> >
> >>
> >> On 1st impression thing went fine, but after a while jobs like ope=
ning
> >> several tabs in firefox or doing a simple df command stalled the
> >> machine. No, my system even got frozen and required a brutal reset=
=2E
> >>
> >> >From the logs (more see file-attachment):
> >>
> >> Mar 26 19:58:40 tbox kernel: [ 1440.640060] INFO: task systemd:1
> >> blocked for more than 120 seconds.
> >> Mar 26 19:58:40 tbox kernel: [ 1440.640074] "echo 0 >
> >> /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> >>
> >> Following it -> NOPE
> >> $ echo 0 > /proc/sys/kernel/hung_task_timeout_secs
> >
> > These are tasks that are blocked, not tasks that are consuming CPU.
> >
> >> > Is there a runaway process consuming CPU? =A0The reason that I a=
sk is that
> >> > an infinite loop in the kernel can result in a stall when PREEMP=
T=3Dn
> >> > but is less likely to if PREEMPT=3Dy. =A0Could you please check =
with "top",
> >> > "ps", or whatever?
> >>
> >> Unsure what you mean by this, as you can see from the logs, it's n=
ot
> >> only one special task "stalling".
> >> BTW, I have systemd here running.
> >
> > Right. =A0But I need to know if there are tasks consuming lots of C=
PU,
> > which is different than tasks that are stalled for a long time. =A0=
Look
> > at the message: it says "blocked for more than 120 seconds", not
> > "running for more than 120 seconds".
> >
> > For example, if one of the RCU kthreads is consuming lots of CPU, t=
hat
> > would tell me that I should look for an RCU bug (and yank the patch=
es
> > from -next in the meantime). =A0On the other hand, if some other ta=
sk is
> > consuming lots of CPU, then that would be a hint as to where to fin=
d
> > the bug.
> >
> >> >> I am not sure what the change to PREEMPT exactly mean in the en=
d.
> >> >> ( Let's work with this new kernel and carefully check for possi=
ble
> >> >> side-effects. )
> >> >> For example CONFIG_RCU_FAST_NO_HZ=3Dy is now dropped, where the=
 Kconfig
> >> >> descriptive text says some words on better energy saving. For a
> >> >> notebook this is no good.
> >> >
> >> > CONFIG_RCU_FAST_NO_HZ is of no use on a uniprocessor system, so =
OK
> >> > to disable it. =A0But are you saying that CONFIG_RCU_FAST_NO_HZ=3D=
y
> >> > results in problems that are removed by CONFIG_RCU_FAST_NO_HZ=3D=
n?
> >> > That would be a surprise, and I need to know if this is the case=
=2E
> >>
> >> In my current setup (PREEMPT and TREE_PREEMPT_RCU)
> >> CONFIG_RCU_FAST_NO_HZ is not considered and set via Kconfig-system
> >> (see excerpt below).
> >> But when you say for UP it is of no use, I need no more info.
> >
> > OK, "of no use" is overstating things a bit. =A0But CONFIG_RCU_FAST=
_NO_HZ's
> > main purpose is to get the last CPU into dyntick-idle state
> > (CONFIG_NO_HZ), which is most useful if the system has several CPUs=
=2E
> >
> >> Might be good to add some recommended (and/or useless) kernel-conf=
ig
> >> settings to RCU/UP.txt?
> >>
> >> [ init/Kconfig ]
> >> config RCU_FAST_NO_HZ
> >> =A0 =A0 =A0 =A0 bool "Accelerate last non-dyntick-idle CPU's grace=
 periods"
> >> =A0 =A0 =A0 =A0 depends on TREE_RCU && NO_HZ && SMP
> >> =A0 =A0 =A0 =A0 default n
> >
> > The "depends on TREE_RCU && NO_HZ && SMP" already excludes it from
> > UP kernel builds, so no need to document.
> >
> >> >> I have also questions to some Kconfig dependencies, for example=
 why I
> >> >> can't select TREE_PREEMPT_RCU if CONFIG_PREEMPT_VOLUNTARY=3Dy, =
etc.
> >> >> Intended?
> >> >
> >> > Yes. =A0There is no point in TREE_PREEMPT_RCU unless PREEMPT=3Dy=
=2E
> >> >
> >>
> >> OK.
> >>
> >> >> Maybe I collect all my askings in a separate email to RCU folks=
 and ML
> >> >> and do not disturb further people from other sub-trees.
> >> >>
> >> >> I enjoyed to read the numerous docs in Documentation/RCU/ (and =
noticed
> >> >> some typos as well).
> >> >> The RCU folk gave the word "FAQ" a new meaning: Frequenty Asked
> >> >> Questions & Q*uiz* :-).
> >> >>
> >> >> Thanks for the helpful hints and explanations from the RCU folk=
s!
> >> >
> >> > Glad you liked them! =A0;-)
> >> >
> >>
> >> Other sub-trees lack of no good or up2date docs.
> >>
> >> >> - Sedat -
> >> >>
> >> >> P.S.: Current RCU and HZ kernel-config settings
> >> >>
> >> >> # grep RCU /boot/config-$(uname -r)
> >> >> # RCU Subsystem
> >> >> CONFIG_TREE_PREEMPT_RCU=3Dy
> >> >> CONFIG_PREEMPT_RCU=3Dy
> >> >> CONFIG_RCU_TRACE=3Dy
> >> >> CONFIG_RCU_FANOUT=3D32
> >> >> # CONFIG_RCU_FANOUT_EXACT is not set
> >> >> CONFIG_TREE_RCU_TRACE=3Dy
> >> >> CONFIG_RCU_BOOST=3Dy
> >> >> CONFIG_RCU_BOOST_PRIO=3D1
> >> >> CONFIG_RCU_BOOST_DELAY=3D500
> >> >> # CONFIG_SPARSE_RCU_POINTER is not set
> >> >> # CONFIG_RCU_TORTURE_TEST is not set
> >> >> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> >> >> CONFIG_RCU_CPU_STALL_VERBOSE=3Dy
> >> >>
> >> >> # grep _HZ /boot/config-$(uname -r)
> >> >> CONFIG_NO_HZ=3Dy
> >> >> # CONFIG_HZ_100 is not set
> >> >> CONFIG_HZ_250=3Dy
> >> >> # CONFIG_HZ_300 is not set
> >> >> # CONFIG_HZ_1000 is not set
> >> >> CONFIG_HZ=3D250
> >> >
> >> > OK, thank you for the info!
> >> >
> >>
> >> N.P.
> >>
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >> >
> >>
> >> I guees I will revert step-by-step the RCU commits in linux-next a=
nd report.
> >> This weekend I wanted to enhance Debian's live-cd framework with
> >> overlayfs support and a customized kernel.
> >> But then came RCU :-(.
> >
> > Well, if it turns out to be a problem in RCU I will certainly apolo=
gize.
> >
>=20
> No, that's not so dramatic.
> Dealing with this RCU issue has nice side-effects: I remembered (and
> finally did) to use a reduced kernel-config set.
> The base for it I created with 'make localmodconfig' and did some
> manual fine-tuning afterwards (throw out media, rc, dvd, unneeded FSs=
,
> etc.).
> Also, I can use fresh gcc-4.6 (4.6.0-1) from the official Debian repo=
s.
>=20
> So, I started building with
> "revert-rcu-patches/0001-Revert-rcu-introduce-kfree_rcu.patch".
> I will let you know.

And please also check for tasks consuming all available CPU.

							Thanx, Paul

> - Sedat -
>=20
> >> Can you say some words to kfree_rcu.2011.03.25b (rcu/kfree_rcu) GI=
T branch(es)?
> >
> > These are just applying Lia Jiangshan's kfree_rcu() to a number of =
places
> > in the kernel. =A0You can safely ignore them.
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >
> >> - Sedat -
> >
