From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: usb tree build failure
Date: Wed, 13 Aug 2008 17:33:39 +1000
Message-ID: <20080813173339.874bd598.sfr@canb.auug.org.au>
References: <20080813163728.08551adf.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__13_Aug_2008_17_33_39_+1000_p36Q6NylEpgT9DdA"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:43625 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752021AbYHMHdu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 13 Aug 2008 03:33:50 -0400
In-Reply-To: <20080813163728.08551adf.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org

--Signature=_Wed__13_Aug_2008_17_33_39_+1000_p36Q6NylEpgT9DdA
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Wed, 13 Aug 2008 16:37:28 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next build (powerpc ppc44x_config) failed like this:
>=20
> drivers/usb/host/ohci-ppc-of.c: In function 'ohci_hcd_ppc_of_probe':
> drivers/usb/host/ohci-ppc-of.c:103: error: implicit declaration of functi=
on 'usb_dbg'
>=20
> Caused by commit f64f8413f2cf9f4d549c033bc546b9c3d30e78f6 ("USB: convert
> the USB host controller code to use usb_dbg()").

Also a powerpc ps3_defconfig got:

drivers/usb/host/ohci-ps3.c:94: error: implicit declaration of function 'us=
b_dbg'

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__13_Aug_2008_17_33_39_+1000_p36Q6NylEpgT9DdA
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkiijlMACgkQjjKRsyhoI8xltwCffV81AKX9yTCki1pvKr+QvxBp
9HwAnR1ffEgGpiu3m+FFvHlvlhbuI6kq
=Ej1g
-----END PGP SIGNATURE-----

--Signature=_Wed__13_Aug_2008_17_33_39_+1000_p36Q6NylEpgT9DdA--
