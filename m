From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the fscrypt tree
Date: Tue, 18 Dec 2018 10:36:50 +1100
Message-ID: <20181218103650.6b1d79be@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GtBjbh0pu_fBDE94CCWbl=2"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Theodore Ts'o <tytso@mit.edu>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Eric Biggers <ebiggers@google.com>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/GtBjbh0pu_fBDE94CCWbl=2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the vfs tree got a conflict in:

  include/linux/fs.h

between commit:

  a2bd7d2fc32c ("fs-verity: add setup code, UAPI, and Kconfig")

from the fscrypt tree and commit:

  013c7af575e5 ("vfs: Implement a filesystem superblock creation/configurat=
ion context")

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
index b2f9913eee10,169ca472d16a..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -62,8 -61,8 +62,10 @@@ struct workqueue_struct
  struct iov_iter;
  struct fscrypt_info;
  struct fscrypt_operations;
 +struct fsverity_info;
 +struct fsverity_operations;
+ struct fs_context;
+ struct fs_parameter_description;
 =20
  extern void __init inode_init(void);
  extern void __init inode_init_early(void);

--Sig_/GtBjbh0pu_fBDE94CCWbl=2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwYMxIACgkQAVBC80lX
0Gw0+Af9HSMH5V6xVdbu9aJ24NXfK9WxHeT3jPT5397i3ia2QbPkIfNfmmSq4dTV
RmAkbv5llYsXGTWA4VBts0qcG56aXGwarI4sQ87w/eBcHGYjmOcX3cWTAfeqg39W
ZqRG0kC2J3SZNt7jGROiuH5Iq7xsCkuAeng8h7dyRr89FnDp76tOFijViAQSy4PA
NKdbXR3+k1aCQywF/f4Nu9xBfD+UPcA07tgvcrIXEEubIfRgsGOvRMvBcfIEl59N
c4LN9okNAGcCTIRCrHpUw4R22PObxcymej5RcZfOupy3VzcvdtlgvJx44b3eAVXC
yQ52Ug4TrfdPEk4kprAbRXneWUSnFg==
=zeBu
-----END PGP SIGNATURE-----

--Sig_/GtBjbh0pu_fBDE94CCWbl=2--
