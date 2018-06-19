From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Tue, 19 Jun 2018 11:21:40 +1000
Message-ID: <20180619112140.58be35dd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fM04mZG8oQ6OrLSZGB6.rfU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/fM04mZG8oQ6OrLSZGB6.rfU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  include/uapi/linux/fs.h

between commit:

  1d91ca426d8d ("Partially revert "locks: fix file locking on overlayfs"")

from the overlayfs tree and commit:

  28514d1edad4 ("vfs: Suppress MS_* flag defs within the kernel unless expl=
icitly enabled")

from the vfs tree.

I fixed it up (I used the vfs tree version of the file and added the
following merge fix patch) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 19 Jun 2018 11:16:12 +1000
Subject: [PATCH] overlayfs: fix up for MS_ constants moving

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 include/uapi/linux/mount.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/uapi/linux/mount.h b/include/uapi/linux/mount.h
index 3634e065836c..fb104836a51f 100644
--- a/include/uapi/linux/mount.h
+++ b/include/uapi/linux/mount.h
@@ -37,7 +37,6 @@
=20
 /* These sb flags are internal to the kernel */
 #define MS_SUBMOUNT     (1<<26)
-#define MS_NOREMOTELOCK	(1<<27)
 #define MS_NOSEC	(1<<28)
 #define MS_BORN		(1<<29)
 #define MS_ACTIVE	(1<<30)
--=20
2.17.1

--=20
Cheers,
Stephen Rothwell

--Sig_/fM04mZG8oQ6OrLSZGB6.rfU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsoWqQACgkQAVBC80lX
0GysdAgAo1s7cqVK1K67FxOnlVHga7mJD77YJCLhzSujfwH07/mwJgBKI61aIe+X
0H8/s6trv5LxIMYu8s1y/RwxLU3WjCexG4r+lJMvoxOQ/U2CFHZmQ3okZVC2XVJK
J+n+gm9vZHFKWkfmerQpoZvLYtMKw6krcq7Ov5mYQ63TmcKlhdXscbbIf67w5Fov
K8iQH8ORUpJw9q0Onkun7xREu9JrCm6lkGiCpbiL1i79XJkbVJplq/a7JZWwqYXd
q/tnwQ3Wwa8tsQMXrBzjVAr2L1/J9GNX9PcXZckSrD26Kfi2Q/m4ELki0KjPgcjd
r1yU/2udnG3j/j5mA/B5Op/JRLCYzQ==
=8ziM
-----END PGP SIGNATURE-----

--Sig_/fM04mZG8oQ6OrLSZGB6.rfU--
