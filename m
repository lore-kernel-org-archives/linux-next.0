From: Mandeep Singh Baines <msb@google.com>
Subject: Re: next-20090202: task kmemleak:763 blocked for more than 120 seconds.
Date: Mon, 2 Feb 2009 13:57:40 -0800
Message-ID: <20090202215740.GA26550@google.com>
References: <a4423d670902020327x61a1d9dehb1642b25ec7f82f1@mail.gmail.com> <tnxiqns28mm.fsf@pc1117.cambridge.arm.com> <c62985530902020715u73407d4dqe14c340de310c866@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-out.google.com ([216.239.33.17]:14348 "EHLO
	smtp-out.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753569AbZBBV5z (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 2 Feb 2009 16:57:55 -0500
Content-Disposition: inline
In-Reply-To: <c62985530902020715u73407d4dqe14c340de310c866@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?Q?Fr=E9d=E9ric?= Weisbecker <fweisbec@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Alexander Beregalov <a.beregalov@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

=46r=E9d=E9ric Weisbecker (fweisbec@gmail.com) wrote:
> 2009/2/2 Catalin Marinas <catalin.marinas@arm.com>:
> > Alexander Beregalov <a.beregalov@gmail.com> wrote:
> >> It seems it is blocked forever.
> >
> > Scanning the full memory may take a lot of time, depending on the
> > amount of RAM and the number of objects allocated. It is not unlike=
ly
> > to take more than 120 seconds on some loaded systems. However, it
> > should call schedule() periodically to let other tasks run. Is your
> > system unresponsive during this?
> >
> >> [ 1704.619898] INFO: task kmemleak:763 blocked for more than 120 s=
econds.
> >> [ 1704.697951] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> >> disables this message.
> >> [ 1704.791613] kmemleak      D 0000000000000001  6008   763      2
> > [...]
> >> [ 1706.246334] no locks held by kmemleak/763.
> >
> > It looks like the kmemleak thread is in the TASK_UNINTERUPTIBLE sta=
te.
> > This happens when it calls schedule_timeout_uninterruptible() to sl=
eep
> > between scans. It probably took more than 120 to scan the memory an=
d
> > hence the report.
> >
> > It doesn't look like a problem, only that the watchdog thread check=
s
> > for uninterruptible tasks. I can try to make it sleep with
> > TASK_INTERRUPTIBLE to avoid the message.
> >
> > Thanks.
> >
> > --
> > Catalin
> > --
>=20
>=20
> Hi,
>=20
> May be it would be better to make the softlockup detector hooking int=
o
> schedule_timeout()
> (ie by using a tracepoint) to check if a thread chose to sleep more
> than hung_task_timeout_secs
> intentionally in a TASK_UNINTERRUPTIBLE state.
>=20
> Fixing it into kmemleak would not solve the problem in other tasks
> which do similar sleeps...
>=20

The hung_task timeout is now 480 seconds because of sys_sync:

http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;a=3D=
commitdiff;h=3Dfb822db465bd9fd4208eef1af4490539b236c54e

But are there are really any other tasks which call
schedule_timeout_uninterruptibl() for with a timeout >480 seconds?

Right now kmemleak appears to be the only exception. (A quick grep didn=
't turn
anything up.) And it is trivial to change kmemleak to use INTERRUPTIBLE=
=2E
Might even be a nice feature. You could stop it faster that way.

I suspect cases where long UNINTERRUPTIBLE sleeps is the right solution=
 are
extremely rare. Since kmemleak can be modified, maybe hold off on ignor=
ing
schedule_timeout_uninterruptible(). Not exempting schedule_timeout_unin=
ter*
reduces code sprawl and discourages long UNINTERRUPTIBLE sleeps.

> Mandeep, if you agree I can try something? Or perhaps you prefer to d=
o
> it yourself. As you wish.

Nah, don't wait for me. If you have a useful patch, just send it;) I'm
actually not the maintainer of hung_task, mingo@elte.hu is, but I am mo=
re than
happy to review patches.
