From: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: linux-next: Tree for June 24 (mtd + of)
Date: Sun, 26 Jun 2011 12:43:41 +0300
Message-ID: <1309081426.6618.0.camel@koala>
References: <20110624155822.cb8cf6eb.sfr@canb.auug.org.au>
	 <20110624090456.191f1fda.randy.dunlap@oracle.com>
	 <1308947172.13493.37.camel@koala> <4E04F5D0.9090900@oracle.com>
	 <1308983721.23868.2.camel@koala>
	 <20110625152009.f264be78.randy.dunlap@oracle.com>
	 <BANLkTi=Q-7bCHaH+-z6gnbwvexpGLYH6pA@mail.gmail.com>
Reply-To: dedekind1@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:43038 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752560Ab1FZJnu (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Sun, 26 Jun 2011 05:43:50 -0400
In-Reply-To: <BANLkTi=Q-7bCHaH+-z6gnbwvexpGLYH6pA@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Grant Likely <grant.likely@secretlab.ca>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Randy Dunlap <randy.dunlap@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Vitaly Wool <vwool@ru.mvista.com>

On Sun, 2011-06-26 at 00:11 -0600, Grant Likely wrote:
> > 3.0-rc4 does not have this build error when I use the .config file =
with it...
> > however, I think that 3.0-rc4 also does not build ofpart.ko as it s=
hould.
> >
> > Looks to me like changes in drivers/mtd/{Kconfig && Makefile} cause=
d this
> > build error.
>=20
> The following commit in linux-next appears to be the culprit:
>=20
> commit 1a6bc893044b961caae1c5a9c6c2065e608da427
> Author: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
> Date:   Sun May 29 21:32:33 2011 +0400
>=20
>     mtd: prepare to convert of_mtd_parse_partitions to partition pars=
er
>=20
>     Prepare to convert of_mtd_parse_partitions() to usual partitions =
parser:
>     1) Register ofpart parser
>     2) Internally don't use passed device for error printing
>     3) Add device_node to mtd_part_parser_data struct
>     4) Move of_mtd_parse_partitions from __devinit to common text sec=
tion
>     5) add ofpart to the default list of partition parsers
>=20
>     Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
>     Signed-off-by: Artem Bityutskiy <dedekind1@gmail.com>
>=20
> It adds a module_init() call to ofpart.c which does not work the way
> that ofpart.c is linked to mtdcore.o.  Seems like that commit series
> still needs work.

OK, let's ask Dmitry to take a look at this.

--=20
Best Regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
