From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the vfs tree with the aio-direct tree
Date: Thu, 5 Sep 2013 12:54:57 +1000
Message-ID: <20130905125457.5f1e5e843167a0aaee7816f8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__5_Sep_2013_12_54_57_+1000_tuKIiw7JTIe7Gwrj"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Al Viro <viro@ZenIV.linux.org.uk>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Asias He <asias@redhat.com>, Dave Kleikamp <dave.kleikamp@oracle.com>
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__5_Sep_2013_12_54_57_+1000_tuKIiw7JTIe7Gwrj
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Al,

Today's linux-next merge of the vfs tree got a conflict in fs/block_dev.c
between commit b176eedb2a8b ("block_dev: add support for read_iter,
write_iter") from the aio-direct tree and commit 02afc27faec9
("direct-io: Handle O_(D)SYNC AIO") from the vfs tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc fs/block_dev.c
index 89d8ec5,1173a4e..0000000
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@@ -1517,8 -1518,8 +1517,8 @@@ ssize_t blkdev_write_iter(struct kiocb=20
  	BUG_ON(iocb->ki_pos !=3D pos);
 =20
  	blk_start_plug(&plug);
 -	ret =3D __generic_file_aio_write(iocb, iov, nr_segs, &iocb->ki_pos);
 +	ret =3D __generic_file_write_iter(iocb, iter, &iocb->ki_pos);
- 	if (ret > 0 || ret =3D=3D -EIOCBQUEUED) {
+ 	if (ret > 0) {
  		ssize_t err;
 =20
  		err =3D generic_write_sync(file, pos, ret);

--Signature=_Thu__5_Sep_2013_12_54_57_+1000_tuKIiw7JTIe7Gwrj
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iQIcBAEBCAAGBQJSJ/KEAAoJEECxmPOUX5FErI8P+wcdEsGVQY7VIkBuFu1+aK8X
mw/jWtOhO2ojoPhm7QPi28+5wIHoXc6M8aUVlvJ4MSCWxi5WqYHqVMtruWq1tQ5a
vOhScZzFe130GUWGfvYFftN3p2KVSjrtrO3LMM3RRnvmEz6moHOb5EZGs1GzO9s0
N/H69UeBBQZlYO5SV56YMBGKpmNVf8RvJgarn39DIF6Kj5dpApFWY/l1EZm2m0Z6
SSfS4WQQzlgUCb9OZB9FD8uvEe0hH6oQ4xwly0TiejM8D5luYhy8oehHAESjVUfn
QRjQy845wJDx8MH/nYSwcm578pLCjtmZqIq6eM/Rn18lG4Mtcw/urg3jmnFg1ITI
OoiTIVN2K8jH38TLweXiTlZCmdfkHqOCnMM3PiSaZ6dPvo28UgvWWiu+HEeKkDAl
xS2zarHSXMhqjHO0cKmHoCTjVE7uhPIitK7/xh89MQE8bo2G1bud77URAUcMvexV
75AzxzxbHWWZO2NjOALAMuCNGRIOZQdNJXxbkXT1wvjf+CdLmLcphQKWXPxeg9tN
hnACqHK3MAEsdXSh+nZZy4eoEVZNT1ImgXuXjz8YEoFV0JfkLmQEHHAnC2WmCO1K
pMEhDlTZ7tgBdp0qMyr6PIKHEJcscpo0CGLFgYAgW/6itRYDG8CxpzZyWy+R4Cax
qxPIDWMm3oSrNC+VtHSZ
=xCYl
-----END PGP SIGNATURE-----

--Signature=_Thu__5_Sep_2013_12_54_57_+1000_tuKIiw7JTIe7Gwrj--
