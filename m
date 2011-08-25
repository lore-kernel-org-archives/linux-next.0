From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the rcu tree
Date: Wed, 24 Aug 2011 22:04:56 -0700
Message-ID: <20110825050456.GB2411@linux.vnet.ibm.com>
References: <20110824142337.78715e4d6f9db2de68d87fe4@canb.auug.org.au>
 <20110824122739.GB2320@linux.vnet.ibm.com>
 <CACqU3MVZRjxo-C+z-WRKnMMFfkr35c4FDUpoY6Kbkh1y1J45kQ@mail.gmail.com>
Reply-To: paulmck@linux.vnet.ibm.com
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from e9.ny.us.ibm.com ([32.97.182.139]:47264 "EHLO e9.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751789Ab1HYFE7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 25 Aug 2011 01:04:59 -0400
Content-Disposition: inline
In-Reply-To: <CACqU3MVZRjxo-C+z-WRKnMMFfkr35c4FDUpoY6Kbkh1y1J45kQ@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Aug 24, 2011 at 08:46:15PM -0400, Arnaud Lacombe wrote:
> Hi,
>=20
> On Wed, Aug 24, 2011 at 8:27 AM, Paul E. McKenney
> <paulmck@linux.vnet.ibm.com> wrote:
> > On Wed, Aug 24, 2011 at 02:23:37PM +1000, Stephen Rothwell wrote:
> >> Hi Paul,
> >>
> >> After merging the rcu tree, today's linux-next build (powerpc
> >> ppc64_defconfig) produced this warning:
> >>
> >> kernel/rtmutex.c: In function '__rt_mutex_slowlock':
> >> kernel/rtmutex.c:605:3: warning: suggest parentheses around assign=
ment used as truth value
> >
> > There actually already are parentheses around it, and the first pas=
s
> > through the loop it is uninitialized at that point. =A0But hey, tha=
t
> > is gcc for you! =A0Does the patch below cure it?
> >
> Yes.

Thank you!

							Thanx, Paul

>  - Arnaud
>=20
> >> Introduced by commit 83841f021d4b ("rcu: Permit rt_mutex_unlock() =
with
> >> irqs disabled").
> >
> > If it does, then I will fold into that commit.
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Thanx, Paul
> >
> > -------------------------------------------------------------------=
-----
> >
> > Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
> >
> > diff --git a/kernel/rtmutex.c b/kernel/rtmutex.c
> > index 0222e34..2548f44 100644
> > --- a/kernel/rtmutex.c
> > +++ b/kernel/rtmutex.c
> > @@ -602,7 +602,8 @@ __rt_mutex_slowlock(struct rt_mutex *lock, int =
state,
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0raw_spin_unlock(&lock->wait_lock);
> >
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (was_disabled =3D irqs_disabled())
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 was_disabled =3D irqs_disabled();
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (was_disabled)
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0local_irq_enable();
> >
> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0debug_rt_mutex_print_deadlock(waiter=
);
> > --
> > To unsubscribe from this list: send the line "unsubscribe linux-ker=
nel" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at =A0http://vger.kernel.org/majordomo-info.htm=
l
> > Please read the FAQ at =A0http://www.tux.org/lkml/
> >
