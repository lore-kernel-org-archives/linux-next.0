From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: mtd tree build failure
Date: Mon, 20 Oct 2008 16:35:18 +1100
Message-ID: <20081020163518.b858f3f7.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Mon__20_Oct_2008_16_35_18_+1100_pza5kv0SeQWlcwqG"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:48430 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750755AbYJTFfd (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 20 Oct 2008 01:35:33 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-next@vger.kernel.org, Mike Rapoport <mike@compulab.co.il>, Russell King <rmk+kernel@arm.linux.org.uk>

--Signature=_Mon__20_Oct_2008_16_35_18_+1100_pza5kv0SeQWlcwqG
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next build (x86_64 allmodconfig) failed like this:

drivers/mtd/nand/gpio.c: In function 'gpio_nand_writebuf':
drivers/mtd/nand/gpio.c:90: error: implicit declaration of function 'writes=
b'
drivers/mtd/nand/gpio.c: In function 'gpio_nand_readbuf':
drivers/mtd/nand/gpio.c:97: error: implicit declaration of function 'readsb'
drivers/mtd/nand/gpio.c: In function 'gpio_nand_writebuf16':
drivers/mtd/nand/gpio.c:123: error: implicit declaration of function 'write=
sw'
drivers/mtd/nand/gpio.c: In function 'gpio_nand_readbuf16':
drivers/mtd/nand/gpio.c:138: error: implicit declaration of function 'reads=
w'

Caused by commit aaf7ea20000436df3cbb397ccb734ad1e2e5164d ("[MTD] [NAND]
GPIO NAND flash driver").  I assume this needs to depend on some
architecture/platform so I reverted it for now.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Mon__20_Oct_2008_16_35_18_+1100_pza5kv0SeQWlcwqG
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkj8GJYACgkQjjKRsyhoI8wfZgCfd4vZnC2HGVJ2eRZENiEdT8GN
BQcAniHJcx+TX6vGFMKgJ+fqMO2hX9G5
=CTt7
-----END PGP SIGNATURE-----

--Signature=_Mon__20_Oct_2008_16_35_18_+1100_pza5kv0SeQWlcwqG--
