From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the thermal tree
Date: Tue, 30 Apr 2019 13:48:23 +1000
Message-ID: <20190430134823.73bdc4f4@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NhN5W6ljlI1QGFo90A49E2T"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Zhang Rui <rui.zhang@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>
List-Id: linux-next.vger.kernel.org

--Sig_/NhN5W6ljlI1QGFo90A49E2T
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Zhang,

After merging the thermal tree, today's linux-next build (arm
multi_v7_defconfig) produced this warning:

boolean symbol THERMAL tested for 'm'? test forced to 'n'

Introduced by commit

  be33e4fbbea5 ("thermal/drivers/core: Remove the module Kconfig's option")

There is a test for =3Dm in drivers/net/ethernet/mellanox/mlxsw/Kconfig.

--=20
Cheers,
Stephen Rothwell

--Sig_/NhN5W6ljlI1QGFo90A49E2T
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzHxYcACgkQAVBC80lX
0GwqVQf+Nu5eg45oBphFCXGaZZP5XcNk7vZpnRvH7Y6JvEdRvP2c74VA+swwC0Tq
xDOiC+UYQw/JxrTkSvdsEi76BE9skB2y1AGHD2rdKpSBsPPF9hSGrwwUmFqCC6Tv
ncPG5oJM9vSu5xJhCtdG3Fnd2flobPWOt8OYzF7UmWOI/St4kVipWV4RnbYSvGdQ
9Q/ChBbg/BIR94TYpwC3p1NqwSL9MlP21cc1dX3eUZuKiIoHPXMQMcnwi3FeyEzS
yUSVxzO44I0Ivu8jfaU6q+5wMicLkOxr95p7kuw/YhAsfgKazZm0EGcwcf4QJku/
J3WlHz/IPjYv5S8y6INbvc8wef4Q7A==
=DfbY
-----END PGP SIGNATURE-----

--Sig_/NhN5W6ljlI1QGFo90A49E2T--
