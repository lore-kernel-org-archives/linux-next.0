Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84437A832;
	Sun, 26 Jul 2026 21:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785101106; cv=none; b=uQxps1H9zNyeiUuLzjdq5FvpuRZs0J0k1tK0Y01BfhXgtW385QCHuD1qk0rUVHaC1pfEeLcyXFrl5Mc9AGTK1x7qQkmYIupRmH7SS7amgXG0BHpdIjzYl5gDX7DVoo7fy9+ADr0FFkc0uYSRQQo0YiWLDrKnN8Q08d68qYqdoQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785101106; c=relaxed/simple;
	bh=OTRCmdOGVPsrife2ZdHfGLwOhFXYQZv4m3lWHHnQBog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lluNewZuiNjeGvsmSztOUkfsClAktS64jZChb50x8F92krB7/kM/8bmxdeA0v79/Dt675KRja9mwz4YSaDAAXEuQwdEeyMuzerqNyBGfSFTOnFXGTiXLTH4ZSiOr26sRuoRmUMF6TSEpbCl/tAY8w0b87VSlI31CgPXujtD2LYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfUZVI/r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfUZVI/r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142431F000E9;
	Sun, 26 Jul 2026 21:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785101104;
	bh=bCUwRBEHWs9PCc149eaqnCS2GI/LuT80yT1RRNHQOs8=;
	h=Date:From:To:Cc:Subject;
	b=RfUZVI/rlcIG4jOb0C2EqqROPRFR146b9R9Ni9oEFtUnD9rP45psoVtsT2MndWGoG
	 vDkei0LL82PVRjOpqxItuR16F7oeTCNO1ZW8TXTPOFusAlTCz625MdhxzsqDkMz/V4
	 acbA8Q27uzJoGXkM+OjiU85Iws5Lfn3zLDUrZznZcMtJ+0VxtleFDeb5fB406hLmt2
	 A4aNq92Fo5yJgxDli9P6yhl0ooo95oYsV3zse9x0BGb8fXYe9jSFWx4sfAPHKe6h0W
	 JKJW2v07bL69AwwT3nmt3EZlFZ+au+e4shw8aVzoeFfA5BTSxwDCatz1c+Potrlgk7
	 7twi5/YmsrsRQ==
Date: Sun, 26 Jul 2026 22:24:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <amZ7K1lh3UDTqlf8@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lE0dhU5sER4aeu2U"
Content-Disposition: inline


--lE0dhU5sER4aeu2U
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c

between commits:

  8382cd234981a ("drm/amd/display: consolidate DCN vblank/flip handling ont=
o vupdate_no_lock")
  82730dba0cf9d ("drm/amd/display: Fix flip-done timeouts on mode1 reset")

=66rom the drm-fixes tree and commit:

  c87e6635d2db0 ("drm/amd/display: consolidate DCN vblank/flip handling ont=
o vupdate_no_lock")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 95d3da3c4199b,d63688b9d93dd..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@@ -34,6 -34,7 +34,7 @@@
  #include "amdgpu_dm_plane.h"
  #include "amdgpu_dm_trace.h"
  #include "amdgpu_dm_debugfs.h"
+ #include "amdgpu_dm_kunit_helpers.h"
  #include "modules/inc/mod_power.h"
 =20
  #define HPD_DETECTION_PERIOD_uS 2000000
@@@ -65,6 -66,7 +66,7 @@@ bool amdgpu_dm_crtc_modeset_required(st
  {
  	return crtc_state->active && drm_atomic_crtc_needs_modeset(crtc_state);
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_crtc_modeset_required);
 =20
  bool amdgpu_dm_crtc_vrr_active_irq(struct amdgpu_crtc *acrtc)
 =20
@@@ -74,6 -76,7 +76,7 @@@
  	       acrtc->dm_irq_params.freesync_config.state =3D=3D
  		       VRR_STATE_ACTIVE_FIXED;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_crtc_vrr_active_irq);
 =20
  int amdgpu_dm_crtc_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
  {
@@@ -93,12 -96,14 +96,14 @@@
  		      acrtc->crtc_id, enable ? "en" : "dis", rc);
  	return rc;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_crtc_set_vupdate_irq);
 =20
  bool amdgpu_dm_crtc_vrr_active(const struct dm_crtc_state *dm_state)
  {
  	return dm_state->freesync_config.state =3D=3D VRR_STATE_ACTIVE_VARIABLE =
||
  	       dm_state->freesync_config.state =3D=3D VRR_STATE_ACTIVE_FIXED;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_crtc_vrr_active);
 =20
  /**
   * amdgpu_dm_crtc_set_static_screen_optimze() - Toggle static screen opti=
mizations.
@@@ -156,6 -161,7 +161,7 @@@ bool amdgpu_dm_is_headless(struct amdgp
  	drm_connector_list_iter_end(&iter);
  	return is_headless;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_is_headless);
 =20
  static void amdgpu_dm_idle_worker(struct work_struct *work)
  {
@@@ -207,6 -213,7 +213,7 @@@ struct idle_workqueue *idle_create_work
 =20
  	return idle_work;
  }
+ EXPORT_IF_KUNIT(idle_create_workqueue);
 =20
  static void amdgpu_dm_crtc_vblank_control_worker(struct work_struct *work)
  {
@@@ -280,19 -287,10 +287,21 @@@ static inline int amdgpu_dm_crtc_set_vb
  	 * is enabled. On DCE, vupdate is only needed in VRR mode.
  	 */
  	if (amdgpu_ip_version(adev, DCE_HWIP, 0) !=3D 0) {
+ 		rc =3D amdgpu_dm_crtc_set_vupdate_irq(crtc, enable);
+ 	} else if (dc_supports_vrr(dm->dc->ctx->dce_version)) {
  		if (enable) {
 -			/* vblank irq on -> Only need vupdate irq in vrr mode */
 +			rc =3D amdgpu_irq_get(adev, &adev->vupdate_irq, irq_type);
 +			drm_dbg_vbl(crtc->dev, "Get vupdate_irq ret=3D%d\n", rc);
 +		} else {
 +			rc =3D amdgpu_irq_put(adev, &adev->vupdate_irq, irq_type);
 +			drm_dbg_vbl(crtc->dev, "Put vupdate_irq ret=3D%d\n", rc);
 +		}
 +	} else if (dc_supports_vrr(dm->dc->ctx->dce_version)) {
 +		if (enable) {
 +			/* vblank irq on -> Only need vupdate irq in vrr mode
 +			 * Not ref-counted since we need explicit enable/disable
 +			 * for DCE VRR handling
 +			 */
  			if (amdgpu_dm_crtc_vrr_active(acrtc_state))
  				rc =3D amdgpu_dm_crtc_set_vupdate_irq(crtc, true);
  		} else {
@@@ -460,13 -458,13 +469,13 @@@ static void amdgpu_dm_crtc_reset_state(
  {
  	struct dm_crtc_state *state;
 =20
+ 	state =3D kzalloc_obj(*state);
+ 	if (!state)
+ 		return;
+=20
  	if (crtc->state)
  		amdgpu_dm_crtc_destroy_state(crtc, crtc->state);
 =20
- 	state =3D kzalloc_obj(*state);
- 	if (WARN_ON(!state))
- 		return;
-=20
  	__drm_atomic_helper_crtc_reset(crtc, &state->base);
  }
 =20
@@@ -618,12 -616,13 +627,13 @@@ static void amdgpu_dm_crtc_update_crtc_
  		amdgpu_dm_crtc_count_crtc_active_planes(new_crtc_state);
  }
 =20
- static bool amdgpu_dm_crtc_helper_mode_fixup(struct drm_crtc *crtc,
- 				      const struct drm_display_mode *mode,
- 				      struct drm_display_mode *adjusted_mode)
+ STATIC_IFN_KUNIT bool amdgpu_dm_crtc_helper_mode_fixup(struct drm_crtc *c=
rtc,
+ 					       const struct drm_display_mode *mode,
+ 					       struct drm_display_mode *adjusted_mode)
  {
  	return true;
  }
+ EXPORT_IF_KUNIT(amdgpu_dm_crtc_helper_mode_fixup);
 =20
  static int amdgpu_dm_crtc_helper_atomic_check(struct drm_crtc *crtc,
  					      struct drm_atomic_commit *state)

--lE0dhU5sER4aeu2U
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmeyoACgkQJNaLcl1U
h9CxVAf+IW1R3hIjyRKKqzN5K7PCNEP45SKi6PUUyjJ0VXM/dUJsOaABbaIxxTX2
zeMYPf5l1ge3mQqSioz47lJe+IIqdN3BnRxK52PZWIe3JRS6023x2zi21gtUz4jo
1f9u8qIcGBJP+MaTYlfrDG6GiOo+4iuZXuQF4DIBBHPZTfXWC+CZxyshVCH193x2
1m4+lhPqFPL83gWOplyaiGxEZ4ppo/FG/eSW6SJmuf+v4bUqJVA36fbirBWAue4q
5Q0UIafMNxc0X9qDkoacT05yLLJ0OqNHY1u2Aiv1/Bb0TAZ3KVVATHnpa7NuyMN5
EzhS+nnvzEfY3duZIT3aa69Ru3MG+g==
=GwK1
-----END PGP SIGNATURE-----

--lE0dhU5sER4aeu2U--
