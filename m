From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Wed, 25 Feb 2015 12:05:08 +1100
Message-ID: <20150225120508.3213701c@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/fxELgFeesQsoG1n1=J9QvqC"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48566 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751226AbbBYBFT (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 24 Feb 2015 20:05:19 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Damien Lespiau <damien.lespiau@intel.com>

--Sig_/fxELgFeesQsoG1n1=J9QvqC
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in
drivers/gpu/drm/i915/intel_display.c between commit f37b5c2be897
("drm/i915: Align initial plane backing objects correctly") from the
drm-intel-fixes tree and commit 6bf129df6ffa ("drm/i915: Use an
intermediate variable to avoid repeating ourselves") from the drm-intel
tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_display.c
index bf19a5cce4a8,2ac93909cfc5..000000000000
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

--Sig_/fxELgFeesQsoG1n1=J9QvqC
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJU7R/LAAoJEMDTa8Ir7ZwVzmYP/1eufB7Z4+LL1DxqJuJq+fNz
TRZc9iv9QPLVjEmBtLRLuc4nWhMQFYYcBKBxSdHRojmsjCxxcwCNiOQWscaIido3
vf0GugqzOk1lcwssOvibojiqnonv4CCiO2CKixBAZtNQgD0Iu37fCQoxn9ZBPW6I
do9mCPScjvH1yzBtzapCHZZgqDoVhxpfSJzQqW0pOsrkYdscAPCmvxyOZZy1y2ng
PMtP88sfRoqBQTpqV5zaZwGYJT5KugW694ctI80cdZhUHbT9eJN43sD8+ii5wdix
pvEWM3nw0hQvpHIEbIB5DQ6CA9tN8RaDpckLQLViEfk/nIerS2wH5xXRbjgYD88J
XBFbHkGcrLVEyHzlWspzoLfeKRJF2R7CisntuqOgLXNmAZrCC0jaEdK+iqLTdJuD
Hbj4nGhIvrtRsY74h5idShUiYuvmRtLvvNco0l/lv+GSczI12to/9enBVXDGxgfe
zkSv5AfXsqPqUAvzwgzOE4c4rB0HGGxlxtUxou4XiO1p4S3/52oF/2cCJToSfb5l
bpJPaWpaNB5uq0LpJr9tKutaPogCs0ZYUYlHUVlX48oWbCrfxVoQCDbh+JeJulrz
/OXA+ddkH+W1an7YkKTBPpP8ZPfn2eU//fzTTCnwwas4JfGMHE/hNLZrfevgNoFi
KULLMIH26DplCXClnIeM
=+EXa
-----END PGP SIGNATURE-----

--Sig_/fxELgFeesQsoG1n1=J9QvqC--
