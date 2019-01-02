From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext3 tree
Date: Wed, 2 Jan 2019 12:09:10 +1100
Message-ID: <20190102120910.7a673e28@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NnCFe0smkMd93ta7/3oa+hz"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Howells <dhowells@redhat.com>, Phillip Potter <phil@philpotter.co.uk>, Amir Goldstein <amir73il@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/NnCFe0smkMd93ta7/3oa+hz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/Makefile

between commit:

  d44170a7ba48 ("fs: common implementation of file type")

from the ext3 tree and commits:

  fe43eec04841 ("vfs: Introduce fs_context, switch vfs_kern_mount() to it.")
  82685adaccb3 ("vfs: Add configuration parser helpers")

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

diff --cc fs/Makefile
index da0d43eb2bc5,9a0b8003f069..000000000000
--- a/fs/Makefile
+++ b/fs/Makefile
@@@ -13,7 -13,7 +13,7 @@@ obj-y :=3D	open.o read_write.o file_table
  		seq_file.o xattr.o libfs.o fs-writeback.o \
  		pnode.o splice.o sync.o utimes.o d_path.o \
  		stack.o fs_struct.o statfs.o fs_pin.o nsfs.o \
- 		fs_types.o
 -		fs_context.o fs_parser.o
++		fs_types.o fs_context.o fs_parser.o
 =20
  ifeq ($(CONFIG_BLOCK),y)
  obj-y +=3D	buffer.o block_dev.o direct-io.o mpage.o

--Sig_/NnCFe0smkMd93ta7/3oa+hz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwsDzYACgkQAVBC80lX
0GyURgf/en+UO6BfIbaIPXKlEDPDl+20r/Te3xZvbqCj5MLErzEjFxzD7qGN5ZlU
loEzuYyMkNDrWKxQvx2BHChu0Re0UD03y9FdC7XyJN9Zc44xiayw8hy4JxepFTjX
yU0FQb/hopfQZ6sXnsBIBd4JnDlKgQ6D901qSr0l6/mXYHy0uxsx6fDNikLMvFxI
ccQ6dyenlMd0FsM9cm1LXEhGMBJKvTvSzhVgRN3FdesRu1k7CN4BoUtljnEjRsyU
PK7GPnlFJ19p2mKSS7EX9f1KmtzIGVv2gOlAacGrbwKOD1BoKLjiWSVrQsV2Hy/K
l/9A7bEhHoxrHpFSIWwQxeyiUQnyzw==
=BK9a
-----END PGP SIGNATURE-----

--Sig_/NnCFe0smkMd93ta7/3oa+hz--
