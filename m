From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: driver-core tree build failure
Date: Wed, 19 Nov 2008 11:30:31 +1100
Message-ID: <20081119113031.28e2ae68.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__19_Nov_2008_11_30_31_+1100_0REY0PkjqpI=_4XW"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42327 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750854AbYKSAaq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 18 Nov 2008 19:30:46 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Greg KH <greg@kroah.com>
Cc: linux-next@vger.kernel.org, Kay Sievers <kay.sievers@vrfy.org>

--Signature=_Wed__19_Nov_2008_11_30_31_+1100_0REY0PkjqpI=_4XW
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Greg,

Today's linux-next build (powerpc ppc64_defconfig) failed like this:

arch/powerpc/kernel/vio.c: In function 'vio_register_device_node':
arch/powerpc/kernel/vio.c:1246: error: incompatible type for argument 1 of =
'dev_name'

Caused by commit 92136135687b1f8f5d3f03baa3cec40dbc6e73e9 ("powerpc:
struct device - replace bus_id with dev_name(), dev_set_name()").

I have dropped the driver-core tree (and the usb tree that depends on it)
from linux-next for today.=20
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__19_Nov_2008_11_30_31_+1100_0REY0PkjqpI=_4XW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkkjXicACgkQjjKRsyhoI8wm/wCgnenRgdLcItrfdDT1X/PuYUZC
0CwAn0cJlEGwuv5WFFYITEQFmD8nm8zx
=kqGO
-----END PGP SIGNATURE-----

--Signature=_Wed__19_Nov_2008_11_30_31_+1100_0REY0PkjqpI=_4XW--
