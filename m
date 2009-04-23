From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the ttydev tree with the usb.current
 tree
Date: Thu, 23 Apr 2009 14:30:29 +1000
Message-ID: <20090423143029.8a0529f9.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__23_Apr_2009_14_30_29_+1000_N3Tyjym6huCo3q1J"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:42068 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750799AbZDWEaq (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Thu, 23 Apr 2009 00:30:46 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: linux-next@vger.kernel.org, Oliver Neukum <oliver@neukum.org>, Greg KH <greg@kroah.com>

--Signature=_Thu__23_Apr_2009_14_30_29_+1000_N3Tyjym6huCo3q1J
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alan,

Today's linux-next merge of the ttydev tree got a conflict in
drivers/usb/serial/cypress_m8.c between commit
3355625b2b58b213e481b071aa01d15240f0d8dd ("USB: removal of
tty->low_latency hack dating back to the old serial code") from the
usb.current tree and commit 1156df675ae541b21dc343912413f201f87a3909
("tty-usb-use-port") from the ttydev tree.

Each patch just removes code next to the code removed by the other.  I
fixed it up and can carry the fix. as necessary.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__23_Apr_2009_14_30_29_+1000_N3Tyjym6huCo3q1J
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAknv7uUACgkQjjKRsyhoI8xbKQCfdWwKRGZe2mzd0wHDmG2rONgL
96UAoLwQ6Z+4OqcNIrbyrtEvmJmCuU5d
=euAs
-----END PGP SIGNATURE-----

--Signature=_Thu__23_Apr_2009_14_30_29_+1000_N3Tyjym6huCo3q1J--
