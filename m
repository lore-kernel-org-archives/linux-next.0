From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Thu, 14 Aug 2008 00:23:36 +1000
Message-ID: <20080814002336.f13ac789.sfr@canb.auug.org.au>
References: <20080813163728.08551adf.sfr@canb.auug.org.au>
	<20080813173339.874bd598.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__14_Aug_2008_00_23_36_+1000_RvXA9YFYtk_zYrJI"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46449 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751784AbYHMOXo (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 10:23:44 -0400
In-Reply-To: <20080813173339.874bd598.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Thu__14_Aug_2008_00_23_36_+1000_RvXA9YFYtk_zYrJI
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg :-)

On Wed, 13 Aug 2008 17:33:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> > Caused by commit f64f8413f2cf9f4d549c033bc546b9c3d30e78f6 ("USB: convert
> > the USB host controller code to use usb_dbg()").
>=20
> Also a powerpc ps3_defconfig got:
>=20
> drivers/usb/host/ohci-ps3.c:94: error: implicit declaration of function '=
usb_dbg'

Also (from various arm builds):

drivers/usb/host/ohci-at91.c:59: error: implicit declaration of function 'u=
sb_dbg'
drivers/usb/host/ohci-s3c2410.c:50: error: implicit declaration of function=
 'usb_dbg'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__14_Aug_2008_00_23_36_+1000_RvXA9YFYtk_zYrJI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkii7mgACgkQjjKRsyhoI8zABgCgqUO0ihJ2Q4Q4MK6FnLS75OjV
/wgAoIHoecQBMSZFaP17ASNitOPQFdmB
=V0D3
-----END PGP SIGNATURE-----

--Signature=_Thu__14_Aug_2008_00_23_36_+1000_RvXA9YFYtk_zYrJI--
