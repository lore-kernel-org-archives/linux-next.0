From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with the vfs tree
Date: Mon, 9 Feb 2015 14:55:24 +1100
Message-ID: <20150209145524.5b244dfc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pwSZXFqUpFLHQfST__Yig7m"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40215 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751552AbbBIDza (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 8 Feb 2015 22:55:30 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Jens Axboe <axboe@kernel.dk>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>

--Sig_/pwSZXFqUpFLHQfST__Yig7m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Jens,

Today's linux-next merge of the block tree got a conflict in
fs/configfs/configfs_internal.h between commit 22dc94f27d4b ("configfs:
configfs_create() init callback is never NULL and it never fails") from
the vfs tree and commit b4caecd48005 ("fs: introduce
f_op->mmap_capabilities for nommu mmap support") from the block tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/configfs/configfs_internal.h
index 865e41983611,a315677e44d3..000000000000
--- a/fs/configfs/configfs_internal.h
+++ b/fs/configfs/configfs_internal.h
@@@ -69,9 -69,7 +69,7 @@@ extern struct kmem_cache *configfs_dir_
  extern int configfs_is_root(struct config_item *item);
 =20
  extern struct inode * configfs_new_inode(umode_t mode, struct configfs_di=
rent *, struct super_block *);
 -extern int configfs_create(struct dentry *, umode_t mode, int (*init)(str=
uct inode *));
 +extern int configfs_create(struct dentry *, umode_t mode, void (*init)(st=
ruct inode *));
- extern int configfs_inode_init(void);
- extern void configfs_inode_exit(void);
 =20
  extern int configfs_create_file(struct config_item *, const struct config=
fs_attribute *);
  extern int configfs_make_dirent(struct configfs_dirent *,

--Sig_/pwSZXFqUpFLHQfST__Yig7m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU2C+wAAoJEMDTa8Ir7ZwVoa0P/0Faj+nVUSrBxoWt8M+ebD5q
/LLuPzKa2bO+9gKDynBX2J0t/JsMWRHXpOEy0fDwfD01T7wjg0FI8RdzTsgsIQzu
VIhxLQvdYp3fVTpkDmmtvFQbL02V3tZu0ZIMhHQghCClBJE/sy2PGDyG8fwkjYbD
qzEt2gp6QuDVKLt8ewZFRT4c51hi7hS9bid4HTE25vK/gO/TaRq16iOTxHKX+LJ0
v/70HpoMg1Ak1+MEFvocL+EMK+vdEedGcq/7FgU73W3ibmaXw34shgrvqrDxCaqf
vu+xhMtUsEkhHh0caBwVG4e4t7/1xOpNRzrsaq2LmryyTGtKgHDT0LwEevJlxTC8
4xb+LMBiUtU70pa0YMyN3dKFOYzdkZZUp8k689j1TmjLQ58T4QiYlsK+JnBr4soM
ZQ6Cbfhhw8fmooPgBEdMQjaCqZzoxeC5hptjK00gv8unYHfyXGDnUIo2/mnY6zYi
vLOyc6GbTTdCnLixAQFcnAp3PLOm7sWOh+90lTW8Y9y4cKqdkgTxV20pdaZA9uFK
ndFQCknGm2xMg55sinwUmvIETjclkdoeWwZi7YMge6fUe5Xra8vcZv2G9y5hlsb0
spQobC+xFs3iKmFnbGrcUvtfslrnq5TviYR7RJ4K0030/icrlDflW4JA1mU+QGEO
QfZeW0mEAa5AvJ2HZL7f
=R2q2
-----END PGP SIGNATURE-----

--Sig_/pwSZXFqUpFLHQfST__Yig7m--
