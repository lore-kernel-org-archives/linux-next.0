From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the usb tree
Date: Mon, 1 Dec 2014 19:19:23 +1100
Message-ID: <20141201191923.6366f9b5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bQ36yLyIi138xoOu28SGi1W"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38780 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752652AbaLAITb (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 1 Dec 2014 03:19:31 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kishon Vijay Abraham I <kishon@ti.com>

--Sig_/bQ36yLyIi138xoOu28SGi1W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Greg,

After merging the usb tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

arch/arm/mach-omap2/twl-common.c:94:21: error: array type has incomplete el=
ement type
 struct phy_consumer consumers[] =3D {
                     ^

Caused by commit dbc98635e0d4 ("phy: remove the old lookup method").

I have used the usb tree from next-20141128 for today.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/bQ36yLyIi138xoOu28SGi1W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIbBAEBCAAGBQJUfCSRAAoJEMDTa8Ir7ZwVaKsP9jfnLwFNR5S4Tr7peZ0DqdmZ
2nZUlDXjhPrLykjIg00RW8u4b7YebK5j6eGWQDEFBnB57vc3kPomy25ibW3vU7+M
Hx+5h0ssaww4ly09wuw/cjwaLgg8ytmPra9+DSovItdY4fbNgU5lmGTN5kRyRvt5
89xrAEkUGobD177y8ivtmgjPHNBsrXloRGgP/8RyZXievr3LA7/eiCV/rsdRSPLa
B4SbMw3o4iUkK0ntMGB7+cWtyKwqJ/ENlgw+5NHtyVu/D3gaZMTqkW/7KS70vFmu
UiTPzj3wtahZYwmxAylaBViyBak1/9tE4TLKoquQOBxgPm2YJZugqfI1E8ZbOZR1
4TH0BfiTh2TK3fnPMguYdKZybpaa9UU6ZbetGj6Wn88iGEU7TmQSIIr9bht8MNDu
x4/mwS2kq8XqgeKLNGlj38GxyYpkAdkDjo0MpcltGOAMCZJ25WkFYLkbgaREyO6V
CuJ+I3wBIrI1XTrqc+2nlbRDzNeUKVQS226aEmbMG/r0MgWIQlPe8LbuEaThx4Jy
Fk9u14fDUlPWHqa0IZ1JMP36hU7KTT1cxvKgCCwoCAk7NiOnKMYIr0b4DOdFwB+t
uXczFRW47PvGKYlBm0e9eluu5L+7B+xjwtsCB6nltgKRxfPKRxGbs8amQTjr6IOw
Egc1NyuWTWgWYI+Y7/c=
=5+Bc
-----END PGP SIGNATURE-----

--Sig_/bQ36yLyIi138xoOu28SGi1W--
