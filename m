From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Wed, 13 Feb 2019 07:04:50 +1100
Message-ID: <20190213070450.605a6c94@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/x7pERLkwHhtWK7WjZaP_H/R"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Li RongQing <lirongqing@baidu.com>
List-Id: linux-next.vger.kernel.org

--Sig_/x7pERLkwHhtWK7WjZaP_H/R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  d1f20798a119 ("ipv6: propagate genlmsg_reply return code")

Fixes tag

  Fixes: 915d7e5e593 ("ipv6: sr: add code base for control plane support of=
 SR-IPv6")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto")

--=20
Cheers,
Stephen Rothwell

--Sig_/x7pERLkwHhtWK7WjZaP_H/R
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjJuIACgkQAVBC80lX
0GzEWAf/UCpvdQ6F1IH55ebIkcMcvShCBIlV7DwI+wrP1YHlBMaLzpyjhdHFoNjV
yXfX6NIJR2ZFGsBM+pMNTuRml6uAcG+Vkk273KkvB2ZA7HE8q5UuFv22SC4Gelf1
0QW7hJUdf0qz4rBppzDUfKwd74CVqS2GOj8N/W5Y5Zw+c6U+jTzi1aM5ch/o2AYt
fEsQXzz5MTLBlNKQjiTH5e8fauVhTgJh99FuK8EgV5LWNkGJqAUQc5EBb8/+PaXN
IYj4yAvaQRAjijyQpGk+CNXYXJZ7szRFdmD8eFJIZ3Ztw5ZihbxSWxQBeFWbuOo5
u241ly28Cjw+9UQwPPtqunF3ogfx+w==
=PRj1
-----END PGP SIGNATURE-----

--Sig_/x7pERLkwHhtWK7WjZaP_H/R--
