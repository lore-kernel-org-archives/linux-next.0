From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Tue, 10 Jul 2018 10:22:20 +1000
Message-ID: <20180710102220.44ebfc7a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NUDafgH0O3dc96lb6xzdwU/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/NUDafgH0O3dc96lb6xzdwU/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  include/linux/fs.h

between commit:

  5c299f73cc9e ("vfs: add path_open()")

from the overlayfs tree and commit:

  bfd4fa6990f0 ("turn filp_clone_open() into inline wrapper for dentry_open=
()")

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
index be8de5925a12,b3a210bfea85..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -152,10 -158,10 +158,13 @@@ typedef int (dio_iodone_t)(struct kioc
  #define FMODE_NONOTIFY		((__force fmode_t)0x4000000)
 =20
  /* File is capable of returning -EAGAIN if I/O will block */
--#define FMODE_NOWAIT	((__force fmode_t)0x8000000)
++#define FMODE_NOWAIT		((__force fmode_t)0x8000000)
+=20
+ /* File represents mount that needs unmounting */
 -#define FMODE_NEED_UNMOUNT     ((__force fmode_t)0x10000000)
++#define FMODE_NEED_UNMOUNT	((__force fmode_t)0x10000000)
 +
 +/* File does not contribute to nr_files count */
- #define FMODE_NOACCOUNT	((__force fmode_t)0x20000000)
++#define FMODE_NOACCOUNT		((__force fmode_t)0x20000000)
 =20
  /*
   * Flag for rw_copy_check_uvector and compat_rw_copy_check_uvector
@@@ -2419,8 -2445,10 +2442,12 @@@ extern struct file *filp_open(const cha
  extern struct file *file_open_root(struct dentry *, struct vfsmount *,
  				   const char *, int, umode_t);
  extern struct file * dentry_open(const struct path *, int, const struct c=
red *);
 +extern struct file *path_open(const struct path *, int, struct inode *,
 +			      const struct cred *, bool);
+ static inline struct file *file_clone_open(struct file *file)
+ {
+ 	return dentry_open(&file->f_path, file->f_flags, file->f_cred);
+ }
  extern int filp_close(struct file *, fl_owner_t id);
 =20
  extern struct filename *getname_flags(const char __user *, int, int *);

--Sig_/NUDafgH0O3dc96lb6xzdwU/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltD/DwACgkQAVBC80lX
0GxoLgf/Y0ak4Mvwoe3pFrxwDlKE3okWJayV4oXKG+gGn7n8mP9nmJdJ5CxYPGXV
Cwa3Uhvr5cLx5fpy/LrwACfVybvIdwEVPcwUpye8Z7GPOIUMlSw+fk8Wjamqjh2D
3/H7uXdcuCzUq5PsPv0AkS+fp3HArOxXGklPU1PrSOs+9iqIKD+cOElZrPsdThyc
bBt2N45cRkadp/IXXkH7UeCemhlKtgdA+/dBD8ZYwUk0QzzHOV6CnBYIsOJeDG3H
SDdbs4lht7CAu5M6GKyqzgQ4+WL1K6R6tvfiD0KAi7zow40ttVbQRcRMoi4GmGBa
NSgzdDXEMK5nCh2Ypr540mGDiTBwdA==
=URye
-----END PGP SIGNATURE-----

--Sig_/NUDafgH0O3dc96lb6xzdwU/--
