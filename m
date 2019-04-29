From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the driver-core tree with the block
 tree
Date: Mon, 29 Apr 2019 15:24:00 +1000
Message-ID: <20190429152400.281524b7@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/7Jf7rBpQeJoAG=M3SUNEf3C"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Greg KH <greg@kroah.com>, Jens Axboe <axboe@kernel.dk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Weiping Zhang <zhangweiping@didiglobal.com>, Kimberly Brown <kimbrownkd@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/7Jf7rBpQeJoAG=M3SUNEf3C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the driver-core tree got a conflict in:

  block/blk-sysfs.c

between commit:

  4d25339e32a1 ("block: don't show io_timeout if driver has no timeout hand=
ler")

from the block tree and commit:

  800f5aa1e7e1 ("block: Replace all ktype default_attrs with groups")

from the driver-core tree.

I fixed it up (the former stopped using the default_attrs field, so I
effectively reverted the latter changes to this file) and can carry the
fix as necessary. This is now fixed as far as linux-next is concerned,
but any non trivial conflicts should be mentioned to your upstream
maintainer when your tree is submitted for merging.  You may also want
to consider cooperating with the maintainer of the conflicting tree to
minimise any particularly complex conflicts.

--=20
Cheers,
Stephen Rothwell

--Sig_/7Jf7rBpQeJoAG=M3SUNEf3C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzGinAACgkQAVBC80lX
0Gz8Dwf+MJWy5X1/uwKQmm4Z+028zGSMFh9bMYORHGZteWUGsXsJN08urOwKbpmw
3v3T+x21OTK5xyOwVbOArgRZh6uBulHgC19TeGPbzKbVk+GYwdQ2oNo+o+nIUZmj
ups16WAewFOkPkbZsYvcJHKAMgcS3n/mgjIaPRFeogJoTI4mz02yGkqC80hRg1uP
WuDI9RgliIpHfPC6oCjoKA14CHIzhlg8EqytRrWarQnj3WmNK78R0JFLyBnAWNgy
MyTfYrdQ/izUGcHd+VChvK/2jFMFF5sUv1UjmTJUIWf1z8VLhryeIDirl6EEnffq
YkW3IJnLV8VW3ZewJVF2kejqzthhQw==
=UFmE
-----END PGP SIGNATURE-----

--Sig_/7Jf7rBpQeJoAG=M3SUNEf3C--
