From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Wed, 15 Apr 2015 11:35:43 +1000
Message-ID: <20150415113543.3ecf376f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/zwLYH4DUGISrurvnY/LezTZ"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:43686 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751911AbbDOBfu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 14 Apr 2015 21:35:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Uday Savagaonkar <savagaon@google.com>

--Sig_/zwLYH4DUGISrurvnY/LezTZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/symlink.c between commit 48e72c7a0127 ("ext4 crypto: Add
symlink encryption") from the ext4 tree and commit 5dd3dc06371a ("VFS:
normal filesystems (and lustre): d_inode() annotations") from the vfs
tree.

[The ext4 tree commit has been modified.]

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/symlink.c
index a7b3a646dde0,57f50091b8d1..000000000000
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@@ -21,100 -21,11 +21,100 @@@
  #include <linux/namei.h>
  #include "ext4.h"
  #include "xattr.h"
 +#include "ext4_crypto.h"
 =20
 +#ifdef CONFIG_EXT4_FS_ENCRYPTION
  static void *ext4_follow_link(struct dentry *dentry, struct nameidata *nd)
  {
 +	struct page *cpage =3D NULL;
 +	char *caddr, *paddr =3D NULL;
 +	struct ext4_str cstr, pstr;
- 	struct inode *inode =3D dentry->d_inode;
++	struct inode *inode =3D d_inode(dentry);
 +	struct ext4_fname_crypto_ctx *ctx =3D NULL;
 +	struct ext4_encrypted_symlink_data *sd;
 +	loff_t size =3D min_t(loff_t, i_size_read(inode), PAGE_SIZE - 1);
 +	int res;
 +	u32 plen, max_size =3D inode->i_sb->s_blocksize;
 +
 +	if (!ext4_encrypted_inode(inode))
 +		return page_follow_link_light(dentry, nd);
 +
 +	ctx =3D ext4_get_fname_crypto_ctx(inode, inode->i_sb->s_blocksize);
 +	if (IS_ERR(ctx))
 +		return ctx;
 +
 +	if (ext4_inode_is_fast_symlink(inode)) {
- 		caddr =3D (char *) EXT4_I(dentry->d_inode)->i_data;
- 		max_size =3D sizeof(EXT4_I(dentry->d_inode)->i_data);
++		caddr =3D (char *) EXT4_I(d_inode(dentry))->i_data;
++		max_size =3D sizeof(EXT4_I(d_inode(dentry))->i_data);
 +	} else {
 +		cpage =3D read_mapping_page(inode->i_mapping, 0, NULL);
 +		if (IS_ERR(cpage)) {
 +			ext4_put_fname_crypto_ctx(&ctx);
 +			return cpage;
 +		}
 +		caddr =3D kmap(cpage);
 +		caddr[size] =3D 0;
 +	}
 +
 +	/* Symlink is encrypted */
 +	sd =3D (struct ext4_encrypted_symlink_data *)caddr;
 +	cstr.name =3D sd->encrypted_path;
 +	cstr.len  =3D le32_to_cpu(sd->len);
 +	if ((cstr.len +
 +	     sizeof(struct ext4_encrypted_symlink_data) - 1) >
 +	    max_size) {
 +		/* Symlink data on the disk is corrupted */
 +		res =3D -EIO;
 +		goto errout;
 +	}
 +	plen =3D (cstr.len < EXT4_FNAME_CRYPTO_DIGEST_SIZE*2) ?
 +		EXT4_FNAME_CRYPTO_DIGEST_SIZE*2 : cstr.len;
 +	paddr =3D kmalloc(plen + 1, GFP_NOFS);
 +	if (!paddr) {
 +		res =3D -ENOMEM;
 +		goto errout;
 +	}
 +	pstr.name =3D paddr;
 +	res =3D _ext4_fname_disk_to_usr(ctx, &cstr, &pstr);
 +	if (res < 0)
 +		goto errout;
 +	/* Null-terminate the name */
 +	if (res <=3D plen)
 +		paddr[res] =3D '\0';
 +	nd_set_link(nd, paddr);
 +	ext4_put_fname_crypto_ctx(&ctx);
 +	if (cpage) {
 +		kunmap(cpage);
 +		page_cache_release(cpage);
 +	}
 +	return NULL;
 +errout:
 +	ext4_put_fname_crypto_ctx(&ctx);
 +	if (cpage) {
 +		kunmap(cpage);
 +		page_cache_release(cpage);
 +	}
 +	kfree(paddr);
 +	return ERR_PTR(res);
 +}
 +
 +static void ext4_put_link(struct dentry *dentry, struct nameidata *nd,
 +			  void *cookie)
 +{
 +	struct page *page =3D cookie;
 +
 +	if (!page) {
 +		kfree(nd_get_link(nd));
 +	} else {
 +		kunmap(page);
 +		page_cache_release(page);
 +	}
 +}
 +#endif
 +
 +static void *ext4_follow_fast_link(struct dentry *dentry, struct nameidat=
a *nd)
 +{
- 	struct ext4_inode_info *ei =3D EXT4_I(dentry->d_inode);
+ 	struct ext4_inode_info *ei =3D EXT4_I(d_inode(dentry));
  	nd_set_link(nd, (char *) ei->i_data);
  	return NULL;
  }

--Sig_/zwLYH4DUGISrurvnY/LezTZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLcBzAAoJEMDTa8Ir7ZwVo9wP/33b/8rxJVeOQAJ8cBuEvNgp
82LjiVaTBS6B3aFZw9RqC2N1R+eC32yA6MDJVhNLWq+PyqeE+38HTxkYYLS/aTpl
Xfk10BpZ3NvUMDzmq2BDBnglF9t7diVzTsLS1WHFePbnd02iE69hBEdxHhdSYClx
cvHwUiOl2UVo54Q3ffh5LA1oLVPIdDvpDurUaMXN9xm3rodkMYUtE564WWVJnGjj
md0wRI0BbNj11/G7TiO543lOh9GLc5DHjt6LcqgDEg1DAh/hMWjQTL+6C6Y+FUtZ
Ps+Y1JiUx4LGDhDQisp4spFur18JrKCfump8cVGU+TQ05GUsCDm6Zoe66JyRBGvW
J05t4xAn8opKff+jC6gR3ibJehFrViouO6RRUPP+5mC3rfMsCRT7YOzfbXZH+oHc
XcDdkPbpEsb3wrfUnV4JELlJuyUd9x/spv96OQXQaJk1K2Ob1cBAKHwiFyqXtPEY
qG5YiKSwmHavUcUpFSVnseIacUbiKCgf2PhHMFOOTxPRJ/dgZQGwxunRAzx5w0ca
4ZOQGo9tTrlf7zFJtL6Ymj1OITj7DaQfKaCRB/sUoO8Wi4WnLeBtSzewtiYUvMKQ
YK5B0s+UlhgOJ6TM1rlb9niKYSpOBpr7w9NKQzmibmXGKiipd4ELO8DR5eUeEhkY
Y2XSNf3RVOtIO4h2GpLM
=vA5Z
-----END PGP SIGNATURE-----

--Sig_/zwLYH4DUGISrurvnY/LezTZ--
