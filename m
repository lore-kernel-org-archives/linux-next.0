From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 17:10:41 +0200
Message-ID: <200807111710.42826.rjw@sisk.pl>
References: <4877400B.1000400@gmail.com> <487772B6.4090100@gmail.com> <20080711145322.GA25698@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:59022 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751031AbYGKPId convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 11:08:33 -0400
In-Reply-To: <20080711145322.GA25698@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Ingo Molnar <mingo@elte.hu>, =?iso-8859-1?q?T=F6r=F6k_Edwin?= <edwintorok@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@gmail.com>

On Friday, 11 of July 2008, Ingo Molnar wrote:
>=20
> * T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:
>=20
> > On 2008-07-11 16:59, Ingo Molnar wrote:
> > > * T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:
> > >
> > >  =20
> > >>> [Added Ingo to Cc]
> > >>>
> > >>> I get the boot problem on i386 with 2008-07-11 linux-next tree,=
 too.
> > >>> In my case, no error appears on the screen, just staying blank =
and
> > >>> dead.  It seems stopping at the very beginning, soon after GRUB=
, so
> > >>> could be the same reason.
> > >>>  =20
> > >>>      =20
> > >> I don't see any boot messages on the screen, I get that BUG mess=
age as
> > >> soon as grub's menu dissapears.
> > >> I have bisected it to this range so far:
> > >> git-bisect good aa03060a78c1aec53075a0c8ca7be19cedfbea8f
> > >> git-bisect bad b1611c0058bc6635e7257e755c3f194933a7a6df
> > >>
> > >> Should I continue to bisect?
> > >>    =20
> > >
> > > could you check latest tip/master, does it boot fine with the sam=
e=20
> > > config?
> >=20
> > tip/master boots fine.
>=20
> to update linux-next to the latest bits in -tip, you can perhaps do=20
> something like this:
>=20
>  git-merge tip/auto-x86-next
>  git-merge tip/auto-core-next
>  git-merge tip/auto-cpus4096-next
>  git-merge tip/auto-ftrace-next
>  git-merge tip/auto-generic-ipi-next
>  git-merge tip/auto-genirq-next
>  git-merge tip/auto-latest
>  git-merge tip/auto-safe-poison-pointers-next
>  git-merge tip/auto-sched-next
>  git-merge tip/auto-stackprotector-next
>  git-merge tip/auto-timers-next
>=20
> but it's easily possible that the bug is in some other portion of=20
> linux-next.

Hm, I haven't tested the linux-next from today myself yet, but I have a=
 related
question.  Namely, is there a way to get a log of commits that have bee=
n
added since the previous linux-next?

That may help to find a guilty patch if the yesterday's linux-next work=
s.

Thanks,
Rafael
