From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm tree with the vfs tree
Date: Thu, 11 Apr 2019 16:21:57 +1000
Message-ID: <20190411162157.77e4c8cb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/_aTxt_Lt9pi2Lcj13=x/t2q"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ZenIV.linux.org.uk>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Chengguang Xu <cgxu519@gmx.com>, Sabyasachi Gupta <sabyasachi.linux@gmail.com>
List-Id: linux-next.vger.kernel.org

--Sig_/_aTxt_Lt9pi2Lcj13=x/t2q
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm tree got a conflict in:

  fs/block_dev.c

between commit:

  6d46d2934aea ("fs/block_dev.c: remove unused include")

from the vfs tree and patch:

  "fs/block_dev.c: Remove duplicate header"

from the akpm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc fs/block_dev.c
index 6b584817d461,bc80d165f0c0..000000000000
--- a/fs/block_dev.c
+++ b/fs/block_dev.c
@@@ -29,7 -29,7 +29,6 @@@
  #include <linux/namei.h>
  #include <linux/log2.h>
  #include <linux/cleancache.h>
- #include <linux/dax.h>
 -#include <linux/badblocks.h>
  #include <linux/task_io_accounting_ops.h>
  #include <linux/falloc.h>
  #include <linux/uaccess.h>

--Sig_/_aTxt_Lt9pi2Lcj13=x/t2q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyu3QUACgkQAVBC80lX
0Gxa5gf/UaC3CSjHi/SFKtOOqgt/IrA2jvNHK9zFw7xlciuxb3qudMBvrQGEVchx
+gLNfvs8Pb/bdBLBvtZmVn3IwRyxgtaMDcBMjNcqUSRwt/gusrjUH352SpstHi8j
qYazoir6yas3lCz9SpyJCF4FeJxJyx6I5pyRT5RQBuR4JEKZRfT+94zbjk/XbvmZ
obqvSMQ4LpnGIrXbG3XqIDVnte9odKU+HytoSAP0kEkryL9Dj5ISlLgPa26qvgIN
qJQeU/pxGtWIslULNtCDoIa546zGQjQkutEQc207OvimkPzuw9YFKERnFDCAFEmq
Ti75nagGHuGtVapoK9iSBeQkgKeOxQ==
=oK7N
-----END PGP SIGNATURE-----

--Sig_/_aTxt_Lt9pi2Lcj13=x/t2q--
