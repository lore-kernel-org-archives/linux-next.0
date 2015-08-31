From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 31 Aug 2015 10:18:03 +0200
Message-ID: <alpine.DEB.2.02.1508311016040.16666@lnxricardw1.se.axis.com>
References: <20150828115041.037554b4@canb.auug.org.au> <alpine.DEB.2.02.1508280936240.16666@lnxricardw1.se.axis.com> <20150828154556.GO12027@sirena.org.uk> <alpine.DEB.2.02.1508310850530.16666@lnxricardw1.se.axis.com> <20150831174842.3c227fd2@canb.auug.org.au>
 <20150831175149.76ffa13f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bes.se.axis.com ([195.60.68.10]:50933 "EHLO bes.se.axis.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750960AbbHaISG (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 31 Aug 2015 04:18:06 -0400
In-Reply-To: <20150831175149.76ffa13f@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


On Mon, 31 Aug 2015, Stephen Rothwell wrote:

> On Mon, 31 Aug 2015 17:48:42 +1000 Stephen Rothwell <sfr@canb.auug.or=
g.au> wrote:
> >
> > On Mon, 31 Aug 2015 09:04:22 +0200 Ricard Wanderlof <ricard.wanderl=
of@axis.com> wrote:
> > >
> > > On Fri, 28 Aug 2015, Mark Brown wrote:
> > >=20
> > > > On Fri, Aug 28, 2015 at 09:40:41AM +0200, Ricard Wanderlof wrot=
e:
> > > > > On Fri, 28 Aug 2015, Stephen Rothwell wrote:
> > > >=20
> > > > > In fact the exact same construct is used by a handful of othe=
r codec=20
> > > > > drivers which apparently don't fail.
> > > >=20
> > > > > I'm suspecting something slightly more convoluted like a miss=
ing=20
> > > > #include .
> > > >=20
> > > > No, the issue is that you have used a different variable name w=
hen=20
> > > > declaring the IDs and when referencing them in the module devic=
e table.
> > >=20
> > > Yeah, I realized that upon closer inspection.=20
> > >=20
> > > What bugs me is that my ARM gcc didn't seem to flag this, whereas=
 the=20
> > > x86 gcc did upon subsequent testing. And yes, CONFIG_OF is set du=
ring my=20
> > > build.
> >=20
> > Do you have CONFIG_MODULE set in your build? (just guessing)
>=20
> Actually what matters is if you build the driver as a module or not.
> See include/linux/module.h and the definitions of MODULE_DEVICE_TABLE=
().

Bingo.

Haven't verified that, but it's true, the kernel build for our ARM syst=
em=20
is largely monolithic as we have no need to reconfigure it once it has=20
been built. Whereas in my x86 test build the driver was built as a modu=
le.

Thanks Stegphen!

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
