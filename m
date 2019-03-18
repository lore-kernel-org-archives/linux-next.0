From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tags need some work in the sound-asoc-fixes tree
Date: Mon, 18 Mar 2019 21:45:06 +1100
Message-ID: <20190318214506.03f6da24@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/drJHZdp+RxL3r7WN58u7e1s"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jiada Wang <jiada_wang@mentor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/drJHZdp+RxL3r7WN58u7e1s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

In commit

  2b13bee38849 ("ASoC: samsung: odroid: Fix clock configuration for 44100 s=
ample rate")

Fixes tag

  Fixes: fbeec965b8d1c ("ASoC: samsung: odroid: Fix 32000 sample rate handl=
ing")

has these problem(s):

  - Target SHA1 does not exist

Did you mean:

  1d22c337dc8f ("ASoC: samsung: odroid: Fix 32000 sample rate handling")

In commit

  399706df420e ("ASoC: rsnd: src: fix compiler warnings")

Fixes tag

  Fixes: linux-next commit 7674bec4fc09 ("ASoC: rsnd: update BSDSR/BSDISR h=
andling")

has these problem(s):

  - 'linux-next commit' was unexpected.

In commit

  ba164a49f8f7 ("ASoC: rsnd: src: Avoid a potential deadlock")

Fixes tag

  Fixes: linux-next commit 7674bec4fc09 ("ASoC: rsnd: update BSDSR/BSDISR h=
andling")

has these problem(s):

  - 'linux-next commit' was unexpected.

--=20
Cheers,
Stephen Rothwell

--Sig_/drJHZdp+RxL3r7WN58u7e1s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyPdrIACgkQAVBC80lX
0Gxc+gf/VLDJ5p9X1fbStVZTtCGuK66G8XCpVtGCGgXc14vSP98qn7dqXl9bUWIz
iq1Lsbcf9WRQNMWTBkJskEiAgE85SqOBmgNbt++zmN/5NQh+1q/S1rG5tOaJfDLI
KkIuiIXugTdPANccXMFZh6SzQdWcoDrUchCfwE/EDBMk6evgXg6+wAfIF9QBf9y0
PT3qhwbCsVv7gKIbMiUMj0qZVZA4OqC0S9EkwECR4bfOSkwO1y+Or0bCBlGptdng
Z6uuMvuhjba42l2dylVIklW4a0r/NKDiYMuJ0cI+NOemgecaWn1Sd4peOxy15PvD
YPXl7LgASK3yduAoMCJGkRb+V/cwTg==
=aGn2
-----END PGP SIGNATURE-----

--Sig_/drJHZdp+RxL3r7WN58u7e1s--
