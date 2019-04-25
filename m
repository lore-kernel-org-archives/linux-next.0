From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the ext4 tree
Date: Fri, 26 Apr 2019 07:03:56 +1000
Message-ID: <20190426070356.12bc948b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/DBQp7vhJ5VvQRHA3bRBhE9c"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Pan Bian <bianpan2016@163.com>
List-Id: linux-next.vger.kernel.org

--Sig_/DBQp7vhJ5VvQRHA3bRBhE9c
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8c380ab4b7b5 ("ext4: avoid drop reference to iloc.bh twice")

Fixes tag

  Fixes: fb265c9cb49e("ext4: add ext4_sb_bread() to disambiguate ENOMEM cas=
es")

has these problem(s):

  - missing space between the SHA1 and the subject.

--=20
Cheers,
Stephen Rothwell

--Sig_/DBQp7vhJ5VvQRHA3bRBhE9c
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzCILwACgkQAVBC80lX
0GwkMgf/REGx9yNQdztKQVhV6UK7n7NcYd33GssrwvqTCFpjT2TM1YuvRMD7n0Hk
O+c31fER12zqGJpmZI3w3NuRHOQOjevjK99T0Rh6RdIXXimnfGsnvj1VUaFtR1e6
AcfCLm8NLUtsYpmFeb8aN5dMEMMU2n1edvpcnmD9CFAd21K/g7vCejcvvnNHWJNh
iv12G6SogukKAIbmRV1MQTvGQ2UaIxSJuiBfGU8rLFliEsd6Dgaz3sb+d4hGCjQJ
6Ekxdj8gv9a6h7NEjhbybJVIwac96FpP/+mgGCIx+vRCPccZpeeITtkZGvbSm9Rw
VnGDY4AljDgePswRpl/26bK5jQ2tLQ==
=pAF1
-----END PGP SIGNATURE-----

--Sig_/DBQp7vhJ5VvQRHA3bRBhE9c--
