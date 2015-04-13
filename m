From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the vfs tree
Date: Mon, 13 Apr 2015 20:57:49 +1000
Message-ID: <20150413205749.0c6dcf74@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qIvLiD2anCRWz0dEWp9u3qs"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>, Fabian Frederick <fabf@skynet.be>
List-Id: linux-next.vger.kernel.org

--Sig_/qIvLiD2anCRWz0dEWp9u3qs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

Today's linux-next merge of the akpm-current tree got a conflict in
fs/affs/amigaffs.c between commit 5dd3dc06371a ("VFS: normal
filesystems (and lustre): d_inode() annotations") from the vfs tree and
commit 18da6e382823 ("fs/affs: use AFFS_MOUNT prefix for mount
options") from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/affs/amigaffs.c
index 40eb5814b98c,5022ac96aa40..000000000000
--- a/fs/affs/amigaffs.c
+++ b/fs/affs/amigaffs.c
@@@ -471,8 -471,9 +471,9 @@@ affs_warning(struct super_block *sb, co
  bool
  affs_nofilenametruncate(const struct dentry *dentry)
  {
 -	struct inode *inode =3D dentry->d_inode;
 +	struct inode *inode =3D d_inode(dentry);
- 	return AFFS_SB(inode->i_sb)->s_flags & SF_NO_TRUNCATE;
+=20
+ 	return affs_test_opt(AFFS_SB(inode->i_sb)->s_flags, SF_NO_TRUNCATE);
 =20
  }
 =20

--Sig_/qIvLiD2anCRWz0dEWp9u3qs
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVK6E2AAoJEMDTa8Ir7ZwVQwMP/inBLrCbxo+fpY+aQLukmrF+
jQBAywa1bLZEFUoefIv7vS2c2XmQJmgWvBnHvgh4Wcyb8VtaIqkFKQFx5PjzBKT7
6aK86dfyDEXfQEhkdR/VjkPRfLfydLGKLuBWyHUj+mGsE08ylmcrhDe+7KJ+lPvn
lO8BvQ4Z3OBlE8p1wCO42igHeIe656RaJxsu7TMfc/zkjLmdIlkbXvBWFUPjn9gR
MT3iEFu0PM8VUQS12T0Y6BZH93JWDSHVqiZ28Q/dwe0WPNANaoFzDZ2NmpuVCdSr
dJw1tEA3q5JPue/9OwLPvbxnHcIkc8HGmasCG5qE5Uxe6eqL564wyBXnJbUEH9mm
d6SNxSap1kIUErS3Gx43CHeq8VlC7ify5NMD7GBf5rer/44KkKN2dIr8SoppgPiO
nyqxWSWY2daTqZADNXFRv9Tfjo63MUP38M4tD1v314x4bTrJkyNvmRWqSzwCkjG5
3ZedLqGslHjG1RjR6xQ//5q7uE479FYchiBrGsAYq/VK/fncZXHvQkJ8CyUd9Byt
dCdEx5wItSjYeKiZqK3cnLSiTOncqot82b+BHQiadkju6qFoPzW9AI0Pz4+OmaEF
xTeHZnmpidCzbTFaYty1FbSjJRekujB9j0hrcp+gvhMHhNXChPSZW2UYKoKn3T9W
wB56JKQQ5wsBzJ9TqZPc
=spU8
-----END PGP SIGNATURE-----

--Sig_/qIvLiD2anCRWz0dEWp9u3qs--
