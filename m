From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: net tree build failure
Date: Tue, 9 Dec 2008 17:29:54 +1100
Message-ID: <20081209172954.bab90ae4.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Tue__9_Dec_2008_17_29_54_+1100_O9SbryyiBcZR6CuL"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:53355 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751685AbYLIGaE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 9 Dec 2008 01:30:04 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>
Cc: linux-next@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>, Russell King <rmk@arm.linux.org.uk>

--Signature=_Tue__9_Dec_2008_17_29_54_+1100_O9SbryyiBcZR6CuL
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

The linux-next build (arm xm_x2xx_defconfig) fails like this:

net/bluetooth/rfcomm/sock.c: In function 'rfcomm_sock_ioctl':
net/bluetooth/rfcomm/sock.c:795: error: 'sk' undeclared (first use in this =
function)

Introduced (I think) by commit a418b893a6af11ae73c762ed5b76c1bad6dc19d8
("Bluetooth: Enable per-module dynamic debug messages").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Tue__9_Dec_2008_17_29_54_+1100_O9SbryyiBcZR6CuL
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkk+EGIACgkQjjKRsyhoI8yNBACgrQkd80XtRFlXnvTXw4kAl+4/
4WkAn0MQBsz5B7d4j9mjIWaPigqShKN5
=WwEo
-----END PGP SIGNATURE-----

--Signature=_Tue__9_Dec_2008_17_29_54_+1100_O9SbryyiBcZR6CuL--
