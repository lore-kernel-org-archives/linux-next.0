From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Signed-off-by missing for commits in the net tree
Date: Fri, 29 Jun 2018 05:12:09 +1000
Message-ID: <20180629051209.0189ce01@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/sb4XTE35jmrg6xXOuhBtGyK"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Shuah Khan <shuah@kernel.org>, Daniel =?UTF-8?B?RMOtYXo=?= <daniel.diaz@linaro.org>, Eli Cohen <eli@mellanox.com>, Saeed Mahameed <saeedm@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/sb4XTE35jmrg6xXOuhBtGyK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Commit

  933e671f8cff ("selftests/net: Fix permissions for fib_tests.sh")

is missing a Signed-off-by from its author.

Commit

  a8d70a054a71 ("net/mlx5: E-Switch, Disallow vlan/spoofcheck setup if not =
being esw manager")

is missing a Signed-off-by from its committer.

--=20
Cheers,
Stephen Rothwell

--Sig_/sb4XTE35jmrg6xXOuhBtGyK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAls1MwkACgkQAVBC80lX
0GzEkAf+KcwkMepgsf2oTSXV4MU/fQdomj3i7PBszu4QdBCw4F74aXeJ/MfI6gEs
s7uCDfqkMPT/eXnQHDRPrTOkRD40Nllfb//MWzIT1pfLvvP9ULlBVN/2LBbeiMNM
704cNVSKPztyJnGr6X8seNVFnBdchfGQ3SHUcKXGBmh9JOMsUh/Nk9bbTq7Jhvtf
IoNdGyUMCgYXgh3oWNbhC5wqCc9G04Szj36sDaJNdERy+M5xYxIzMcuIkwh3d2UQ
jjvcJpBsYXc+ESheO+2CHz4RqTf7eJ6VIpVkWVti915o93DjLxiYyDE7PtK6ymLZ
I/HBwF1yIC1nLYuUm48E2dj9tAji9w==
=uNqj
-----END PGP SIGNATURE-----

--Sig_/sb4XTE35jmrg6xXOuhBtGyK--
