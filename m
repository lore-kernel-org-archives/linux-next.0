From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-ioctl tree with the bkl-procfs
 tree
Date: Thu, 29 Apr 2010 15:49:54 +1000
Message-ID: <20100429154954.84966e61.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_Apr_2010_15_49_54_+1000_RF0jtTdhfiSd5FrH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__29_Apr_2010_15_49_54_+1000_RF0jtTdhfiSd5FrH
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

Today's linux-next merge of the bkl-ioctl tree got a conflict in
drivers/char/i8k.c between commit
64ef834551d7696f54553d7608eba80a5a800e77 ("procfs: Push down the bkl from
ioctl") from the bkl-procfs tree and commit
59ce88717d9d8af8cb14af3a0a505cafb692b482 ("drivers: Push down BKL into
various drivers") from the bkl-ioctl tree.

I used the version from the bkl-procfs tree for today.

Can you guys please sort out these various bkl removal trees, please.
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__29_Apr_2010_15_49_54_+1000_RF0jtTdhfiSd5FrH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvZHgMACgkQjjKRsyhoI8x/XQCePei03lEkFKKn9oBbisG8epUB
Xq0An3mV45lfwl66q0bNW4u7ALnLKwkB
=02In
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Apr_2010_15_49_54_+1000_RF0jtTdhfiSd5FrH--
