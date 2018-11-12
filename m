From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the kbuild tree with the kbuild-current
 tree
Date: Tue, 13 Nov 2018 09:30:50 +1100
Message-ID: <20181113093050.6785eec5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Z.WKk4aE08LlmMrFOkFR+GV"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Z.WKk4aE08LlmMrFOkFR+GV
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the kbuild tree got a conflict in:

  init/Kconfig

between commit:

  f9af851aa8e7 ("kernel hacking: support building kernel with -Og optimizat=
ion level")

from the kbuild-current tree and commit:

  a4219aff51b8 ("kernel hacking: support building kernel with -Og optimizat=
ion level")

from the kbuild tree.

I fixed it up (I used the kbuild-current tree version) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/Z.WKk4aE08LlmMrFOkFR+GV
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlvp/xoACgkQAVBC80lX
0GwrrQf/ZZFknZNh1+SpQvjKmllbRqc549c4i9odUL5r/bfu+tJOFYf++KksxeaA
oMION/jNRZKqfrL+Epmna+VRYf5bAA0biH3GvJnJpBHH322jn7fsFdLY5ndInXqS
rxiIl8fbvDQUAQe6GbnU5emXA3147OydgcL28ng2NG9BaqCjc2SNLOPjWvDGLAez
n4NzUIWbBOETfmtwH2PLAV43JrgYY4XiX2KNB7D/O3cljLL1assWYKDV7q/jFT0h
Qo2sh2q7ACofMsESLcCTuZW6qmgMW1QYl5C8Jm3/qEnwsYpjl5orh6gv7OuD4RLj
8yLF21Hu3jtSG3Jo79+rxYqyn6U9wA==
=XOFO
-----END PGP SIGNATURE-----

--Sig_/Z.WKk4aE08LlmMrFOkFR+GV--
