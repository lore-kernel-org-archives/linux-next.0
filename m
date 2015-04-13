From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext4 tree
Date: Mon, 13 Apr 2015 11:43:55 +1000
Message-ID: <20150413114355.72f80ab8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j3Eo2paDsELfOnBA1FGP3y5"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41390 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752688AbbDMBoC (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Apr 2015 21:44:02 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Lukas Czerner <lczerner@redhat.com>, Michael Halcrow <mhalcrow@google.com>

--Sig_/j3Eo2paDsELfOnBA1FGP3y5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/ext4/namei.c between commits e12fb97222fc ("ext4: make fsync to sync
parent dir in no-journal for real this time") and 5c34f02d301e ("ext4
crypto: partial update to namei.c for fname crypto") from the ext4 tree
and commit 5dd3dc06371a ("VFS: normal filesystems (and lustre):
d_inode() annotations") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/ext4/namei.c
index c5197176dba4,e086eebe335e..000000000000
--- a/fs/ext4/namei.c
+++ b/fs/ext4/namei.c
@@@ -2058,14 -1732,9 +2058,14 @@@ static int add_dirent_to_buf(handle_t *
  static int make_indexed_dir(handle_t *handle, struct dentry *dentry,
  			    struct inode *inode, struct buffer_head *bh)
  {
- 	struct inode	*dir =3D dentry->d_parent->d_inode;
+ 	struct inode	*dir =3D d_inode(dentry->d_parent);
 +#ifdef CONFIG_EXT4_FS_ENCRYPTION
 +	struct ext4_fname_crypto_ctx *ctx =3D NULL;
 +	int res;
 +#else
  	const char	*name =3D dentry->d_name.name;
  	int		namelen =3D dentry->d_name.len;
 +#endif
  	struct buffer_head *bh2;
  	struct dx_root	*root;
  	struct dx_frame	frames[2], *frame;
@@@ -2212,8 -1864,8 +2212,8 @@@ out_frames
  static int ext4_add_entry(handle_t *handle, struct dentry *dentry,
  			  struct inode *inode)
  {
- 	struct inode *dir =3D dentry->d_parent->d_inode;
+ 	struct inode *dir =3D d_inode(dentry->d_parent);
 -	struct buffer_head *bh;
 +	struct buffer_head *bh =3D NULL;
  	struct ext4_dir_entry_2 *de;
  	struct ext4_dir_entry_tail *t;
  	struct super_block *sb;

--Sig_/j3Eo2paDsELfOnBA1FGP3y5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKx9gAAoJEMDTa8Ir7ZwV2fIQAJChIP0OvLnjKgzVQJallQJK
2Fsof3KaZYRutIr82H0/eEPSIhUOny7diHcn/u7fJXN3D5ADwN3sQleLIbvsNGjH
r+jCmt4PdQ7ylN1QdDqsdlvFpSYgW3m7Lac0N8b1WlqVI8KvsL4hZ3ikvPbc1OxK
v3I54wuZIUwhKS1cKR/ERaifuGFCjtC/K3IS4lMEjmf+T2VUTHXFErP+kzlguXlA
n18wAmJa7EtmYmAikPsguqIUVabQ/giKxU3/m4XJQnf0/ZFEFFqddlB5BxN66gC2
1LFRAtv3WpTLy3q8oE84bP99qT5QCdMEBgPGElAHTt31FYe+Uki2QaoYbDa5dzzj
ewtmWHuyjgWIlVLnhJ0BKYKyZYxOZyEzX2bvPIYY2hcogEpdCU7OjpLDECfa336Q
xIrjMlTIehMVhd+z1rNeh+8caWJPXHFfcAPoTfHTYrdBetRkdpuhArUpinV4RPLT
3xlV2LmcPb3YLnB+pxeaAFpg0Jh7lyzs0mHdmS5wIQSjDvacd0qcGPYGutdYWWGg
c4HfvVle/msYYkEUHIWw/tfT1ct62Z+9fz06UT8Tz9keMjMelCogaxRk6bVin2cc
S5R9odquGSGjQAy7vFAcptEOk5XGQA7DH89ITMCXhmN5B4KytQ3rF/ozAiSdoCbk
5B+MgBTot9/mtbBxN//3
=SGs2
-----END PGP SIGNATURE-----

--Sig_/j3Eo2paDsELfOnBA1FGP3y5--
