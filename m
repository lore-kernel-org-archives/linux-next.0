From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the spi tree
Date: Tue, 2 Apr 2019 05:12:03 +1100
Message-ID: <20190402051203.1d7579cf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZVP/=oh7A.EE_TbBm=fa9ab"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sowjanya Komatineni <skomatineni@nvidia.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ZVP/=oh7A.EE_TbBm=fa9ab
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mark,

In commit

  fc9ba6e3e28a ("spi: tegra114: use packed mode for 32 bits per word")

Fixes tag

  Fixes: Use packed mode for 32 bits per word transfers to increase

has these problem(s):

  - No SHA1 recognised

--=20
Cheers,
Stephen Rothwell

--Sig_/ZVP/=oh7A.EE_TbBm=fa9ab
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyiVHMACgkQAVBC80lX
0GxBDQf9GOoynd/oAAwY5tyzijyrsdJ4theirRJ5eKnPom9X8G3f+CjHlvqY0rH2
LxknGV/0dK1POM1sxC2lfYrPXO5DHZH57todXOE5xTmODEyr+IURcRhKcDhoqg1O
YuuS5N/N8zRtupnARxmH0tn0/i5rlDtSAwrdQT5MV1FMWCGHl98mKVHrvMNN2B5Q
9iuVqcmW+JWbPQ80N8YDcoeMS7yXNEEZfUcsZf7XYfhWtBIoLLTdhoDj6c2j3M1D
CsJL7MS7N6fM6K+wvFG/zbeB1Z/95bt7qHsi9TYq+m7nYqU6zYjIZKx94+bqXdle
31gdptNtV4yNiNK9v1k3ngO9i8Om/Q==
=HnR1
-----END PGP SIGNATURE-----

--Sig_/ZVP/=oh7A.EE_TbBm=fa9ab--
