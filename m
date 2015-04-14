From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Tue, 14 Apr 2015 11:30:25 +1000
Message-ID: <20150414113025.06905c2a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SRSBkAm9bXcKQgYSjbKoXjc"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37362 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750935AbbDNBac (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Apr 2015 21:30:32 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>

--Sig_/SRSBkAm9bXcKQgYSjbKoXjc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/symlink.c between commit f1195c72c951 ("ext4 crypto: Add
symlink encryption") from the ext4 tree and commit 5dd3dc06371a ("VFS:
normal filesystems (and lustre): d_inode() annotations") from the vfs
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

P.S. is there some reason that the two copies of
"EXT4_I(dentry->d_inode)" that I fixed up below are not just
"EXT4_I(inode)" ?
--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/symlink.c
index 408d15bc7b12,57f50091b8d1..000000000000
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@@ -21,112 -21,11 +21,112 @@@
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
 +	u32 plen, plen2, max_size =3D inode->i_sb->s_blocksize;
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
 +	if (!ctx) {
 +		/* Symlink is unencrypted */
 +		plen =3D strnlen((char *)caddr, inode->i_sb->s_blocksize);
 +		plen2 =3D (plen < max_size) ? plen + 1 : plen;
 +		paddr =3D kmalloc(plen2, GFP_NOFS);
 +		if (!paddr) {
 +			ext4_put_fname_crypto_ctx(&ctx);
 +			kunmap(cpage);
 +			page_cache_release(cpage);
 +			return ERR_PTR(-ENOMEM);
 +		}
 +		memcpy(paddr, caddr, plen);
 +		if (plen < inode->i_sb->s_blocksize)
 +			paddr[plen] =3D '\0';
 +	} else {
 +		/* Symlink is encrypted */
 +		sd =3D (struct ext4_encrypted_symlink_data *)caddr;
 +		cstr.name =3D sd->encrypted_path;
 +		cstr.len  =3D le32_to_cpu(sd->len);
 +		if ((cstr.len +
 +		     sizeof(struct ext4_encrypted_symlink_data) - 1) >
 +		    max_size) {
 +			/* Symlink data on the disk is corrupted */
 +			res =3D -EIO;
 +			goto errout;
 +		}
 +		plen =3D (cstr.len < EXT4_FNAME_CRYPTO_DIGEST_SIZE*2) ?
 +			EXT4_FNAME_CRYPTO_DIGEST_SIZE*2 : cstr.len;
 +		paddr =3D kmalloc(plen + 1, GFP_NOFS);
 +		if (!paddr) {
 +			res =3D -ENOMEM;
 +			goto errout;
 +		}
 +		pstr.name =3D paddr;
 +		res =3D _ext4_fname_disk_to_usr(ctx, &cstr, &pstr);
 +		if (res < 0)
 +			goto errout;
 +		/* Null-terminate the name */
 +		if (res <=3D plen)
 +			paddr[res] =3D '\0';
 +	}
 +	nd_set_link(nd, paddr);
 +	ext4_put_fname_crypto_ctx(&ctx);
 +	return cpage;
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
 +	char *buf =3D nd_get_link(nd);
 +
 +	if (page) {
 +		kunmap(page);
 +		page_cache_release(page);
 +	}
 +	if (buf) {
 +		nd_set_link(nd, NULL);
 +		kfree(buf);
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

--Sig_/SRSBkAm9bXcKQgYSjbKoXjc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVLG21AAoJEMDTa8Ir7ZwVKisP/R7JHINE/JaNOMF6uKy6RrFi
K/exp9u3ggdIkiewtV8xs10hoWL8ZFHDJ6qSis/yw3mXLEDf5dnSTOOvEL0tbRCF
7jVkm7sdVQMUm7i2inbN3Y3QNFHn6rnENS9nu/m4IbO/Ty84q7fFa57tcL+Hy4qY
Sk5sx2esgA3ZPRqzB6q3c6Tnvnw0yU939lcghSgvHHUxGbgOjGtx/FWqhLoa6XPM
hktGxRmooaTO40HEp/9w3tTZdHA7RfW4BiOb2hWd1EsKBVy/kykLOiQ7mvK9Sq31
utNN/lUCzO09tGTBg8nUlpXAM5TI76TzAd5VqReBRIah2SvfgINRPpPRf2+BQnhx
fMBmCHrfKv+gOq2x3hUlB8oFnxzMWuELwJ2Tb3sS5ENNGzr0iFEp3qk5U3z3Rthe
yjqFKa1FLLCSapQgAII+Z1iUqCtCgK2c9OBCfrnYsQbODkGpwAA5kCvheM1Id54S
oh1uEGnxV9tEGAHxRk0bOIeHgBuoafwg1ZpEMsHJaTSMZzC7emuSiNtrXSpvWhGq
D5qUinvfKHEsx4r9SWAP6lrSYUUyk4Z41p8/6g7Ux06u0uKaR8vRjUwXEKt/GDz9
236bOjPThrNGQHddStj/FLq2sRN+J+U1OYiK4vI6sO7T7KGS3sSyENnhYQEq3F9h
W0Zv3+76wN6w+VgqLJ5B
=rIm8
-----END PGP SIGNATURE-----

--Sig_/SRSBkAm9bXcKQgYSjbKoXjc--
