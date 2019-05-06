From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the akpm-current tree with the rdma
 tree
Date: Mon, 6 May 2019 20:37:10 +1000
Message-ID: <20190506203710.10b080dc@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/3gncj=lu4fwPmti+gIskl1D"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Morton <akpm@linux-foundation.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Gal Pressman <galpress@amazon.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>
List-Id: linux-next.vger.kernel.org

--Sig_/3gncj=lu4fwPmti+gIskl1D
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  include/linux/dynamic_debug.h

between commit:

  923abb9d797b ("RDMA/core: Introduce RDMA subsystem ibdev_* print function=
s")

from the rdma tree and commit:

  8dc1ed58157d ("lib/dynamic_debug.c: introduce CONFIG_DYNAMIC_DEBUG_RELATI=
VE_POINTERS")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/linux/dynamic_debug.h
index 6c809440f319,08175c219d60..000000000000
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@@ -71,13 -77,12 +77,20 @@@ void __dynamic_netdev_dbg(struct _ddebu
  			  const struct net_device *dev,
  			  const char *fmt, ...);
 =20
 +struct ib_device;
 +
 +extern __printf(3, 4)
 +void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 +			 const struct ib_device *ibdev,
 +			 const char *fmt, ...);
 +
++
+ #ifdef CONFIG_DYNAMIC_DEBUG_RELATIVE_POINTERS
+ #include <asm/dynamic_debug.h>
+ #ifndef DEFINE_DYNAMIC_DEBUG_METADATA
+ # error "asm/dynamic_debug.h must provide definition of DEFINE_DYNAMIC_DE=
BUG_METADATA"
+ #endif
+ #else
  #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
  	static struct _ddebug  __aligned(8)			\
  	__attribute__((section("__verbose"))) name =3D {		\

--Sig_/3gncj=lu4fwPmti+gIskl1D
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlzQDlYACgkQAVBC80lX
0GxkFgf+ONRkS4T1A0ayyhOQWMeJN6RiJKna46rX1c8Y++CaIvFWZ32HXKtQnCiD
1dOXB+sOgxVVqC4Mz05K95kPrLbbBEa4IFExeeZ0j+HY840veFN9mWNwI3MCDZMo
kg/8ebo/odFMJEnrVLijlhPrecXQdp33sI8XFR2qs21exL+4wrh3/sH+ZThtmtmr
oUPxXAHjOO147yQTSaMu4mAQvbHqpWClHx18fFy8JinFvi1kfgIEop9xTH2s69+6
kmPUkjYIIIUrs2qMPZqCNxlXfME9O8nH4Zsev9xixrWXwD5rmXFSj+OUkhc914hI
dMvr947yD8aQHM+LhI0k5a4WBGbBUg==
=T39j
-----END PGP SIGNATURE-----

--Sig_/3gncj=lu4fwPmti+gIskl1D--
