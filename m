Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2443F257ACF;
	Fri,  3 Jul 2026 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093309; cv=none; b=ohuAPybfWsiV6Cw8+gOqO6lnSMiKDljO4JBoNKxcCsptaBK9eGirVGEaHW3JovxKY0BwQhc3Fbbg0OYHXWBSxKTfNwJ5ztvpOwS4tmrTP7HVTVTEUzNm6ExWodpY7vCbFwKSofIK5k/kDBl+s2UvaswUU6I+vb3LBPB1sQNyWvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093309; c=relaxed/simple;
	bh=t43ZBRFtaii0iJO18SobITOI4jk2QUhRSXBUBfQM+F0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VCjsQP/J7aCQgl03FuFweH4lVCjUxVOesxn1K2D13vUuVtpy25caxaB40AknVUGR/b0wpA49V+zMWeoBr3mFgk/IPrXnC2PCCFVYwqIlaOtHCk6JjkUQfgCaVaVuq+lXwONXKhKdGilaJIax/j4elfozncJiPIHsh5/+WjzjmEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0KR0Mez; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0KR0Mez"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41EB31F000E9;
	Fri,  3 Jul 2026 15:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093307;
	bh=aMmsKHwyxSLj78ezD2er3ks4iNDlot2Gyc5Hlk/GAQI=;
	h=Date:From:To:Cc:Subject;
	b=D0KR0MezYhry8Dvd3piCy6yLtbflQKyXkWlPt1EGNpSTMNpq/OE2wSJmMWvSpJNbg
	 NEbE4Vm6F2MTmGVTy4y1CRZ6Icge63Kb6W0sadSwiH3zFN5hzLh/OYV0jZdaE0WksF
	 6RsNSnV+zjUnLq/gmW9d01VAjUHWh6mAKjfxLv7xmlEJH+o28Vzerd4+qutR/Udw+I
	 IKfGV/tvYgd/C3MYBCrPXwVm/BywKosl7AS3VV+k8TVY7QNwYINHIiRM09nmiv0ASC
	 O5DSqEd++1gmdPR38Rbt77a+2nneZoTNQwLgNs//IwApCWn9+eHW2s/DGGG+LC4LNw
	 WDWyM2Axd0XVA==
Date: Fri, 3 Jul 2026 16:41:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Gustavo Sousa <gustavo.sousa@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Violet Monti <violet.monti@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <akfYN1-v8QcgJ9sx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zRnTNxOzVH4js2Nu"
Content-Disposition: inline


--zRnTNxOzVH4js2Nu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_hw_engine.c

between commit:

  e23fafb8594ea ("drm/xe/rtp: Add struct types for RTP tables")

=66rom the drm-fixes tree and commits:

  5ff004fdc7377 ("drm/xe/rtp: Add struct types for RTP tables")
  431a233c1710c ("drm/xe: Move engines' LRC programming RTP table off the s=
tack")
  4ff7902a64c18 ("drm/xe: Move engines' non-LRC programming RTP table off t=
he stack")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_hw_engine.c
index 0b193c451a11d,87d60c4117bd8..0000000000000
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@@ -337,39 -337,41 +337,41 @@@ static bool xe_rtp_cfeg_wmtp_disabled(c
  	return xe_mmio_read32(&hwe->gt->mmio, XEHP_FUSE4) & CFEG_WMTP_DISABLE;
  }
 =20
+ static u32 blit_cctl_val(struct xe_gt *gt, struct xe_hw_engine *hwe)
+ {
+ 	return REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, gt->mocs.uc_index) |
+ 		REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, gt->mocs.uc_index);
+ }
+=20
+ static const struct xe_rtp_table_sr lrc_setup =3D XE_RTP_TABLE_SR(
+ 	/*
+ 	 * Some blitter commands do not have a field for MOCS, those
+ 	 * commands will use MOCS index pointed by BLIT_CCTL.
+ 	 * BLIT_CCTL registers are needed to be programmed to un-cached.
+ 	 */
+ 	{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
+ 		       ENGINE_CLASS(COPY)),
+ 	  XE_RTP_ACTIONS(FIELD_SET_FUNC(BLIT_CCTL(0),
+ 					BLIT_CCTL_DST_MOCS_MASK |
+ 					BLIT_CCTL_SRC_MOCS_MASK,
+ 					blit_cctl_val,
+ 					XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ 	/* Disable WMTP if HW doesn't support it */
+ 	{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
+ 	  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
+ 	  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
+ 				   PREEMPT_GPGPU_LEVEL_MASK,
+ 				   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
+ 	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
+ 	},
+ );
+=20
  static void
  hw_engine_setup_default_lrc_state(struct xe_hw_engine *hwe)
  {
- 	struct xe_gt *gt =3D hwe->gt;
- 	const u8 mocs_write_idx =3D gt->mocs.uc_index;
- 	const u8 mocs_read_idx =3D gt->mocs.uc_index;
- 	u32 blit_cctl_val =3D REG_FIELD_PREP(BLIT_CCTL_DST_MOCS_MASK, mocs_write=
_idx) |
- 			    REG_FIELD_PREP(BLIT_CCTL_SRC_MOCS_MASK, mocs_read_idx);
  	struct xe_rtp_process_ctx ctx =3D XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
- 	const struct xe_rtp_table_sr lrc_setup =3D XE_RTP_TABLE_SR(
- 		/*
- 		 * Some blitter commands do not have a field for MOCS, those
- 		 * commands will use MOCS index pointed by BLIT_CCTL.
- 		 * BLIT_CCTL registers are needed to be programmed to un-cached.
- 		 */
- 		{ XE_RTP_NAME("BLIT_CCTL_default_MOCS"),
- 		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1274),
- 			       ENGINE_CLASS(COPY)),
- 		  XE_RTP_ACTIONS(FIELD_SET(BLIT_CCTL(0),
- 				 BLIT_CCTL_DST_MOCS_MASK |
- 				 BLIT_CCTL_SRC_MOCS_MASK,
- 				 blit_cctl_val,
- 				 XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 		},
- 		/* Disable WMTP if HW doesn't support it */
- 		{ XE_RTP_NAME("DISABLE_WMTP_ON_UNSUPPORTED_HW"),
- 		  XE_RTP_RULES(FUNC(xe_rtp_cfeg_wmtp_disabled)),
- 		  XE_RTP_ACTIONS(FIELD_SET(CS_CHICKEN1(0),
- 					   PREEMPT_GPGPU_LEVEL_MASK,
- 					   PREEMPT_GPGPU_THREAD_GROUP_LEVEL)),
- 		  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE)
- 		},
- 	);
 =20
  	xe_rtp_process_to_sr(&ctx, &lrc_setup, &hwe->reg_lrc, true);
  }
@@@ -385,86 -387,92 +387,92 @@@ void xe_hw_engine_setup_reg_lrc(struct=20
  	xe_tuning_process_lrc(hwe);
  }
 =20
+ /*
+  * RING_CMD_CCTL specifies the default MOCS entry that will be
+  * used by the command streamer when executing commands that
+  * don't have a way to explicitly specify a MOCS setting.
+  * The default should usually reference whichever MOCS entry
+  * corresponds to uncached behavior, although use of a WB cached
+  * entry is recommended by the spec in certain circumstances on
+  * specific platforms.
+  * Bspec: 72161
+  */
+ static u32 ring_cmd_cctl_val(struct xe_gt *gt, struct xe_hw_engine *hwe)
+ {
+ 	struct xe_device *xe =3D gt_to_xe(gt);
+ 	u8 mocs_read_idx =3D gt->mocs.uc_index;
+=20
+ 	if (hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE && IS_DGFX(xe) &&
+ 	    (GRAPHICS_VER(xe) >=3D 20 || xe->info.platform =3D=3D XE_PVC))
+ 		mocs_read_idx =3D gt->mocs.wb_index;
+=20
+ 	return REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, gt->mocs.uc_index) |
+ 		REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
+ }
+=20
+ static const struct xe_rtp_table_sr engine_sr =3D XE_RTP_TABLE_SR(
+ 	{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
+ 	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+ 	  XE_RTP_ACTIONS(FIELD_SET_FUNC(RING_CMD_CCTL(0),
+ 					CMD_CCTL_WRITE_OVERRIDE_MASK |
+ 					CMD_CCTL_READ_OVERRIDE_MASK,
+ 					ring_cmd_cctl_val,
+ 					XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ 	{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
+ 	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+ 	  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
+ 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ 	{ XE_RTP_NAME("Disable engine 'legacy' mode"),
+ 	  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
+ 	  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_DISABLE_LEGACY_MODE,
+ 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ 	/*
+ 	 * To allow the GSC engine to go idle on MTL we need to enable
+ 	 * idle messaging and set the hysteresis value (we use 0xA=3D5us
+ 	 * as recommended in spec). On platforms after MTL this is
+ 	 * enabled by default.
+ 	 */
+ 	{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
+ 	  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
+ 	  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
+ 			     IDLE_MSG_DISABLE,
+ 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
+ 			 FIELD_SET(RING_PWRCTX_MAXCNT(0),
+ 				   IDLE_WAIT_TIME,
+ 				   0xA,
+ 				   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ 	/* Enable Priority Mem Read */
+ 	{ XE_RTP_NAME("Priority_Mem_Read"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINED=
)),
+ 	  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
+ 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ 	{ XE_RTP_NAME("Enable CCS Engine(s)"),
+ 	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINED=
),
+ 		       FUNC(xe_rtp_match_first_render_or_compute)),
+ 	  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
+ 	},
+ 	/* Use Fixed slice CCS mode */
+ 	{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
+ 	  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
+ 	  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
+ 				   RCU_MODE_FIXED_SLICE_CCS_MODE))
+ 	},
+ 	{ XE_RTP_NAME("Enable MSI-X interrupt support"),
+ 	  XE_RTP_RULES(FUNC(xe_rtp_match_has_msix)),
+ 	  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
+ 			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
+ 	},
+ );
+=20
  static void
  hw_engine_setup_default_state(struct xe_hw_engine *hwe)
  {
- 	struct xe_gt *gt =3D hwe->gt;
- 	struct xe_device *xe =3D gt_to_xe(gt);
- 	/*
- 	 * RING_CMD_CCTL specifies the default MOCS entry that will be
- 	 * used by the command streamer when executing commands that
- 	 * don't have a way to explicitly specify a MOCS setting.
- 	 * The default should usually reference whichever MOCS entry
- 	 * corresponds to uncached behavior, although use of a WB cached
- 	 * entry is recommended by the spec in certain circumstances on
- 	 * specific platforms.
- 	 * Bspec: 72161
- 	 */
- 	const u8 mocs_write_idx =3D gt->mocs.uc_index;
- 	const u8 mocs_read_idx =3D hwe->class =3D=3D XE_ENGINE_CLASS_COMPUTE && =
IS_DGFX(xe) &&
- 				 (GRAPHICS_VER(xe) >=3D 20 || xe->info.platform =3D=3D XE_PVC) ?
- 				 gt->mocs.wb_index : gt->mocs.uc_index;
- 	u32 ring_cmd_cctl_val =3D REG_FIELD_PREP(CMD_CCTL_WRITE_OVERRIDE_MASK, m=
ocs_write_idx) |
- 				REG_FIELD_PREP(CMD_CCTL_READ_OVERRIDE_MASK, mocs_read_idx);
  	struct xe_rtp_process_ctx ctx =3D XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
- 	const struct xe_rtp_table_sr engine_sr =3D XE_RTP_TABLE_SR(
- 		{ XE_RTP_NAME("RING_CMD_CCTL_default_MOCS"),
- 		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
- 		  XE_RTP_ACTIONS(FIELD_SET(RING_CMD_CCTL(0),
- 					   CMD_CCTL_WRITE_OVERRIDE_MASK |
- 					   CMD_CCTL_READ_OVERRIDE_MASK,
- 					   ring_cmd_cctl_val,
- 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 		},
- 		{ XE_RTP_NAME("Disable HW status page updates for interrupts"),
- 		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
- 		  XE_RTP_ACTIONS(SET(RING_HWSTAM(0), ~0x0,
- 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 		},
- 		{ XE_RTP_NAME("Disable engine 'legacy' mode"),
- 		  XE_RTP_RULES(FUNC(xe_rtp_match_always)),
- 		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_DISABLE_LEGACY_MODE,
- 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 		},
- 		/*
- 		 * To allow the GSC engine to go idle on MTL we need to enable
- 		 * idle messaging and set the hysteresis value (we use 0xA=3D5us
- 		 * as recommended in spec). On platforms after MTL this is
- 		 * enabled by default.
- 		 */
- 		{ XE_RTP_NAME("MTL GSCCS IDLE MSG enable"),
- 		  XE_RTP_RULES(MEDIA_VERSION(1300), ENGINE_CLASS(OTHER)),
- 		  XE_RTP_ACTIONS(CLR(RING_PSMI_CTL(0),
- 				     IDLE_MSG_DISABLE,
- 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)),
- 				 FIELD_SET(RING_PWRCTX_MAXCNT(0),
- 					   IDLE_WAIT_TIME,
- 					   0xA,
- 					   XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 		},
- 		/* Enable Priority Mem Read */
- 		{ XE_RTP_NAME("Priority_Mem_Read"),
- 		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, XE_RTP_END_VERSION_UNDEFINE=
D)),
- 		  XE_RTP_ACTIONS(SET(CSFE_CHICKEN1(0), CS_PRIORITY_MEM_READ,
- 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 		},
- 		{ XE_RTP_NAME("Enable CCS Engine(s)"),
- 		  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, XE_RTP_END_VERSION_UNDEFINE=
D),
- 			       FUNC(xe_rtp_match_first_render_or_compute)),
- 		  XE_RTP_ACTIONS(SET(RCU_MODE, RCU_MODE_CCS_ENABLE))
- 		},
- 		/* Use Fixed slice CCS mode */
- 		{ XE_RTP_NAME("RCU_MODE_FIXED_SLICE_CCS_MODE"),
- 		  XE_RTP_RULES(FUNC(xe_hw_engine_match_fixed_cslice_mode)),
- 		  XE_RTP_ACTIONS(FIELD_SET(RCU_MODE, RCU_MODE_FIXED_SLICE_CCS_MODE,
- 					   RCU_MODE_FIXED_SLICE_CCS_MODE))
- 		},
- 		{ XE_RTP_NAME("Enable MSI-X interrupt support"),
- 		  XE_RTP_RULES(FUNC(xe_rtp_match_has_msix)),
- 		  XE_RTP_ACTIONS(SET(GFX_MODE(0), GFX_MSIX_INTERRUPT_ENABLE,
- 				     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
- 		},
- 	);
 =20
  	xe_rtp_process_to_sr(&ctx, &engine_sr, &hwe->reg_sr, false);
  }

--zRnTNxOzVH4js2Nu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH2DYACgkQJNaLcl1U
h9AxOgf+LAvWzc3ngmi/qSobzpwoqA9bm7HanQvjQGBnF5R+0HHkOtG3EAYB9B1Y
Q2qdj9AKie4erc7x2dR35SwM/hCh4VMj59jeQq/Q0WiiVWE5z7W4n85AmjDXFWay
iFp9mAPK36oV/VICe8PxC6YGm97Sw6PahnHbTMJ0xz5i7qneGdwGgq3C/4gk7cVh
Apc9B3Du/M8o7FK+TJJxfmsLpt9/bSBsiYnF+HNcQRpoajrbvdX1qA9hyAJrAsp2
OBjIt/83CYC84fy4loVSOekvnlK5sZdyxpCbVPm4wE67XnTUTYbaBkPENUR5XA/b
nX1vmGLfOVNop1wprB+lU5avW0kWaQ==
=3Fkz
-----END PGP SIGNATURE-----

--zRnTNxOzVH4js2Nu--
