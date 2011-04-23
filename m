From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for April 14 (Call-traces: RCU/ACPI/WQ
 related?)
Date: Sat, 23 Apr 2011 14:05:39 -0700
Message-ID: <20110423210539.GI2628@linux.vnet.ibm.com>
References: <20110421050823.GA4487@linux.vnet.ibm.com>
 <BANLkTinFmG5GVq6D8+wq_89OPF8snsQ=Jw@mail.gmail.com>
 <BANLkTi=c=+JnU9dQsVhgjZbOtArhHQz+EQ@mail.gmail.com>
 <BANLkTimEWqBVdq8MWbjAAfXCLPQdiHkuNg@mail.gmail.com>
 <20110421142853.GA2235@linux.vnet.ibm.com>
 <BANLkTineNYTXffcNT59STsk5nkLhi=o-kA@mail.gmail.com>
 <20110422005046.GQ2235@linux.vnet.ibm.com>
 <BANLkTi=W=s876U===LVfp59Nnfui8d-1RQ@mail.gmail.com>
 <20110422150222.GA2300@linux.vnet.ibm.com>
 <BANLkTind84Gf8JA9Fa4QL2GbaF8nMNhDzw@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e4.ny.us.ibm.com ([32.97.182.144]:43396 "EHLO e4.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757246Ab1DWVFs (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 23 Apr 2011 17:05:48 -0400
Content-Disposition: inline
In-Reply-To: <BANLkTind84Gf8JA9Fa4QL2GbaF8nMNhDzw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, Apr 22, 2011 at 07:36:58PM +0200, Sedat Dilek wrote:
> On Fri, Apr 22, 2011 at 5:02 PM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Fri, Apr 22, 2011 at 11:40:54AM +0200, Sedat Dilek wrote:
> >> On Fri, Apr 22, 2011 at 2:50 AM, Paul E. McKenney
> >> <paulmck@linux.vnet.ibm.com> wrote:
> >> > On Thu, Apr 21, 2011 at 04:47:31PM +0200, Sedat Dilek wrote:
> >> >> On Thu, Apr 21, 2011 at 4:28 PM, Paul E. McKenney
> >> >> <paulmck@linux.vnet.ibm.com> wrote:
> >> >> > On Thu, Apr 21, 2011 at 02:49:37PM +0200, Sedat Dilek wrote:
> >> >> >> On Thu, Apr 21, 2011 at 12:24 PM, Sedat Dilek
> >> >> >> <sedat.dilek@googlemail.com> wrote:
> >> >
> >> > [ . . . ]
> >> >
> >> >> >> Here the results from the 2nd-run (PREEMPT_RCU enabled).
> >> >> >
> >> >> > OK, and the grace periods clearly stopped advancing early on.
> >> >> >
> >> >> > Beyond that point, the per-CPU kthread is blocked, but RCU ha=
s some
> >> >> > work for it to do. =A0So someone has called invoke_rcu_cpu_kt=
hread(),
> >> >> > but rcu_cpu_kthread() is still blocked. =A0I don't see a bug =
right
> >> >> > off-hand, but it is early in the morning for me, so I might e=
asily
> >> >> > be missing something.
> >> >> >
> >> >> > Hmmm...
> >> >> >
> >> >> > The synchronization between these two assumes that the per-CP=
U
> >> >> > kthread is always bound to the respective CPU, so if was some=
how
> >> >> > being migrated off, that might explain these results.
> >> >> >
> >> >> > I will add some more diagnostics, test them locally, then pus=
h
> >> >> > out an update. =A0Seem reasonable?
> >> >> >
> >> >> > And thank you again for the testing!!!
> >> >>
> >> >> Ping me when you have new stuff for testing.
> >> >> Tomorrow (friday), here is public holiday and monday, too.
> >> >> So a looong weekend.
> >> >
> >> > ;-)
> >> >
> >> > OK, I have a new sedat.2011.04.21a branch in the -rcu git tree:
> >> >
> >> > git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-2.6-=
rcu.git
> >> >
> >> > This is against 2.6.39-rc3, as before. =A0(Yes, I do need to reb=
ase to
> >> > 2.6.39-rc4, but didn't want to change any more than I had to.)
> >> >
> >> > I also have an updated script, which is attached. =A0The output =
is similar
> >> > to the earlier one, and it operated is pretty much the same way.
> >> >
> >> > Have a great weekend, and I look forward to seeing what shows up=
 on
> >> > this round. =A0I confess to still being quite puzzled!
> >> >
> >> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >> >
> >>
> >> Here are the results of the Sedat's vote (European song contest :-=
)).
> >
> > ;-)
> >
> > Very strange. =A0RCU has told the per-CPU kthread that it needs to =
get
> > to work, but this kthread is still waiting from RCU's viewpoint.
> > Yet the "ps" command believes that this kthread is in fact runnable
> > at SCHED_FIFO priority 1.
> >
> > I can tell that this one will require some thought... =A0And more
> > diagnostics...
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >
>=20
> "We are with you in spirit."
>=20
> ( Level XX from Hybris shooter-game on Amiga (1989) )

OK, I added a few more diagnostics: sedat.2011.04.23a in -rcu:

git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-2.6-rcu.git

When you get a chance, could you please give it a try?

							Thanx, Paul
