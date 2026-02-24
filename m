Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8040C37FF4E;
	Tue, 24 Feb 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771937040; cv=none; b=Jnufvs4pssgWofg9LX0EeLridt9uTtBjNwRLp5oxKO6BsE3fRG2HssAaYVsvtIegr9gTwBDvw+E+r6LC0x25E4t7zfNVmdw7/PRujI0RpLiYDcJ69LxumzFyhDziaQeKyAqnvSl2Uj3BuedcwbwFb3BzopL1CV2Do6t/20dcZ3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771937040; c=relaxed/simple;
	bh=+8lBKc2uVHXIJhHf5Dd5bljRoBqRLmLS5u9J6s0Wshs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BEz9oU0mLAouiVDaXvWl17kRsV+x1IfAiIjp1zmITy0Qk0bkWrtPM7UX2kYqjp6ZayVUsIyd/MTzbDhATO+SVcT8uiZNsEmRfFfIhEC+BJr6okZIXUoAf3Jiq7WePy3jmqvk68s7PMK3a3zo6lucaBbn7TzCa333d1PpgvptchE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RHofB9v6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RHofB9v6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991C8C19422;
	Tue, 24 Feb 2026 12:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771937040;
	bh=+8lBKc2uVHXIJhHf5Dd5bljRoBqRLmLS5u9J6s0Wshs=;
	h=Date:From:To:Cc:Subject:From;
	b=RHofB9v6w2VQ59HffX6KQO671UvvMCPR9fa6I4WNio3R1efauDCyAfoceezs6bwpd
	 GZ/ZUJMaDKvhF8YOtmyC0EhhGaPoGreRYKaBH/rMJN7G3TC2GlvrLe9XZhYXiG4n16
	 iz64JL04bc9bu/RnPegRDnnGwa0ZVwT2KtvEMNkvBWyIxrcQVl++PM8bvJlo87evE2
	 daUkCJ0UgW1PhvmpG9z6WIN370bFyrOusTGDL0/aOD8akHJ0jNob1D4YkBjSqn1+gL
	 tbLcCJmxkHwnyQSTLkaRkMjtWYcy762z2moLQFBAq7xxynDXSEPcNSIp7tDPzGMymQ
	 TSINZ4WRE6T+A==
Date: Tue, 24 Feb 2026 12:43:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <aZ2dC79MyrPKedf0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kVLM52Qkn2zFqzHU"
Content-Disposition: inline


--kVLM52Qkn2zFqzHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_wa.c

between commit:

  bc6387a2e0c15 ("drm/xe/xe2_hpg: Fix handling of Wa_14019988906 & Wa_14019=
877138")

=66rom the origin tree and commits:

  97ec6cb8109ce ("drm/xe: Consolidate workaround entries for Wa_15016589081=
")
  fe681e7b44d78 ("drm/xe: Consolidate workaround entries for Wa_18033852989=
")
  c2142a1a84152 ("drm/xe: Consolidate workaround entries for Wa_14019988906=
")
  f0d6d356f8ac4 ("drm/xe: Consolidate workaround entries for Wa_14019386621=
")
  55b19abb6c44d ("drm/xe: Consolidate workaround entries for Wa_14019877138=
")
  7b6f615d2b1f0 ("drm/xe: Consolidate workaround entries for Wa_13012615864=
")
  a9b2f1467464f ("drm/xe: Consolidate workaround entries for Wa_14021402888=
")
  909a0bcd37c6c ("drm/xe: Consolidate workaround entries for Wa_16021639441=
")
  792880cada369 ("drm/xe: Consolidate workaround entries for Wa_14018471104=
")
  37681c32f2597 ("drm/xe: Consolidate workaround entries for Wa_14020338487=
")
  1aaea53115870 ("drm/xe: Consolidate workaround entries for Wa_16018712365=
")
  ef32868d58490 ("drm/xe: Consolidate workaround entries for Wa_18032247524=
")
  6b4578b7c1b5b ("drm/xe: Consolidate workaround entries for Wa_16021865536=
")
  c9459e8c8baa9 ("drm/xe: Consolidate workaround entries for Wa_16028005424=
")
  aa0f0a678370b ("drm/xe: Consolidate workaround entries for Wa_14019449301=
")
  941f538b0af81 ("drm/xe: Consolidate workaround entries for Wa_16021867713=
")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_wa.c
index c7b1bd79ab17b,50f5d3381b4cd..0000000000000
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@@ -111,6 -111,17 +111,17 @@@
   *    difference of how they are maintained in the code. In xe it uses the
   *    xe_rtp infrastructure so the workarounds can be kept in tables, fol=
lowing
   *    a more declarative approach rather than procedural.
+  *
+  * .. note::
+  *    When a workaround applies to every single known IP version in a ran=
ge,
+  *    the preferred handling is to use a single range-based RTP entry rat=
her
+  *    than individual entries for each version, even if some of the inter=
mediate
+  *    version numbers are currently unused.  If a new intermediate IP ver=
sion
+  *    appears in the future and is enabled in the driver, any existing
+  *    range-based entries that contain the new version number will need t=
o be
+  *    analyzed to determine whether their workarounds should apply to the=
 new
+  *    version, or whether any existing range based entries needs to be sp=
lit
+  *    into two entries that do not include the new intermediate version.
   */
 =20
  #undef XE_REG_MCR
@@@ -120,6 -131,8 +131,8 @@@ __diag_push()
  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
 =20
  static const struct xe_rtp_entry_sr gt_was[] =3D {
+ 	/* Workarounds applying over a range of IPs */
+=20
  	{ XE_RTP_NAME("14011060649"),
  	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1200, 1255),
  		       ENGINE_CLASS(VIDEO_DECODE),
@@@ -135,6 -148,22 +148,22 @@@
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1260)),
  	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
  	},
+ 	{ XE_RTP_NAME("16021867713"),
+ 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1300, 3002),
+ 		       ENGINE_CLASS(VIDEO_DECODE)),
+ 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
+ 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+ 	},
+ 	{ XE_RTP_NAME("14019449301"),
+ 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 2000), ENGINE_CLASS(VIDEO_DECOD=
E)),
+ 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
+ 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
+ 	},
+ 	{ XE_RTP_NAME("16028005424"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), OR,
+ 		       MEDIA_VERSION_RANGE(1301, 3500)),
+ 	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
+ 	},
 =20
  	/* DG1 */
 =20
@@@ -191,10 -220,6 +220,6 @@@
 =20
  	/* Xe_LPG */
 =20
- 	{ XE_RTP_NAME("14015795083"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1271), GRAPHICS_STEP(A0, B0)=
),
- 	  XE_RTP_ACTIONS(CLR(MISCCPCTL, DOP_CLOCK_GATE_RENDER_ENABLE))
- 	},
  	{ XE_RTP_NAME("14018575942"),
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
  	  XE_RTP_ACTIONS(SET(COMP_MOD_CTRL, FORCE_MISS_FTLB))
@@@ -206,12 -231,6 +231,6 @@@
 =20
  	/* Xe_LPM+ */
 =20
- 	{ XE_RTP_NAME("16021867713"),
- 	  XE_RTP_RULES(MEDIA_VERSION(1300),
- 		       ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
  	{ XE_RTP_NAME("22016670082"),
  	  XE_RTP_RULES(MEDIA_VERSION(1300)),
  	  XE_RTP_ACTIONS(SET(XELPMP_SQCNT1, ENFORCE_RAR))
@@@ -225,17 -244,6 +244,6 @@@
  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
  	},
- 	{ XE_RTP_NAME("16021867713"),
- 	  XE_RTP_RULES(MEDIA_VERSION(2000),
- 		       ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
- 	{ XE_RTP_NAME("14019449301"),
- 	  XE_RTP_RULES(MEDIA_VERSION(2000), ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
 =20
  	/* Xe2_HPG */
 =20
@@@ -249,20 -257,6 +257,6 @@@
  			     LSN_DIM_Z_WGT(1)))
  	},
 =20
- 	/* Xe2_HPM */
-=20
- 	{ XE_RTP_NAME("16021867713"),
- 	  XE_RTP_RULES(MEDIA_VERSION(1301),
- 		       ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
- 	{ XE_RTP_NAME("14019449301"),
- 	  XE_RTP_RULES(MEDIA_VERSION(1301), ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
-=20
  	/* Xe3_LPG */
 =20
  	{ XE_RTP_NAME("14021871409"),
@@@ -272,43 -266,48 +266,48 @@@
 =20
  	/* Xe3_LPM */
 =20
- 	{ XE_RTP_NAME("16021867713"),
- 	  XE_RTP_RULES(MEDIA_VERSION(3000),
- 		       ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
  	{ XE_RTP_NAME("16021865536"),
- 	  XE_RTP_RULES(MEDIA_VERSION(3000),
+ 	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3002),
  		       ENGINE_CLASS(VIDEO_DECODE)),
  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
  	},
- 	{ XE_RTP_NAME("16021865536"),
- 	  XE_RTP_RULES(MEDIA_VERSION(3002),
- 		       ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
- 	{ XE_RTP_NAME("16021867713"),
- 	  XE_RTP_RULES(MEDIA_VERSION(3002),
- 		       ENGINE_CLASS(VIDEO_DECODE)),
- 	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F1C(0), MFXPIPE_CLKGATE_DIS)),
- 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
- 	},
  	{ XE_RTP_NAME("14021486841"),
  	  XE_RTP_RULES(MEDIA_VERSION(3000), MEDIA_STEP(A0, B0),
  		       ENGINE_CLASS(VIDEO_DECODE)),
  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
  	},
+=20
+ 	/* Xe3P_LPG */
+=20
+ 	{ XE_RTP_NAME("14025160223"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
+ 	  XE_RTP_ACTIONS(SET(MMIOATSREQLIMIT_GAM_WALK_3D,
+ 			     DIS_ATS_WRONLY_PG))
+ 	},
+ 	{ XE_RTP_NAME("16028780921"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
+ 	  XE_RTP_ACTIONS(SET(CCCHKNREG2, LOCALITYDIS))
+ 	},
+ 	{ XE_RTP_NAME("14026144927"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
+ 	  XE_RTP_ACTIONS(SET(L3SQCREG2, L3_SQ_DISABLE_COAMA_2WAY_COH |
+ 			     L3_SQ_DISABLE_COAMA))
+ 	},
+ 	{ XE_RTP_NAME("14025635424"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
+ 	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL2, STLB_SINGLE_BANK_MODE))
+ 	},
  	{ XE_RTP_NAME("16028005424"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0)),
  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
  	},
  };
 =20
  static const struct xe_rtp_entry_sr engine_was[] =3D {
+ 	/* Workarounds applying over a range of IPs */
+=20
  	{ XE_RTP_NAME("22010931296, 18011464164, 14010919138"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(1200), ENGINE_CLASS(RENDER)),
  	  XE_RTP_ACTIONS(SET(FF_THREAD_MODE(RENDER_RING_BASE),
@@@ -344,6 -343,48 +343,48 @@@
  	  XE_RTP_ACTIONS(SET(FF_SLICE_CS_CHICKEN1(RENDER_RING_BASE),
  			     FFSC_PERCTX_PREEMPT_CTRL))
  	},
+ 	{ XE_RTP_NAME("18032247524"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABL=
E))
+ 	},
+ 	{ XE_RTP_NAME("16018712365"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS=
))
+ 	},
+ 	{ XE_RTP_NAME("14020338487"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
+ 	},
+ 	{ XE_RTP_NAME("14018471104"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE=
_CONTROL))
+ 	},
+ 	/*
+ 	 * Although this workaround isn't required for the RCS, disabling these
+ 	 * reports has no impact for our driver or the GuC, so we go ahead and
+ 	 * apply this to all engines for simplicity.
+ 	 */
+ 	{ XE_RTP_NAME("16021639441"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), OR,
+ 		       MEDIA_VERSION_RANGE(1301, 2000)),
+ 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
+ 			     GHWSP_CSB_REPORT_DIS |
+ 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
+ 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ 	{ XE_RTP_NAME("14021402888"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3005), ENGINE_CLASS(RENDER)),
+ 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
+ 	},
+ 	{ XE_RTP_NAME("13012615864"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 3005),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+ 	},
 =20
  	/* TGL */
 =20
@@@ -459,11 -500,6 +500,6 @@@
  		       ENGINE_CLASS(COMPUTE)),
  	  XE_RTP_ACTIONS(SET(RING_HWSTAM(RENDER_RING_BASE), ~0))
  	},
- 	{ XE_RTP_NAME("14014999345"),
- 	  XE_RTP_RULES(PLATFORM(PVC), ENGINE_CLASS(COMPUTE),
- 		       GRAPHICS_STEP(B0, C0)),
- 	  XE_RTP_ACTIONS(SET(CACHE_MODE_SS, DISABLE_ECC))
- 	},
 =20
  	/* Xe_LPG */
 =20
@@@ -486,149 -522,48 +522,48 @@@
 =20
  	/* Xe2_LPG */
 =20
- 	{ XE_RTP_NAME("18032247524"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABL=
E))
- 	},
- 	{ XE_RTP_NAME("16018712365"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or=
_compute)),
- 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS=
))
- 	},
- 	{ XE_RTP_NAME("14020338487"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or=
_compute)),
- 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
- 	},
  	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP=
(A0, B0) */
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN4, DISABLE_TDL_PUSH))
  	},
- 	{ XE_RTP_NAME("14018471104"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or=
_compute)),
- 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE=
_CONTROL))
- 	},
- 	/*
- 	 * These two workarounds are the same, just applying to different
- 	 * engines.  Although Wa_18032095049 (for the RCS) isn't required on
- 	 * all steppings, disabling these reports has no impact for our
- 	 * driver or the GuC, so we go ahead and treat it the same as
- 	 * Wa_16021639441 which does apply to all steppings.
- 	 */
- 	{ XE_RTP_NAME("18032095049, 16021639441"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004)),
- 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
- 			     GHWSP_CSB_REPORT_DIS |
- 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
- 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 	},
  	{ XE_RTP_NAME("16018610683"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or=
_compute)),
  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, SLM_WMTP_RESTORE))
  	},
- 	{ XE_RTP_NAME("14021402888"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
- 	},
- 	{ XE_RTP_NAME("13012615864"),
+ 	{ XE_RTP_NAME("18041344222"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
+ 		       FUNC(xe_rtp_match_first_render_or_compute),
+ 		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
+ 	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
  	},
 =20
  	/* Xe2_HPG */
 =20
- 	{ XE_RTP_NAME("16018712365"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS=
))
- 	},
  	{ XE_RTP_NAME("16018737384"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED=
),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2999),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
  	},
- 	{ XE_RTP_NAME("14020338487"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
- 	},
- 	{ XE_RTP_NAME("18032247524"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, SEQUENTIAL_ACCESS_UPGRADE_DISABL=
E))
- 	},
- 	{ XE_RTP_NAME("14018471104"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, ENABLE_SMP_LD_RENDER_SURFACE=
_CONTROL))
- 	},
- 	/*
- 	 * Although this workaround isn't required for the RCS, disabling these
- 	 * reports has no impact for our driver or the GuC, so we go ahead and
- 	 * apply this to all engines for simplicity.
- 	 */
- 	{ XE_RTP_NAME("16021639441"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002)),
- 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
- 			     GHWSP_CSB_REPORT_DIS |
- 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
- 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 	},
  	{ XE_RTP_NAME("14019811474"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0, WR_REQ_CHAINING_DIS))
  	},
- 	{ XE_RTP_NAME("14021402888"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
- 	},
  	{ XE_RTP_NAME("14021821874, 14022954250"),
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
  	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
  	},
- 	{ XE_RTP_NAME("13012615864"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
- 	},
  	{ XE_RTP_NAME("18041344222"),
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
  		       FUNC(xe_rtp_match_first_render_or_compute),
- 		       FUNC(xe_rtp_match_not_sriov_vf),
  		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
  	},
 =20
- 	/* Xe2_LPM */
-=20
- 	{ XE_RTP_NAME("16021639441"),
- 	  XE_RTP_RULES(MEDIA_VERSION(2000)),
- 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
- 			     GHWSP_CSB_REPORT_DIS |
- 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
- 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 	},
-=20
- 	/* Xe2_HPM */
-=20
- 	{ XE_RTP_NAME("16021639441"),
- 	  XE_RTP_RULES(MEDIA_VERSION(1301)),
- 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0),
- 			     GHWSP_CSB_REPORT_DIS |
- 			     PPHWSP_CSB_AND_TIMESTAMP_REPORT_DIS,
- 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 	},
-=20
  	/* Xe3_LPG */
 =20
- 	{ XE_RTP_NAME("14021402888"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
- 	},
  	{ XE_RTP_NAME("18034896535"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
@@@ -641,35 -576,40 +576,40 @@@
  				   SMP_FORCE_128B_OVERFETCH))
  	},
  	{ XE_RTP_NAME("14023061436"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
- 		       FUNC(xe_rtp_match_first_render_or_compute), OR,
- 		       GRAPHICS_VERSION_RANGE(3003, 3005),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005),
  		       FUNC(xe_rtp_match_first_render_or_compute)),
  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_DISABLE))
  	},
- 	{ XE_RTP_NAME("13012615864"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
- 		       GRAPHICS_VERSION_RANGE(3003, 3005),
- 		       FUNC(xe_rtp_match_first_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
- 	},
  	{ XE_RTP_NAME("16023105232"),
  	  XE_RTP_RULES(MEDIA_VERSION_RANGE(1301, 3000), OR,
  		       GRAPHICS_VERSION_RANGE(2001, 3001)),
  	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
  			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
  	},
- 	{ XE_RTP_NAME("14021402888"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3003, 3005), FUNC(xe_rtp_match_fir=
st_render_or_compute)),
- 	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
- 	},
  	{ XE_RTP_NAME("18041344222"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(3000),
  		       FUNC(xe_rtp_match_first_render_or_compute),
- 		       FUNC(xe_rtp_match_not_sriov_vf),
  		       FUNC(xe_rtp_match_gt_has_discontiguous_dss_groups)),
  	  XE_RTP_ACTIONS(SET(TDL_CHICKEN, EUSTALL_PERF_SAMPLING_DISABLE))
  	},
+=20
+ 	/* Xe3p_LPG*/
+=20
+ 	{ XE_RTP_NAME("22021149932"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, SAMPLER_LD_LSC_DISABLE))
+ 	},
+ 	{ XE_RTP_NAME("14025676848"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, LSCFE_SAME_ADDRESS_ATOMICS_C=
OALESCING_DISABLE))
+ 	},
+ 	{ XE_RTP_NAME("16028951944"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0, B0),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(ROW_CHICKEN5, CPSS_AWARE_DIS))
+ 	},
  };
 =20
  static const struct xe_rtp_entry_sr lrc_was[] =3D {
@@@ -706,6 -646,26 +646,26 @@@
  	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, DISABLE_TDC_LOAD_BALANCING_C=
ALC))
  	},
+ 	{ XE_RTP_NAME("14019877138"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, 2004), ENGINE_CLASS(RENDER)),
+ 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
+ 	},
+ 	{ XE_RTP_NAME("14019386621"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+ 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE=
))
+ 	},
+ 	{ XE_RTP_NAME("14019988906"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+ 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
+ 	},
+ 	{ XE_RTP_NAME("18033852989"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+ 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGL=
E_TEST))
+ 	},
+ 	{ XE_RTP_NAME("15016589081"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004), ENGINE_CLASS(RENDER)),
+ 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
+ 	},
 =20
  	/* DG1 */
 =20
@@@ -742,10 -702,6 +702,6 @@@
  	  XE_RTP_RULES(PLATFORM(DG2)),
  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
  	},
- 	{ XE_RTP_NAME("14019877138"),
- 	  XE_RTP_RULES(PLATFORM(DG2)),
- 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
- 	},
 =20
  	/* PVC */
 =20
@@@ -763,29 -719,9 +719,9 @@@
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1, MSAA_OPTIMIZATION_REDUC_DISABLE))
  	},
- 	{ XE_RTP_NAME("14019877138"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
- 	},
 =20
  	/* Xe2_LPG */
 =20
- 	{ XE_RTP_NAME("14019386621"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE=
))
- 	},
- 	{ XE_RTP_NAME("14019877138"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
- 	},
- 	{ XE_RTP_NAME("14019988906"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
- 	},
- 	{ XE_RTP_NAME("18033852989"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGL=
E_TEST))
- 	},
  	{ XE_RTP_NAME("14021567978"),
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED=
),
  		       ENGINE_CLASS(RENDER)),
@@@ -805,32 -741,16 +741,24 @@@
  			     DIS_PARTIAL_AUTOSTRIP |
  			     DIS_AUTOSTRIP))
  	},
- 	{ XE_RTP_NAME("15016589081"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
- 	},
 =20
  	/* Xe2_HPG */
  	{ XE_RTP_NAME("15010599737"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_SF_ROUND_NEAREST_EVEN))
  	},
- 	{ XE_RTP_NAME("14019386621"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD, XE2_VFG_TED_CREDIT_INTERFACE_DISABLE=
))
- 	},
  	{ XE_RTP_NAME("14020756599"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
  	  XE_RTP_ACTIONS(SET(WM_CHICKEN3, HIZ_PLANE_COMPRESSION_DIS))
  	},
 +	{ XE_RTP_NAME("14019988906"),
 +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
 +	},
 +	{ XE_RTP_NAME("14019877138"),
 +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
 +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
 +	},
  	{ XE_RTP_NAME("14021490052"),
  	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
  	  XE_RTP_ACTIONS(SET(FF_MODE,
@@@ -840,18 -760,10 +768,10 @@@
  			     DIS_PARTIAL_AUTOSTRIP |
  			     DIS_AUTOSTRIP))
  	},
- 	{ XE_RTP_NAME("15016589081"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
- 	},
  	{ XE_RTP_NAME("22021007897"),
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002), ENGINE_CLASS(RENDER)),
  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4, SBE_PUSH_CONSTANT_BEHIND_FIX=
_ENABLE))
  	},
- 	{ XE_RTP_NAME("18033852989"),
- 	  XE_RTP_RULES(GRAPHICS_VERSION(2001), ENGINE_CLASS(RENDER)),
- 	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN1, DISABLE_BOTTOM_CLIP_RECTANGL=
E_TEST))
- 	},
 =20
  	/* Xe3_LPG */
  	{ XE_RTP_NAME("14021490052"),
@@@ -877,6 -789,10 +797,10 @@@
  		       ENGINE_CLASS(RENDER)),
  	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
  	},
+ 	{ XE_RTP_NAME("14026781792"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION(3510), ENGINE_CLASS(RENDER)),
+ 	  XE_RTP_ACTIONS(SET(FF_MODE, DIS_TE_PATCH_CTRL))
+ 	},
  };
 =20
  static __maybe_unused const struct xe_rtp_entry oob_was[] =3D {
@@@ -943,7 -859,8 +867,8 @@@ void xe_wa_process_gt(struct xe_gt *gt
 =20
  	xe_rtp_process_ctx_enable_active_tracking(&ctx, gt->wa_active.gt,
  						  ARRAY_SIZE(gt_was));
- 	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was), &gt->reg_sr);
+ 	xe_rtp_process_to_sr(&ctx, gt_was, ARRAY_SIZE(gt_was),
+ 			     &gt->reg_sr, false);
  }
  EXPORT_SYMBOL_IF_KUNIT(xe_wa_process_gt);
 =20
@@@ -961,7 -878,8 +886,8 @@@ void xe_wa_process_engine(struct xe_hw_
 =20
  	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.engin=
e,
  						  ARRAY_SIZE(engine_was));
- 	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was), &hwe->reg=
_sr);
+ 	xe_rtp_process_to_sr(&ctx, engine_was, ARRAY_SIZE(engine_was),
+ 			     &hwe->reg_sr, false);
  }
 =20
  /**
@@@ -978,7 -896,8 +904,8 @@@ void xe_wa_process_lrc(struct xe_hw_eng
 =20
  	xe_rtp_process_ctx_enable_active_tracking(&ctx, hwe->gt->wa_active.lrc,
  						  ARRAY_SIZE(lrc_was));
- 	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was), &hwe->reg_lrc);
+ 	xe_rtp_process_to_sr(&ctx, lrc_was, ARRAY_SIZE(lrc_was),
+ 			     &hwe->reg_lrc, true);
  }
 =20
  /**

--kVLM52Qkn2zFqzHU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmdnQsACgkQJNaLcl1U
h9CR/gf/XcsV32BX6bRMB/TTykn7E9fqr8vzs0Nm6IZcWAkR08S8K/68txn82Zr3
ZjGXe8or28DsUJ08DPDblXO+q5DheBLSPH7FK0GQqiuf5q3ECDQtbOlvKqciBy8o
691oUKjojLfRogbv9+j3GyNgd16itC5nif6BmL7rlUHbE1WUrv7l3fewXu+l0laW
0qyoNHoIgXkUbi5t73ya4xcxBH855sYL3h6zZVw+eOmkwaOYAmdmaehSi4mv342P
pbHBO3rvVeofuJtNyC4WT5uY8P/hJWIDLH4BWeuqnGao1PKEZr2PWObKJSSZV5qE
VFXMzKuiXYP8T2mRhJdqcpvUH3rRDQ==
=0N9S
-----END PGP SIGNATURE-----

--kVLM52Qkn2zFqzHU--
