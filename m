From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: m68k build failure
Date: Tue, 9 Dec 2008 17:45:34 +1100
Message-ID: <20081209174534.17ad7991.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_17_45_34_+1100_dXMsGLEsxW3gvGqb"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:37462 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751867AbYLIGpq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 01:45:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Stephen Hemminger <shemminger@vyatta.com>

--Signature=_Tue__9_Dec_2008_17_45_34_+1100_dXMsGLEsxW3gvGqb
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

The linux-next build (m68k defconfig) failed like this:

drivers/net/hydra.c: In function 'hydra_init':
/drivers/net/hydra.c:163: error: 'hydra_netdev_ops' undeclared (first use i=
n this function)

Caused by commit 5618f0d1193d6b051da9b59b0e32ad24397f06a4 ("hydra:
convert to net_device_ops") which contains a typo in the net_device_ops
structure naming (presumably cut and paste).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_17_45_34_+1100_dXMsGLEsxW3gvGqb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk+FA4ACgkQjjKRsyhoI8xGhACfVLiDItN11PWx/w3ZpmNSEKj9
UDAAn2AvvbQ1aqESm5lHkhlaCPWY3rh8
=rzFf
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_17_45_34_+1100_dXMsGLEsxW3gvGqb--
