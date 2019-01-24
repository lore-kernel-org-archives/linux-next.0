From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: Fixes tag needs some work in the input-current tree
Date: Thu, 24 Jan 2019 22:09:54 +1100
Message-ID: <20190124220954.2147f1da@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/0inBpMCXdbZb.4K1MiJ=/7M"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: linux-next.vger.kernel.org

--Sig_/0inBpMCXdbZb.4K1MiJ=/7M
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

In commit

  ec87da107d11 ("Input: olpc_apsp - assign priv->dev earlier")

Fixes tag

  Fixes: commit af518342effd ("Input: olpc_apsp - check FIFO status on open=
(), not probe()")

has these problem(s):

  - No SHA1 recognised

The "commit" at the start of the tag value was unexpected.

--=20
Cheers,
Stephen Rothwell

--Sig_/0inBpMCXdbZb.4K1MiJ=/7M
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxJnQIACgkQAVBC80lX
0Gy3wAf/VXbFqCqycCQnS/MsDgCGYSxbx1Pwb3FXwv6SOCwqQdroCiayj01EzpmR
h0PiRHjHXAN4BfEyuxCgbnQ9G6fRIgZWIquHEflqvhdnpy4Gy8l6DlOC2x5GPoCI
NsF5DrmcYPstEpkgozZVNVuxdckc45m5IZRlRDYjGvMHLCsJ5CPuEjlLLQj3DWxt
LKoMYMQyik6wlkWOo1/DAyfzF12IlvBqzNvyN7NJ6mGI7mTYf5p78XxBOLc+DGUN
BrIrl3Dc77TNxSfuJRYaCca/JSyEtrixVbM8agbIAoQ4/n5M+GQIlM5tZXql38bP
3PAyGgdq6lmkpKW7CPVdFiM+ocgiYQ==
=aN4J
-----END PGP SIGNATURE-----

--Sig_/0inBpMCXdbZb.4K1MiJ=/7M--
