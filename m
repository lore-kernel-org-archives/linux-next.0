From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the rockchip tree
Date: Wed, 24 Apr 2019 07:25:39 +1000
Message-ID: <20190424072539.51aa27e2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Bb1/XjE._+6r=GsN++GsiZ="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Katsuhiro Suzuki <katsuhiro@katsuster.net>
List-Id: linux-next.vger.kernel.org

--Sig_/Bb1/XjE._+6r=GsN++GsiZ=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Heiko,

In commit

  89c1f66ae88a ("arm64: dts: rockchip: fix IO domain voltage setting of API=
O5 on rockpro64")

Fixes tag

  Fixes: e4f3fb4909 ("arm64: dts: rockchip: add initial dts support for Roc=
kpro64")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/Bb1/XjE._+6r=GsN++GsiZ=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/gtMACgkQAVBC80lX
0GwZzwf/bm/Nd0w/H4mBDMp1ghoQwah0rhbVWDAQ5ZNLVohxbHPrh32BepEYJva4
ZYr0i+JGWAOEBMkFCzB94Q+tk0qgxXAt+nc4kzrX+iyq8UAYC6NdnvhNolRBrjig
Ap1uKnlN4dRO2LUEOQAscvV72hQtdLTJdvbbA0iBuXvMvlgqdCB/qF2rQC4CgpRj
PI9mTJHVpf2aZmwCp8oN38bGn/7m5soZz2shy3i7tWPlW2Py4hJIILjB9TuWCFw4
gqpr3axTZ4mhUH7QRneVA6GaKyvwfMUlDuDWLS46euhrux+RihOYdSiDUkCyrOBK
ZobPRF2GTfMiesPR8/Q5WJ7KNrv20g==
=nOLL
-----END PGP SIGNATURE-----

--Sig_/Bb1/XjE._+6r=GsN++GsiZ=--
