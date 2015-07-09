From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes trees
Date: Thu, 9 Jul 2015 11:02:26 +1000
Message-ID: <20150709110226.1cca4b83@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Ny7+kk6MqXLWk8_I2_EfbLy"; protocol="application/pgp-signature"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:57523 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751622AbbGIBCg (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 8 Jul 2015 21:02:36 -0400
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>, Jani Nikula <jani.nikula@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

--Sig_/Ny7+kk6MqXLWk8_I2_EfbLy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/intel_display.c

between commits:

  63fef06ada94 ("drm/i915: Check crtc->active in intel_crtc_disable_planes")
  dec4f799d0a4 ("drm/i915: Use crtc_state->active in primary check_plane fu=
nc")

from the drm-intel-fixes tree and commit:

  a539205a1628 ("drm/i915: atomic plane updates in a nutshell")
  da20eabd2c69 ("drm/i915: Split plane updates of crtc->atomic into a helpe=
r, v2.")

from the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary (no action
is required).

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

diff --cc drivers/gpu/drm/i915/intel_display.c
index ba9321998a41,4bcbff9793d4..000000000000
--- a/drivers/gpu/drm/i915/intel_display.c
+++ b/drivers/gpu/drm/i915/intel_display.c
@@@ -4851,25 -4800,13 +4800,16 @@@ static void intel_crtc_disable_planes(s
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

--Sig_/Ny7+kk6MqXLWk8_I2_EfbLy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJVncgqAAoJEMDTa8Ir7ZwV7E8P/2ITJaRfjOuHuTVhAw8fCBiY
O9vi6BBuf62jmCcS18JFy2j/oBbZrCcjggf5R+o21K9XS9d4uLmACwcgwdstbe5c
WA1MPsxgelB7iEiORAEzLQrPDkX5fp1skp2NaM4UCzrm67R+VbgOpxPUD/M5CTFO
/5CGUPtch2xzJyKSdRksgCGlwpV707cdt1AXE65LDkVqNfOvmQ86DHPiStMkI8+y
ePvsGkMbW3H0Bod6p+xyu3awTpAvHu69AbV34lX75e59e872naPIH1toViWIIjQj
CEbDtacQIdG4l3ug82J0gXxnkYRYql4LS+WI9o5GgvitCY56be28PBYWbtucMzv/
oleV0dg7m5BkLdtJohMZ+QD8xeEj9U+tpFRnTlSC0wsWvsNdSosVGvWIFFY90sMK
3+X80dcqzNfXNchyPY9XgqcoY/YnW1o+zqWhuC6fIVd8dFhVtcKluAp4xKxTKcJc
OlSMbmqaVHZnirKx9kxmoZjacDPilMUldoTFd7wHDP/coWYE4xDPwXMrvxelcciX
lHwhVn3b/0vHTkcVFgMtLCumGjNXifW7fL/tsJ0mqPQ7vln0GPxQT6pT6C1l1k5R
gSthqX74RhYWqPXpeFXyRGZ5tOH3BDJHtLnKUUw6JcWNDER8RnTO7AOqSdrGwVmK
BKPMvQzks14Jh7d/AjOd
=rYFT
-----END PGP SIGNATURE-----

--Sig_/Ny7+kk6MqXLWk8_I2_EfbLy--
