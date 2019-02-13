From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build warning after merge of the net-next tree
Date: Wed, 13 Feb 2019 11:51:41 +1100
Message-ID: <20190213115141.376058e8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/xu6E6NX+b2SRJkS85Er./tR"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/xu6E6NX+b2SRJkS85Er./tR
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the net-next tree, today's linux-next build (x86_64
allmodconfig) produced this warning:

drivers/staging/fsl-dpaa2/ethsw/ethsw.c: In function 'swdev_port_attr_get':
drivers/staging/fsl-dpaa2/ethsw/ethsw.c:646:26: warning: unused variable 'p=
ort_priv' [-Wunused-variable]
  struct ethsw_port_priv *port_priv =3D netdev_priv(netdev);
                          ^~~~~~~~~

Introduced by commit

  1b8b589d9103 ("staging: fsl-dpaa2: ethsw: Remove getting PORT_BRIDGE_FLAG=
S")

--=20
Cheers,
Stephen Rothwell

--Sig_/xu6E6NX+b2SRJkS85Er./tR
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxjah0ACgkQAVBC80lX
0GyI2QgAh+9v6JDBdVvFgaJH5sP+a7J47MNSqoNj7083aW7nAMldhBI53zJTEt/U
iq6+Ag6Jh584HRmfOiihGC0NQFm/LvUm/s1zGX9G94aIuVdZIR3543252bqjWz/L
uX2HRLQBYmgUptTGI38+4BqsCuTX7AE0HTNoN74GiOrhRr25oTBgnklGr80Ql2rU
hhMQzStvgZI4dabtydYPjs3zwJFLYKYWSMZOCaMxia7oNNwxiurfMYr50LRuCjpX
H/pBphegJYV2EqnAw3+0rzRtbXNGg3qU9KLatzIUp4KJk+2u/psu2mRAsnHOvPE7
4ZEE37dMS2kDPnt9opw82Nhc/5r7QA==
=+H4O
-----END PGP SIGNATURE-----

--Sig_/xu6E6NX+b2SRJkS85Er./tR--
