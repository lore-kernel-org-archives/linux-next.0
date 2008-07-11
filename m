From: Ingo Molnar <mingo@elte.hu>
Subject: Re: today's linux-next fails to boot
Date: Fri, 11 Jul 2008 16:53:22 +0200
Message-ID: <20080711145322.GA25698@elte.hu>
References: <4877400B.1000400@gmail.com> <s5hy747rvpr.wl%tiwai@suse.de> <48775C69.6050107@gmail.com> <20080711135937.GA25004@elte.hu> <487772B6.4090100@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mx2.mail.elte.hu ([157.181.151.9]:40627 "EHLO mx2.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750896AbYGKOxc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 11 Jul 2008 10:53:32 -0400
Content-Disposition: inline
In-Reply-To: <487772B6.4090100@gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: =?iso-8859-1?B?VPZy9ms=?= Edwin <edwintorok@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-next@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@gmail.com>


* T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:

> On 2008-07-11 16:59, Ingo Molnar wrote:
> > * T=F6r=F6k Edwin <edwintorok@gmail.com> wrote:
> >
> >  =20
> >>> [Added Ingo to Cc]
> >>>
> >>> I get the boot problem on i386 with 2008-07-11 linux-next tree, t=
oo.
> >>> In my case, no error appears on the screen, just staying blank an=
d
> >>> dead.  It seems stopping at the very beginning, soon after GRUB, =
so
> >>> could be the same reason.
> >>>  =20
> >>>      =20
> >> I don't see any boot messages on the screen, I get that BUG messag=
e as
> >> soon as grub's menu dissapears.
> >> I have bisected it to this range so far:
> >> git-bisect good aa03060a78c1aec53075a0c8ca7be19cedfbea8f
> >> git-bisect bad b1611c0058bc6635e7257e755c3f194933a7a6df
> >>
> >> Should I continue to bisect?
> >>    =20
> >
> > could you check latest tip/master, does it boot fine with the same=20
> > config?
>=20
> tip/master boots fine.

to update linux-next to the latest bits in -tip, you can perhaps do=20
something like this:

 git-merge tip/auto-x86-next
 git-merge tip/auto-core-next
 git-merge tip/auto-cpus4096-next
 git-merge tip/auto-ftrace-next
 git-merge tip/auto-generic-ipi-next
 git-merge tip/auto-genirq-next
 git-merge tip/auto-latest
 git-merge tip/auto-safe-poison-pointers-next
 git-merge tip/auto-sched-next
 git-merge tip/auto-stackprotector-next
 git-merge tip/auto-timers-next

but it's easily possible that the bug is in some other portion of=20
linux-next.

	Ingo
