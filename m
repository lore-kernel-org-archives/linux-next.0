From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the kbuild tree
Date: Tue, 15 May 2018 15:50:38 +1000
Message-ID: <20180515155038.7387bf2c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Cn+fxNSFYl4oymnJw0bH2Se"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Cn+fxNSFYl4oymnJw0bH2Se
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Masahiro,

After merging the kbuild tree, today's linux-next build (x86_64
modules_install) failed like this:

Usage: scripts/depmod.sh /sbin/depmod <kernelrelease> <symbolprefix>
Makefile:1314: recipe for target '_modinst_post' failed

Caused by commit

  ea7ad9856a2c ("depmod.sh: remove symbol prefix support")

I added the following fix for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 15 May 2018 15:47:33 +1000
Subject: [PATCH] depmod.sh: fix syntax check and uage message

fixes: ea7ad9856a2c ("depmod.sh: remove symbol prefix support")
Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 scripts/depmod.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/depmod.sh b/scripts/depmod.sh
index 421d1aa01304..1a6f85e0e6e1 100755
--- a/scripts/depmod.sh
+++ b/scripts/depmod.sh
@@ -3,8 +3,8 @@
 #
 # A depmod wrapper used by the toplevel Makefile
=20
-if test $# -ne 3; then
-	echo "Usage: $0 /sbin/depmod <kernelrelease> <symbolprefix>" >&2
+if test $# -ne 2; then
+	echo "Usage: $0 /sbin/depmod <kernelrelease>" >&2
 	exit 1
 fi
 DEPMOD=3D$1
--=20
2.17.0

--=20
Cheers,
Stephen Rothwell

--Sig_/Cn+fxNSFYl4oymnJw0bH2Se
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr6dS4ACgkQAVBC80lX
0GxxCwf/dz+wGoEpoYgpS3nhPTOZniUqhX5WU0hOPbVLE1Q40s0+WVQ5Cb3zIrMg
Qh1W7ItSiQV1R3nZ17yEgtvrk0NCyMPQV5DU6TOxkxg0EG4MC14rkydw6cge7xBg
4Ig93GU07Y67sm9VDUW3AO4f1XmKOuZC66AY+n22+1wJEsklGHpg6VzpQjD/E4jB
iM6p7I/SAgkh8LKZ4BCoScIIKBHDjhiZgxL1UD0UvRqF4aepdLKQMrZE30ZdjPdK
XIqm+q1hiLCMhSGdF4O9+c43vryeGPyTYaWVEn0FZRP1Dsy4iRXhFD1EW9/nAMcx
LApymayqqdsyVi1G8acljhqwu9wNoQ==
=UMO3
-----END PGP SIGNATURE-----

--Sig_/Cn+fxNSFYl4oymnJw0bH2Se--
