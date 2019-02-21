From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the xarray tree
Date: Thu, 21 Feb 2019 17:13:32 +1100
Message-ID: <20190221171332.262cf619@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/e9dqugCWODAQ208HfahNA5W"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Wilcox <willy@infradead.org>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leon Romanovsky <leonro@mellanox.com>
List-Id: linux-next.vger.kernel.org

--Sig_/e9dqugCWODAQ208HfahNA5W
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the xarray tree, today's linux-next build (powerpc
ppc64_defconfig) failed like this:

In file included from include/linux/uio.h:12,
                 from include/linux/socket.h:8,
                 from include/rdma/rdma_cm.h:37,
                 from drivers/infiniband/core/restrack.c:6:
drivers/infiniband/core/restrack.c: In function 'rt_xa_alloc_cyclic':
include/linux/kernel.h:40:18: warning: passing argument 3 of '__xa_alloc' m=
akes pointer from integer without a cast [-Wint-conversion]
 #define U32_MAX  ((u32)~0U)
                  ^~~~~~~~~~
drivers/infiniband/core/restrack.c:26:27: note: in expansion of macro 'U32_=
MAX'
  err =3D __xa_alloc(xa, id, U32_MAX, entry, GFP_KERNEL);
                           ^~~~~~~
In file included from include/linux/radix-tree.h:31,
                 from include/linux/fs.h:15,
                 from include/linux/seq_file.h:11,
                 from arch/powerpc/include/asm/machdep.h:12,
                 from arch/powerpc/include/asm/archrandom.h:7,
                 from include/linux/random.h:166,
                 from include/linux/net.h:22,
                 from include/linux/skbuff.h:29,
                 from include/linux/if_arp.h:26,
                 from include/rdma/ib_addr.h:39,
                 from include/rdma/rdma_cm.h:39,
                 from drivers/infiniband/core/restrack.c:6:
include/linux/xarray.h:524:61: note: expected 'void *' but argument is of t=
ype 'unsigned int'
 int __must_check __xa_alloc(struct xarray *, u32 *id, void *entry,
                                                       ~~~~~~^~~~~
drivers/infiniband/core/restrack.c:26:36: error: incompatible type for argu=
ment 4 of '__xa_alloc'
  err =3D __xa_alloc(xa, id, U32_MAX, entry, GFP_KERNEL);
                                    ^~~~~
In file included from include/linux/radix-tree.h:31,
                 from include/linux/fs.h:15,
                 from include/linux/seq_file.h:11,
                 from arch/powerpc/include/asm/machdep.h:12,
                 from arch/powerpc/include/asm/archrandom.h:7,
                 from include/linux/random.h:166,
                 from include/linux/net.h:22,
                 from include/linux/skbuff.h:29,
                 from include/linux/if_arp.h:26,
                 from include/rdma/ib_addr.h:39,
                 from include/rdma/rdma_cm.h:39,
                 from drivers/infiniband/core/restrack.c:6:
include/linux/xarray.h:525:3: note: expected 'struct xa_limit' but argument=
 is of type 'void *'
   struct xa_limit, gfp_t);
   ^~~~~~~~~~~~~~~
drivers/infiniband/core/restrack.c:29:28: warning: passing argument 3 of '_=
_xa_alloc' makes pointer from integer without a cast [-Wint-conversion]
   err =3D __xa_alloc(xa, id, *next, entry, GFP_KERNEL);
                            ^~~~~
In file included from include/linux/radix-tree.h:31,
                 from include/linux/fs.h:15,
                 from include/linux/seq_file.h:11,
                 from arch/powerpc/include/asm/machdep.h:12,
                 from arch/powerpc/include/asm/archrandom.h:7,
                 from include/linux/random.h:166,
                 from include/linux/net.h:22,
                 from include/linux/skbuff.h:29,
                 from include/linux/if_arp.h:26,
                 from include/rdma/ib_addr.h:39,
                 from include/rdma/rdma_cm.h:39,
                 from drivers/infiniband/core/restrack.c:6:
include/linux/xarray.h:524:61: note: expected 'void *' but argument is of t=
ype 'u32' {aka 'unsigned int'}
 int __must_check __xa_alloc(struct xarray *, u32 *id, void *entry,
                                                       ~~~~~~^~~~~
drivers/infiniband/core/restrack.c:29:35: error: incompatible type for argu=
ment 4 of '__xa_alloc'
   err =3D __xa_alloc(xa, id, *next, entry, GFP_KERNEL);
                                   ^~~~~
In file included from include/linux/radix-tree.h:31,
                 from include/linux/fs.h:15,
                 from include/linux/seq_file.h:11,
                 from arch/powerpc/include/asm/machdep.h:12,
                 from arch/powerpc/include/asm/archrandom.h:7,
                 from include/linux/random.h:166,
                 from include/linux/net.h:22,
                 from include/linux/skbuff.h:29,
                 from include/linux/if_arp.h:26,
                 from include/rdma/ib_addr.h:39,
                 from include/rdma/rdma_cm.h:39,
                 from drivers/infiniband/core/restrack.c:6:
include/linux/xarray.h:525:3: note: expected 'struct xa_limit' but argument=
 is of type 'void *'
   struct xa_limit, gfp_t);
   ^~~~~~~~~~~~~~~

Caused by commit

  fd47c2f99f04 ("RDMA/restrack: Convert internal DB from hash to XArray")

from the rdma tree interacting with commit

  a3e4d3f97ec8 ("XArray: Redesign xa_alloc API")

from the xarray tree.

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Thu, 21 Feb 2019 17:07:22 +1100
Subject: [PATCH] RDMA/restrack: fix for __xa_alloc() API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/infiniband/core/restrack.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/infiniband/core/restrack.c b/drivers/infiniband/core/r=
estrack.c
index fa804093fafb..5cb381a986c1 100644
--- a/drivers/infiniband/core/restrack.c
+++ b/drivers/infiniband/core/restrack.c
@@ -23,10 +23,10 @@ static int rt_xa_alloc_cyclic(struct xarray *xa, u32 *i=
d, void *entry,
 		*id =3D 0;
=20
 	xa_lock(xa);
-	err =3D __xa_alloc(xa, id, U32_MAX, entry, GFP_KERNEL);
+	err =3D __xa_alloc(xa, id, entry, XA_LIMIT(*id, U32_MAX), GFP_KERNEL);
 	if (err && *next !=3D U32_MAX) {
 		*id =3D 0;
-		err =3D __xa_alloc(xa, id, *next, entry, GFP_KERNEL);
+		err =3D __xa_alloc(xa, id, entry, XA_LIMIT(0, *next), GFP_KERNEL);
 	}
=20
 	if (!err)
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/e9dqugCWODAQ208HfahNA5W
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlxuQYwACgkQAVBC80lX
0GxmVwf/cEWamI1bh+DIqaGS2Se06+ts10egGLhV4BLkjLptH49TCOBXbt3TexM+
ZssmBDZm4VDPV67eHLilyvyyWvfrIshtntzPbROe3lzxEHWa2aM5IDHueUdv9VpQ
5IiOtigs9mD413jEZgEA40whRd2QBuezgLtcaMwYCtZCr2oIo5TinnKmNOS5N6Hy
DNgCnGcGRtCx34ILTzW4a4z7+CsFxMCNPWN09I9hYrrzhRkPXQoO/LLgNMD3pGyd
ygR2osqsFtp2dXg3NwhazNnfA/+cpjadR+oQbYBooRkT0rAahgutH6veurOUtScP
ZMkzEB+6Xv7g71C3oy+hQoZTusDWXQ==
=g/G2
-----END PGP SIGNATURE-----

--Sig_/e9dqugCWODAQ208HfahNA5W--
