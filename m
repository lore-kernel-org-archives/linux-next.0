From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the jc_docs tree with the ext4 tree
Date: Thu, 2 Aug 2018 11:15:12 +1000
Message-ID: <20180802111512.3a467ff5@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7=12L=sr.Fv+AsRsDlGk3uz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Federico Vaga <federico.vaga@vaga.pv.it>, "Darrick J. Wong" <darrick.wong@oracle.com>
List-Id: linux-next.vger.kernel.org

--Sig_/7=12L=sr.Fv+AsRsDlGk3uz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/index.rst

between commit:

  6684874af063 ("docs: create filesystem internal section")

from the ext4 tree and commit:

  85c32d9c6f3e ("doc: move away translations from top-level index")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/index.rst
index f95ba981f8cd,5d310d960f82..000000000000
--- a/Documentation/index.rst
+++ b/Documentation/index.rst
@@@ -102,40 -104,13 +104,24 @@@ implementation
 =20
     sh/index
 =20
 +Filesystem Documentation
 +------------------------
 +
 +The documentation in this section are provided by specific filesystem
 +subprojects.
 +
 +.. toctree::
 +   :maxdepth: 2
 +
 +   filesystems/ext4/index
 +
- Korean translations
- -------------------
-=20
- .. toctree::
-    :maxdepth: 1
-=20
-    translations/ko_KR/index
-=20
- Chinese translations
- --------------------
+ Translations
+ ------------
 =20
  .. toctree::
-    :maxdepth: 1
-=20
-    translations/zh_CN/index
-=20
- Japanese translations
- ---------------------
-=20
- .. toctree::
-    :maxdepth: 1
+    :maxdepth: 2
 =20
-    translations/ja_JP/index
+    translations/index
 =20
  Indices and tables
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--Sig_/7=12L=sr.Fv+AsRsDlGk3uz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltiWyAACgkQAVBC80lX
0GxhKAgAmxX4uTddswsJeFVLG4euFxLC2EbdjLawn7+ZFazDNrneLbOVuW2zq6+I
Ww525gMYrZImk1JxllMUw2JcSwSEiUNvkoqSPk1ZSbEbvhu1AT7XPNDs00+tiMrc
UXnss5tnDAy9czB2eZBdzmLxdOc98Q4QMNoDdTf+9sG25jDwInfFWeT+uitSHyvN
kx+h9DDKSYm/W2ydLzXgLPslvauKtOkrwpsvzGzI/aW17oUXP1X5ZJWozWOxaUt/
A6jP+U/RlAHe0reKHC0WmS/pugWoKBEtxmAMlulILxVm9PpmDef7okqqAdrNlfCl
c/6J/1AW6+C37KmX+xlmKA0YpvkmCQ==
=oAag
-----END PGP SIGNATURE-----

--Sig_/7=12L=sr.Fv+AsRsDlGk3uz--
