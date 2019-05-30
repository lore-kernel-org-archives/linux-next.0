From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the nfs-anna tree
Date: Fri, 31 May 2019 07:58:34 +1000
Message-ID: <20190531075834.78bbdeaf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/G=V4Jqd3sQno0kV7pCsaf5B"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Olga Kornievskaia <kolga@netapp.com>
List-Id: linux-next.vger.kernel.org

--Sig_/G=V4Jqd3sQno0kV7pCsaf5B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  ec6017d90359 ("SUNRPC fix regression in umount of a secure mount")

Fixes tag

  Fixes: c8485e4d63 ("SUNRPC: Handle ECONNREFUSED correctly in xprt_transmi=
t()")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/G=V4Jqd3sQno0kV7pCsaf5B
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzwUgoACgkQAVBC80lX
0Gw/XggAkpbAg9ArAfpP3jcqqudkDXSoWQkbTb4SnGRQm8LD3f8lIjdf8fifk++J
3r4WNXOaRxkw9CbClcPENnWfrMAOziIzW5hN2XLqcDGTSOGTeYpIQHkbvW4V4FUW
RJw/vDjygqiZPohs6/QadMdePOyw6qT9ODTxrPVfl3SEbsY9m/9mJtMZeXZTpQr9
FbJNST9MDLgwq//ZUa9TdBo561CJ8xnE7NBnHPD32U0UJ1RlWiK6Hp/BfKF26R83
P1H8ew/1YOxYVO7Uko1EcoWqyoByJwoANzTX3v/yR33biIIiLYHcp9fAipKTRnMZ
vHtSejahWOtsrOl6rKL92fdwax1hMQ==
=N/Lv
-----END PGP SIGNATURE-----

--Sig_/G=V4Jqd3sQno0kV7pCsaf5B--
