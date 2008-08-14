From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 14 Aug 2008 16:54:55 +1000
Message-ID: <20080814165455.c2f3f8a2.sfr@canb.auug.org.au>
References: <20080813163728.08551adf.sfr@canb.auug.org.au>
	<20080813173339.874bd598.sfr@canb.auug.org.au>
	<20080814002336.f13ac789.sfr@canb.auug.org.au>
	<20080814162834.de56c895.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__14_Aug_2008_16_54_55_+1000_7MIJ4fGkWOrZ+zKw"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:49272 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751831AbYHNGzF (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 14 Aug 2008 02:55:05 -0400
In-Reply-To: <20080814162834.de56c895.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__14_Aug_2008_16_54_55_+1000_7MIJ4fGkWOrZ+zKw
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Thu, 14 Aug 2008 16:28:34 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> I have added
>=20
> #include "../core/usb.h"
>=20
> near the top of all four files for today's linux-next.

Only to find that that is complete wrong :-)

I have added that include to just drivers/usb/host/ohci-hcd.c instead.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__14_Aug_2008_16_54_55_+1000_7MIJ4fGkWOrZ+zKw
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkij1r8ACgkQjjKRsyhoI8wXGQCcDpiHTllPzmkAB5sZZPrfl76x
8oQAnRqz0IiE+vnxC8FT30SvoOBW3JDR
=O8mm
-----END PGP SIGNATURE-----

--Signature=_Thu__14_Aug_2008_16_54_55_+1000_7MIJ4fGkWOrZ+zKw--
