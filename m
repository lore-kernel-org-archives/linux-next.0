From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Tue, 2 Apr 2019 10:50:06 +1100
Message-ID: <20190402105006.48f93e53@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1232090005=="
Return-path: <dri-devel-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Qiang Yu <yuq825@gmail.com>
List-Id: linux-next.vger.kernel.org

--===============1232090005==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/SZEXJadgHBuvyUe/0V=B28w"; protocol="application/pgp-signature"

--Sig_/SZEXJadgHBuvyUe/0V=B28w
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from include/linux/kernel.h:7,
                 from include/asm-generic/bug.h:18,
                 from arch/x86/include/asm/bug.h:83,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/gfp.h:5,
                 from include/linux/slab.h:15,
                 from drivers/gpu/drm/lima/lima_ctx.c:4:
drivers/gpu/drm/lima/lima_ctx.c: In function 'lima_ctx_create':
include/linux/limits.h:13:18: warning: passing argument 3 of 'xa_alloc' mak=
es pointer from integer without a cast [-Wint-conversion]
 #define UINT_MAX (~0U)
                  ^~~~~
drivers/gpu/drm/lima/lima_ctx.c:26:36: note: in expansion of macro 'UINT_MA=
X'
  err =3D xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
                                    ^~~~~~~~
In file included from include/linux/radix-tree.h:31,
                 from include/linux/idr.h:15,
                 from include/drm/drm_device.h:7,
                 from drivers/gpu/drm/lima/lima_device.h:7,
                 from drivers/gpu/drm/lima/lima_ctx.c:6:
include/linux/xarray.h:817:9: note: expected 'void *' but argument is of ty=
pe 'unsigned int'
   void *entry, struct xa_limit limit, gfp_t gfp)
   ~~~~~~^~~~~
drivers/gpu/drm/lima/lima_ctx.c:26:46: error: incompatible type for argumen=
t 4 of 'xa_alloc'
  err =3D xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
                                              ^~~
In file included from include/linux/radix-tree.h:31,
                 from include/linux/idr.h:15,
                 from include/drm/drm_device.h:7,
                 from drivers/gpu/drm/lima/lima_device.h:7,
                 from drivers/gpu/drm/lima/lima_ctx.c:6:
include/linux/xarray.h:817:32: note: expected 'struct xa_limit' but argumen=
t is of type 'struct lima_ctx *'
   void *entry, struct xa_limit limit, gfp_t gfp)
                ~~~~~~~~~~~~~~~~^~~~~

Caused by commit

  a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")

interacting with commit

  a3e4d3f97ec8 ("XArray: Redesign xa_alloc API")

from Linus' tree (v5.1-rc1).

I have applied the following patch for today.  It could be applied as
part of a merge of v5.1-rc1 into drm-misc.

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 2 Apr 2019 10:45:32 +1100
Subject: [PATCH] drm/lima: update for xa_alloc API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/lima/lima_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ct=
x.c
index c8d12f7c6894..bafa00d74cc5 100644
--- a/drivers/gpu/drm/lima/lima_ctx.c
+++ b/drivers/gpu/drm/lima/lima_ctx.c
@@ -23,7 +23,7 @@ int lima_ctx_create(struct lima_device *dev, struct lima_=
ctx_mgr *mgr, u32 *id)
 			goto err_out0;
 	}
=20
-	err =3D xa_alloc(&mgr->handles, id, UINT_MAX, ctx, GFP_KERNEL);
+	err =3D xa_alloc(&mgr->handles, id, ctx, XA_LIMIT(*id, UINT_MAX), GFP_KER=
NEL);
 	if (err < 0)
 		goto err_out0;
=20
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/SZEXJadgHBuvyUe/0V=B28w
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyio64ACgkQAVBC80lX
0Gyxmwf7BUUcO3jO4XZMNB1v76C3+C8HGbIcponmP/SqlaVSm0ERkTwh5rpHCQJ6
ckz2pUVtQOKWoRyzU9PkE061Qg5piQjIfW6aFGvVba8uyW/jXNXN9SgSDs9ldin5
9HoQAW/5hcV/wiK/0kSd3lzcJUZw12PaVozlEGsp7M4hnnO5MXsxzvzWhJE3dwqK
Ptj2T+XJu++rg8M4JacRlrq2AOuiydUC2M8EHbzqYek/ouNVj9QqPrGvAtCHzSrz
AvAunWUXF/nmSbs+xvYUtyZ8rGN1iokwqEZeVZLqskWffnfsHVzBU+08czc5tkRI
DijfB9yTtCwQvAD/PxNcM/p2WBAUhw==
=OqG1
-----END PGP SIGNATURE-----

--Sig_/SZEXJadgHBuvyUe/0V=B28w--

--===============1232090005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1232090005==--
