From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: Tree for June 24 (mtd + of)
Date: Sat, 25 Jun 2011 09:35:13 +0300
Message-ID: <1308983721.23868.2.camel@koala>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>
		 <20110624090456.191f1fda.randy.dunlap@oracle.com>
	 <1308947172.13493.37.camel@koala> <4E04F5D0.9090900@oracle.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:52798 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750893Ab1FYGfY (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sat, 25 Jun 2011 02:35:24 -0400
In-Reply-To: <4E04F5D0.9090900@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Vitaly Wool <vwool@ru.mvista.com>

On Fri, 2011-06-24 at 13:38 -0700, Randy Dunlap wrote:
> On 06/24/11 13:26, Artem Bityutskiy wrote:
> > On Fri, 2011-06-24 at 09:04 -0700, Randy Dunlap wrote:
> >> On Fri, 24 Jun 2011 15:58:22 +1000 Stephen Rothwell wrote:
> >>
> >>> Hi all,
> >>>
> >>> Changes since 20110623:
> >>>
> >>> My fixes tree includes:
> >>> 	(as an experiment) the early part of mmotm-2011-06-22-13-05
> >>> 	STAGING: Comedi: Build only on arches providing PAGE_KERNEL_NOCA=
CHE
> >>
> >>
> >> When CONFIG_MTD=3Dm, CONFIG_MTD_OF_PARTS=3Dy:
> >>
> >> drivers/mtd/ofpart.o: In function `init_module':
> >> ofpart.c:(.init.text+0x0): multiple definition of `init_module'
> >> drivers/mtd/mtdcore.o:(.init.text+0x43): first defined here
> >=20
> > I guess this is some old issue? I do not think ofpart can be compil=
ed-in
> > if the mtd core is a module...
>=20
> [adding driver author, Vitaly]
>=20
> No, it's a current issue.

I meant that the subject suggests this is about linux-next, but this
problem should be in upstream.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
