From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the xarray tree with the f2fs tree
Date: Wed, 3 Oct 2018 18:16:50 +1000
Message-ID: <20181003181638.54613336@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/OH7K2l5jMLWmlJ/r.Kys7JU"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chao Yu <yuchao0@huawei.com>
List-Id: linux-next.vger.kernel.org

--Sig_/OH7K2l5jMLWmlJ/r.Kys7JU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the xarray tree got a conflict in:

  fs/f2fs/data.c

between commit:

  bab475c5414e ("Revert: "f2fs: check last page index in cached bio to deci=
de submission"")

from the f2fs tree and commit:

  dfe989c12c50 ("pagevec: Use xa_mark_t")

from the xarray tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/f2fs/data.c
index 9ef6f1f01eda,6962491172a5..000000000000
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@@ -2029,10 -2000,10 +2029,10 @@@ static int f2fs_write_cache_pages(struc
  	pgoff_t index;
  	pgoff_t end;		/* Inclusive */
  	pgoff_t done_index;
 -	pgoff_t last_idx =3D ULONG_MAX;
  	int cycled;
  	int range_whole =3D 0;
- 	int tag;
+ 	xa_mark_t tag;
 +	int nwritten =3D 0;
 =20
  	pagevec_init(&pvec);
 =20

--Sig_/OH7K2l5jMLWmlJ/r.Kys7JU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlu0evIACgkQAVBC80lX
0GzCPggAjvc2pN9Bj45/oKQWJhtX9Ox/fN33t8gmsNHtVP+fH4BocR+pxvQ3FF11
qr5oHK/MRjPajb1D5fkJ1ZN/mVdN1GFQe+/rQodiUkxW5Elv88iozHxF9lTNpewk
0dwF7eumAhAGuUQJduYcHxR9zFV6ygFZXoo/8mSzgQb/qwPu7fbkcZrmYSwW4AAP
rkpE9atgAeFnq4O0tyk3lbeczLOwWtRgt14ngNO8m3smGK/Tb76/XdyMrcWavJ1R
y80HOzmTvhddcjAWISkHUXu7QpoebJ9XNeb9m+OI2pmGgBVlMgA50ntEnlLhXoZa
scYIXhDI9c6gf0U7TeRehPUNxZbjmA==
=dkCD
-----END PGP SIGNATURE-----

--Sig_/OH7K2l5jMLWmlJ/r.Kys7JU--
