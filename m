From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Thu, 26 Feb 2015 11:15:36 +1100
Message-ID: <20150226111536.42e221b8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/BZmHcv/MbTU_y=k0diRyxl4"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:40936 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752891AbbBZAPn (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 25 Feb 2015 19:15:43 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>

--Sig_/BZmHcv/MbTU_y=k0diRyxl4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/intel_display.c between commit 62e537f8d568
("drm/i915: Fix frontbuffer false positve") from the drm-intel-fixes
tree and commit 6a418fcd84d6 ("drm/i915: Use fb modifiers in
intel_check_cursor_plane") from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_display.c
index 3117679299a6,2ac93909cfc5..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -2371,11 -2376,8 +2376,12 @@@ intel_alloc_plane_obj(struct intel_crt
  	struct drm_device *dev =3D crtc->base.dev;
  	struct drm_i915_gem_object *obj =3D NULL;
  	struct drm_mode_fb_cmd2 mode_cmd =3D { 0 };
+ 	struct drm_framebuffer *fb =3D &plane_config->fb->base;
 -	u32 base =3D plane_config->base;
 +	u32 base_aligned =3D round_down(plane_config->base, PAGE_SIZE);
 +	u32 size_aligned =3D round_up(plane_config->base + plane_config->size,
 +				    PAGE_SIZE);
 +
 +	size_aligned -=3D base_aligned;
 =20
  	if (plane_config->size =3D=3D 0)
  		return false;
@@@ -6640,9 -6678,10 +6693,10 @@@ i9xx_get_initial_plane_config(struct in
  	fb->pitches[0] =3D val & 0xffffffc0;
 =20
  	aligned_height =3D intel_fb_align_height(dev, fb->height,
- 					       plane_config->tiling);
+ 					       fb->pixel_format,
+ 					       fb->modifier[0]);
 =20
 -	plane_config->size =3D PAGE_ALIGN(fb->pitches[0] * aligned_height);
 +	plane_config->size =3D fb->pitches[0] * aligned_height;
 =20
  	DRM_DEBUG_KMS("pipe/plane %c/%d with fb: size=3D%dx%d@%d, offset=3D%x, p=
itch %d, size 0x%x\n",
  		      pipe_name(pipe), plane, fb->width, fb->height,
@@@ -7677,9 -7721,10 +7736,10 @@@ skylake_get_initial_plane_config(struc
  	fb->pitches[0] =3D (val & 0x3ff) * stride_mult;
 =20
  	aligned_height =3D intel_fb_align_height(dev, fb->height,
- 					       plane_config->tiling);
+ 					       fb->pixel_format,
+ 					       fb->modifier[0]);
 =20
 -	plane_config->size =3D ALIGN(fb->pitches[0] * aligned_height, PAGE_SIZE);
 +	plane_config->size =3D fb->pitches[0] * aligned_height;
 =20
  	DRM_DEBUG_KMS("pipe %c with fb: size=3D%dx%d@%d, offset=3D%x, pitch %d, =
size 0x%x\n",
  		      pipe_name(pipe), fb->width, fb->height,
@@@ -7768,9 -7818,10 +7833,10 @@@ ironlake_get_initial_plane_config(struc
  	fb->pitches[0] =3D val & 0xffffffc0;
 =20
  	aligned_height =3D intel_fb_align_height(dev, fb->height,
- 					       plane_config->tiling);
+ 					       fb->pixel_format,
+ 					       fb->modifier[0]);
 =20
 -	plane_config->size =3D PAGE_ALIGN(fb->pitches[0] * aligned_height);
 +	plane_config->size =3D fb->pitches[0] * aligned_height;
 =20
  	DRM_DEBUG_KMS("pipe %c with fb: size=3D%dx%d@%d, offset=3D%x, pitch %d, =
size 0x%x\n",
  		      pipe_name(pipe), fb->width, fb->height,
@@@ -12197,9 -12188,10 +12203,7 @@@ intel_check_cursor_plane(struct drm_pla
  		return -ENOMEM;
  	}
 =20
- 	/* we only need to pin inside GTT if cursor is non-phy */
- 	mutex_lock(&dev->struct_mutex);
- 	if (!INTEL_INFO(dev)->cursor_needs_physical && obj->tiling_mode) {
 -	if (fb =3D=3D crtc->cursor->fb)
 -		return 0;
 -
+ 	if (fb->modifier[0] !=3D DRM_FORMAT_MOD_NONE) {
  		DRM_DEBUG_KMS("cursor cannot be tiled\n");
  		ret =3D -EINVAL;
  	}

--Sig_/BZmHcv/MbTU_y=k0diRyxl4
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU7mWtAAoJEMDTa8Ir7ZwVBt8QAINvgRi5NLHTxdAun8wBTYdC
MusLbMAl0LyiKh0rFzYfr0QGaHb5LUf+tYeIszHrczHKn+ioOzzMTXoprHJ1+rZd
cbXHy2js4um1SA/UtJCJskCsYb3uzPBe3nv12TTdULJO2y4MU0kXtxS/bhm6WQeA
/3hBWNpR6B0pnBq1u+cg3nsNFs/ztUrXO7y6pV3TqJtJZsWmEV2tMJo6lIYm6y45
1RNSqdXxjtac2f5dN/sELjjisxa1y30clPLezSfAEQfSXfTeIADtI4yJGVBboW8T
IBfSsOmUJuDxViCqcOBN4yJF39NWW/3SRDPENUV8o3T01TLA0VHaQE5yqKK8iiTm
t/u7xFpW8ow2Mr18KnFwUyPBlyegkOxlL70pLwsYxnUTfnTWUp3tvhILuuIUaHiF
vdnFkfJ14vvwPLMFVC/5dmA+HcsCjNAKpoMWynqdyCbXvTWiOdKQkl2ztP5iuXRB
jVpHOWaHKuLtkpSiS/9nrk5MEbBsdcJbi0wVX9F3Nye5pPf5EVaSHWbF9NvrBZeo
scjIFSvEuF3ajT4mXNPp//HlzQciZv2PmN63D5lluZOKctn21ZpjxCqZm6/pgmQk
28YgZ4g4GMn/QvWQ6MYp1mng0iJ1HvGqQONZCsLMY9m7MG0FLWqZ3rROrjoykxxq
7+DTwKcXyMHo/XsfOUT/
=Uj3N
-----END PGP SIGNATURE-----

--Sig_/BZmHcv/MbTU_y=k0diRyxl4--
