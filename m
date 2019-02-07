From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc-fixes tree
Date: Fri, 8 Feb 2019 07:31:22 +1100
Message-ID: <20190208073113.0043c41b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/rWI=/q4=d0Ydc7drSuSVCOv"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/rWI=/q4=d0Ydc7drSuSVCOv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  76379dfbfd7c ("ASoC: rsnd: ssiu: correct shift bit for ssiu9")

Fixes tag

  Fixes: commit b7169ddea2f2 ("ASoC: rsnd: remove RSND_REG_ from rsnd_reg")

has these problem(s):

  - leading word 'commit' unexpected

--=20
Cheers,
Stephen Rothwell

--Sig_/rWI=/q4=d0Ydc7drSuSVCOv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxclZoACgkQAVBC80lX
0GxYhwf+Kho1PKVJTzRqm4LQGZu/vgljgR5TyvU330rZOmyUxQCo15Xo99RAk9Qn
FluaxERc+LdXcaYnF5sZOUAzb3f0qNL9smSGFJnXhxBJJR8pQRJz8CP+ODPRmeeh
tbZMgMZOE/RofEjcb8ncSbyiTyRg/4+ozoouDu1HY3OFyHAweQVaSWSi9L5s6gQq
KP4uu/Xv3MAjkXGpVqbZ7jFno2n3Wof0vg4LY1vUdByL0ADV3HA/sCNxBqkzPAa3
9fccRoH65WKWTfAfS4kXSxPohAKpH72/cVLESC/UzOF9BXI3RPuB8dziTzWsUvdT
ldZAWmxNQOopgIHLPuirACil+b501Q==
=dj9V
-----END PGP SIGNATURE-----

--Sig_/rWI=/q4=d0Ydc7drSuSVCOv--
