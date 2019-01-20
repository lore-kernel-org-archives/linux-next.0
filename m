From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Sun, 20 Jan 2019 15:10:25 +1100
Message-ID: <20190120151025.196b7a5e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/eB5QcuqC+._gdmVJWj8Nsk."; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eli Britstein <elibr@mellanox.com>, Oz Shlomo <ozsh@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/eB5QcuqC+._gdmVJWj8Nsk.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  25f2d0e7791e ("net/mlx5e: Fix cb_ident duplicate in indirect block regist=
er")

Fixes tag

  Fixes: f5bc2c5de101 ("net/mlx5e: Support TC indirect block notifications

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

The Fixes tag line was split over 2 lines.  Please, in the future, try
to keep it on a single line.

--=20
Cheers,
Stephen Rothwell

--Sig_/eB5QcuqC+._gdmVJWj8Nsk.
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxD9LEACgkQAVBC80lX
0GzaMwf/Qub8Lk1mIzFmEFUEqxZ0C/Brpc0crAwn1bDT1AR2thWpYcGQwvxwFmjM
EEdrjxEAEhsV8DAPJuEuLjQNFSRRsC4WUOVzng6Y/+73NmHmEXu5+Q5cISv78c/J
bEvVL4M27MBJ6r+ddp9+sAnWt+ZjsguuyjtvKVo6wTIOkkrSza215Unhj06YOh7w
Bz4/sbTBEUbLkbHWabOUkDNPhZ/7C6DJuoAt5vUlDNhP3Af8j9FyFxt6c18aZV9k
1IYbk/AuaERo+MRXCmh5LHS2B7uOpDcFTeVIfc7cyJ+48Bo/tzTHn7iPkWsSn93R
ozrfE29iipxSVQ8NBY21TWvt8iZnFg==
=KssF
-----END PGP SIGNATURE-----

--Sig_/eB5QcuqC+._gdmVJWj8Nsk.--
