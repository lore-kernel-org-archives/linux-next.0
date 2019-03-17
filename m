From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the sound-asoc tree
Date: Sun, 17 Mar 2019 12:34:41 +1100
Message-ID: <20190317123441.1722959e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/8YN0Of.WZu=rVDF3VUDLoz/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jiada Wang <jiada_wang@mentor.com>
List-Id: linux-next.vger.kernel.org

--Sig_/8YN0Of.WZu=rVDF3VUDLoz/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

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

Just use:

  got log --format=3D'Fixes: %h ("%s")' <commit>

to generate the Fixes tags.

--=20
Cheers,
Stephen Rothwell

--Sig_/8YN0Of.WZu=rVDF3VUDLoz/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyNpDEACgkQAVBC80lX
0Gzsfgf7B8laTevaamvgYKDNrqzqZOvxNBpa+cE4O5SQ4Im9bigeXurNWrqWzk63
3ztfn8GOPUEBKndYXDfoTx8mgdjBE4MJ5XvtOIKWVeTq03ZC/iwsqxWop9FFBPt8
3SFsJpSEvjHhw5T6WLpvY3IgRyDq6jQrHsMgdp8HI8nKjC/B33GCC10x3DfBVwHD
NYR395Ib4NMofhqEzvT9/VJYQvhdkzJVI8H8QQPusjuDnZt+AXCEy6emdORrdDm8
t1Jx9btBzNKcnOT64/ZzQ8gndBvgxrUyvokeTbsSMxlEngs//Fi9JNYD1aCV/sGa
jIPgZ9KKi7a+JLNG/P+gtCfyqUHb+A==
=c82n
-----END PGP SIGNATURE-----

--Sig_/8YN0Of.WZu=rVDF3VUDLoz/--
