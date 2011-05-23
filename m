From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [bloat] Measuring header file bloat effects on kernel build
 performance: a more than 2x slowdown ...
Date: Mon, 23 May 2011 12:55:22 +0200
Message-ID: <20110523105522.GC24674@elte.hu>
References: <20110520161210.81bbef3a.sfr@canb.auug.org.au>
 <BANLkTi=Dn_jvJ8mLY0Bc6C1Ptoqa-kJrCg@mail.gmail.com>
 <20110523090918.GA5474@elte.hu>
 <BANLkTi=Vbr+DRBy6sa7omGpvAb0uGunYMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BANLkTi=Vbr+DRBy6sa7omGpvAb0uGunYMA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, David Miller <davem@davemloft.net>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org, Peter Zijlstra <a.p.zijlstra@chello.nl>, Andrew Morton <akpm@linux-foundation.org>
List-Id: linux-next.vger.kernel.org


* Alexey Dobriyan <adobriyan@gmail.com> wrote:

> On Mon, May 23, 2011 at 12:09 PM, Ingo Molnar <mingo@elte.hu> wrote:
> > =A0 =A0 =A024594a2bfcaa: [PATCH] x86-64 merge
> >
> > =A0 =A0 - Remove some unneeded prefetches. =A0Just two are enough t=
o kickstart
> > =A0 =A0 =A0 the hardware prefetcher.
> >
> > =A0 But despite touching prefetches explicitly, this too sloppily l=
eft the (now
> > =A0 dangling) prefetch.h include file around.
>=20
> Well, developer removes include, developer risks compile breakage.

If developer removes the final prefetch() from an unrelated header he m=
ight as=20
well think of removing the prefetch.h header. If there's compile breaka=
ge we=20
want to fix the breakage.

But yes, this is easily forgotten and the basic psychology is for heade=
r file=20
dependencies to grow, almost never to shrink.

To counteract that in a really good way we need tooling help - we are f=
ighting=20
entropy here ...

> > Anway, what i tried to demonstrate with this mail how much *real* s=
lowdown=20
> > in the kernel build our current header file bloat is causing. We co=
uld=20
> > literally halve our kernel build times if we fixed this!
>=20
> News at 11!

I have not seen *actual hard numbers* measured before, so how exactly i=
s this=20
news at 11? So i think your condescending reply is neither fair nor jus=
tified.

Yes, we all knew that there's build time costs of header bloat - but it=
 was=20
never AFAIK measured and posted to lkml in such a clear way.

Thanks,

	Ingo
