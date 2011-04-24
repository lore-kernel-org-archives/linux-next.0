From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ
 related?)
Date: Sat, 23 Apr 2011 23:27:28 -0700
Message-ID: <20110424062728.GM2628@linux.vnet.ibm.com>
References: <20110421142853.GA2235@linux.vnet.ibm.com>
 <BANLkTineNYTXffcNT59STsk5nkLhi=o-kA@mail.gmail.com>
 <20110422005046.GQ2235@linux.vnet.ibm.com>
 <BANLkTi=W=s876U===LVfp59Nnfui8d-1RQ@mail.gmail.com>
 <20110422150222.GA2300@linux.vnet.ibm.com>
 <BANLkTind84Gf8JA9Fa4QL2GbaF8nMNhDzw@mail.gmail.com>
 <20110423210539.GI2628@linux.vnet.ibm.com>
 <BANLkTimXW2=PYOXkKjnLuH+eN2TjZBqAxw@mail.gmail.com>
 <BANLkTi=ntjm-5D=OD1oFogpNjmJSJiZygQ@mail.gmail.com>
 <BANLkTim9H1k4c7xSZZJ09WXs8WCeCQQJJg@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e8.ny.us.ibm.com ([32.97.182.138]:39361 "EHLO e8.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752512Ab1DXG1l (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 24 Apr 2011 02:27:41 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTim9H1k4c7xSZZJ09WXs8WCeCQQJJg@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, Apr 24, 2011 at 01:08:42AM +0200, Sedat Dilek wrote:
> On Sun, Apr 24, 2011 at 1:04 AM, Sedat Dilek <sedat.dilek@googlemail.=
com> wrote:
> > On Sat, Apr 23, 2011 at 11:16 PM, Sedat Dilek
> > <sedat.dilek@googlemail.com> wrote:
> >> On Sat, Apr 23, 2011 at 11:05 PM, Paul E. McKenney
> >> <paulmck@linux.vnet.ibm.com> wrote:
> >>> On Fri, Apr 22, 2011 at 07:36:58PM +0200, Sedat Dilek wrote:
> >>>> On Fri, Apr 22, 2011 at 5:02 PM, Paul E. McKenney
> >>>> <paulmck@linux.vnet.ibm.com> wrote:
> >>>> > On Fri, Apr 22, 2011 at 11:40:54AM +0200, Sedat Dilek wrote:
> >>>> >> On Fri, Apr 22, 2011 at 2:50 AM, Paul E. McKenney
> >>>> >> <paulmck@linux.vnet.ibm.com> wrote:
> >>>> >> > On Thu, Apr 21, 2011 at 04:47:31PM +0200, Sedat Dilek wrote=
:
> >>>> >> >> On Thu, Apr 21, 2011 at 4:28 PM, Paul E. McKenney
> >>>> >> >> <paulmck@linux.vnet.ibm.com> wrote:
> >>>> >> >> > On Thu, Apr 21, 2011 at 02:49:37PM +0200, Sedat Dilek wr=
ote:
> >>>> >> >> >> On Thu, Apr 21, 2011 at 12:24 PM, Sedat Dilek
> >>>> >> >> >> <sedat.dilek@googlemail.com> wrote:
> >>>> >> >
> >>>> >> > [ . . . ]
> >>>> >> >
> >>>> >> >> >> Here the results from the 2nd-run (PREEMPT_RCU enabled)=
=2E
> >>>> >> >> >
> >>>> >> >> > OK, and the grace periods clearly stopped advancing earl=
y on.
> >>>> >> >> >
> >>>> >> >> > Beyond that point, the per-CPU kthread is blocked, but R=
CU has some
> >>>> >> >> > work for it to do. =A0So someone has called invoke_rcu_c=
pu_kthread(),
> >>>> >> >> > but rcu_cpu_kthread() is still blocked. =A0I don't see a=
 bug right
> >>>> >> >> > off-hand, but it is early in the morning for me, so I mi=
ght easily
> >>>> >> >> > be missing something.
> >>>> >> >> >
> >>>> >> >> > Hmmm...
> >>>> >> >> >
> >>>> >> >> > The synchronization between these two assumes that the p=
er-CPU
> >>>> >> >> > kthread is always bound to the respective CPU, so if was=
 somehow
> >>>> >> >> > being migrated off, that might explain these results.
> >>>> >> >> >
> >>>> >> >> > I will add some more diagnostics, test them locally, the=
n push
> >>>> >> >> > out an update. =A0Seem reasonable?
> >>>> >> >> >
> >>>> >> >> > And thank you again for the testing!!!
> >>>> >> >>
> >>>> >> >> Ping me when you have new stuff for testing.
> >>>> >> >> Tomorrow (friday), here is public holiday and monday, too.
> >>>> >> >> So a looong weekend.
> >>>> >> >
> >>>> >> > ;-)
> >>>> >> >
> >>>> >> > OK, I have a new sedat.2011.04.21a branch in the -rcu git t=
ree:
> >>>> >> >
> >>>> >> > git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux=
-2.6-rcu.git
> >>>> >> >
> >>>> >> > This is against 2.6.39-rc3, as before. =A0(Yes, I do need t=
o rebase to
> >>>> >> > 2.6.39-rc4, but didn't want to change any more than I had t=
o.)
> >>>> >> >
> >>>> >> > I also have an updated script, which is attached. =A0The ou=
tput is similar
> >>>> >> > to the earlier one, and it operated is pretty much the same=
 way.
> >>>> >> >
> >>>> >> > Have a great weekend, and I look forward to seeing what sho=
ws up on
> >>>> >> > this round. =A0I confess to still being quite puzzled!
> >>>> >> >
> >>>> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >>>> >> >
> >>>> >>
> >>>> >> Here are the results of the Sedat's vote (European song conte=
st :-)).
> >>>> >
> >>>> > ;-)
> >>>> >
> >>>> > Very strange. =A0RCU has told the per-CPU kthread that it need=
s to get
> >>>> > to work, but this kthread is still waiting from RCU's viewpoin=
t.
> >>>> > Yet the "ps" command believes that this kthread is in fact run=
nable
> >>>> > at SCHED_FIFO priority 1.
> >>>> >
> >>>> > I can tell that this one will require some thought... =A0And m=
ore
> >>>> > diagnostics...
> >>>> >
> >>>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >>>> >
> >>>>
> >>>> "We are with you in spirit."
> >>>>
> >>>> ( Level XX from Hybris shooter-game on Amiga (1989) )
> >>>
> >>> OK, I added a few more diagnostics: sedat.2011.04.23a in -rcu:
> >>>
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-2.6-r=
cu.git
> >>>
> >>> When you get a chance, could you please give it a try?
> >>>
> >>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >>>
> >>
> >> As soon as I can clone/pull from new GIT repo/branch.
> >> Currently, I don't see it only, but kernel-mirrors are sometimes s=
low.
> >>
> >> I will report later.
> >>
> >> - Sedat -
> >>
> >
> > Hi Paul,
> >
> > I have seen CONFIG_DEBUG_OBJECTS_RCU_HEAD mentionned in the commits=
,
> > so I enabled it here together with CONFIG_DEBUG_OBJECTS=3Dy.
> > Hope this is OK.
> > Am I missing other useful (*DEBUG_OBJECT*) kernel options?
> >
> > - Sedat -
> >
> > P.S.: Enabled CONFIG_DEBUG_OBJECTS=3Dy and
> > CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy (and some more)
> >
> > # diff -uprN for-paulk-3/config-2.6.39-rc3-preempt-rcu-sedat.2011.0=
4.21a+
> > for-paulk-4/config-2.6.39-rc3-preempt-rcu-sedat.2011.04.23a+
> > --- for-paulk-3/config-2.6.39-rc3-preempt-rcu-sedat.2011.04.21a+
> > =A02011-04-22 10:25:42.000000000 +0200
> > +++ for-paulk-4/config-2.6.39-rc3-preempt-rcu-sedat.2011.04.23a+
> > =A02011-04-24 00:35:37.000000000 +0200
> > @@ -1,7 +1,7 @@
> > =A0#
> > =A0# Automatically generated make config: don't edit
> > =A0# Linux/i386 2.6.39-rc3 Kernel Configuration
> > -# Fri Apr 22 09:54:37 2011
> > +# Sat Apr 23 23:58:52 2011
> > =A0#
> > =A0# CONFIG_64BIT is not set
> > =A0CONFIG_X86_32=3Dy
> > @@ -3065,7 +3065,14 @@ CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> > =A0CONFIG_SCHED_DEBUG=3Dy
> > =A0# CONFIG_SCHEDSTATS is not set
> > =A0CONFIG_TIMER_STATS=3Dy
> > -# CONFIG_DEBUG_OBJECTS is not set
> > +CONFIG_DEBUG_OBJECTS=3Dy
> > +# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
> > +# CONFIG_DEBUG_OBJECTS_FREE is not set
> > +CONFIG_DEBUG_OBJECTS_TIMERS=3Dy
> > +# CONFIG_DEBUG_OBJECTS_WORK is not set
> > +CONFIG_DEBUG_OBJECTS_RCU_HEAD=3Dy
> > +CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=3Dy
> > +CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=3D1
> > =A0# CONFIG_SLUB_DEBUG_ON is not set
> > =A0# CONFIG_SLUB_STATS is not set
> > =A0# CONFIG_DEBUG_KMEMLEAK is not set
> >
>=20
> Oops, forget the dmesg output.

OK, this looks unrelated, but just in case, could you please try it
again with the following patch?  (Not mainlinable, debug only.)

Also, it does look like you are still seeing a grace-period hang.
Could you please send the output of the script?  Same one as last time.

							Thanx, Paul

-----------------------------------------------------------------------=
-

 debugobjects.c |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/lib/debugobjects.c b/lib/debugobjects.c
index 9d86e45..10a7c7a 100644
--- a/lib/debugobjects.c
+++ b/lib/debugobjects.c
@@ -289,10 +289,12 @@ static void debug_object_is_on_stack(void *addr, =
int onstack)
 		return;
=20
 	limit++;
-	if (is_on_stack)
+	if (is_on_stack) {
+		struct rcu_head *p =3D (struct rcu_head *)addr;
 		printk(KERN_WARNING
-		       "ODEBUG: object is on stack, but not annotated\n");
-	else
+		       "ODEBUG: object is on stack, but not annotated: %p\n",
+		       p->func);
+	} else
 		printk(KERN_WARNING
 		       "ODEBUG: object is not on stack, but annotated\n");
 	WARN_ON(1);
