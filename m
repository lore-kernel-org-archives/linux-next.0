From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: Tree for June 24 (mtd + of)
Date: Fri, 24 Jun 2011 23:26:06 +0300
Message-ID: <1308947172.13493.37.camel@koala>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>
	 <20110624090456.191f1fda.randy.dunlap@oracle.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:49920 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751403Ab1FXU0Q (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Fri, 24 Jun 2011 16:26:16 -0400
In-Reply-To: <20110624090456.191f1fda.randy.dunlap@oracle.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, Grant Likely <grant.likely@secretlab.ca>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2011-06-24 at 09:04 -0700, Randy Dunlap wrote:
> On Fri, 24 Jun 2011 15:58:22 +1000 Stephen Rothwell wrote:
>=20
> > Hi all,
> >=20
> > Changes since 20110623:
> >=20
> > My fixes tree includes:
> > 	(as an experiment) the early part of mmotm-2011-06-22-13-05
> > 	STAGING: Comedi: Build only on arches providing PAGE_KERNEL_NOCACH=
E
>=20
>=20
> When CONFIG_MTD=3Dm, CONFIG_MTD_OF_PARTS=3Dy:
>=20
> drivers/mtd/ofpart.o: In function `init_module':
> ofpart.c:(.init.text+0x0): multiple definition of `init_module'
> drivers/mtd/mtdcore.o:(.init.text+0x43): first defined here

I guess this is some old issue? I do not think ofpart can be compiled-i=
n
if the mtd core is a module...

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
