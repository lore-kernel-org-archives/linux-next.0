From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] dma: vdma: Fix compilation warnings
Date: Tue, 31 Mar 2015 00:10:50 +1100
Message-ID: <20150331001050.37edbd32@canb.auug.org.au>
References: <3912f868-18f8-44ef-9312-b3842270b4da@BY2FFO11OLC001.protection.gbl>
	<20150330203624.51cd07d5@canb.auug.org.au>
	<BL2FFO11FD0547729E39ACFCB0A988C88A1F50@BL2FFO11FD054.protection.gbl>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/n1imNsUzk=NPlZcjtgmrRo0"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46997 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753067AbbC3NK7 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 30 Mar 2015 09:10:59 -0400
In-Reply-To: <BL2FFO11FD0547729E39ACFCB0A988C88A1F50@BL2FFO11FD054.protection.gbl>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Appana Durga Kedareswara Rao <appana.durga.rao@xilinx.com>
Cc: "vinod.koul@intel.com" <vinod.koul@intel.com>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Anirudha Sarangi <anirudh@xilinx.com>

--Sig_/n1imNsUzk=NPlZcjtgmrRo0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Appana,

On Mon, 30 Mar 2015 11:40:02 +0000 Appana Durga Kedareswara Rao <appana.dur=
ga.rao@xilinx.com> wrote:
>
> > -----Original Message-----
> > From: Stephen Rothwell [mailto:sfr@canb.auug.org.au]
> > Sent: Monday, March 30, 2015 3:06 PM
> > To: Appana Durga Kedareswara Rao
> > Cc: vinod.koul@intel.com; linux-next@vger.kernel.org; linux-
> > kernel@vger.kernel.org; Anirudha Sarangi; Appana Durga Kedareswara Rao
> > Subject: Re: [PATCH] dma: vdma: Fix compilation warnings
> >
> > Hi Kedareswara,
> >
> > On Mon, 30 Mar 2015 14:30:26 +0530 Kedareswara rao Appana
> > <appana.durga.rao@xilinx.com> wrote:
> > >
> > > diff --git a/include/linux/dmapool.h b/include/linux/dmapool.h index
> > > 022e34f..01c91bb 100644
> > > --- a/include/linux/dmapool.h
> > > +++ b/include/linux/dmapool.h
> > > @@ -13,6 +13,7 @@
> > >
> > >  #include <asm/io.h>
> > >  #include <asm/scatterlist.h>
> > > +#include <linux/device.h>
> > >
> > >  struct dma_pool *dma_pool_create(const char *name, struct device *de=
v,
> > >                     size_t size, size_t align, size_t allocation);
> >
> > This might be to much, all it really needs is a
> >
> > struct device;
> >
> > line ...
>=20
> Why it is a better solution rather than including header file?
> I didn't get you could you please explain a bit.

When adding an include to an include file, there is always the chance
that you may create a circular include and break some other unrelated
code.  In this case the far more unintrusive fix is to just add the
forward declaration of the struct to satisfy the compiler as the actual
definition of the struct is not needed (since only pointers to the
struct are referenced in dmapool.h).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/n1imNsUzk=NPlZcjtgmrRo0
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVGUtgAAoJEMDTa8Ir7ZwVVx4P/jUC6IqWsfUmUkNVs6TYVssk
aDZE49M51Qb83E2/z3oHjHUJQhQ0YFQiRfEjmp5u5h5GOYPAW25j9i42cqEorC35
CKkvJYxuQn7BFGGBaSzQLGIdk0Qa52+cmb7/hxWw8CJO8RWGrxXBBubVjJ5toOhP
HiL+9wtHvCFx8Vt2/YuxleovZx819ejQ/J0Y++4QVTt2/Ev3UZw9TZ9/6f0Pdu/p
1vNYcidVZAN01VIQkExP5mXY9KokqD9IhikduM0xiy+6vHgPG2KMksA5gm+pb9GK
rLmEimfdCvHmacRhCAAgZFC0CGkeG8XGp7akqH+YYxtmMyztfzkS4OnePz3Rdl/W
xpEXEK4jYEEcWjhUUYfKY5/9DMuhWkEAzC+qLrFnjdeGsydxcZZTz68jggIGWAF+
Hk250C3U3TqW9EJF5N9In7YmqdIEzx2olk4OrVT8iePkAQ06TTNGtDI0Bxz+N2eX
flrYrQCLfqvKmcz2rAzm2oHGkC/ng8sopbNVEx1r4teZmQ5LU3NhUvexEadX15pK
iHJTsthpFBLyBXvT6UqjJ99CBopEOHl6udOo629TtQZLXznRDo63ZC4ebhRkVmt3
9SBwwP5NZe1246YrGUhsBXrI281lNcjWFEBQ96bhs0PFUdh+egSQK21nzFoiDrOG
yQyElfXCDFMOB4HjkNyg
=tuup
-----END PGP SIGNATURE-----

--Sig_/n1imNsUzk=NPlZcjtgmrRo0--
