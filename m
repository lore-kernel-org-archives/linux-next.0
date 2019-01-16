From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the block tree
Date: Wed, 16 Jan 2019 13:35:52 +1100
Message-ID: <20190116133552.37436b9c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qYOt_5uLb3ymrivCw=yJuQI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jens Axboe <axboe@kernel.dk>, Anna Schumaker <Anna.Schumaker@Netapp.com>, Trond Myklebust <trondmy@gmail.com>, NFS Mailing List <linux-nfs@vger.kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qYOt_5uLb3ymrivCw=yJuQI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the block tree, today's linux-next build (arm
multi_v7_defconfig) failed like this:

net/sunrpc/xprtsock.c: In function 'xs_flush_bvec':
net/sunrpc/xprtsock.c:390:2: error: implicit declaration of function 'for_e=
ach_bvec'; did you mean 'for_each_net'? [-Werror=3Dimplicit-function-declar=
ation]
  for_each_bvec(bv, bvec, bi, bi)
  ^~~~~~~~~~~~~
  for_each_net
net/sunrpc/xprtsock.c:390:33: error: expected ';' before 'flush_dcache_page'
  for_each_bvec(bv, bvec, bi, bi)
                                 ^
                                 ;
   flush_dcache_page(bv.bv_page);
   ~~~~~~~~~~~~~~~~~             =20

Caused by commit

  f3effe4c1240 ("block: rename bvec helpers")

interacting with commit

  6a829eb8619f ("SUNRPC: Fix TCP receive code on archs with flush_dcache_pa=
ge()")

from the nfs-anna tree.

[I love API changes :-(]

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Wed, 16 Jan 2019 13:32:59 +1100
Subject: [PATCH] SUNRPC: merge fix for "block: rename bvec helpers"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 net/sunrpc/xprtsock.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
index 7754aa3e434f..47f29cc23f27 100644
--- a/net/sunrpc/xprtsock.c
+++ b/net/sunrpc/xprtsock.c
@@ -387,7 +387,7 @@ xs_flush_bvec(const struct bio_vec *bvec, size_t count,=
 size_t seek)
 	struct bio_vec bv;
=20
 	bvec_iter_advance(bvec, &bi, seek & PAGE_MASK);
-	for_each_bvec(bv, bvec, bi, bi)
+	for_each_segment(bv, bvec, bi, bi)
 		flush_dcache_page(bv.bv_page);
 }
 #else
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/qYOt_5uLb3ymrivCw=yJuQI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+mIgACgkQAVBC80lX
0Gzuwwf+La/pohlEBDONJUvWmXyLlrYiTe4dk8pUR+R6ScpuMamN+xMQGOuTCHQj
5GNZuNvy2Rvh2H/r4qO3nGJxhWoJoDf8a1bffEK6Kveh6smUm1Ygfgz5DYyym9zN
CaaqG5cZtWDV02w4ipNiRVGBJqcUSuptKAXIxCZuxY7LYUCVFYv43vBLOKSB4BP9
/LkF53i/CF/cKUUHjqTcNEm61N1CO5lVPbCQHKg36Nrk+D09rYRuAdsS2KQHWSkZ
0UgqJBV5thYlLe43UaMcLAzbi6oUc3/GnP3phG+ocGvL4FIFbuA1GCZqX+7aLQQz
rHZCfdywXSNbL1creWVMxbsEgWudMQ==
=9hhs
-----END PGP SIGNATURE-----

--Sig_/qYOt_5uLb3ymrivCw=yJuQI--
