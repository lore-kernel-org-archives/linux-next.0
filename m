From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-misc tree
Date: Mon, 24 Oct 2016 11:24:52 +1100
Message-ID: <20161024112452.7945da3f@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:52381 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756185AbcJXAYz (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 23 Oct 2016 20:24:55 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>

Hi all,

After merging the drm-misc tree, today's linux-next build (x86_64
allmodconfig) failed like this:

In file included from drivers/gpu/drm/i915/intel_drv.h:32:0,
                 from drivers/gpu/drm/i915/intel_display.c:36:
drivers/gpu/drm/i915/intel_display.c: In function 'intel_primary_plane_crea=
te':
drivers/gpu/drm/i915/i915_drv.h:2601:40: error: 'struct drm_device' has no =
member named 'info'
 #define INTEL_GEN(dev_priv) ((dev_priv)->info.gen)
                                        ^
drivers/gpu/drm/i915/intel_display.c:15077:6: note: in expansion of macro '=
INTEL_GEN'
  if (INTEL_GEN(dev) >=3D 9) {
      ^
drivers/gpu/drm/i915/i915_drv.h:2601:40: error: 'struct drm_device' has no =
member named 'info' =20
 #define INTEL_GEN(dev_priv) ((dev_priv)->info.gen)
                                        ^
drivers/gpu/drm/i915/intel_display.c:15081:13: note: in expansion of macro =
'INTEL_GEN'
  } else if (INTEL_GEN(dev) >=3D 4) {=20
             ^
drivers/gpu/drm/i915/i915_drv.h:2601:40: error: 'struct drm_device' has no =
member named 'info' =20
 #define INTEL_GEN(dev_priv) ((dev_priv)->info.gen)
                                        ^
drivers/gpu/drm/i915/intel_display.c:15088:6: note: in expansion of macro '=
INTEL_GEN'
  if (INTEL_GEN(dev) >=3D 4)
      ^
drivers/gpu/drm/i915/intel_display.c: In function 'intel_cursor_plane_creat=
e':
drivers/gpu/drm/i915/i915_drv.h:2601:40: error: 'struct drm_device' has no =
member named 'info' =20
 #define INTEL_GEN(dev_priv) ((dev_priv)->info.gen)
                                        ^
drivers/gpu/drm/i915/intel_display.c:15231:6: note: in expansion of macro '=
INTEL_GEN'
  if (INTEL_GEN(dev) >=3D 4)
      ^

Caused by commit

  93ca7e006670 ("drm/i915: Use the per-plane rotation property")

interacting with commit

  55b8f2a76dff ("drm/i915: Make INTEL_GEN only take dev_priv")

from the drm-intel tree.

I added this merge fix patch:

=46rom 3d8024ddc9cd584e23e9ff4845a46475972c3d36 Mon Sep 17 00:00:00 2001
From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Mon, 24 Oct 2016 11:12:05 +1100
Subject: [PATCH] drm/i915: merge fix for INTEL_GEN API change

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/intel_display.c | 9 +++++----
 drivers/gpu/drm/i915/intel_sprite.c  | 2 +-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/in=
tel_display.c
index c2a8df968b03..89d73ab020e7 100644
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@ -15074,18 +15074,18 @@ static struct drm_plane *intel_primary_plane_crea=
te(struct drm_device *dev,
 	if (ret)
 		goto fail;
=20
-	if (INTEL_GEN(dev) >=3D 9) {
+	if (INTEL_GEN(dev_priv) >=3D 9) {
 		supported_rotations =3D
 			DRM_ROTATE_0 | DRM_ROTATE_90 |
 			DRM_ROTATE_180 | DRM_ROTATE_270;
-	} else if (INTEL_GEN(dev) >=3D 4) {
+	} else if (INTEL_GEN(dev_priv) >=3D 4) {
 		supported_rotations =3D
 			DRM_ROTATE_0 | DRM_ROTATE_180;
 	} else {
 		supported_rotations =3D DRM_ROTATE_0;
 	}
=20
-	if (INTEL_GEN(dev) >=3D 4)
+	if (INTEL_GEN(dev_priv) >=3D 4)
 		drm_plane_create_rotation_property(&primary->base,
 						   DRM_ROTATE_0,
 						   supported_rotations);
@@ -15199,6 +15199,7 @@ static struct drm_plane *intel_cursor_plane_create(=
struct drm_device *dev,
 {
 	struct intel_plane *cursor =3D NULL;
 	struct intel_plane_state *state =3D NULL;
+	struct drm_i915_private *dev_priv =3D to_i915(dev);
 	int ret;
=20
 	cursor =3D kzalloc(sizeof(*cursor), GFP_KERNEL);
@@ -15228,7 +15229,7 @@ static struct drm_plane *intel_cursor_plane_create(=
struct drm_device *dev,
 	if (ret)
 		goto fail;
=20
-	if (INTEL_GEN(dev) >=3D 4)
+	if (INTEL_GEN(dev_priv) >=3D 4)
 		drm_plane_create_rotation_property(&cursor->base,
 						   DRM_ROTATE_0,
 						   DRM_ROTATE_0 |
diff --git a/drivers/gpu/drm/i915/intel_sprite.c b/drivers/gpu/drm/i915/int=
el_sprite.c
index 9436d041389f..43d0350856e7 100644
--- a/drivers/gpu/drm/i915/intel_sprite.c
+++ b/drivers/gpu/drm/i915/intel_sprite.c
@@ -1126,7 +1126,7 @@ intel_plane_init(struct drm_device *dev, enum pipe pi=
pe, int plane)
 		goto fail;
 	}
=20
-	if (INTEL_GEN(dev) >=3D 9) {
+	if (INTEL_GEN(dev_priv) >=3D 9) {
 		supported_rotations =3D
 			DRM_ROTATE_0 | DRM_ROTATE_90 |
 			DRM_ROTATE_180 | DRM_ROTATE_270;
--=20
2.8.1

--=20
Cheers,
Stephen Rothwell
