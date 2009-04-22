From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Wed, 22 Apr 2009 10:29:06 +1000
Message-ID: <20090422102906.7604dfb3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__22_Apr_2009_10_29_06_+1000_z7.IMQ.fnY_VRYDp"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:46465 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750987AbZDVA3P (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 21 Apr 2009 20:29:15 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Alexander Beregalov <a.beregalov@gmail.com>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Wed__22_Apr_2009_10_29_06_+1000_z7.IMQ.fnY_VRYDp
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Building next-20090421 (arm assabet_defconfig and several others) fails like
this:

drivers/net/irda/sa1100_ir.c:928: error: 'struct net_device' has no member =
named 'ir'

Caused by commit a1de966682551debbe690672e760487cc555c05f
("irda/sa1100_ir: convert to net_device_ops").

A simple typo - more care needed ...
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__22_Apr_2009_10_29_06_+1000_z7.IMQ.fnY_VRYDp
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknuZNIACgkQjjKRsyhoI8wwegCfQHVRohleLgUkeip7VTH68Jq3
ZsAAn2D3+BwyO90rTsdN8Mn3PF+i82Ko
=mqtf
-----END PGP SIGNATURE-----

--Signature=_Wed__22_Apr_2009_10_29_06_+1000_z7.IMQ.fnY_VRYDp--
