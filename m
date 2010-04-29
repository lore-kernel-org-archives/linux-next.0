From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the bkl-ioctl tree with the fixes tree
Date: Thu, 29 Apr 2010 15:50:04 +1000
Message-ID: <20100429155004.26148af5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Thu__29_Apr_2010_15_50_04_+1000_NQKzfK67SSvv/4Ui"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?IkZyw6lkw6lyaWMgV2Vpc2JlY2tlciI=?= <fweisbec@gmail.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__29_Apr_2010_15_50_04_+1000_NQKzfK67SSvv/4Ui
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Fr=C3=A9d=C3=A9ric,

Today's linux-next merge of the bkl-ioctl tree got a conflict in
drivers/block/pktcdvd.c between commit
db02df06864ed90b08771914ed3d50daca7cd8d7 ("pktcdvd: improve BKL and
compat_ioctl.c usage") from the fixes tree and commit
59ce88717d9d8af8cb14af3a0a505cafb692b482 ("drivers: Push down BKL into
various drivers") from the bkl-ioctl tree.

I used the version from the fixes tree as that seems to be a superset
(including removing the [un]lock_kernel() calls).
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Signature=_Thu__29_Apr_2010_15_50_04_+1000_NQKzfK67SSvv/4Ui
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkvZHgwACgkQjjKRsyhoI8wKdACdGaS3X/C8AYan27tSfDjR3NZH
tFcAn1Rjy27SiGgl3dbgac0E3EUz3vDh
=I0ps
-----END PGP SIGNATURE-----

--Signature=_Thu__29_Apr_2010_15_50_04_+1000_NQKzfK67SSvv/4Ui--
