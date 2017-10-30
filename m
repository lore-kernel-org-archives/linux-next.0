From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the ext4 tree with the fscrypt tree
Date: Mon, 30 Oct 2017 14:48:04 +0000
Message-ID: <20171030144804.dkjusjfvl4cvlzoh@sirena.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="4smuhi5wktn3gbk5"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Theodore Ts'o <tytso@mit.edu>, Eric Biggers <ebiggers@google.com>, Ross Zwisler <ross.zwisler@linux.intel.com>, Jan Kara <jack@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org


--4smuhi5wktn3gbk5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Theodore,

Today's linux-next merge of the ext4 tree got a conflict in:

  fs/ext4/inode.c

between commit:

  2ee6a576be564272 ("fs, fscrypt: add an S_ENCRYPTED inode flag")

=66rom the fscrypt tree and commit:

  d4e50e6d43b2620f ("ext4: add ext4_should_use_dax()")

=66rom the ext4 tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc fs/ext4/inode.c
index 617c7feced24,9f836e2ec18c..000000000000
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@@ -4572,6 -4610,21 +4610,23 @@@ int ext4_get_inode_loc(struct inode *in
  		!ext4_test_inode_state(inode, EXT4_STATE_XATTR));
  }
 =20
+ static bool ext4_should_use_dax(struct inode *inode)
+ {
++	unsigned int flags =3D EXT4_I(inode)->i_flags;
++
+ 	if (!test_opt(inode->i_sb, DAX))
+ 		return false;
+ 	if (!S_ISREG(inode->i_mode))
+ 		return false;
+ 	if (ext4_should_journal_data(inode))
+ 		return false;
+ 	if (ext4_has_inline_data(inode))
+ 		return false;
 -	if (ext4_encrypted_inode(inode))
++	if (flags & EXT4_ENCRYPT_FL)
+ 		return false;
+ 	return true;
+ }
+=20
  void ext4_set_inode_flags(struct inode *inode)
  {
  	unsigned int flags =3D EXT4_I(inode)->i_flags;
@@@ -4587,15 -4640,10 +4642,13 @@@
  		new_fl |=3D S_NOATIME;
  	if (flags & EXT4_DIRSYNC_FL)
  		new_fl |=3D S_DIRSYNC;
- 	if (test_opt(inode->i_sb, DAX) && S_ISREG(inode->i_mode) &&
- 	    !ext4_should_journal_data(inode) && !ext4_has_inline_data(inode) &&
- 	    !(flags & EXT4_ENCRYPT_FL))
+ 	if (ext4_should_use_dax(inode))
  		new_fl |=3D S_DAX;
 +	if (flags & EXT4_ENCRYPT_FL)
 +		new_fl |=3D S_ENCRYPTED;
  	inode_set_flags(inode, new_fl,
 -			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|S_DAX);
 +			S_SYNC|S_APPEND|S_IMMUTABLE|S_NOATIME|S_DIRSYNC|S_DAX|
 +			S_ENCRYPTED);
  }
 =20
  static blkcnt_t ext4_inode_blocks(struct ext4_inode *raw_inode,

--4smuhi5wktn3gbk5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAln3O6MACgkQJNaLcl1U
h9CO9wf9FokAkRetrhmfFC4b1zMD0H9CygzjiC4oiMsUZP1gW+RKMAgqxg5cZbkY
GH4LVIcDlUL8WfarcoUgum+2hLcVPjqAmGUE5RXLteyyjx7GAjwsvdMmMZxm2aj/
9Jt1UyhpP/rCu+bPOXe3DX08j3lG3yoD3AkqLI7jyndG77B12YjYJJ1KjF7YWbXu
Qw8QRZgv5zlwIPv+Fv/40iOH7iYVWeL6WXWs7Y3/UnjK3Hg5XR9Te/bPbU1ofe4L
179/wyPqyfJP5kqBEe77z2z25o6YmeQ/5ROB54jDxRFRZZx8Gsj4GOSOks2RjBpK
eC8ONngzuM84YQPOxfUwSRh89jKcOQ==
=p7lg
-----END PGP SIGNATURE-----

--4smuhi5wktn3gbk5--
