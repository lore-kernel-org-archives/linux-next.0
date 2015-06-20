From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the akpm tree
Date: Sun, 21 Jun 2015 00:31:39 +1000
Message-ID: <20150621003139.5cfdfcd6@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/CJdMeQg6PxuV8fYsTxouB4z"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:60411 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754462AbbFTObu (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Sat, 20 Jun 2015 10:31:50 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, Boris BREZILLON <boris.brezillon@free-electrons.com>

--Sig_/CJdMeQg6PxuV8fYsTxouB4z
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Andrew,

After merging the akpm tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/crypto/marvell/cesa.c: In function 'mv_cesa_get_sram':
drivers/crypto/marvell/cesa.c:324:2: error: implicit declaration of functio=
n 'of_get_named_gen_pool' [-Werror=3Dimplicit-function-declaration]
  engine->pool =3D of_get_named_gen_pool(cesa->dev->of_node,
  ^
drivers/crypto/marvell/cesa.c:324:15: warning: assignment makes pointer fro=
m integer without a cast
  engine->pool =3D of_get_named_gen_pool(cesa->dev->of_node,
               ^

Caused by commit:

  f63601fd616a ("crypto: marvell/cesa - add a new driver for Marvell's CESA=
")

from the crypto tree interacting with patch:

  "genalloc: rename of_get_named_gen_pool() to of_gen_pool_get()"

from the akpm tree.

I added this merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Sun, 21 Jun 2015 00:23:08 +1000
Subject: [PATCH] crypto: marvell/cesa - fix up for of_get_named_gen_pool()
 rename

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/crypto/marvell/cesa.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/marvell/cesa.c b/drivers/crypto/marvell/cesa.c
index a432633bced4..1c6f98dd88f4 100644
--- a/drivers/crypto/marvell/cesa.c
+++ b/drivers/crypto/marvell/cesa.c
@@ -321,9 +321,8 @@ static int mv_cesa_get_sram(struct platform_device *pde=
v, int idx)
 	const char *res_name =3D "sram";
 	struct resource *res;
=20
-	engine->pool =3D of_get_named_gen_pool(cesa->dev->of_node,
-					     "marvell,crypto-srams",
-					     idx);
+	engine->pool =3D of_gen_pool_get(cesa->dev->of_node,
+				       "marvell,crypto-srams", idx);
 	if (engine->pool) {
 		engine->sram =3D gen_pool_dma_alloc(engine->pool,
 						  cesa->sram_size,

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/CJdMeQg6PxuV8fYsTxouB4z
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVhXlUAAoJEMDTa8Ir7ZwVHV4P/3yJ4HqGZU/xB3qtexU6G1nP
ww1gQkJ5gN5+dDyJZFOS4w4pZnIvBzcC17881wjLjH0BXX22xWPY/VsKMUUqIz8L
9/wf9TjBfQpNzgxy8ldH/plcluaJyKQMg1xw+8YGE/3nbZ7vT1f2yuPb3dG/y6bL
15uQlDQwTAF+ytCq5hSaYsXINxk6LRuBkwO9FQaXAG1XdmEgHN73OZ8DnGfHO8bm
uG+aE832mq0XONjFE4t7e8FGGxvIKXSv4blx4kA0Z+XXfQmz2Qi7R3NX80x/dNGk
NWdma+pFw6eMR6sGqPcDVFgmNAAQKFZHy9vzRrjnJRg1zhJ878YLHejE+Fp1a3Aj
VK0pYxgqpXM5CM2cb6+TvhhjKYfOhP5Y8AvRmiaDJn68bZE6t8B20DAIj6xLW5Nr
/ifdh3G1ZCROJ4X4ykfXExh/4b13CMQEyjybmUJN3kUVdQrgAjC+ocSwjz3Hv8a3
qxNu26+ONKK1COHcQsgA2mLfedwZRMop/icCB2IR/DNok7ZXalKOShfhUA26tsU2
SQmfUpStUvBZ52FLJaB3p/TSpqWT+g3oe660KtWRMFhca0UxtfmLbpS7IA6aajYq
jpnussChuasIjv5+SrqqDLsjYDo6ZTbAXZbhOmBgryOqOR/DYh+N4omufmJzPoZn
E7DP27B7s8iMZq6DoVSs
=KdHu
-----END PGP SIGNATURE-----

--Sig_/CJdMeQg6PxuV8fYsTxouB4z--
