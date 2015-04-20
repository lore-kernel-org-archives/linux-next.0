From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the xfs tree
Date: Mon, 20 Apr 2015 12:35:24 +1000
Message-ID: <20150420123524.4d1da1fa@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/LgYsPegD/wKnMa0G71o+dtW"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58364 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753290AbbDTCfa (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sun, 19 Apr 2015 22:35:30 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Ben Myers <bpm@sgi.com>, David Chinner <david@fromorbit.com>, xfs@oss.sgi.com
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Omar Sandoval <osandov@osandov.com>, Al Viro <viro@zeniv.linux.org.uk>

--Sig_/LgYsPegD/wKnMa0G71o+dtW
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xfs tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

fs/xfs/xfs_file.c: In function 'xfs_file_dio_aio_write':
fs/xfs/xfs_file.c:744:8: warning: passing argument 1 of 'mapping->a_ops->di=
rect_IO' makes pointer from integer without a cast
  ret =3D mapping->a_ops->direct_IO(WRITE, iocb, &data, pos);
        ^
fs/xfs/xfs_file.c:744:8: note: expected 'struct kiocb *' but argument is of=
 type 'long long unsigned int'
fs/xfs/xfs_file.c:744:8: warning: passing argument 2 of 'mapping->a_ops->di=
rect_IO' from incompatible pointer type
fs/xfs/xfs_file.c:744:8: note: expected 'struct iov_iter *' but argument is=
 of type 'struct kiocb *'
fs/xfs/xfs_file.c:744:8: warning: passing argument 3 of 'mapping->a_ops->di=
rect_IO' makes integer from pointer without a cast
fs/xfs/xfs_file.c:744:8: note: expected 'loff_t' but argument is of type 's=
truct iov_iter *'
fs/xfs/xfs_file.c:744:8: error: too many arguments to function 'mapping->a_=
ops->direct_IO'

So, my merge resolution was not sufficient :-(

Commit 22c6186ecea0 ("direct_IO: remove rw from a_ops->direct_IO()")
removed the first argument from ->direct_IO(), so I added the following
merge fix patch.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 20 Apr 2015 12:32:00 +1000
Subject: [PATCH] xfs: fix up for direct_IO API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 fs/xfs/xfs_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/xfs_file.c b/fs/xfs/xfs_file.c
index 0d5053fcd8c5..8121e75352ee 100644
--- a/fs/xfs/xfs_file.c
+++ b/fs/xfs/xfs_file.c
@@ -741,7 +741,7 @@ xfs_file_dio_aio_write(
 	trace_xfs_file_direct_write(ip, count, iocb->ki_pos, 0);
=20
 	data =3D *from;
-	ret =3D mapping->a_ops->direct_IO(WRITE, iocb, &data, pos);
+	ret =3D mapping->a_ops->direct_IO(iocb, &data, pos);
=20
 	/* see generic_file_direct_write() for why this is necessary */
 	if (mapping->nrpages) {
--=20
2.1.4

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/LgYsPegD/wKnMa0G71o+dtW
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVNGXwAAoJEMDTa8Ir7ZwVSoIP/iOHktGpYCZXZeXxVEIjB9WN
O0Ga/h8T4itTCvOIp+9v/OgaiSbB75ohtVPhEJBoxnVtNsFhfAid3DjR5/txlHiK
hjDwlfdCQ3G/QVLRLGKaO1/1hjnWgoBgqC3zAesuezu8cfJrR0wDlwf7RVjJvt6/
gD5GXqfB6Tla8b1EpMJP4ui3y78sOWvzLA28iVbMOMYZlr4MHf5I2b01mLRSRROF
Fh0baXh0643y5MUGihu+Lf2a3qpdXxKhClaNh2CWfMc2G5k5IDzwKi3uy5g24siY
s50HN4NvWeWtxHldImuy2puKwL0hK4Sp7hc8vvp6m2qDvApUsOgQmxb4ZpeSU6+/
rc81xpI/K0LXjhGE6OEHhGyyxrmiHcMVOfvrw3b9wK8LNOOfva9LZ+VuTLq2chvu
kdt8yvkvxv37DA6H4m+MVjarDJ+Z/dg7rSdAlK+fKnfg/K6xe/BNGu80CC6o21LX
s7HpqLUpA9fVGjr2BaXrZgXLHd3e/m7S5E0ktnlUBEWE8P69aMdy0Ese6Da5GVXl
ffYqSeCwJ/IeVaQKPNQ7IRD0T6RS03yEF8+mGV2SWaRys1rdyxp82kG/QFPtqNij
lFu7EksjG34pWP2tc2c3DsXrLrWGR8mnaMOVRSSfFnwLy3J9oX70AwbhTc34Y1Lh
RjZXdBdMia3vUCbwSW1D
=BOwo
-----END PGP SIGNATURE-----

--Sig_/LgYsPegD/wKnMa0G71o+dtW--
