From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Tue, 19 Jun 2018 11:10:34 +1000
Message-ID: <20180619111034.65953fe8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/dKliGKXayxMZKJJXIFK4So4"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/dKliGKXayxMZKJJXIFK4So4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got conflicts in:

  include/linux/fs.h

between commit:

  e8f97b0a52b3 ("vfs: optionally don't account file in nr_files")

from the overlayfs tree and commit:

  db39e40a9682 ("new syscall: open_tree(2)")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index ef2a9bba4e11,55ddf123023c..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -154,9 -157,9 +157,12 @@@ typedef int (dio_iodone_t)(struct kioc
  /* File is capable of returning -EAGAIN if I/O will block */
  #define FMODE_NOWAIT	((__force fmode_t)0x8000000)
 =20
+ /* File represents mount that needs unmounting */
+ #define FMODE_NEED_UNMOUNT     ((__force fmode_t)0x10000000)
+=20
 +/* File does not contribute to nr_files count */
- #define FMODE_NOACCOUNT	((__force fmode_t)0x10000000)
++#define FMODE_NOACCOUNT	((__force fmode_t)0x20000000)
 +
  /*
   * Flag for rw_copy_check_uvector and compat_rw_copy_check_uvector
   * that indicates that they should check the contents of the iovec are

--Sig_/dKliGKXayxMZKJJXIFK4So4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlsoWAoACgkQAVBC80lX
0Gz2Ugf/aMmdZh9LEcyCGrS5eqHw6EN2JJfa7DqJx8gYZfU1Vido90IB9XpwihEY
sTeMyBhijxi9itryu+zRUUq9GiF0PayEgOXM7pdY2cm8pvvvoW73ZQ2eAexLep+5
+T4Ty2PD1LtlB+0RuG8RmvXBf16gPkawXXzJGqSUAX1PvdTirt24V9bZESkepDur
X4bkt3aiFBEprvZvfrka4Iht2frVGciBYAPTd1WT/HampqHbvEVHhzTRw3W8oPJv
D/10m4Kw8i4u1rI1eRsRn3W09PJNiEjm2ElHvG2RaiGxtsXTb6otdUUm+Sedaizb
WeT/e+Z+QKHeNhukiccqnNEOIPPJoQ==
=eFtb
-----END PGP SIGNATURE-----

--Sig_/dKliGKXayxMZKJJXIFK4So4--
