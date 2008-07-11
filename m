From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 23:06:38 +0200
Message-ID: <200807112306.39455.rjw@sisk.pl>
References: <4877400B.1000400@gmail.com> <200807111710.42826.rjw@sisk.pl> <20080711190749.GB21758@elte.hu>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ogre.sisk.pl ([217.79.144.158]:60619 "EHLO ogre.sisk.pl"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755629AbYGKVEi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 11 Jul 2008 17:04:38 -0400
In-Reply-To: <20080711190749.GB21758@elte.hu>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, =?iso-8859-1?q?T=F6r=F6k_Edwin?= <edwintorok@gmail.com>, Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@gmail.com>

On Friday, 11 of July 2008, Ingo Molnar wrote:
>=20
> * Rafael J. Wysocki <rjw@sisk.pl> wrote:
>=20
> > On Friday, 11 of July 2008, Ingo Molnar wrote:
> > >=20
> > > * T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:
> > >=20
> > > > On 2008-07-11 16:59, Ingo Molnar wrote:
> > > > > * T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:
> > > > >
> > > > >  =20
> > > > >>> [Added Ingo to Cc]
> > > > >>>
> > > > >>> I get the boot problem on i386 with 2008-07-11 linux-next t=
ree, too.
> > > > >>> In my case, no error appears on the screen, just staying bl=
ank and
> > > > >>> dead.  It seems stopping at the very beginning, soon after =
GRUB, so
> > > > >>> could be the same reason.
> > > > >>>  =20
> > > > >>>      =20
> > > > >> I don't see any boot messages on the screen, I get that BUG =
message as
> > > > >> soon as grub's menu dissapears.
> > > > >> I have bisected it to this range so far:
> > > > >> git-bisect good aa03060a78c1aec53075a0c8ca7be19cedfbea8f
> > > > >> git-bisect bad b1611c0058bc6635e7257e755c3f194933a7a6df
> > > > >>
> > > > >> Should I continue to bisect?
> > > > >>    =20
> > > > >
> > > > > could you check latest tip/master, does it boot fine with the=
 same=20
> > > > > config?
> > > >=20
> > > > tip/master boots fine.
> > >=20
> > > to update linux-next to the latest bits in -tip, you can perhaps =
do=20
> > > something like this:
> > >=20
> > >  git-merge tip/auto-x86-next
> > >  git-merge tip/auto-core-next
> > >  git-merge tip/auto-cpus4096-next
> > >  git-merge tip/auto-ftrace-next
> > >  git-merge tip/auto-generic-ipi-next
> > >  git-merge tip/auto-genirq-next
> > >  git-merge tip/auto-latest
> > >  git-merge tip/auto-safe-poison-pointers-next
> > >  git-merge tip/auto-sched-next
> > >  git-merge tip/auto-stackprotector-next
> > >  git-merge tip/auto-timers-next
> > >=20
> > > but it's easily possible that the bug is in some other portion of=
=20
> > > linux-next.
> >=20
> > Hm, I haven't tested the linux-next from today myself yet, but I ha=
ve=20
> > a related question.  Namely, is there a way to get a log of commits=
=20
> > that have been added since the previous linux-next?
> >=20
> > That may help to find a guilty patch if the yesterday's linux-next=20
> > works.
>=20
> at least in -tip it works like this:
>=20
>    git-shortlog tip-history-2008-07-10_09.58_Thu..
>=20
> or, a more practical format with commit IDs on the same line:
>=20
>   git log --no-merges --pretty=3Dformat:"%h: %s" \
>       tip-history-2008-07-10_09.58_Thu..
>=20
> you can restrict it to a given piece of code as well, say:
>=20
>   git log --no-merges --pretty=3Dformat:"%h: %s" \
>       tip-history-2008-07-10_09.58_Thu.. -- arch/x86/ include/asm-x86=
/
>=20
> this doesnt work in linux-next nearly as well, due to the Quilt impor=
ted=20
> trees. Every time a quilt queue is updated and reimported, there's a=20
> stream of repeat commits.

Thanks for the tips.

Well, it turns out that linux-next from today doesn't boot on my box to=
o
(64-bit) and I don't see anything obviously suspicious.  Bisection time=
=2E

Thanks,
Rafael
