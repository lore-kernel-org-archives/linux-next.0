From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the btrfs tree
Date: Mon, 13 Apr 2015 11:37:20 +1000
Message-ID: <20150413113720.01ec6b1f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/jTpSV3J.2eB=m3JjAQH2W_p"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:46031 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752143AbbDMBh2 (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 12 Apr 2015 21:37:28 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Al Viro <viro@ZenIV.linux.org.uk>, Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, David Sterba <dsterba@suse.cz>, David Howells <dhowells@redhat.com>

--Sig_/jTpSV3J.2eB=m3JjAQH2W_p
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in
fs/btrfs/xattr.c between commit 3c3b04d10ff1 ("btrfs: don't accept bare
namespace as a valid xattr") from the btrfs tree and commit
5dd3dc06371a ("VFS: normal filesystems (and lustre): d_inode()
annotations") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/btrfs/xattr.c
index 45ea704be030,4cca14ecb660..000000000000
--- a/fs/btrfs/xattr.c
+++ b/fs/btrfs/xattr.c
@@@ -408,17 -388,15 +408,17 @@@ ssize_t btrfs_getxattr(struct dentry *d
  	if (!strncmp(name, XATTR_SYSTEM_PREFIX, XATTR_SYSTEM_PREFIX_LEN))
  		return generic_getxattr(dentry, name, buffer, size);
 =20
 -	if (!btrfs_is_valid_xattr(name))
 -		return -EOPNOTSUPP;
 +	ret =3D btrfs_is_valid_xattr(name);
 +	if (ret)
 +		return ret;
- 	return __btrfs_getxattr(dentry->d_inode, name, buffer, size);
+ 	return __btrfs_getxattr(d_inode(dentry), name, buffer, size);
  }
 =20
  int btrfs_setxattr(struct dentry *dentry, const char *name, const void *v=
alue,
  		   size_t size, int flags)
  {
- 	struct btrfs_root *root =3D BTRFS_I(dentry->d_inode)->root;
+ 	struct btrfs_root *root =3D BTRFS_I(d_inode(dentry))->root;
 +	int ret;
 =20
  	/*
  	 * The permission on security.* and system.* is not checked
@@@ -435,12 -413,11 +435,12 @@@
  	if (!strncmp(name, XATTR_SYSTEM_PREFIX, XATTR_SYSTEM_PREFIX_LEN))
  		return generic_setxattr(dentry, name, value, size, flags);
 =20
 -	if (!btrfs_is_valid_xattr(name))
 -		return -EOPNOTSUPP;
 +	ret =3D btrfs_is_valid_xattr(name);
 +	if (ret)
 +		return ret;
 =20
  	if (!strncmp(name, XATTR_BTRFS_PREFIX, XATTR_BTRFS_PREFIX_LEN))
- 		return btrfs_set_prop(dentry->d_inode, name,
+ 		return btrfs_set_prop(d_inode(dentry), name,
  				      value, size, flags);
 =20
  	if (size =3D=3D 0)
@@@ -452,8 -429,7 +452,8 @@@
 =20
  int btrfs_removexattr(struct dentry *dentry, const char *name)
  {
- 	struct btrfs_root *root =3D BTRFS_I(dentry->d_inode)->root;
+ 	struct btrfs_root *root =3D BTRFS_I(d_inode(dentry))->root;
 +	int ret;
 =20
  	/*
  	 * The permission on security.* and system.* is not checked
@@@ -470,15 -446,14 +470,15 @@@
  	if (!strncmp(name, XATTR_SYSTEM_PREFIX, XATTR_SYSTEM_PREFIX_LEN))
  		return generic_removexattr(dentry, name);
 =20
 -	if (!btrfs_is_valid_xattr(name))
 -		return -EOPNOTSUPP;
 +	ret =3D btrfs_is_valid_xattr(name);
 +	if (ret)
 +		return ret;
 =20
  	if (!strncmp(name, XATTR_BTRFS_PREFIX, XATTR_BTRFS_PREFIX_LEN))
- 		return btrfs_set_prop(dentry->d_inode, name,
+ 		return btrfs_set_prop(d_inode(dentry), name,
  				      NULL, 0, XATTR_REPLACE);
 =20
- 	return __btrfs_setxattr(NULL, dentry->d_inode, name, NULL, 0,
+ 	return __btrfs_setxattr(NULL, d_inode(dentry), name, NULL, 0,
  				XATTR_REPLACE);
  }
 =20

--Sig_/jTpSV3J.2eB=m3JjAQH2W_p
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVKx3VAAoJEMDTa8Ir7ZwVCkEP+wUBAa3CxxCAujcVg/RprKzo
z0pzRktbsOCZJypCc3qyPMR8I7agtY/ul9XW/P+J4ZklQrgSETIDnM15S94KwM00
FoJFw1hLQ3oPyLmRBQXdNt3PdC3cuHv2jC5WhEP6ea4GWndRGEgsi1KOljXq6lVW
LoE9FegY6jTVtFEiV+3DK9CkqpGdIFdc5mmG4f/Wta3EEicnsmuUGLpOT5fT9/Ba
Mztro+JN5sRKYmANRKh5SqP7exVjNcm8x6+uVDWp9k+W/1UXkZTXGQTVpY3j71lH
k3KVf+HPDZ5FgepZg0/OKffx9ZVWhNS1AvZMayV+hBmaWkKYjla6jcyHrhHsnuy8
y4PHQDznxiKVxe3iM7dKj45W3sLwyAsXJog6fEdvjboV8JQjoayDPgKfjGwbfGbI
GWzD6w8cGlL7Qq0jFMTRAjFNvm/aNI4uZtZyGwTD+UYv/Tn6dmvUhaKyO2H/r7Xw
6LKIRH0CKxBnv2/82XKloIFcsWtcb6yksVTz9xkvI3hLQHmhyJArKZQrKlkguHqq
B5hj1QYhWaiMlkpTVaUys8pRKDKRBMHZoCa+9DdfuaoSa6vjhfiE71417QHmdJD9
8diq6g0Qewd7l6r/13ySPrwtnsgjeeRtGZxy64Izzhfp/9laDPqj6Ep8Lt3/MXdE
aLvQJkPqdOh+tq3vwFyz
=hJb6
-----END PGP SIGNATURE-----

--Sig_/jTpSV3J.2eB=m3JjAQH2W_p--
