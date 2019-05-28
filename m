From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the v4l-dvb tree
Date: Wed, 29 May 2019 08:04:54 +1000
Message-ID: <20190529080454.6d62a7fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.d=BWJoTy6lPfZL4/CmtHiY"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Niklas =?UTF-8?B?U8O2ZGVybHVuZA==?= <niklas.soderlund+renesas@ragnatech.se>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
List-Id: linux-next.vger.kernel.org

--Sig_/.d=BWJoTy6lPfZL4/CmtHiY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Mauro,

In commit

  0c310868826e ("media: rcar-csi2: Fix coccinelle warning for PTR_ERR_OR_ZE=
RO()")

Fixes tag

  Fixes: 3ae854cafd76 ("rcar-csi2: Use standby mode instead of resetting")

has these problem(s):

  - Target SHA1 does not exist

Did you mean

Fixes: d245a940d97b ("media: rcar-csi2: Use standby mode instead of resetti=
ng")

--=20
Cheers,
Stephen Rothwell

--Sig_/.d=BWJoTy6lPfZL4/CmtHiY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlztsIYACgkQAVBC80lX
0Gz+/gf/T31KoLazyjEW89krmzM2wgc40Sab/m3NnCGPtDAzT4itrTJbP7xHwKts
R+MpjXiHQ5CtUdZnaBT9o4jsHQYR0gZNiqCxAC2gTok1tZkZHRzsU18LzRHcwLCE
bV4QzTxH4JJJwNZCeG90AsZsG2NLvE3M/DRneZ48TcstMk1rOqrp+C/8SX5Af6Qx
vovVBPfg5KokPSd76NnTZSJT+r8GV67CmoYXfVLsEiCOnAhFPkDAPLe7rhXjl8bg
lwDJuxDk/lSzfZqr9Q+zeeU1qucx5SLx1jMYB1CMMl3c/8+lamlnn/w8iPNar+Y6
MGnT8yyWWd5tAESGkM7wD9agYrJfBQ==
=Y/Qv
-----END PGP SIGNATURE-----

--Sig_/.d=BWJoTy6lPfZL4/CmtHiY--
