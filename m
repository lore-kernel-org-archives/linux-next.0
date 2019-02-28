From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the net tree
Date: Fri, 1 Mar 2019 07:32:34 +1100
Message-ID: <20190301073217.27931d39@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bM4IbjYuQmcKHRbQQr/M=Xc"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sheng Lan <lansheng@huawei.com>, Eric Dumazet <edumazet@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/bM4IbjYuQmcKHRbQQr/M=Xc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  5845f706388a ("net: netem: fix skb length BUG_ON in __skb_to_sgvec")

Fixes tag

  Fixes: 35d889d1 ("sch_netem: fix skb leak in netem_enqueue()")

has these problem(s):

  - SHA1 should be at least 12 digits long
    Can be fixed by setting core.abbrev to 12 (or more) or (for git v2.11
    or later) just making sure it is not set (or set to "auto").

--=20
Cheers,
Stephen Rothwell

--Sig_/bM4IbjYuQmcKHRbQQr/M=Xc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx4RWIACgkQAVBC80lX
0Gw8Ygf/UaRvRGAtenDvUlJUKnjMq92Wjj0CTC5JI0qgG8LA5cxCSR1lu6mWl2Gn
8YELN2PALK6mP9rhzdhVRms3AZ9xmwGJ0+4zH5Hj4jRAWrM+UCxN3bezRlRlzQ8R
/TDqPZkHuMAy4ge5LI78mJvjNYylD0RL1mh/n519b1ZbE6Z3sbPOJAL+6X64dvAN
PrAJfaEx33tlSZIAHREe9O4LSFz/ruJaYvC2V4atSbQDoh7QYOoKbSbk1IrR2XjF
5w0cwFM4TACVxzY6208L7SHMHTjdmaaC4WlBh20Gm9btxbdRRQRBjE2lKwTFbQDP
JU6Q3gd/9VDX9z66j2debUjFgDa+HQ==
=YzC3
-----END PGP SIGNATURE-----

--Sig_/bM4IbjYuQmcKHRbQQr/M=Xc--
