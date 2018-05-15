From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the btrfs-kdave tree with the
 btrfs-fixes tree
Date: Wed, 16 May 2018 09:47:04 +1000
Message-ID: <20180516094704.652238c9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/6f04O+xoTYk/LzykGuibmau"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Sterba <dsterba@suse.cz>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Misono Tomohiro <misono.tomohiro@jp.fujitsu.com>, Adam Borowski <kilobyte@angband.pl>
List-Id: linux-next.vger.kernel.org

--Sig_/6f04O+xoTYk/LzykGuibmau
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

Today's linux-next merge of the btrfs-kdave tree got a conflict in:

  fs/btrfs/props.c

between commit:

  f764b4f4bb26 ("btrfs: property: Set incompat flag if lzo/zstd compression=
 is set")

from the btrfs-fixes tree and commit:

  e37739baf401 ("btrfs: allow setting zstd level")

from the btrfs-kdave tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/btrfs/props.c
index dc6140013ae8,c85bb04a1cc3..000000000000
--- a/fs/btrfs/props.c
+++ b/fs/btrfs/props.c
@@@ -391,17 -390,14 +391,17 @@@ static int prop_compression_apply(struc
  		return 0;
  	}
 =20
 -	if (!strncmp("lzo", value, 3))
 +	if (!strncmp("lzo", value, 3)) {
  		type =3D BTRFS_COMPRESS_LZO;
 -	else if (!strncmp("zlib", value, 4))
 +		btrfs_set_fs_incompat(fs_info, COMPRESS_LZO);
 +	} else if (!strncmp("zlib", value, 4)) {
  		type =3D BTRFS_COMPRESS_ZLIB;
- 	} else if (!strncmp("zstd", value, len)) {
 -	else if (!strncmp("zstd", value, 4))
++	} else if (!strncmp("zstd", value, 4)) {
  		type =3D BTRFS_COMPRESS_ZSTD;
 -	else
 +		btrfs_set_fs_incompat(fs_info, COMPRESS_ZSTD);
 +	} else {
  		return -EINVAL;
 +	}
 =20
  	BTRFS_I(inode)->flags &=3D ~BTRFS_INODE_NOCOMPRESS;
  	BTRFS_I(inode)->flags |=3D BTRFS_INODE_COMPRESS;

--Sig_/6f04O+xoTYk/LzykGuibmau
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlr7cXgACgkQAVBC80lX
0GxR5wf+MjZx0E4MuLEYw/LRc1NczI06A2l5+JeQ9OJRtLQeiUpvfWaSC6OICdkk
HDfdF+RDdkyelq1qmbvbytP4WmsJXLDQcjj0b3C1ylBG0Kl0AW9xNYjhks2M3IDR
Lfej6CCQsqJh/D+Wfahofv9Q2Qdv96tR4rfNoFAoiDcCdHMLZuAqKpVe3jzP1hlJ
Rf+228lxnoOt5MhhkvjR4POjjLgbCCIYH+LT5fFyZA1mFZYJsYKT7lpCEYSD1zcm
CW4djSyx3VtPKsQrtT8RAwM6fFpYQLbYvUwPn3pWDNvlt2QVUxIXVw8zyBPWFiMm
0BbxNLsdfFul5S2h/ok5OiYMokfPqw==
=7x4T
-----END PGP SIGNATURE-----

--Sig_/6f04O+xoTYk/LzykGuibmau--
