From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the fscrypt tree
Date: Mon, 3 Dec 2018 11:23:45 +1100
Message-ID: <20181203112345.6c9a786a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Q._oDp0b403T/oqY4d.1U0j"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Eric Biggers <ebiggers@google.com>
List-Id: linux-next.vger.kernel.org

--Sig_/Q._oDp0b403T/oqY4d.1U0j
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  include/linux/fs.h

between commit:

  a2bd7d2fc32c ("fs-verity: add setup code, UAPI, and Kconfig")

from the fscrypt tree and commit:

  37744f3d21f8 ("vfs: Implement a filesystem superblock creation/configurat=
ion context")
  d5ab33dfd7bc ("vfs: syscall: Add fsinfo() to query filesystem information=
")

from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/fs.h
index d7bf524a0517,aae0aec1adb4..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -62,8 -61,10 +62,12 @@@ struct workqueue_struct
  struct iov_iter;
  struct fscrypt_info;
  struct fscrypt_operations;
 +struct fsverity_info;
 +struct fsverity_operations;
+ struct fs_context;
+ struct fs_parameter_description;
+ struct fsinfo_kparams;
+ enum fsinfo_attribute;
 =20
  extern void __init inode_init(void);
  extern void __init inode_init_early(void);

--Sig_/Q._oDp0b403T/oqY4d.1U0j
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwEd5EACgkQAVBC80lX
0GzUYQf+JTTe3SpIyGyM3DJH59W/CzMXmFtMyUiTsBwmu8aeS/94BxXX7yFbHjNu
g41M2VoWm0MrNCmrai7uVo5LEp07xUCf6OwizLvdU8Lwdtu/208VqvRARgsJFCRD
JzOvp80BOqIZbGzr43jCZzq/BdlX3kPcVGm/VFjXvxA2PRyKbGSSyyfZAT9R2fAk
NL4l6R+/qvKHbgFvVMRJNOlhCe/zAYMYJFj2GS8O2hAW3RVFTtB4KEN47ZnUwVjX
v57v2nf9mNwCDYdCcAn+eVZfS0wjgOsICgeUoRkIBiymz5hi0wq8wzsqRovvp9E6
ch9bUs8ajz7bqH273qk+vPA2CLrTog==
=PX9N
-----END PGP SIGNATURE-----

--Sig_/Q._oDp0b403T/oqY4d.1U0j--
