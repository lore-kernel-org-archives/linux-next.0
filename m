From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 14 Aug 2008 16:28:34 +1000
Message-ID: <20080814162834.de56c895.sfr@canb.auug.org.au>
References: <20080813163728.08551adf.sfr@canb.auug.org.au>
	<20080813173339.874bd598.sfr@canb.auug.org.au>
	<20080814002336.f13ac789.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__14_Aug_2008_16_28_34_+1000_k+3a1ETbrxNGP.Ox"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53388 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751589AbYHNG2m (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 02:28:42 -0400
In-Reply-To: <20080814002336.f13ac789.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__14_Aug_2008_16_28_34_+1000_k+3a1ETbrxNGP.Ox
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 14 Aug 2008 00:23:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Wed, 13 Aug 2008 17:33:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > > Caused by commit f64f8413f2cf9f4d549c033bc546b9c3d30e78f6 ("USB: conv=
ert
> > > the USB host controller code to use usb_dbg()").
> >=20
> > Also a powerpc ps3_defconfig got:
> >=20
> > drivers/usb/host/ohci-ps3.c:94: error: implicit declaration of function=
 'usb_dbg'
>=20
> Also (from various arm builds):
>=20
> drivers/usb/host/ohci-at91.c:59: error: implicit declaration of function =
'usb_dbg'
> drivers/usb/host/ohci-s3c2410.c:50: error: implicit declaration of functi=
on 'usb_dbg'

I have added

#include "../core/usb.h"

near the top of all four files for today's linux-next.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__14_Aug_2008_16_28_34_+1000_k+3a1ETbrxNGP.Ox
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkij0JIACgkQjjKRsyhoI8zIqQCgiUaY3ZtptKYa1xKXvGImMIe2
lpcAoIOQ+xZOtpSLPaTibbjde5nLlv5g
=Xf73
-----END PGP SIGNATURE-----

--Signature=_Thu__14_Aug_2008_16_28_34_+1000_k+3a1ETbrxNGP.Ox--
