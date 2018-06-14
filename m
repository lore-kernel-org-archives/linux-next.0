From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with Linus' tree
Date: Thu, 14 Jun 2018 11:43:35 +1000
Message-ID: <20180614114335.3a38727c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3aIayOpgIvcPGlW9ro7MTL="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Guozhonghua <guozhonghua@h3c.com>
List-Id: linux-next.vger.kernel.org

--Sig_/3aIayOpgIvcPGlW9ro7MTL=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in:

  fs/ocfs2/journal.c

between commit:

  6396bb221514 ("treewide: kzalloc() -> kcalloc()")

from Linus' tree and commits:

  18dc5b7810ff ("ocfs2: without quota support, avoid calling quota recovery=
")
  aa935a9c155b ("ocfs2-without-quota-support-try-to-avoid-calling-quota-rec=
overy-checkpatch-fixes")

from the akpm-current tree.

I fixed it up (the latter akpm-current commit also did the kzalloc to
kcalloc conversion, so I just used that version) and can carry the fix
as necessary. This is now fixed as far as linux-next is concerned, but
any non trivial conflicts should be mentioned to your upstream maintainer
when your tree is submitted for merging.  You may also want to consider
cooperating with the maintainer of the conflicting tree to minimise any
particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/3aIayOpgIvcPGlW9ro7MTL=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlshyEcACgkQAVBC80lX
0GzkdAf9FER5V08G/x4Xfpd7JySbEfe29qm16FzW4aDVTrMSIVfAC2C1pYIYppc0
YdRauUhGEn3DTXO2gpMHLTfpA5/tutMzWVJFrlgJ3vNp31y8ogczc27NOmAdarFg
EKMSyYBPg2aN4irGVPg82H08raDWy/uXsJG9eoV8W0ohlkQK7L8p45leAfaIbdgx
orCGDl0rdJZ5Q1X3XMMiaHzrIbutBGAADaqTdKQaJ7o2mBuXsN4f7CxG2TyAQQti
70MY3PpPUyYVjK9KqdebfY+oLCI43P1X5XAzxQAqi2Rxbu8A38fktcxOov2n8sto
vx5Br6u1yeRkVx9X3mcrmQjUhc0DGQ==
=CeO3
-----END PGP SIGNATURE-----

--Sig_/3aIayOpgIvcPGlW9ro7MTL=--
