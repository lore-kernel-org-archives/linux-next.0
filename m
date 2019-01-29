From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the net tree
Date: Wed, 30 Jan 2019 07:49:39 +1100
Message-ID: <20190130074939.03c7ac10@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ye_IUSmdmxYlZXhS7CsnT=z"; protocol="application/pgp-signature"
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: David Miller <davem@davemloft.net>, Networking <netdev@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dave Watson <davejwatson@fb.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Ye_IUSmdmxYlZXhS7CsnT=z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  1023121375c6 ("net: tls: Fix deadlock in free_resources tx")

Fixes tag

  Fixes: a42055e8d2c30 ("Add support for async encryption of records...")

has these problem(s):

  - Subject does not match target commit subject

In commit

  32eb67b93c9e ("net: tls: Save iv in tls_rec for async crypto requests")

Fixes tag

  Fixes: a42055e8d2c30 ("Add support for async encryption of records...")

has these problem(s):

  - Subject does not match target commit subject

--=20
Cheers,
Stephen Rothwell

--Sig_/Ye_IUSmdmxYlZXhS7CsnT=z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxQvGMACgkQAVBC80lX
0Gxy+wf/WxMHLhIt5mf7GXfKJMLjMM6ZVELxvHPWYHlf/E7WiMBqqVZ5x6/3qJbY
xBSOMP3pAcJBzcjoiHQNbO/0PJzypC0hKTLNvMg99iMNgPE84NnXQ1dxOUPfpgFB
9apZ78yUqLb/I973ne3jvqtMYg2yXwqGSap2fjuU8fogf/UMEkswMmfXLNCVCK9I
gWYFO6CjvgKjWjIBUcQR5ndnf7iEkNzynkWJVt2gmoy6r/TVGIDu6UIWuQHOOF8w
ct8ZEah8jESzsS5TOUZqlNHJyEwH04MKdYHSEVj12SjxQtbyPGE5u0A73z2m2S0y
DfCk+Xkl3LxvIrOuHPk7WDDy7mzUmw==
=LYvE
-----END PGP SIGNATURE-----

--Sig_/Ye_IUSmdmxYlZXhS7CsnT=z--
