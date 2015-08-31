From: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: linux-next: build failure after merge of the sound-asoc tree
Date: Mon, 31 Aug 2015 09:04:22 +0200
Message-ID: <alpine.DEB.2.02.1508310850530.16666@lnxricardw1.se.axis.com>
References: <20150828115041.037554b4@canb.auug.org.au> <alpine.DEB.2.02.1508280936240.16666@lnxricardw1.se.axis.com> <20150828154556.GO12027@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-next-owner@vger.kernel.org>
Received: from bastet.se.axis.com ([195.60.68.11]:48176 "EHLO
	bastet.se.axis.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750922AbbHaHEZ (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Mon, 31 Aug 2015 03:04:25 -0400
In-Reply-To: <20150828154556.GO12027@sirena.org.uk>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Liam Girdwood <lgirdwood@gmail.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


On Fri, 28 Aug 2015, Mark Brown wrote:

> On Fri, Aug 28, 2015 at 09:40:41AM +0200, Ricard Wanderlof wrote:
> > On Fri, 28 Aug 2015, Stephen Rothwell wrote:
>=20
> > In fact the exact same construct is used by a handful of other code=
c=20
> > drivers which apparently don't fail.
>=20
> > I'm suspecting something slightly more convoluted like a missing=20
> #include .
>=20
> No, the issue is that you have used a different variable name when=20
> declaring the IDs and when referencing them in the module device tabl=
e.

Yeah, I realized that upon closer inspection.=20

What bugs me is that my ARM gcc didn't seem to flag this, whereas the=20
x86 gcc did upon subsequent testing. And yes, CONFIG_OF is set during m=
y=20
build.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
