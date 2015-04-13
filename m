From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Mon, 13 Apr 2015 11:48:14 +1000
Message-ID: <20150413114814.3b74e8fb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/2DXa_EkSgLzEOMTCXxNLsN="; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/2DXa_EkSgLzEOMTCXxNLsN=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/symlink.c between commit 8ee224253787 ("ext4 crypto: Add
symlink encryption") from the ext4 tree and commit 5dd3dc06371a ("VFS:
normal filesystems (and lustre): d_inode() annotations") from the vfs
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/symlink.c
index 839f71e941a9,57f50091b8d1..000000000000
--- a/fs/ext4/symlink.c
+++ b/fs/ext4/symlink.c
@@@ -21,107 -21,11 +21,107 @@@
  #include <linux/namei.h>
  #include "ext4.h"
  #include "xattr.h"
 +#include "ext4_crypto.h"
 =20
 +#ifdef CONFIG_EXT4_FS_ENCRYPTION
  static void *ext4_follow_link(struct dentry *dentry, struct nameidata *nd)
  {
 +	struct page *cpage =3D NULL;
 +	char *caddr, *paddr;
 +	struct ext4_str cstr, pstr;
- 	struct inode *inode =3D dentry->d_inode;
++	struct inode *inode =3D d_inode(dentry);
 +	struct ext4_fname_crypto_ctx *ctx =3D NULL;
 +	struct ext4_encrypted_symlink_data *sd;
 +	loff_t size =3D min(inode->i_size, (loff_t) PAGE_SIZE-1);
 +	int res;
 +	u32 plen, plen2;
 +
 +	ctx =3D ext4_get_fname_crypto_ctx(inode, inode->i_sb->s_blocksize);
 +	if (IS_ERR(ctx))
 +		return ctx;
 +
 +	cpage =3D read_mapping_page(inode->i_mapping, 0, NULL);
 +	if (IS_ERR(cpage)) {
 +		ext4_put_fname_crypto_ctx(&ctx);
 +		return cpage;
 +	}
 +	caddr =3D kmap(cpage);
 +	caddr[size] =3D 0;
 +
 +	if (!ctx) {
 +		/* Symlink is unencrypted */
 +		plen =3D strnlen((char *)caddr, inode->i_sb->s_blocksize);
 +		plen2 =3D (plen < inode->i_sb->s_blocksize) ? plen + 1 : plen;
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
 +		if ((cstr.len + sizeof(struct ext4_encrypted_symlink_data) - 1)
 +			> inode->i_sb->s_blocksize) {
 +			/* Symlink data on the disk is corrupted */
 +			kunmap(cpage);
 +			page_cache_release(cpage);
 +			return ERR_PTR(-EIO);
 +		}
 +		plen =3D (cstr.len < EXT4_FNAME_CRYPTO_DIGEST_SIZE*2)
 +			? EXT4_FNAME_CRYPTO_DIGEST_SIZE*2
 +			: cstr.len;
 +		paddr =3D kmalloc(plen + 1, GFP_NOFS);
 +		if (!paddr) {
 +			ext4_put_fname_crypto_ctx(&ctx);
 +			kunmap(cpage);
 +			page_cache_release(cpage);
 +			return ERR_PTR(-ENOMEM);
 +		}
 +		pstr.name =3D paddr;
 +		res =3D _ext4_fname_disk_to_usr(ctx, &cstr, &pstr);
 +		if (res < 0) {
 +			ext4_put_fname_crypto_ctx(&ctx);
 +			kunmap(cpage);
 +			page_cache_release(cpage);
 +			kfree(paddr);
 +			return ERR_PTR(res);
 +		}
 +		/* Null-terminate the name */
 +		if (res <=3D plen)
 +			paddr[res] =3D '\0';
 +	}
 +	nd_set_link(nd, paddr);
 +	ext4_put_fname_crypto_ctx(&ctx);
 +	return cpage;
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

--Sig_/2DXa_EkSgLzEOMTCXxNLsN=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKyBiAAoJEMDTa8Ir7ZwVoxgP/A8V/FNGTu8DzkWnonkq3Zq+
s+KFLYhUplJrwfotQ4C0cDgOfrs9ZfLW276VLFmwO0MkAx+mSYZmmdYjiAi78U4i
SWuK6juDttn6f2cIvJ84J9ni/hFVRjmBSC7Jk6FmRMZ5t7YEjnh5PZfTzaZ1xRG4
HqOs7li1TKv5NgCPfo+LhPmVwzsl7+WwEwfh0Gp2Dtju8cOEn+JFQ5qnkD6Dw3DN
UItIDfLIPn6uAR7YppPkJ3+fVMzZTNzkpp1iwM81k3y0dkYnU65XWs7OVCFP17Cn
XU7C15d8X6kBwP7CIuP24W8ucVKCKK0Hi2mKWxtAOn9Cby86mY24lK6RKVi/uu5Z
eEDPK5n3TUtzsKdnY2Jjr3s4XSUuxf/vxDyORIk+H+vUChHnmAfSFsyvfkeRQ5J+
YG6emqAQ6GiuY9+hbe90hIRRUk76u8/iLbCaNy6BnkL/DwfwCgbIwnrfYRzVF4gF
xASHLzX3rtw94qVuAvCcuKHV5nSlphIXONLgqkkyjEKwtdk02E55hG4lLmfY2EUL
CCa4Y81IhhV5O2UqRI1lOsyGxsRQrrZXFDF+EEsxn2Ch5837/Dnuiq/X2KbJAgjv
lFhpOF0CBpn3FNeMcXQmyuis8pRAJFZLVqnJBHJqNucqFKy3uAO5GX0DVbmSgA/n
alld1cneKEiKdSRdZlE/
=W4V2
-----END PGP SIGNATURE-----

--Sig_/2DXa_EkSgLzEOMTCXxNLsN=--
