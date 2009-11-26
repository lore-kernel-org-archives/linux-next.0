From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: i2c tree build warning
Date: Thu, 26 Nov 2009 14:06:00 +1100
Message-ID: <20091126140600.2f55ab0e.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__26_Nov_2009_14_06_00_+1100_cJf71GLr139HqxNf"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:45331 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752033AbZKZDGA (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Nov 2009 22:06:00 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jean Delvare <khali@linux-fr.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>

--Signature=_Thu__26_Nov_2009_14_06_00_+1100_cJf71GLr139HqxNf
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jean,

Today's linux-next build (x86_64 allmodconfig) produced this warning:

drivers/misc/eeprom/at24.c: In function 'at24_eeprom_read':
drivers/misc/eeprom/at24.c:230: warning: format '%zd' expects type 'signed =
size_t', but argument 6 has type 'int'

Introduced by commit 39bfab2519e6f148f2508d719f9fc5f4581aeefd ("at24: Use
timeout also for read").
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Thu__26_Nov_2009_14_06_00_+1100_cJf71GLr139HqxNf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksN8JgACgkQjjKRsyhoI8wKOQCeJgrpQBxE39ABa2bXDiD/GctH
+hAAoLqka7NHuMgPrQ59M5Hi49lbUb5J
=w7YH
-----END PGP SIGNATURE-----

--Signature=_Thu__26_Nov_2009_14_06_00_+1100_cJf71GLr139HqxNf--
