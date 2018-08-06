From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the vfs tree
Date: Mon, 6 Aug 2018 10:37:38 +1000
Message-ID: <20180806103738.794c479d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/O6PynJXjSVInLzFtS633g8e"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/O6PynJXjSVInLzFtS633g8e
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
failed like this:

samples/statx/test-fsinfo.c:26:10: fatal error: linux/fsinfo.h: No such fil=
e or directory
 #include <linux/fsinfo.h>
          ^~~~~~~~~~~~~~~~

Caused by commit

  90b413cb970a ("vfs: syscall: Add fsinfo() to query filesystem information=
")

I guess that headers_install (or whatever its called) has not bee run
before the sample code is built.

I have applied the following patch for today:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 6 Aug 2018 10:29:34 +1000
Subject: [PATCH] vfs: don;t build new sample programs yet

It seems that headers_install is not done before the samples
are build so some needed include files are not in the right place.

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 samples/statx/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/statx/Makefile b/samples/statx/Makefile
index 05b4d30cdd3c..0b4d01822eca 100644
--- a/samples/statx/Makefile
+++ b/samples/statx/Makefile
@@ -1,5 +1,5 @@
 # List of programs to build
-hostprogs-$(CONFIG_SAMPLE_STATX) :=3D test-statx test-fsinfo test-fs-query
+hostprogs-$(CONFIG_SAMPLE_STATX) :=3D test-statx
=20
 # Tell kbuild to always build the programs
 always :=3D $(hostprogs-y)
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/O6PynJXjSVInLzFtS633g8e
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltnmFMACgkQAVBC80lX
0GwI7QgAlA5YvG8c85Dk4oGHwVCuNQciHk7BTFnkB7ZGvO93dT4YQKCgMCnPUUXB
H6XP/ZyUjb0WDBz8Zczk6Iqskmc+hRxQZKMCTsl52SQIvGi5dhLJwhU1JVwZmgMR
qBp4GBOAmblyymvRuEszRUD2jmvcMFDckL6/kajfWMTNTeKK4YZ0n7aRRBLseCpZ
Gz/Dh+lz7ZCIAA8vyIPo4y0iYZ1TzbWurpJqISVjBck1BR78ENlpCL8+fYIGAjYG
M0NocKMj6Fu9WviVHrxblTxPY+i00Mm7uyvVqycKxONabrGCIeXJPCPf0LVEbDyF
9ixIsARgQZist1ZrJ3cUeOdJ4Up8wQ==
=8B9i
-----END PGP SIGNATURE-----

--Sig_/O6PynJXjSVInLzFtS633g8e--
