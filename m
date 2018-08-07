From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Tue, 7 Aug 2018 11:11:46 +1000
Message-ID: <20180807111146.0249b0ce@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/+Gx.D8jzJE5QnZLV1jF+R/L"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/+Gx.D8jzJE5QnZLV1jF+R/L
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

/usr/bin/ld: /home/sfr/next/tmp/ccWnssuq.o: in function `dump_attr_TIMESTAM=
P_INFO':
test-fsinfo.c:(.text+0x5d4): undefined reference to `pow'
/usr/bin/ld: test-fsinfo.c:(.text+0x618): undefined reference to `pow'
/usr/bin/ld: test-fsinfo.c:(.text+0x65c): undefined reference to `pow'
/usr/bin/ld: test-fsinfo.c:(.text+0x6a0): undefined reference to `pow'

Caused by commit

  90b413cb970a ("vfs: syscall: Add fsinfo() to query filesystem information=
")

interacting with commit

  8377bd2b9ee1 ("kbuild: Rename HOST_LOADLIBES to KBUILD_HOSTLDLIBS")

from the kbuild tree.

I have added the following merge fix patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 7 Aug 2018 11:01:32 +1000
Subject: [PATCH] vfs: samples: fix up for HOSTLOADLIBES rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 samples/statx/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/statx/Makefile b/samples/statx/Makefile
index 05b4d30cdd3c..6a862bbc0627 100644
--- a/samples/statx/Makefile
+++ b/samples/statx/Makefile
@@ -7,6 +7,6 @@ always :=3D $(hostprogs-y)
 HOSTCFLAGS_test-statx.o +=3D -I$(objtree)/usr/include
=20
 HOSTCFLAGS_test-fsinfo.o +=3D -I$(objtree)/usr/include
-HOSTLOADLIBES_test-fsinfo +=3D -lm
+HOSTLDLIBS_test-fsinfo +=3D -lm
=20
 HOSTCFLAGS_test-fs-query.o +=3D -I$(objtree)/usr/include
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/+Gx.D8jzJE5QnZLV1jF+R/L
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlto8dIACgkQAVBC80lX
0GymeAf/byxau9b+ze3ax4fKj0msRJDYXZomQ2D09KGMc1G6Due2wIfbqy/UHbZU
08DMzaLmeE5k5CQpU6y75GUF2fFL/gGfiYr2/CaL6gs7aij4M2gJE3ialRvkIfZa
8pkuBJo06eK10FjEMogdbfGzKNjS9oGBRLKXmyzfCFdjUA/GgFLb2/Rrav9+HiVR
0o71vxMROtgedJQNJ71rqhwsOgKAAYrCJs4EzMXHAowjQD5XnnryVZNX4AIM3+eL
TG/mPHByDFfuy2uh4P6dLsnQ32QA+2ukg51CyMYzAMB0JYP2KAjfkvPbrt+MfVUF
Vi3cIobz1rMCkuE2kMwGTbjPb4XGdA==
=NMCN
-----END PGP SIGNATURE-----

--Sig_/+Gx.D8jzJE5QnZLV1jF+R/L--
