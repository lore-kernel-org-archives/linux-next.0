From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH -next] mtd: fix physmap.h warnings
Date: Tue, 24 May 2011 08:58:03 +0300
Message-ID: <1306216683.2785.47.camel@localhost>
References: <20110523154518.5e27cfb0.sfr@canb.auug.org.au>
	 <20110523113709.4357b4ba.randy.dunlap@oracle.com>
	 <1306216431.2785.46.camel@localhost>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1306216431.2785.46.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-mtd@lists.infradead.org, linux-next@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <Marc.Zyngier@arm.com>, Randy Dunlap <randy.dunlap@oracle.com>
List-Id: linux-next.vger.kernel.org

On Tue, 2011-05-24 at 08:53 +0300, Artem Bityutskiy wrote:
> On Mon, 2011-05-23 at 11:37 -0700, Randy Dunlap wrote:
> > From: Randy Dunlap <randy.dunlap@oracle.com>
> >=20
> > Fix build warnings in physmap.h:
> >=20
> > include/linux/mtd/physmap.h:25: warning: 'struct platform_device' d=
eclared inside parameter list
> > include/linux/mtd/physmap.h:25: warning: its scope is only this def=
inition or declaration, which is probably not what you want
> > include/linux/mtd/physmap.h:26: warning: 'struct platform_device' d=
eclared inside parameter list
> > include/linux/mtd/physmap.h:27: warning: 'struct platform_device' d=
eclared inside parameter list
> >=20
> > Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
>=20
> Oh, this was missed during review.  This was introduced in
> b7281ca2a4b00044c60c25059f467d05772cdbe3 which is going in via Russel=
's
> tree, so I guess Russel could pick up your patch.

My big apologies, s/Russel/Russell/.

--=20
Best Regards,
Artem Bityutskiy (=D0=90=D1=80=D1=82=D1=91=D0=BC =D0=91=D0=B8=D1=82=D1=8E=
=D1=86=D0=BA=D0=B8=D0=B9)
