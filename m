From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the overlayfs tree
Date: Tue, 10 Jul 2018 10:17:36 +1000
Message-ID: <20180710101736.32d6cc6c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Lv8gHqCvqsM22ljHWOuQjRX"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Miklos Szeredi <miklos@szeredi.hu>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--Sig_/Lv8gHqCvqsM22ljHWOuQjRX
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got conflicts in:

  fs/open.c

between commit:

  d4d6f39c507e ("vfs: optionally don't account file in nr_files")
  88498a6bd8d1 ("vfs: simplify dentry_open()")

from the overlayfs tree and commit:

  5f0cc0005d2e ("introduce FMODE_OPENED")
  13fcca01ef86 ("now we can fold open_check_o_direct() into do_dentry_open(=
)")
  7dfb1eeaea37 ("introduce FMODE_CREATED and switch to it")

from the vfs tree.

I *think* I got this right, but please check.  Is there some way that
these overlayfs commits can be integrated into the vfs tree development
(or vice versa).  Also, I would expect to see *some* Reviewed-by or
Acked-by lines in all this work ...

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/open.c
index 52a1ea584669,39dcbf13031c..000000000000
--- a/fs/open.c
+++ b/fs/open.c
@@@ -731,7 -732,6 +721,7 @@@ static int do_dentry_open(struct file *
  	static const struct file_operations empty_fops =3D {};
  	int error;
 =20
- 	WARN_ON(f->f_mode & ~FMODE_NOACCOUNT);
++	WARN_ON(f->f_mode & ~ (FMODE_NOACCOUNT | FMODE_CREATED));
  	f->f_mode |=3D OPEN_FMODE(f->f_flags) | FMODE_LSEEK |
  				FMODE_PREAD | FMODE_PWRITE;
 =20
@@@ -743,8 -743,7 +733,8 @@@
  	f->f_wb_err =3D filemap_sample_wb_err(f->f_mapping);
 =20
  	if (unlikely(f->f_flags & O_PATH)) {
 +		WARN_ON(f->f_mode & FMODE_NOACCOUNT);
- 		f->f_mode =3D FMODE_PATH;
+ 		f->f_mode =3D FMODE_PATH | FMODE_OPENED;
  		f->f_op =3D &empty_fops;
  		return 0;
  	}
@@@ -890,47 -893,14 +884,44 @@@ EXPORT_SYMBOL(file_path)
  int vfs_open(const struct path *path, struct file *file,
  	     const struct cred *cred)
  {
 -	struct dentry *dentry =3D d_real(path->dentry, NULL, file->f_flags, 0);
 +	file->f_path =3D *path;
 +	return do_dentry_open(file, d_backing_inode(path->dentry), NULL, cred);
 +}
 =20
 -	if (IS_ERR(dentry))
 -		return PTR_ERR(dentry);
 +/**
 + * path_open() - Open an inode by a particular name.
 + * @path: The name of the file.
 + * @flags: The O_ flags used to open this file.
 + * @inode: The inode to open.
 + * @cred: The task's credentials used when opening this file.
 + *
 + * Context: Process context.
 + * Return: A pointer to a struct file or an IS_ERR pointer.  Cannot retur=
n NULL.
 + */
 +struct file *path_open(const struct path *path, int flags, struct inode *=
inode,
 +		       const struct cred *cred, bool account)
 +{
 +	struct file *file;
 +	int error;
 +
 +	file =3D __get_empty_filp(account);
 +	if (IS_ERR(file))
 +		return file;
 =20
 +	file->f_flags =3D flags;
  	file->f_path =3D *path;
 -	return do_dentry_open(file, d_backing_inode(dentry), NULL, cred);
 +	error =3D do_dentry_open(file, inode, NULL, cred);
 +	if (error) {
- 		put_filp(file);
++		if (file->f_mode & FMODE_OPENED)
++			fput(file);
++		else
++			put_filp(file);
 +		return ERR_PTR(error);
 +	}
 +
- 	error =3D open_check_o_direct(file);
- 	if (error) {
- 		fput(file);
- 		file =3D ERR_PTR(error);
- 	}
-=20
 +	return file;
  }
 +EXPORT_SYMBOL(path_open);
 =20
  struct file *dentry_open(const struct path *path, int flags,
  			 const struct cred *cred)

--Sig_/Lv8gHqCvqsM22ljHWOuQjRX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltD+yAACgkQAVBC80lX
0GxR+QgAod34mQiGNDHM02Dz67oe+BgAzvW0KCo6dNL8/pa54S17Zjw5eoihMhv1
wdmqirlcexjifRMSRWJ27evyQK/zO72PKFC87F5F6eL9j473uv8whh3ks8yG5zVm
c2TWXkeHJmzlnXDc9gwRbbb2fxmp0ug4uC6JqJNdIwRRV92N/0P9CdzknRIBMFPm
1tPtSOgCcZlcpk5/5hLOpqi8KGcYiq1FzOJHIwOUUAP7+LTk3aONnvEwx0XhVvp0
h6IHBDkWZpZabWrP2ARYHK2bEo8rL6YRtk7LUBxK+JiJQ3eTrOf553pN/W5mtRAO
Yt4xLuNKqh/uLBcvpN7SqaaBlRuxdQ==
=ayol
-----END PGP SIGNATURE-----

--Sig_/Lv8gHqCvqsM22ljHWOuQjRX--
