From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the v4l-dvb-next tree with the v4l-dvb
 tree
Date: Tue, 23 Apr 2019 10:51:31 +1000
Message-ID: <20190423105131.7f460991@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/UgZn/0eMWNXqs_CbU66YxT+"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sean Young <sean@mess.org>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-next.vger.kernel.org

--Sig_/UgZn/0eMWNXqs_CbU66YxT+
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the v4l-dvb-next tree got a conflict in:

  drivers/media/platform/Kconfig

between commit:

  63604a143fe1 ("media: seco-cec: fix building with RC_CORE=3Dm")

from the v4l-dvb tree and commit:

  81527254e151 ("media: seco: depend on CONFIG_RC_CORE=3Dy when not a modul=
e")

from the v4l-dvb-next tree.

I fixed it up (I just used the v4l-dvb tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/UgZn/0eMWNXqs_CbU66YxT+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly+YZMACgkQAVBC80lX
0GxNYQf+NVcWPMWliyvLuqJadx2S/9l3vjkMy8nHmyxORStdVA0URBMOmDxc8QhN
gFdALg3DoJM8RFIEQoBjwa+hhLUT3F66yHhtY/u7hGG1609nYlsqknc4L4mC9H2Y
EsDBpLaoQE+fVsmYjIjP8Z4FxQ77/WB37Sz4xyEpt47WffuVxB0axXjyLCBwJFCQ
Y6w0xnUQKcqqd6Mwt8LlzM1TrfN5bWwYM+WIeEW2MWFmLuhI8x61hl46sNksKN/O
NScctplex4HMOTXtlRRD3oO9eqOWR3z3Qk5dKdehytiGHiFX111ryunOVK61r0Y/
PtZTTN8P+aHhYX9SgCJfwqjo3cvA2A==
=L0ta
-----END PGP SIGNATURE-----

--Sig_/UgZn/0eMWNXqs_CbU66YxT+--
