From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the mali-dp tree
Date: Tue, 15 Jan 2019 10:46:19 +1100
Message-ID: <20190115104619.516be4b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ORRWyQUNNFs.5NO+mj+mV2/"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Liviu Dudau <Liviu.Dudau@arm.com>, Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>, Boris Brezillon <boris.brezillon@bootlin.com>, "James Qian Wang (Arm Technology China)" <james.qian.wang@arm.com>
List-Id: linux-next.vger.kernel.org

--Sig_/ORRWyQUNNFs.5NO+mj+mV2/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Liviu,

After merging the mali-dp tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c: In function 'komed=
a_pipeline_obj_add':
drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:48:30: error: passi=
ng argument 1 of 'drm_atomic_private_obj_init' from incompatible pointer ty=
pe [-Werror=3Dincompatible-pointer-types]
  drm_atomic_private_obj_init(&pipe->obj, &st->obj,
                              ^~~~~~~~~~
In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:=
11,
                 from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
                 from drivers/gpu/drm/arm/display/komeda/komeda_private_obj=
.c:7:
include/drm/drm_atomic.h:437:53: note: expected 'struct drm_device *' but a=
rgument is of type 'struct drm_private_obj *'
 void drm_atomic_private_obj_init(struct drm_device *dev,
                                  ~~~~~~~~~~~~~~~~~~~^~~
drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:48:42: error: passi=
ng argument 2 of 'drm_atomic_private_obj_init' from incompatible pointer ty=
pe [-Werror=3Dincompatible-pointer-types]
  drm_atomic_private_obj_init(&pipe->obj, &st->obj,
                                          ^~~~~~~~
In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:=
11,
                 from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
                 from drivers/gpu/drm/arm/display/komeda/komeda_private_obj=
.c:7:
include/drm/drm_atomic.h:438:30: note: expected 'struct drm_private_obj *' =
but argument is of type 'struct drm_private_state *'
      struct drm_private_obj *obj,
      ~~~~~~~~~~~~~~~~~~~~~~~~^~~
drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:49:9: error: passin=
g argument 3 of 'drm_atomic_private_obj_init' from incompatible pointer typ=
e [-Werror=3Dincompatible-pointer-types]
         &komeda_pipeline_obj_funcs);
         ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:=
11,
                 from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
                 from drivers/gpu/drm/arm/display/komeda/komeda_private_obj=
.c:7:
include/drm/drm_atomic.h:439:32: note: expected 'struct drm_private_state *=
' but argument is of type 'const struct drm_private_state_funcs *'
      struct drm_private_state *state,
      ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c:48:2: error: too fe=
w arguments to function 'drm_atomic_private_obj_init'
  drm_atomic_private_obj_init(&pipe->obj, &st->obj,
  ^~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from drivers/gpu/drm/arm/display/komeda/komeda_pipeline.h:=
11,
                 from drivers/gpu/drm/arm/display/komeda/komeda_dev.h:12,
                 from drivers/gpu/drm/arm/display/komeda/komeda_private_obj=
.c:7:
include/drm/drm_atomic.h:437:6: note: declared here
 void drm_atomic_private_obj_init(struct drm_device *dev,
      ^~~~~~~~~~~~~~~~~~~~~~~~~~~

Caused by commit

  61f1c4a8ab75 ("drm/komeda: Attach komeda_dev to DRM-KMS")

interacting with commit

  b962a12050a3 ("drm/atomic: integrate modeset lock with private objects")

from the drm tree.

I have applied the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Tue, 15 Jan 2019 10:42:04 +1100
Subject: [PATCH] drm/komeda: merge fix for drm_atomic_private_obj_init() AP=
I change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c b/driv=
ers/gpu/drm/arm/display/komeda/komeda_private_obj.c
index 9edfd6ab0c12..f1c9e3fefa86 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_private_obj.c
@@ -45,7 +45,7 @@ static int komeda_pipeline_obj_add(struct komeda_kms_dev =
*kms,
 		return -ENOMEM;
=20
 	st->pipe =3D pipe;
-	drm_atomic_private_obj_init(&pipe->obj, &st->obj,
+	drm_atomic_private_obj_init(&kms->base, &pipe->obj, &st->obj,
 				    &komeda_pipeline_obj_funcs);
=20
 	return 0;
--=20
2.20.1

--=20
Cheers,
Stephen Rothwell

--Sig_/ORRWyQUNNFs.5NO+mj+mV2/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw9H0sACgkQAVBC80lX
0Gwjlwf/fLC7NhKAYLX0MfKAV3Sx4pyviHg7su3pI8w3NV2t77JA0IQkb1DkHlDt
SaxCtG0XjnG26nvWduG1RoESnHyVvtKX2uXFdS+nT06PxRjMbbLrqLsJ34Z6GHdr
G2CJxpz/wjmhVELrCY+StBs4+AN/y7Kp5PmSsugdsUBhX+NTOnsfCRKy+IoSGDrn
tUdC2oH5u/W1NxCA7rrggCmA371GJRt2eEiTElpnurcuiv5ZPVb7qkPRyIjZGF3G
CUMaJtISlQLNCir1bVILE21l69PItX5omR/VL6Bk7yIrCtFGXMavpazO4ZS5LqBr
0vBRBDPjVH9mjGebfHe/FHSgOXMJsA==
=W9EV
-----END PGP SIGNATURE-----

--Sig_/ORRWyQUNNFs.5NO+mj+mV2/--
