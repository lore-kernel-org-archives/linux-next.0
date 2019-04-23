From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the i2c tree
Date: Wed, 24 Apr 2019 07:55:35 +1000
Message-ID: <20190424075535.7cdd5a73@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7k+5vEFyz4c==QABG=3K+uE"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Anson Huang <anson.huang@nxp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/7k+5vEFyz4c==QABG=3K+uE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  31cac068e9f3 ("i2c: imx: correct the method of getting private data in no=
tifier_call")

Fixes tag

  Fixes: 90ad2cbe88c2("i2c: imx: use clk notifier for rate changes")

has these problem(s):

  - missing space between the SHA1 and the subject

--=20
Cheers,
Stephen Rothwell

--Sig_/7k+5vEFyz4c==QABG=3K+uE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAly/idcACgkQAVBC80lX
0GyAFwf/a4UAfA9ceSsFVpiu8IsqEgMntY9tGRtdlE3+MsSebIk+P4hopSnFXnI7
UwXG8I8slQC8Sgm3stXK1IxlYR5DhtFd+J/XlIEYj13EPgkGr08W+GFzbrJayXeO
gL8pkkeQODMmMzvh1GMp9NPsq0IFykVYvCdKyc/dMpp9AOao9JU1Hw4MXYrWdDfD
lHrQxGqOoGXgQmzU1In7JXOLIwqBaFmYkft8SmJI8iSgPSN3b/bLNkH4qwNGxWZp
uhtsmLNeHwItdDC9Sja3Y1rKvwn0q67BZbOMsZEIH/UeMEUUojSs335IEpqWPLK/
YGZs5XHFnnzHCmYM2FfzVsDOftqaMQ==
=zXMJ
-----END PGP SIGNATURE-----

--Sig_/7k+5vEFyz4c==QABG=3K+uE--
