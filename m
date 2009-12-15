From: Peter Ujfalusi <peter.ujfalusi@nokia.com>
Subject: Re: linux-next: manual merge of the voltage tree with Linus' tree
Date: Tue, 15 Dec 2009 16:23:21 +0200
Message-ID: <200912151623.21924.peter.ujfalusi@nokia.com>
References: <20091215133808.cd3d4b8b.sfr@canb.auug.org.au> <1260870485.3591.25.camel@odin> <1260879242.3591.335.camel@odin>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp.nokia.com ([192.100.105.134]:60495 "EHLO
	mgw-mx09.nokia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932208AbZLOOXn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 15 Dec 2009 09:23:43 -0500
In-Reply-To: <1260879242.3591.335.camel@odin>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: ext Liam Girdwood <lrg@slimlogic.co.uk>
Cc: "Keski-Saari Juha.1 (EXT-Teleca/Helsinki)" <ext-juha.1.keski-saari@nokia.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Valentin Eduardo (Nokia-D/Helsinki)" <eduardo.valentin@nokia.com>, Rajendra Nayak <rnayak@ti.com>, Samuel Ortiz <sameo@linux.intel.com>, Balaji T K <balajitk@ti.com>, Stephen Rothwell <sfr@canb.auug.org.au>

Hello Liam,

On Tuesday 15 December 2009 14:14:02 ext Liam Girdwood wrote:
> On Tue, 2009-12-15 at 09:48 +0000, Liam Girdwood wrote:
> > Hi Stephen,
> >
> > On Tue, 2009-12-15 at 13:38 +1100, Stephen Rothwell wrote:
> > > Hi Liam,
> > >
> > > Today's linux-next merge of the voltage tree got a conflict in
> > > drivers/regulator/twl-regulator.c between commit
> > > 441a450554dada1c59fc06fdf068cb0eeba53c6d ("regulator: Add support=
 for
> > > twl6030 regulators") from Linus' tree and commits
> > > 6360cf42ae51be5f6e6e72d6e81f202d9db0f7e9 ("twl4030-regulator: Rem=
ove
> > > regulator from all groups when disabling") and
> > > 3277b9fce0fcaa68d5947429e062163852ebc6fb ("twl4030-regulator: Add=
 all
> > > TWL regulators to twreg_info") from the voltage tree.
> > >
> > > I cannot begin to fix this mess up.  I do wonder why the regulato=
r
> > > patch above was never in linux-next before being sent upstream
> > > yesterday (Samuel?).  All I can do is use the version of the volt=
age
> > > tree from next-20091120 (commit id
> > > b0a7a2ad0aebb35934de6d2509c73fe93a362c0e) for today and hope that=
 Liam
> > > can do the merge with Linus' tree.
> >
> > Sorry about this. There were some large patch sets that did span bo=
th
> > mfd and regulator recently.
> >
> > I'll fix and do my pull request today.
>=20
> Peter, Juha,
>=20
> I've fixed up regulator for-next against upstream and now get a build
> failure on twl-regulator.c (possibly related to mfd/twl-codec.c build
> failure today ?)

I think this is not related to twl403-codec.c (or twl-codec.c, if it ha=
s been=20
changed as well).
It looks like the twl6030 changes went in quite an un-organized way, wh=
ich is=20
causing lots of problems all over the place...

=2E..

>=20
> Can you check this and send me patch before I issue a pull request.
> Fwiw, the regulator pull request is now blocking on this issue.

I need to find the series for the twl6030, and check the soc codec driv=
er as=20
well, if it is still in a working shape.

>=20
> Thanks.
>=20
> Liam
>=20

--=20
P=C3=A9ter
