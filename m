From: Andres Freund <andres@anarazel.de>
Subject: Re: Current suspend issues on Lenovo X200
Date: Sat, 25 Oct 2008 17:55:06 +0200
Message-ID: <200810251755.11253.andres@anarazel.de>
References: <20081023204326.GB4175@denkbrett.schottelius.org> <200810241123.17883.jbarnes@virtuousgeek.org> <20081025145329.GB4273@denkbrett.schottelius.org>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1398266.XEXbYssOhb";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mail.anarazel.de ([217.115.131.40]:43084 "EHLO smtp.anarazel.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752439AbYJYPzP (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 25 Oct 2008 11:55:15 -0400
In-Reply-To: <20081025145329.GB4273@denkbrett.schottelius.org>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Nico -telmich- Schottelius <nico-linux-next@schottelius.org>
Cc: Jesse Barnes <jbarnes@virtuousgeek.org>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

--nextPart1398266.XEXbYssOhb
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi Nico,

On Saturday 25 October 2008 16:53:29 Nico -telmich- Schottelius wrote:
> Jesse Barnes [Fri, Oct 24, 2008 at 11:23:17AM -0700]:
> > On Friday, October 24, 2008 7:28 am Andres Freund wrote:
> > > On Thursday 23 October 2008 22:43:26 Nico -telmich- Schottelius wrote:
> > > >  - 2.6.27-next-20081023:
> > > >    -> no X running (because xorg does not work with that kernel)
> > > I think what you need is one rather short fix for the intel xorg
> > > driver:
> > > diff --git a/src/i830_driver.c b/src/i830_driver.c
> > > index c1d61f4..eaf5d27 100644
> > > --- a/src/i830_driver.c
> > > +++ b/src/i830_driver.c
> > > @@ -502,8 +502,8 @@ I830DetectMemory(ScrnInfoPtr pScrn)
> > >     range =3D gtt_size + 4;
> > >
> > >     /* new 4 series hardware has seperate GTT stolen with GFX stolen =
*/
> > > - if (IS_G4X(pI830))
> > > - range =3D 0;
> > > + if (IS_G4X(pI830) || IS_GM45(pI830))
> > > + range =3D 4;
> > >
> > >     if (IS_I85X(pI830) || IS_I865G(pI830) || IS_I9XX(pI830)) {
> > >        switch (gmch_ctrl & I855_GMCH_GMS_MASK) {
> > >
> > > (Out of the "[git pull] agp patches for 2.6.28-rc1" thread)
> > Something like this might also help.
> > G4x chips do their own memory arbitration management, so we shouldn't
> > trying to save/restore the DSPARB reg.
> I'm a bit confused. Which of both patches against 2.6.28-rc1 should I try?
"My" patch is definitely needed to make the X intel driver work with 2.6.28-
rc1. Its a patch for X and not for the kernel.
Its not necessarily directly related to what you reported, but to:
>=A0- 2.6.27-next-20081023:
> =A0-> no X running (because xorg does not work with that kernel)
It might also help to work with suspend, because seemingly (according to In=
tel=20
people) its not expected that the driver works with that bug.

So try the patch I posted (which is out of the upstream development version=
)=20
to make X work with 2.6.28-rc1 and continue testing if X works with 2.6.28-
rcx.

Andres

--nextPart1398266.XEXbYssOhb
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkkDQVsACgkQporPraT14igBKgCfZhWBOMJ7siSvGEw8gqX/ipvK
6n8AoKNo0Jlvp2TBD9Mq530rBbbTbNSC
=5L0Q
-----END PGP SIGNATURE-----

--nextPart1398266.XEXbYssOhb--
