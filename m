From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the ext3 tree
Date: Wed, 28 Nov 2018 10:10:48 +1100
Message-ID: <20181128101048.01864df2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/kwbht/nHU92K0rlCuHV/fVQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>, Jan Kara <jack@suse.cz>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Phillip Potter <phil@philpotter.co.uk>, Amir Goldstein <amir73il@gmail.com>, David Howells <dhowells@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/kwbht/nHU92K0rlCuHV/fVQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in:

  fs/Makefile

between commit:

  d44170a7ba48 ("fs: common implementation of file type")

from the ext3 tree and commits:

  229e55402816 ("vfs: Add configuration parser helpers")
  37744f3d21f8 ("vfs: Implement a filesystem superblock creation/configurat=
ion context")
  1d9c8fafbf6f ("vfs: syscall: Add fsopen() to prepare for superblock creat=
ion")

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
index 23fcd8c164a3,e3ea8093b178..000000000000
--- a/fs/Makefile
+++ b/fs/Makefile
@@@ -13,7 -13,7 +13,8 @@@ obj-y :=3D	open.o read_write.o file_table
  		seq_file.o xattr.o libfs.o fs-writeback.o \
  		pnode.o splice.o sync.o utimes.o d_path.o \
  		stack.o fs_struct.o statfs.o fs_pin.o nsfs.o \
 -		fs_context.o fs_parser.o fsopen.o
++		fs_context.o fs_parser.o fsopen.o \
 +		fs_types.o
 =20
  ifeq ($(CONFIG_BLOCK),y)
  obj-y +=3D	buffer.o block_dev.o direct-io.o mpage.o

--Sig_/kwbht/nHU92K0rlCuHV/fVQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv9zvgACgkQAVBC80lX
0Gw2Agf/T0+1ogTrw7dBOrcSIyGa0MiqQLltpGlf5ztY2z0229pvG8t6HIIrMB7o
EVwBg9wHOmYylZqjm8TwQPJ2FLyDMmXhQzzzXbMUmjI1SjrbDnFXR0wbCqmI6/YV
Us0Opbyq8peWMvSpBZbtSCNUKqNvIfaY8SE2ZaS1BDkFp8kxut03D0A3T4eNSvO1
R4VqBu62QGzGzOtV6IKoaSXeL49DlcG5X2M54Fl0+BoRoLgwuUwKsBFEYftNexoH
p2ccgrcMNFSksK51c0GmX8hj0OtwV+H7ariGH0amAiIn97zoBiJTF9LfwH0rhMMc
UtgMORcod37QYCPzLdgt42+QpavZIg==
=IXae
-----END PGP SIGNATURE-----

--Sig_/kwbht/nHU92K0rlCuHV/fVQ--
