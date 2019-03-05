From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the block tree with Linus' tree
Date: Tue, 5 Mar 2019 12:48:44 +1100
Message-ID: <20190305124844.05e44755@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/B5zHwxVW_bqVsvYOIvnbPs/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
List-Id: linux-next.vger.kernel.org

--Sig_/B5zHwxVW_bqVsvYOIvnbPs/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the block tree got a conflict in:

  include/linux/fs.h

between commit:

  84c4e1f89fef ("aio: simplify - and fix - fget/fput for io_submit()")

from Linus' tree and commit:

  fb7e160019f4 ("fs: add an iopoll method to struct file_operations")

from the block tree.

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
index 76c7205d4f0d,80e1b199a4b1..000000000000
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@@ -317,9 -310,8 +317,10 @@@ struct kiocb=20
  	int			ki_flags;
  	u16			ki_hint;
  	u16			ki_ioprio; /* See linux/ioprio.h */
+ 	unsigned int		ki_cookie; /* for ->iopoll */
 -} __randomize_layout;
 +
 +	randomized_struct_fields_end
 +};
 =20
  static inline bool is_sync_kiocb(struct kiocb *kiocb)
  {

--Sig_/B5zHwxVW_bqVsvYOIvnbPs/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlx91XwACgkQAVBC80lX
0Gwb7AgAkCdTqpNCAv5Yaw+AQSwC74X/Iwl6PW20EwP8FpHsjomppf/C+Vf0qhMM
GPZJTyVlhQGASo/aRtQBQ80garQQY45CiXvqivgQe2cKyH6nuvdEfyvYmc42vEn3
u3WYLpdmBaXKOZvUXEp+hqtIngGz2aT3tVo4Vkgy+U6JTFJJZ50yf0sqlBhnqFzH
EXnHbM2GzOYFP0xW5HAEtrdgq61mhfBNZPGNlK6If25SU9mmAHFbuMp7pwV51AXO
OZ46SkmSKFlinv0KLa6Xm2OndQRnr0oDt6/KWdwTue0jjX32G4CHcnVLa9q3ml+h
09q5ziPSK78ifcUXp/tOoO373rPAbg==
=xU3a
-----END PGP SIGNATURE-----

--Sig_/B5zHwxVW_bqVsvYOIvnbPs/--
