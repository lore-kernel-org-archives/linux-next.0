From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the userns tree with the vfs tree
Date: Mon, 25 May 2015 19:49:43 +1000
Message-ID: <20150525194943.3ae9649d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zY30d1DWq_ByzWVhQ4+dWzj"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:38884 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750859AbbEYJtv (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 25 May 2015 05:49:51 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Eric W. Biederman" <ebiederm@xmission.com>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Sig_/zY30d1DWq_ByzWVhQ4+dWzj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Today's linux-next merge of the userns tree got a conflict in
fs/libfs.c between commit 61ba64fc0768 ("libfs: simple_follow_link()")
from the vfs tree and commit d5044ae07353 ("fs: Add helper functions
for permanently empty directories.") from the userns tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/libfs.c
index 65e1feca8b98,02813592e121..000000000000
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@@ -1097,14 -1094,98 +1097,109 @@@ simple_nosetlease(struct file *filp, lo
  }
  EXPORT_SYMBOL(simple_nosetlease);
 =20
 +const char *simple_follow_link(struct dentry *dentry, void **cookie)
 +{
 +	return d_inode(dentry)->i_link;
 +}
 +EXPORT_SYMBOL(simple_follow_link);
 +
 +const struct inode_operations simple_symlink_inode_operations =3D {
 +	.follow_link =3D simple_follow_link,
 +	.readlink =3D generic_readlink
 +};
 +EXPORT_SYMBOL(simple_symlink_inode_operations);
+=20
+ /*
+  * Operations for a permanently empty directory.
+  */
+ static struct dentry *empty_dir_lookup(struct inode *dir, struct dentry *=
dentry, unsigned int flags)
+ {
+ 	return ERR_PTR(-ENOENT);
+ }
+=20
+ static int empty_dir_getattr(struct vfsmount *mnt, struct dentry *dentry,
+ 				 struct kstat *stat)
+ {
+ 	struct inode *inode =3D d_inode(dentry);
+ 	generic_fillattr(inode, stat);
+ 	return 0;
+ }
+=20
+ static int empty_dir_setattr(struct dentry *dentry, struct iattr *attr)
+ {
+ 	return -EPERM;
+ }
+=20
+ static int empty_dir_setxattr(struct dentry *dentry, const char *name,
+ 			      const void *value, size_t size, int flags)
+ {
+ 	return -EOPNOTSUPP;
+ }
+=20
+ static ssize_t empty_dir_getxattr(struct dentry *dentry, const char *name,
+ 				  void *value, size_t size)
+ {
+ 	return -EOPNOTSUPP;
+ }
+=20
+ static int empty_dir_removexattr(struct dentry *dentry, const char *name)
+ {
+ 	return -EOPNOTSUPP;
+ }
+=20
+ static ssize_t empty_dir_listxattr(struct dentry *dentry, char *list, siz=
e_t size)
+ {
+ 	return -EOPNOTSUPP;
+ }
+=20
+ static const struct inode_operations empty_dir_inode_operations =3D {
+ 	.lookup		=3D empty_dir_lookup,
+ 	.permission	=3D generic_permission,
+ 	.setattr	=3D empty_dir_setattr,
+ 	.getattr	=3D empty_dir_getattr,
+ 	.setxattr	=3D empty_dir_setxattr,
+ 	.getxattr	=3D empty_dir_getxattr,
+ 	.removexattr	=3D empty_dir_removexattr,
+ 	.listxattr	=3D empty_dir_listxattr,
+ };
+=20
+ static loff_t empty_dir_llseek(struct file *file, loff_t offset, int when=
ce)
+ {
+ 	/* An empty directory has two entries . and .. at offsets 0 and 1 */
+ 	return generic_file_llseek_size(file, offset, whence, 2, 2);
+ }
+=20
+ static int empty_dir_readdir(struct file *file, struct dir_context *ctx)
+ {
+ 	dir_emit_dots(file, ctx);
+ 	return 0;
+ }
+=20
+ static const struct file_operations empty_dir_operations =3D {
+ 	.llseek		=3D empty_dir_llseek,
+ 	.read		=3D generic_read_dir,
+ 	.iterate	=3D empty_dir_readdir,
+ 	.fsync		=3D noop_fsync,
+ };
+=20
+=20
+ void make_empty_dir_inode(struct inode *inode)
+ {
+ 	set_nlink(inode, 2);
+ 	inode->i_mode =3D S_IFDIR | S_IRUGO | S_IXUGO;
+ 	inode->i_uid =3D GLOBAL_ROOT_UID;
+ 	inode->i_gid =3D GLOBAL_ROOT_GID;
+ 	inode->i_rdev =3D 0;
+ 	inode->i_size =3D 2;
+ 	inode->i_blkbits =3D PAGE_SHIFT;
+ 	inode->i_blocks =3D 0;
+=20
+ 	inode->i_op =3D &empty_dir_inode_operations;
+ 	inode->i_fop =3D &empty_dir_operations;
+ }
+=20
+ bool is_empty_dir_inode(struct inode *inode)
+ {
+ 	return (inode->i_fop =3D=3D &empty_dir_operations) &&
+ 		(inode->i_op =3D=3D &empty_dir_inode_operations);
+ }

--Sig_/zY30d1DWq_ByzWVhQ4+dWzj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVYvA7AAoJEMDTa8Ir7ZwVyckP/2OY6tvX0B0JjeobjHFYX+JW
j6N5UYQbQVz2cfDZQM5UQL+sGqPtVD0hPn7hPJO4dREHjVnPxs16l3rAvtVke1yR
GHhwhdbEsA/O0pi6DNGLpJqGuwqVwB7SOpy7enih8vpQM9kfazWIo1X3HsprVM3B
DNd2Kdg6TMDKPe+eBhb9KvjthL6bkfYsu4N7yEcpSEpRIbfwTyZzxgjJsN63qzGR
hXLdzcYducBiuMfB+7d0CI0s8Z2oGjzql7YCZX/6n0U6ZMvPeqSmYBaSscpiOufR
CNOyrYDZumoIO14TxUeQSdRmkuqaCalc+Qy3LPINocVG/pwnlJhA/6ViSJF08DKf
X05yLcWzDy6IuI24lBmbMlKXM/53IB+xP66X3vUrWrAnbM/9mOuYOmx+OHl74YG4
S02GR05amtn6hh3n+swjV0TS6X5n11Zzf8gkmPe76oEYQwOeRG96/wZocWUaOyAp
n8f337ajn+PW0GdhBTeRs2Gir0Rn0d03mgLDXKJ+VzY/DQK0a4PuxXg4bQh4SbVn
M/vyGxTtzmMRr4kCSdaDL8XxvoeGsTExUWfgBX+JhRo188sVMUFcf+m6guQa5YsY
pGEfpRKLuirT+VrNjEWPjbwGFyr0UWPhPTiXzoWgAPc75L6W3MEucISJY1X9aUzE
RERRU7aYUjUoXnDBa18y
=LJTP
-----END PGP SIGNATURE-----

--Sig_/zY30d1DWq_ByzWVhQ4+dWzj--
