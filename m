From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
Date: Tue, 24 May 2011 10:40:34 +0300
Message-ID: <1306222834.2785.53.camel@localhost>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	 <20110523113709.4357b4ba.randy.dunlap@oracle.com>
	 <1306216431.2785.46.camel@localhost> <1306216683.2785.47.camel@localhost>
	 <20110524074020.GA9490@flint.arm.linux.org.uk>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:65392 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753853Ab1EXHoy (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 24 May 2011 03:44:54 -0400
In-Reply-To: <20110524074020.GA9490@flint.arm.linux.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Russell King <rmk@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mtd@lists.infradead.org, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, Randy Dunlap <randy.dunlap@oracle.com>

On Tue, 2011-05-24 at 08:40 +0100, Russell King wrote:
> On Tue, May 24, 2011 at 08:58:03AM +0300, Artem Bityutskiy wrote:
> > On Tue, 2011-05-24 at 08:53 +0300, Artem Bityutskiy wrote:
> > > On Mon, 2011-05-23 at 11:37 -0700, Randy Dunlap wrote:
> > > > From: Randy Dunlap <randy.dunlap@oracle.com>
> > > >=20
> > > > Fix build warnings in physmap.h:
> > > >=20
> > > > include/linux/mtd/physmap.h:25: warning: 'struct platform_devic=
e' declared inside parameter list
> > > > include/linux/mtd/physmap.h:25: warning: its scope is only this=
 definition or declaration, which is probably not what you want
> > > > include/linux/mtd/physmap.h:26: warning: 'struct platform_devic=
e' declared inside parameter list
> > > > include/linux/mtd/physmap.h:27: warning: 'struct platform_devic=
e' declared inside parameter list
> > > >=20
> > > > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> > >=20
> > > Oh, this was missed during review.  This was introduced in
> > > b7281ca2a4b00044c60c25059f467d05772cdbe3 which is going in via Ru=
ssel's
> > > tree, so I guess Russel could pick up your patch.
> >=20
> > My big apologies, s/Russel/Russell/.
>=20
> Which patch?  Neither of these messages contained Randy's patch and I
> wasn't included on the original posting.

Sorry, I assumed you'd look that lkml is in CC and would find it in lkm=
l
(I assumed you are subscribed there). I'll send this patch shortly.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
