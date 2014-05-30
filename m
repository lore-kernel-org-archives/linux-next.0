From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>
Subject: Re: nommu build failures on ARM in linux-next
Date: Fri, 30 May 2014 10:02:57 +0200
Message-ID: <20140530080257.GW20155@pengutronix.de>
References: <5387661F.1050000@windriver.com>
 <20140529185534.GK3693@n2100.arm.linux.org.uk>
 <20140529234012.GL3693@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33716 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750970AbaE3IDD (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 30 May 2014 04:03:03 -0400
Content-Disposition: inline
In-Reply-To: <20140529234012.GL3693@n2100.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Jonathan Austin <Jonathan.Austin@arm.com>, Kevin Hilman <khilman@deeprootsystems.com>, kernel@pengutronix.de

Hello,

[adding a few people to Cc]

On Fri, May 30, 2014 at 12:40:12AM +0100, Russell King - ARM Linux wrot=
e:
> On Thu, May 29, 2014 at 07:55:34PM +0100, Russell King - ARM Linux wr=
ote:
> > On Thu, May 29, 2014 at 12:53:51PM -0400, Paul Gortmaker wrote:
> > > Hi Russell,
> > >=20
> > > The allnoconfig builds in linux-next fail because __clear_cr
> > > lives in mmu.c without any stub or similar in nommu.c
> > >=20
> > > Introduced by:
> > >=20
> > > commit 247e4fff3aa927ad069447e6da05bb966b70dece
> > > Author: Russell King <rmk+kernel@arm.linux.org.uk>
> > > Date:   Sun Apr 13 18:57:29 2014 +0100
> > >=20
> > >     ARM: provide common method to clear bits in CPU control regis=
ter
> > >    =20
> > > Sample failure:
> > >   http://kisskb.ellerman.id.au/kisskb/buildresult/11264405/
> >=20
> > ALIGNMENT_TRAP depends on CPU_CP15_MMU, so it's quite reasonable th=
at
> > __clear_cr should exist in this case - but it doesn't because it's =
in
> > mmu.c.  I guess we need __clear_cr moved to arch/arm/kernel/setup.c=
=2E
>=20
> I've been looking at doing this, and while it can be done by applying
> a patch on top, that's not my preferred solution.
>=20
> However, my preferred solution (which is to fix the commit) needs a b=
it
> of rework of the patch series, and given the number of patches I'm
> carrying right now, I'm just going to drop the branch out of linux-ne=
xt
> and hold it off until the following merge window instead.
>=20
> Even so, I suspect even with this build problem solved, that's not go=
ing
> to be the end of the story for noMMU breakage... it's certainly somet=
hing
> that gets very little testing by anyone.  I suspect it should be remo=
ved
> from the mainline kernel tree rather than being a constant source of =
these
> kinds of problems.
That would mean that support for Cortex-M3 would die, too, which would
(IMHO) be sad.

Currently the efm32 test in our autobuilder is broken, I will address
that and then keep an eye on it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
