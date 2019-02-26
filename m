From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Date: Wed, 27 Feb 2019 07:42:39 +1100
Message-ID: <20190227074239.2574e3b0@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/q9RCVH6I7eZUC8axiqv.Siu"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>, Timo Wischer <twischer@de.adit-jv.com>
List-Id: linux-next.vger.kernel.org

--Sig_/q9RCVH6I7eZUC8axiqv.Siu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  8af6c521cc23 ("ASoC: rsnd: gen: fix SSI9 4/5/6/7 busif related register a=
ddress")

Fixes tag

  Fixes: commit 8c9d75033340 ("ASoC: rsnd: ssiu: Support BUSIF other than B=
USIF0")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/q9RCVH6I7eZUC8axiqv.Siu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx1pL8ACgkQAVBC80lX
0Gye0Af+N9Ach8AB9NV5xwu2HvjVlY1axVmRz5zz542V5w+hzt1RNmZpHBRoYjSU
A+QW8hqAPAORNLBUGLrdqQcyBGRt9wLsezT7sblENGqTRJxHycekIS23v1xG2POS
CTiRrPd2H2vte5x/jgi1aUJ9kZY01eFtVV5MG6WqXQmFEDvvcdg11rh5II2vMECs
1v5uOuhFlQUBHf/b/NZlZdHI5EcKAc1mja8v3ECjGMsCsGF8zm4N+1m+y2nXLXNK
8QKnfxGLwMTP72avL5Oet4VjGOsVXET7DndQQHWxoW2Ao/3jMTP0xwP4gkBu0+zE
CSwZugWQrS4Aap66Kt0DfEaHo8vdQw==
=L99B
-----END PGP SIGNATURE-----

--Sig_/q9RCVH6I7eZUC8axiqv.Siu--
