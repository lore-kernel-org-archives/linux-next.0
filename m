From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Date: Tue, 14 Jul 2015 12:11:12 +1000
Message-ID: <20150714121112.29dc5e75@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GmKGbOYBjtTBsDsshbfVgfI"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:55271 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751951AbbGNCLS (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 13 Jul 2015 22:11:18 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

--Sig_/GmKGbOYBjtTBsDsshbfVgfI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commit:

  8aa3053bf731 ("drm/i915: fix oops in primary_check_plane")

from the drm-intel-fixes tree and commit:

  da20eabd2c69 ("drm/i915: Split plane updates of crtc->atomic into a helpe=
r, v2.")

from the drm-intel tree.

I fixed it up (but it probably needs more - see below) and can carry
the fix as necessary.

Daniel, can you please merge your fixes branch into your main branch
(maybe after Linus has merged it) and fix these conflicts correctly as
these conflicts tend to go on and on as the files get changed.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_display.c
index 85ac6d85dc39,00c60c1c5162..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -4851,25 -4802,13 +4802,16 @@@ static void intel_crtc_disable_planes(s
  {
  	struct drm_device *dev =3D crtc->dev;
  	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
- 	struct intel_plane *intel_plane;
+ 	struct drm_plane *p;
  	int pipe =3D intel_crtc->pipe;
 =20
 +	if (!intel_crtc->active)
 +		return;
 +
- 	intel_crtc_wait_for_pending_flips(crtc);
-=20
- 	intel_pre_disable_primary(crtc);
-=20
  	intel_crtc_dpms_overlay_disable(intel_crtc);
- 	for_each_intel_plane(dev, intel_plane) {
- 		if (intel_plane->pipe =3D=3D pipe) {
- 			struct drm_crtc *from =3D intel_plane->base.crtc;
 =20
- 			intel_plane->disable_plane(&intel_plane->base,
- 						   from ?: crtc, true);
- 		}
- 	}
+ 	drm_for_each_plane_mask(p, dev, plane_mask)
+ 		to_intel_plane(p)->disable_plane(p, crtc);
 =20
  	/*
  	 * FIXME: Once we grow proper nuclear flip support out of this we need
@@@ -13382,47 -13751,11 +13757,14 @@@ static void intel_begin_crtc_commit(s=
tr
  	struct drm_device *dev =3D crtc->dev;
  	struct drm_i915_private *dev_priv =3D dev->dev_private;
  	struct intel_crtc *intel_crtc =3D to_intel_crtc(crtc);
- 	struct intel_plane *intel_plane;
- 	struct drm_plane *p;
- 	unsigned fb_bits =3D 0;
-=20
- 	/* Track fb's for any planes being disabled */
- 	list_for_each_entry(p, &dev->mode_config.plane_list, head) {
- 		intel_plane =3D to_intel_plane(p);
-=20
- 		if (intel_crtc->atomic.disabled_planes &
- 		    (1 << drm_plane_index(p))) {
- 			switch (p->type) {
- 			case DRM_PLANE_TYPE_PRIMARY:
- 				fb_bits =3D INTEL_FRONTBUFFER_PRIMARY(intel_plane->pipe);
- 				break;
- 			case DRM_PLANE_TYPE_CURSOR:
- 				fb_bits =3D INTEL_FRONTBUFFER_CURSOR(intel_plane->pipe);
- 				break;
- 			case DRM_PLANE_TYPE_OVERLAY:
- 				fb_bits =3D INTEL_FRONTBUFFER_SPRITE(intel_plane->pipe);
- 				break;
- 			}
 =20
- 			mutex_lock(&dev->struct_mutex);
- 			i915_gem_track_fb(intel_fb_obj(p->fb), NULL, fb_bits);
- 			mutex_unlock(&dev->struct_mutex);
- 		}
- 	}
-=20
- 	if (intel_crtc->atomic.wait_for_flips)
- 		intel_crtc_wait_for_pending_flips(crtc);
-=20
- 	if (intel_crtc->atomic.disable_fbc)
- 		intel_fbc_disable(dev);
+ 	if (!needs_modeset(crtc->state))
+ 		intel_pre_plane_update(intel_crtc);
 =20
 +	if (intel_crtc->atomic.disable_ips)
 +		hsw_disable_ips(intel_crtc);
 +
- 	if (intel_crtc->atomic.pre_disable_primary)
- 		intel_pre_disable_primary(crtc);
-=20
- 	if (intel_crtc->atomic.update_wm)
+ 	if (intel_crtc->atomic.update_wm_pre)
  		intel_update_watermarks(crtc);
 =20
  	intel_runtime_pm_get(dev_priv);

--Sig_/GmKGbOYBjtTBsDsshbfVgfI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVpG/EAAoJEMDTa8Ir7ZwVQiMP/0yATY3+2JvlKAlPKJ9FY/tt
n7xiRXxOk2LwQbVdPFmoD1vxe7VMc39z7xPqhHcaSW0SWORXWpCy5PlL1mzkHoXJ
2UFkrdmCArUrIn9xXMMl2NNHNlrjxsyit4v75itYOvXUFrelfB3vG7YNL8gzMJKt
DZRCAnBkeTPURJtYZ1D/Mmev3Oc1oCr/9pmHF/JpbgZYeHRsmzoceYhyxAluutXm
WuGAUKDo+Ux12gN2YUH5860LFQaL45o3ccDO+3YBbj+YbnCJcF6dOPPuhCxPYYSS
rYU32Z1HRvDU1kOHyFl/LUaPe/oG1vRVdmN3MLLN1UbSM9wu6fY4DyJJHnV/24B7
02Q9q+MleKcrJQ5BtovsZb7txSe1aAFi2G2VeZGsFjb8iBNl3jibJNcsaSc6FM2t
SFxSsVIETfnFh2N8TzC/sLJP7iWXuhKIIqHut+K5CvpgONn0LrBH2zZxYhbThjYf
Ovw2ZlMGIrq7/vQkDg2M9TksOSUM8J7Xi3HNTLo+dzIFpRbPWKePxQPk74kypbQo
h6fG07lSBmIh2cp1p2B+Jv4giLGKBoUj60gE/xblNMZAbdEjFe69YX9oSO/sDMOd
F4mR4yKwP2upLXVKGtQ4a5gUyQQw+rAmaYYmZ3MZWmkmPhmtIB0FLOfFTO6so9qM
K1TBdUqFHNK9rhV/pPSn
=0+x9
-----END PGP SIGNATURE-----

--Sig_/GmKGbOYBjtTBsDsshbfVgfI--
