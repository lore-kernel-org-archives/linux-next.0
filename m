Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705748;
	b=kXWqqBBpr9DKOxaChUqCZ0qsb4nnNr89HofI5l8hokOU3paeZNWCZQrKbEZVfXzbiU4z
	 ZfGxZNqSKJBT865O+kGgaUdCMp9E5NDeZKijF6i4MaJdkZKcD5DeGvkMgFkpF5LZ//OT2
	 23trM/CCUAB2foIpUdxcajttiVUy+m5m7hxL+Y3zlq+uEMFkd28DvlTHiY5R8mWRi4mAw
	 KsIRCZMqczlUi5qgNYMf5+hzjyGuIGxsPNlYnP51LnzItbbGug+NrNjkUfP3pNC60ZlK2
	 tPEvGNOqqdUWE9QYkSojuTf0AuSwIXaaTb8Zo1O9FqiKMua0OOqsn29252aqzCOX9SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705748;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Js+zOxc4PsCa2+ayT4WKeZDZDeyPABiCE09LfHg44n0=;
	b=XXjfkPlJIlhlUGPJHpOfPC3HzWI9uxY1ZIjM3f9QO8U5bsIDcMRsNUi0t8g71Gq1FqMP
	 j6ItmhGcTJWtlTaQ7N5PXc2MEZiYaIxhXxpEt+Od1KXLOdIuk4/kXleyb9pnaiymZyR/3
	 mklQ9wImjxuYI0iC4L60sLT40U4SP1lf0Lz86BvYtn3roIRXoZzk899pOMsjeVAZpz6Uk
	 HFyX+Eg8U36HKsAmz2f6mTWp/fJdjb136JW6i2pSAct7/8gd/pczPc/1CcLypLr3Ajeek
	 mbXSTSPlNaOEoVp2s4HCRhkcA9Vcjhcupo7abtTUbIZuQP2+LB1ALuhhKAstMikqY9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ajq5wKDW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1B9606A32C;
	Thu, 26 Nov 2026 15:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ajq5wKDW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 361CD1F000E0;
	Thu, 26 Nov 2026 15:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705747;
	bh=Js+zOxc4PsCa2+ayT4WKeZDZDeyPABiCE09LfHg44n0=;
	h=Date:From:To:Cc:Subject;
	b=Ajq5wKDWDfKhzuJmYUl9dz+8EcYgk7NVsgTSWRk/PqNh8RJauOS8u4kFK0xazwU4v
	 dDUe0Qd8VyjAjaMlHlj78SD+WdMmJHajXlQh0wCAD0kgCFeoXXi022JogRlNfb0z21
	 tFK8zuU/EPnRKoqnFiTMroH4nYEF0EZwqsbRcSgqNDtvABD8SHMIn4Gvb3wIRKA0fv
	 T5TAxstxQqxPhqJSvRB4jJ0rHuN3D94NaMJSgmp/md6dnFq0knLQR/M5wa0GgqzvKT
	 yGYufeuRdAdL1WDUJdsHvKfrwWIRR7cYy+qX2UB4lSupTwAvguq2ULq9n7X8qxBvJs
	 dMl1o9CqUwheg==
Date: Thu, 26 Nov 2026 15:09:02 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Hugo Sales <hugo@hsal.es>,
	James Lin <pinglei.lin@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Ray Wu <ray.wu@amd.com>, Suresh Guttula <suresh.guttula@amd.com>,
	Wayne Lin <Wayne.Lin@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <awhLjgj2tyQ7KX3o@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WjD9+FjzFGvFNXqW"
Content-Disposition: inline


--WjD9+FjzFGvFNXqW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got conflicts in:

  drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
  drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c

between commits:

  b99cc7665fc83 ("drm/amdgpu: bypass IMU ucode loading for GC 11 APU")
  988ab04d773ac ("drm/amd/display: Add the AUX backlight minimum once on th=
e custom curve")
  6d8e709912753 ("drm/amd: Select the firmware signing scheme the PSP repor=
ts")

=66rom the origin tree and commits:

  127b26805f62d ("drm/amd/display: Pass linear brightness percent to power =
module")
  db037de64e38d ("drm/amd/amdgpu: Enable IMU_I/DRAM FW_LOAD CMD")
  1a1e2f5d829cb ("drm/amd/display: Add a KUnit test for the custom curve mi=
nimum")
  3fef0181c79e1 ("drm/amd/display: Drop the unused min argument of convert_=
custom_brightness()")
  5f95ef2cfd208 ("drm/amd/display: Add the AUX backlight minimum once on th=
e custom curve")
  2fe41c5fb704e ("drm/amd: Select the firmware signing scheme the PSP repor=
ts")
  68107f081efea ("drm/amdgpu: bypass IMU ucode loading for GC 11 APU")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
index b6c4ae35ca03a,3aef68c9891a9..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/imu_v11_0.c
@@@ -31,6 -31,8 +31,8 @@@
  #include "gc/gc_11_0_0_offset.h"
  #include "gc/gc_11_0_0_sh_mask.h"
 =20
+ #define IMU_DATA_SIZE_BYTES	66304
+=20
  MODULE_FIRMWARE("amdgpu/gc_11_0_0_imu.bin");
  MODULE_FIRMWARE("amdgpu/gc_11_0_0_imu_kicker.bin");
  MODULE_FIRMWARE("amdgpu/gc_11_0_1_imu.bin");
@@@ -73,8 -75,18 +75,18 @@@ static int imu_v11_0_init_microcode(str
  	else
  		err =3D amdgpu_ucode_request(adev, &adev->gfx.imu_fw, required,
  					   "amdgpu/%s_imu.bin", ucode_prefix);
- 	if (err =3D=3D -ENODEV && imu_in_ifwi)
+ 	if (err =3D=3D -ENODEV && imu_in_ifwi) {
+ 		info =3D &adev->firmware.ucode[AMDGPU_UCODE_ID_IMU_I];
+ 		info->ucode_id =3D AMDGPU_UCODE_ID_IMU_I;
+ 		info->fw =3D adev->gfx.imu_fw;
+ 		info->ucode_size =3D IMU_DATA_SIZE_BYTES;
+=20
+ 		info =3D &adev->firmware.ucode[AMDGPU_UCODE_ID_IMU_D];
+ 		info->ucode_id =3D AMDGPU_UCODE_ID_IMU_D;
+ 		info->fw =3D adev->gfx.imu_fw;
+ 		info->ucode_size =3D IMU_DATA_SIZE_BYTES;
  		return 0;
+ 	}
  	if (err)
  		goto out;
 =20
diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index f89b74f09b044,14e7c7190165c..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@@ -170,6 -170,7 +170,7 @@@ static inline void amdgpu_dm_exit_ips_f
  STATIC_IFN_KUNIT u32 dm_vblank_get_counter(struct amdgpu_device *adev, in=
t crtc)
  {
  	struct amdgpu_crtc *acrtc =3D NULL;
+ 	struct amdgpu_display_manager *dm =3D &adev->dm;
 =20
  	if (crtc >=3D adev->mode_info.num_crtc)
  		return 0;
@@@ -182,7 -183,19 +183,19 @@@
  		return 0;
  	}
 =20
- 	return dc_stream_get_vblank_counter(acrtc->dm_irq_params.stream);
+ 	guard(spinlock_irqsave)(&adev->dm.sw_counter_lock);
+=20
+ 	if (acrtc->otg_inst < 0) {
+ 		drm_err(adev_to_drm(adev), "dm_vblank_get_counter: no otg_inst for crtc=
 '%d'!\n",
+ 			crtc);
+ 		return 0;
+ 	}
+=20
+ 	if (dm->use_sw_vblank_counter)
+ 		return dm->otg_sw_counter[acrtc->otg_inst].frozen;
+=20
+ 	return (dc_stream_get_vblank_counter(acrtc->dm_irq_params.stream) +
+ 		dm->otg_sw_counter[acrtc->otg_inst].offset) & 0xffffff;
  }
  EXPORT_IF_KUNIT(dm_vblank_get_counter);
 =20
@@@ -190,8 -203,8 +203,8 @@@ STATIC_IFN_KUNIT int dm_crtc_get_scanou
  					    u32 *vbl, u32 *position)
  {
  	u32 v_blank_start =3D 0, v_blank_end =3D 0, h_position =3D 0, v_position=
 =3D 0;
+ 	struct amdgpu_display_manager *dm =3D &adev->dm;
  	struct amdgpu_crtc *acrtc =3D NULL;
- 	struct dc *dc =3D adev->dm.dc;
 =20
  	if ((crtc < 0) || (crtc >=3D adev->mode_info.num_crtc))
  		return -EINVAL;
@@@ -204,8 -217,20 +217,20 @@@
  		return 0;
  	}
 =20
- 	if (dc && dc->caps.ips_support && dc->idle_optimizations_allowed)
- 		dc_allow_idle_optimizations(dc, false);
+ 	guard(spinlock_irqsave)(&adev->dm.sw_counter_lock);
+=20
+ 	if (acrtc->otg_inst < 0) {
+ 		drm_err(adev_to_drm(adev), "dm_crtc_get_scanoutpos: no otg_inst for crt=
c '%d'!\n",
+ 			crtc);
+ 		return 0;
+ 	}
+=20
+ 	if (dm->use_sw_vblank_counter) {
+ 		*vbl =3D dm->otg_sw_counter[acrtc->otg_inst].vblank_start |
+ 		       (dm->otg_sw_counter[acrtc->otg_inst].vblank_end << 16);
+ 		*position =3D dm->otg_sw_counter[acrtc->otg_inst].vblank_end;
+ 		return 0;
+ 	}
 =20
  	/*
  	 * TODO rework base driver to use values directly.
@@@ -224,6 -249,61 +249,61 @@@
  }
  EXPORT_IF_KUNIT(dm_crtc_get_scanoutpos);
 =20
+ /* active_vblank_irq_count must be 0 before calling this function */
+ void amdgpu_dm_sw_counter_freeze(struct amdgpu_display_manager *dm)
+ {
+ 	struct dc *dc =3D dm->dc;
+=20
+ 	lockdep_assert_held(&dm->dc_lock);
+=20
+ 	if (!dc->caps.ips_support || dc->config.disable_ips =3D=3D DMUB_IPS_DISA=
BLE_ALL)
+ 		return;
+=20
+ 	guard(spinlock_irqsave)(&dm->sw_counter_lock);
+=20
+ 	if (dm->use_sw_vblank_counter)
+ 		return;
+=20
+ 	for (int i =3D 0; i < MAX_PIPES; i++) {
+ 		u32 hw, h_position, v_position;
+=20
+ 		hw =3D dc_otg_get_vblank_counter(dc, i);
+ 		dm->otg_sw_counter[i].frozen =3D (hw + dm->otg_sw_counter[i].offset + 1=
) & 0xffffff;
+ 		dc_otg_get_scanoutpos(dc, i,
+ 				      &dm->otg_sw_counter[i].vblank_start,
+ 				      &dm->otg_sw_counter[i].vblank_end,
+ 				      &h_position, &v_position);
+ 	}
+=20
+ 	dm->use_sw_vblank_counter =3D true;
+=20
+ }
+=20
+ /* should only be called after IPS exit */
+ void amdgpu_dm_sw_counter_resume(struct amdgpu_display_manager *dm)
+ {
+ 	struct dc *dc =3D dm->dc;
+=20
+ 	lockdep_assert_held(&dm->dc_lock);
+=20
+ 	if (!dc->caps.ips_support || dc->config.disable_ips =3D=3D DMUB_IPS_DISA=
BLE_ALL)
+ 		return;
+=20
+ 	guard(spinlock_irqsave)(&dm->sw_counter_lock);
+=20
+ 	if (!dm->use_sw_vblank_counter)
+ 		return;
+=20
+ 	for (int i =3D 0; i < MAX_PIPES; i++) {
+ 		u32 hw;
+=20
+ 		hw =3D dc_otg_get_vblank_counter(dc, i);
+ 		dm->otg_sw_counter[i].offset =3D (dm->otg_sw_counter[i].frozen - hw) & =
0xffffff;
+ 	}
+=20
+ 	dm->use_sw_vblank_counter =3D false;
+ }
+=20
  STATIC_IFN_KUNIT int dm_wait_for_idle(struct amdgpu_ip_block *ip_block)
  {
  	/* XXX todo */
@@@ -415,6 -495,22 +495,22 @@@ STATIC_IFN_KUNIT void mmhub_read_system
  }
  EXPORT_IF_KUNIT(mmhub_read_system_context);
 =20
+ STATIC_IFN_KUNIT void
+ amdgpu_dm_fill_power_nits_range(const struct amdgpu_dm_backlight_caps *ca=
ps,
+ 				struct mod_power_init_params *init_data)
+ {
+ 	init_data->use_nits_based_brightness =3D false;
+ 	init_data->panel_max_millinits =3D 0;
+ 	init_data->panel_min_millinits =3D 0;
+ 	if (caps->aux_support &&
+ 	    caps->aux_max_input_signal > caps->aux_min_input_signal) {
+ 		init_data->use_nits_based_brightness =3D true;
+ 		init_data->panel_max_millinits =3D caps->aux_max_input_signal * 1000;
+ 		init_data->panel_min_millinits =3D caps->aux_min_input_signal * 1000;
+ 	}
+ }
+ EXPORT_IF_KUNIT(amdgpu_dm_fill_power_nits_range);
+=20
  STATIC_IFN_KUNIT int amdgpu_dm_init_power_module(struct amdgpu_display_ma=
nager *dm)
  {
  	struct mod_power_init_params init_data[MAX_NUM_EDP];
@@@ -439,9 -535,7 +535,7 @@@
  		init_data[i].def_varibright_level =3D 0;
  		init_data[i].abm_config_setting =3D 0;
  		init_data[i].num_backlight_levels =3D 101;
- 		init_data[i].use_nits_based_brightness =3D false;
- 		init_data[i].panel_max_millinits =3D 0;
- 		init_data[i].panel_min_millinits =3D 0;
+ 		amdgpu_dm_fill_power_nits_range(&dm->backlight_caps[i], &init_data[i]);
  		init_data[i].disable_fractional_pwm =3D
  			!(amdgpu_dc_feature_mask & DC_DISABLE_FRACTIONAL_PWM_MASK);
  		init_data[i].use_custom_backlight_caps =3D false;
@@@ -500,6 -594,7 +594,7 @@@ static int amdgpu_dm_init(struct amdgpu
  	mutex_init(&adev->dm.audio_lock);
 =20
  	spin_lock_init(&adev->dm.dmub_lock);
+ 	spin_lock_init(&adev->dm.sw_counter_lock);
 =20
  	if (amdgpu_dm_irq_init(adev)) {
  		drm_err(adev_to_drm(adev), "failed to initialize DM IRQ support.\n");
@@@ -752,8 -847,10 +847,10 @@@
  	if (adev->dm.dc->caps.max_links > 0) {
  		adev->dm.vblank_control_workqueue =3D
  			create_singlethread_workqueue("dm_vblank_control_workqueue");
- 		if (!adev->dm.vblank_control_workqueue)
+ 		if (!adev->dm.vblank_control_workqueue) {
  			drm_err(adev_to_drm(adev), "failed to initialize vblank_workqueue.\n");
+ 			goto error;
+ 		}
  	}
 =20
  	if (adev->dm.dc->caps.ips_support &&
@@@ -2728,15 -2825,8 +2825,8 @@@ EXPORT_IF_KUNIT(dm_bandwidth_update)
  static const struct amdgpu_display_funcs dm_display_funcs =3D {
  	.bandwidth_update =3D dm_bandwidth_update, /* called unconditionally */
  	.vblank_get_counter =3D dm_vblank_get_counter,/* called unconditionally =
*/
- 	.backlight_set_level =3D NULL, /* never called for DC */
- 	.backlight_get_level =3D NULL, /* never called for DC */
- 	.hpd_sense =3D NULL,/* called unconditionally */
- 	.hpd_set_polarity =3D NULL, /* called unconditionally */
- 	.hpd_get_gpio_reg =3D NULL, /* VBIOS parsing. DAL does it. */
  	.page_flip_get_scanoutpos =3D
  		dm_crtc_get_scanoutpos,/* called unconditionally */
- 	.add_encoder =3D NULL, /* VBIOS parsing. DAL does it. */
- 	.add_connector =3D NULL, /* VBIOS parsing. DAL does it. */
  };
 =20
  #if defined(CONFIG_DEBUG_KERNEL_DC)
@@@ -3008,6 -3098,9 +3098,9 @@@ fill_dc_plane_info_and_addr(struct amdg
  	case DRM_FORMAT_ARGB8888:
  		plane_info->format =3D SURFACE_PIXEL_FORMAT_GRPH_ARGB8888;
  		break;
+ 	case DRM_FORMAT_RGBA8888:
+ 		plane_info->format =3D SURFACE_PIXEL_FORMAT_GRPH_RGBA8888;
+ 		break;
  	case DRM_FORMAT_XRGB2101010:
  	case DRM_FORMAT_ARGB2101010:
  		plane_info->format =3D SURFACE_PIXEL_FORMAT_GRPH_ARGB2101010;
@@@ -3854,7 -3947,7 +3947,7 @@@ EXPORT_IF_KUNIT(dm_arm_vblank_event_pre
   * this at commit time, not in atomic check: by then the previous commit
   * has finished writing it.
   */
- static void
+ STATIC_IFN_KUNIT void
  dm_plane_inherit_flip_time(struct dc_plane_state *dc_plane_state,
  			   struct drm_plane_state *old_plane_state,
  			   struct drm_plane_state *new_plane_state)
@@@ -3866,6 -3959,7 +3959,7 @@@
  	    old_plane_state->crtc =3D=3D new_plane_state->crtc)
  		dc_plane_state->time =3D old_dc_plane_state->time;
  }
+ EXPORT_IF_KUNIT(dm_plane_inherit_flip_time);
 =20
  static void amdgpu_dm_commit_planes(struct drm_atomic_commit *state,
  				    struct drm_device *dev,
@@@ -4451,7 -4545,7 +4545,7 @@@ bool amdgpu_dm_crtc_complete_writeback(
  	if (!pending)
  		return false;
 =20
 -	drm_writeback_signal_completion(acrtc->wb_conn, 0);
 +	drm_writeback_signal_completion(drm_writeback_to_connector(acrtc->wb_con=
n), 0);
  	drm_crtc_vblank_put(&acrtc->base);
 =20
  	return true;
@@@ -4947,7 -5041,7 +5041,7 @@@ dm_set_writeback(struct amdgpu_display_
  		 struct drm_connector *connector,
  		 struct drm_connector_state *new_con_state)
  {
 -	struct drm_writeback_connector *wb_conn =3D drm_connector_to_writeback(c=
onnector);
 +	struct drm_writeback_connector *wb_conn =3D &connector->writeback;
  	struct amdgpu_device *adev =3D dm->adev;
  	struct amdgpu_crtc *acrtc;
  	struct dc_writeback_info *wb_info;
@@@ -4961,7 -5055,7 +5055,7 @@@
  		goto cleanup;
  	}
 =20
 -	acrtc =3D to_amdgpu_crtc(wb_conn->encoder.crtc);
 +	acrtc =3D to_amdgpu_crtc(to_amdgpu_dm_wb_connector(connector)->encoder.c=
rtc);
  	if (!acrtc) {
  		drm_err(adev_to_drm(adev), "no amdgpu_crtc found\n");
  		goto cleanup;
@@@ -5040,7 -5134,7 +5134,7 @@@
  	dc_stream_add_writeback(dm->dc, crtc_state->stream, wb_info);
 =20
  	acrtc->wb_conn =3D wb_conn;
 -	drm_writeback_queue_job(wb_conn, new_con_state);
 +	drm_writeback_queue_job(connector, new_con_state);
 =20
  	/*
  	 * Writeback completion is detected in the CRTC vblank IRQ
diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index 8d27c2712c516,58058fed0b6f8..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@@ -116,162 -116,35 +116,35 @@@ int get_brightness_range(const struct a
  }
  EXPORT_IF_KUNIT(get_brightness_range);
 =20
- /* Rescale userspace [0..max] to the firmware curve's [0..255]. */
- static inline u32 scale_input_to_fw(int max, u64 input)
- {
- 	return DIV_ROUND_CLOSEST_ULL(input * AMDGPU_MAX_BL_LEVEL, max);
- }
-=20
- /* Rescale from [0..AMDGPU_MAX_BL_LEVEL] to [0..max] */
- static inline u32 scale_fw_to_input(int max, u64 input)
- {
- 	return DIV_ROUND_CLOSEST_ULL(input * max, AMDGPU_MAX_BL_LEVEL);
- }
-=20
- static u32 backlight_signal_to_luminance(const struct amdgpu_dm_backlight=
_caps *caps,
- 					 u32 signal)
- {
- 	u32 lower_signal, upper_signal;
- 	u32 lower_lum, upper_lum;
- 	int i;
-=20
- 	if (!caps->data_points)
- 		return DIV_ROUND_CLOSEST(signal * 100, AMDGPU_MAX_BL_LEVEL);
-=20
- 	if (signal < caps->luminance_data[0].input_signal) {
- 		lower_signal =3D 0;
- 		lower_lum =3D 0;
- 		upper_signal =3D caps->luminance_data[0].input_signal;
- 		upper_lum =3D caps->luminance_data[0].luminance;
- 	} else if (signal >=3D
- 		   caps->luminance_data[caps->data_points - 1].input_signal) {
- 		lower_signal =3D caps->luminance_data[caps->data_points - 1].input_sign=
al;
- 		lower_lum =3D caps->luminance_data[caps->data_points - 1].luminance;
- 		upper_signal =3D caps->max_input_signal;
- 		upper_lum =3D 100;
- 	} else {
- 		for (i =3D 1;
- 		     i < caps->data_points &&
- 		     signal > caps->luminance_data[i].input_signal;
- 		     i++)
- 			;
-=20
- 		lower_signal =3D caps->luminance_data[i - 1].input_signal;
- 		upper_signal =3D caps->luminance_data[i].input_signal;
- 		lower_lum =3D caps->luminance_data[i - 1].luminance;
- 		upper_lum =3D caps->luminance_data[i].luminance;
- 	}
-=20
- 	if (upper_signal =3D=3D lower_signal)
- 		return upper_lum;
-=20
- 	return lower_lum + DIV_ROUND_CLOSEST((upper_lum - lower_lum) *
- 					     (signal - lower_signal),
- 					     upper_signal - lower_signal);
- }
-=20
- static u32 convert_brightness_to_millipercent(const struct amdgpu_dm_back=
light_caps *caps,
- 					      u32 user_brightness)
- {
- 	unsigned int min, max;
- 	u32 signal, luminance;
-=20
- 	if (!get_brightness_range(caps, &min, &max))
- 		return DIV_ROUND_CLOSEST_ULL((u64)user_brightness * 100000,
- 					     MAX_BACKLIGHT_LEVEL);
-=20
- 	user_brightness =3D clamp(user_brightness, min, max);
- 	if (amdgpu_dc_debug_mask & DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE)
- 		return DIV_ROUND_CLOSEST_ULL((u64)user_brightness * 100000, max);
-=20
- 	signal =3D scale_input_to_fw(max, user_brightness);
- 	luminance =3D backlight_signal_to_luminance(caps, signal);
-=20
- 	return min_t(u32, luminance * 1000, 100000);
- }
-=20
+ /*
+  * The power module maps the percentage to nits or, through its LUT built=
 from
+  * the ATIF curve, to PWM, so pass userspace's [0..max] through linearly.
+  */
  STATIC_IFN_KUNIT
- void convert_custom_brightness(const struct amdgpu_dm_backlight_caps *cap=
s,
- 			       unsigned int min, unsigned int max,
- 			       uint32_t *user_brightness)
- {
- 	u32 brightness =3D scale_input_to_fw(max, *user_brightness);
- 	u8 lower_signal, upper_signal, upper_lum, lower_lum, lum;
- 	int left, right;
-=20
- 	if (amdgpu_dc_debug_mask & DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE)
- 		return;
-=20
- 	if (!caps->data_points)
- 		return;
-=20
- 	/*
- 	 * Handle the case where brightness is below the first data point
- 	 * Interpolate between (0,0) and (first_signal, first_lum)
- 	 */
- 	if (brightness < caps->luminance_data[0].input_signal) {
- 		lum =3D DIV_ROUND_CLOSEST(caps->luminance_data[0].luminance * brightnes=
s,
- 					caps->luminance_data[0].input_signal);
- 		goto scale;
- 	}
-=20
- 	left =3D 0;
- 	right =3D caps->data_points - 1;
- 	while (left <=3D right) {
- 		int mid =3D left + (right - left) / 2;
- 		u8 signal =3D caps->luminance_data[mid].input_signal;
-=20
- 		/* Exact match found */
- 		if (signal =3D=3D brightness) {
- 			lum =3D caps->luminance_data[mid].luminance;
- 			goto scale;
- 		}
-=20
- 		if (signal < brightness)
- 			left =3D mid + 1;
- 		else
- 			right =3D mid - 1;
- 	}
-=20
- 	/* verify bound */
- 	if (left >=3D caps->data_points)
- 		left =3D caps->data_points - 1;
-=20
- 	/* At this point, left > right */
- 	lower_signal =3D caps->luminance_data[right].input_signal;
- 	upper_signal =3D caps->luminance_data[left].input_signal;
- 	lower_lum =3D caps->luminance_data[right].luminance;
- 	upper_lum =3D caps->luminance_data[left].luminance;
-=20
- 	/* interpolate */
- 	if (right =3D=3D left || !lower_lum)
- 		lum =3D upper_lum;
- 	else
- 		lum =3D lower_lum + DIV_ROUND_CLOSEST((upper_lum - lower_lum) *
- 						    (brightness - lower_signal),
- 						    upper_signal - lower_signal);
- scale:
- 	*user_brightness =3D scale_fw_to_input(max, DIV_ROUND_CLOSEST(lum * brig=
htness, 101));
- }
-=20
- EXPORT_IF_KUNIT(convert_custom_brightness);
-=20
- STATIC_IFN_KUNIT
- u32 convert_brightness_from_user(const struct amdgpu_dm_backlight_caps *c=
aps,
- 				uint32_t brightness)
+ u32 convert_brightness_to_millipercent(const struct amdgpu_dm_backlight_c=
aps *caps,
+ 				       u32 user_brightness)
  {
  	unsigned int min, max;
 =20
  	if (!get_brightness_range(caps, &min, &max))
- 		return brightness;
+ 		max =3D MAX_BACKLIGHT_LEVEL;
 =20
- 	convert_custom_brightness(caps, min, max, &brightness);
-=20
- 	/* Rescale 0..max to min..max */
- 	return min + DIV_ROUND_CLOSEST_ULL((u64)(max - min) * brightness, max);
+ 	return DIV_ROUND_CLOSEST_ULL((u64)min(user_brightness, max) * 100000, ma=
x);
  }
+ EXPORT_IF_KUNIT(convert_brightness_to_millipercent);
 =20
- EXPORT_IF_KUNIT(convert_brightness_from_user);
+ STATIC_IFN_KUNIT
+ u32 convert_millipercent_to_user(const struct amdgpu_dm_backlight_caps *c=
aps,
+ 				 u32 millipercent)
+ {
+ 	unsigned int min, max;
+=20
+ 	if (!get_brightness_range(caps, &min, &max))
+ 		max =3D MAX_BACKLIGHT_LEVEL;
+=20
+ 	return DIV_ROUND_CLOSEST_ULL((u64)min(millipercent, 100000U) * max, 1000=
00);
+ }
+ EXPORT_IF_KUNIT(convert_millipercent_to_user);
 =20
  STATIC_IFN_KUNIT
  u32 convert_brightness_to_user(const struct amdgpu_dm_backlight_caps *cap=
s,
@@@ -309,6 -182,19 +182,19 @@@ struct dc_stream_state *dm_find_stream_
  }
  EXPORT_IF_KUNIT(dm_find_stream_with_link);
 =20
+ /* Must match the panels mod_power_set_brightness() sends nits to in SDR =
*/
+ static bool dm_backlight_takes_nits(const struct dc_link *link)
+ {
+ 	switch (link->backlight_control_type) {
+ 	case BACKLIGHT_CONTROL_VESA_AUX:
+ 		return true;
+ 	case BACKLIGHT_CONTROL_AMD_AUX:
+ 		return link->dpcd_sink_ext_caps.bits.oled;
+ 	default:
+ 		return false;
+ 	}
+ }
+=20
  STATIC_IFN_KUNIT
  int amdgpu_dm_backlight_get_device_index(struct amdgpu_display_manager *d=
m,
  					 struct backlight_device *bd)
@@@ -330,8 -216,7 +216,7 @@@ void amdgpu_dm_backlight_set_level(stru
  {
  	struct amdgpu_dm_backlight_caps *caps;
  	struct dc_link *link;
- 	u32 brightness =3D 0;
- 	u32 millipercent =3D 0;
+ 	u32 millipercent;
  	bool rc =3D false, reallow_idle =3D false;
  	struct drm_connector *connector;
  	struct dc_stream_state *stream;
@@@ -363,20 -248,12 +248,12 @@@
  	if (!stream)
  		return;
 =20
- 	if (caps->aux_support) {
- 		brightness =3D convert_brightness_from_user(caps, dm->brightness[bl_idx=
]);
- 		/* Apply brightness quirk */
- 		if (caps->brightness_mask)
- 			brightness |=3D caps->brightness_mask;
- 	} else {
- 		millipercent =3D convert_brightness_to_millipercent(caps,
- 								  user_brightness);
- 	}
+ 	millipercent =3D convert_brightness_to_millipercent(caps, user_brightnes=
s);
 =20
  	if (trace_amdgpu_dm_brightness_enabled()) {
  		trace_amdgpu_dm_brightness(__builtin_return_address(0),
  					   user_brightness,
- 					   brightness,
+ 					   millipercent,
  					   caps->aux_support,
  					   power_supply_is_system_supplied() > 0);
  	}
@@@ -387,14 -264,10 +264,10 @@@
  		reallow_idle =3D true;
  	}
 =20
- 	if (caps->aux_support) {
- 		rc =3D mod_power_set_backlight_nits(dm->power_module, stream, brightnes=
s,
- 			AUX_BL_DEFAULT_TRANSITION_TIME_MS, false, true);
- 	} else {
- 		/* power module uses millipercent */
- 		rc =3D mod_power_set_backlight_percent(dm->power_module, stream,
- 						     millipercent, 0, false);
- 	}
+ 	rc =3D mod_power_set_brightness(dm->power_module, stream, millipercent,
+ 				      dm_backlight_takes_nits(link) ?
+ 				      AUX_BL_DEFAULT_TRANSITION_TIME_MS : 0,
+ 				      caps->brightness_mask, false);
 =20
  	/*
  	 * Some kms clients create a ramped backlight transition effect
@@@ -442,11 -315,12 +315,12 @@@ u32 amdgpu_dm_backlight_get_level(struc
  	int ret;
  	struct amdgpu_dm_backlight_caps caps;
  	struct dc_link *link =3D (struct dc_link *)dm->backlight_link[bl_idx];
+ 	unsigned int panel_inst, millipercent;
 =20
  	amdgpu_dm_update_backlight_caps(dm, bl_idx);
  	caps =3D dm->backlight_caps[bl_idx];
 =20
- 	if (caps.aux_support) {
+ 	if (dm_backlight_takes_nits(link)) {
  		u32 avg, peak;
 =20
  		if (!dc_link_get_backlight_level_nits(link, &avg, &peak))
@@@ -459,7 -333,12 +333,12 @@@
  	if (ret =3D=3D DC_ERROR_UNEXPECTED)
  		return dm->brightness[bl_idx];
 =20
- 	return convert_brightness_to_user(&caps, ret);
+ 	if (!dc_get_edp_link_panel_inst(dm->dc, link, &panel_inst) ||
+ 	    !mod_power_get_hw_backlight_pwm_percent(dm->power_module, link,
+ 						    &millipercent, panel_inst))
+ 		return dm->brightness[bl_idx];
+=20
+ 	return convert_millipercent_to_user(&caps, millipercent);
  }
  EXPORT_IF_KUNIT(amdgpu_dm_backlight_get_level);
 =20
diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backl=
ight_test.c
index 0a1307a4990e8,2812a9af2683d..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@@ -152,10 -152,9 +152,9 @@@ static void dm_test_backlight_set_level
   * @test: The KUnit test context
   *
   * With a matching stream present, set_level() walks into the DC programm=
ing
-  * path. A NULL power_module makes mod_power_set_backlight_nits() a safe
+  * path. A NULL power_module makes mod_power_set_brightness() a safe
   * early-false, and ips_support disabled leaves idle optimizations untouc=
hed.
-  * A non-matching connector exercises the connector-list skip, and a non-=
zero
-  * brightness_mask exercises the quirk-OR path.
+  * A non-matching connector exercises the connector-list skip.
   */
  static void dm_test_backlight_set_level_aux_programs_power_module(struct =
kunit *test)
  {
@@@ -195,26 -194,15 +194,15 @@@
   * dm_test_backlight_set_level_pwm_programs_power_module - Test PWM progr=
amming path
   * @test: The KUnit test context
   *
-  * With aux_support cleared, set_level() takes the millipercent branch:
-  * get_brightness_range() + mod_power_set_backlight_percent(). A NULL
-  * power_module keeps the call a safe early-false. The cases walk each se=
gment of
-  * the custom luminance curve; DC_DISABLE_CUSTOM_BRIGHTNESS_CURVE then by=
passes it.
+  * With aux_support cleared, set_level() passes the PWM range to
+  * mod_power_set_brightness() as a percentage. A NULL power_module keeps =
the
+  * call a safe early-false.
   */
  static void dm_test_backlight_set_level_pwm_programs_power_module(struct =
kunit *test)
  {
- 	static const struct amdgpu_dm_luminance_data curve[] =3D {
- 		{ .input_signal =3D 50, .luminance =3D 10 },
- 		{ .input_signal =3D 100, .luminance =3D 40 },
- 		{ .input_signal =3D 200, .luminance =3D 80 },
- 		{ .input_signal =3D 255, .luminance =3D 90 },
- 	};
- 	/* { data_points, brightness }: no curve, below/between/above points, ze=
ro-width end */
- 	static const u32 cases[][2] =3D {
- 		{ 0, 2000 }, { 3, 0 }, { 3, 38550 }, { 3, 65535 }, { 4, 65535 },
- 	};
+ 	static const u32 cases[] =3D { 0, 2000, 38550, 65535 };
  	struct amdgpu_display_manager *dm =3D dm_kunit_alloc_dm(test);
  	struct dc_link *link =3D dm_kunit_alloc_link(test);
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
  	int i;
 =20
  	setup_test_dm_ddev(test, dm);
@@@ -225,22 -213,14 +213,14 @@@
  	dm->backlight_caps[1].aux_support =3D false;
  	dm->backlight_caps[1].min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIG=
HT;
  	dm->backlight_caps[1].max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIG=
HT;
- 	memcpy(dm->backlight_caps[1].luminance_data, curve, sizeof(curve));
  	dm->backlight_link[1] =3D link;
  	dm_kunit_add_stream_to_state(test, dm->dc->current_state, 0, link);
 =20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_C=
URVE);
  	for (i =3D 0; i < ARRAY_SIZE(cases); i++) {
- 		dm->backlight_caps[1].data_points =3D cases[i][0];
- 		amdgpu_dm_backlight_set_level(dm, 1, cases[i][1]);
- 		KUNIT_EXPECT_EQ_MSG(test, dm->brightness[1], cases[i][1], "case %d", i);
+ 		amdgpu_dm_backlight_set_level(dm, 1, cases[i]);
+ 		KUNIT_EXPECT_EQ_MSG(test, dm->brightness[1], cases[i], "case %d", i);
  	}
 =20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask | DC_DISABLE_CUSTOM_BRIGHTNESS_CU=
RVE);
- 	amdgpu_dm_backlight_set_level(dm, 1, 2000);
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
-=20
- 	KUNIT_EXPECT_EQ(test, dm->brightness[1], 2000U);
  	KUNIT_EXPECT_EQ(test, dm->actual_brightness[1], 0U);
  }
 =20
@@@ -374,21 -354,24 +354,24 @@@ static bool dm_test_get_backlight_level
  /* Tests for amdgpu_dm_backlight_get_level()/get_brightness() */
 =20
  /**
-  * dm_test_backlight_get_level_pwm_success - Test PWM brightness readback
+  * dm_test_backlight_get_level_pwm_no_power_module - Test PWM readback fa=
llback
   * @test: The KUnit test context
+  *
+  * PWM readback goes through the power module's LUT. Without a power modu=
le
+  * for the link, get_level() must return the cached brightness.
   */
- static void dm_test_backlight_get_level_pwm_success(struct kunit *test)
+ static void dm_test_backlight_get_level_pwm_no_power_module(struct kunit =
*test)
  {
  	struct amdgpu_display_manager *dm =3D dm_kunit_alloc_dm(test);
  	struct dc_link *link =3D dm_kunit_alloc_link(test);
- 	u32 hw_level =3D dm_test_get_backlight_level_mid(link);
 =20
  	setup_test_link_service(test, link);
  	link->dc->link_srv->edp_get_backlight_level =3D dm_test_get_backlight_le=
vel_mid;
+ 	dm->power_module =3D NULL;
+ 	dm->brightness[0] =3D 1234;
  	dm->backlight_link[0] =3D link;
 =20
- 	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0),
- 			 convert_brightness_to_user(&dm->backlight_caps[0], hw_level));
+ 	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), 1234U);
  }
 =20
  /**
@@@ -420,6 -403,8 +403,8 @@@ static void dm_test_backlight_get_level
 =20
  	setup_test_link_service(test, link);
  	link->dc->link_srv->edp_get_backlight_level_nits =3D dm_test_get_backlig=
ht_level_nits;
+ 	link->backlight_control_type =3D BACKLIGHT_CONTROL_AMD_AUX;
+ 	link->dpcd_sink_ext_caps.bits.oled =3D 1;
  	dm->backlight_link[0] =3D link;
  	caps->caps_valid =3D true;
  	caps->aux_support =3D true;
@@@ -430,6 -415,35 +415,35 @@@
  			 convert_brightness_to_user(caps, 250000));
  }
 =20
+ /**
+  * dm_test_backlight_get_level_amd_aux_lcd_reads_pwm - Test forced AMD AU=
X LCD readback
+  * @test: The KUnit test context
+  *
+  * amdgpu.backlight=3D1 forces AMD AUX on an LCD, which the power module =
still
+  * drives through PWM in SDR. get_level() must read PWM back, not the AUX=
 nits
+  * nobody wrote, so without a power module it returns the cached brightne=
ss.
+  */
+ static void dm_test_backlight_get_level_amd_aux_lcd_reads_pwm(struct kuni=
t *test)
+ {
+ 	struct amdgpu_display_manager *dm =3D dm_kunit_alloc_dm(test);
+ 	struct dc_link *link =3D dm_kunit_alloc_link(test);
+ 	struct amdgpu_dm_backlight_caps *caps =3D &dm->backlight_caps[0];
+=20
+ 	setup_test_link_service(test, link);
+ 	link->dc->link_srv->edp_get_backlight_level =3D dm_test_get_backlight_le=
vel_mid;
+ 	link->dc->link_srv->edp_get_backlight_level_nits =3D dm_test_get_backlig=
ht_level_nits;
+ 	link->backlight_control_type =3D BACKLIGHT_CONTROL_AMD_AUX;
+ 	dm->power_module =3D NULL;
+ 	dm->brightness[0] =3D 1234;
+ 	dm->backlight_link[0] =3D link;
+ 	caps->caps_valid =3D true;
+ 	caps->aux_support =3D true;
+ 	caps->aux_min_input_signal =3D 1;
+ 	caps->aux_max_input_signal =3D 512;
+=20
+ 	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), 1234U);
+ }
+=20
  /**
   * dm_test_backlight_get_level_aux_error - Test AUX readback fallback
   * @test: The KUnit test context
@@@ -442,6 -456,8 +456,8 @@@ static void dm_test_backlight_get_level
 =20
  	setup_test_link_service(test, link);
  	link->dc->link_srv->edp_get_backlight_level_nits =3D dm_test_get_backlig=
ht_level_nits_fail;
+ 	link->backlight_control_type =3D BACKLIGHT_CONTROL_AMD_AUX;
+ 	link->dpcd_sink_ext_caps.bits.oled =3D 1;
  	dm->brightness[0] =3D 6789;
  	dm->backlight_link[0] =3D link;
  	caps->caps_valid =3D true;
@@@ -558,7 -574,9 +574,9 @@@ static void dm_test_register_backlight_
 =20
  	amdgpu_dm_set_dc_debug_mask(saved_mask & ~DC_DISABLE_CUSTOM_BRIGHTNESS_C=
URVE);
  	setup_test_link_service(test, link);
- 	link->dc->link_srv->edp_get_backlight_level =3D dm_test_get_backlight_le=
vel_mid;
+ 	link->dc->link_srv->edp_get_backlight_level_nits =3D dm_test_get_backlig=
ht_level_nits;
+ 	link->backlight_control_type =3D BACKLIGHT_CONTROL_AMD_AUX;
+ 	link->dpcd_sink_ext_caps.bits.oled =3D 1;
  	primary =3D kunit_kzalloc(test, sizeof(*primary), GFP_KERNEL);
  	KUNIT_ASSERT_NOT_NULL(test, primary);
  	adev->ddev.primary =3D primary;
@@@ -568,6 -586,9 +586,9 @@@
  	aconnector->bl_idx =3D 0;
  	aconnector->base.kdev =3D adev->ddev.dev;
  	caps =3D &adev->dm.backlight_caps[0];
+ 	caps->aux_support =3D true;
+ 	caps->aux_min_input_signal =3D 1;
+ 	caps->aux_max_input_signal =3D 512;
  	caps->min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
  	caps->max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
  	caps->data_points =3D 1;
@@@ -1034,379 -1055,83 +1055,83 @@@ static void dm_test_brightness_to_user_
  	KUNIT_EXPECT_EQ(test, result, (u32)expected);
  }
 =20
- /* Tests for convert_brightness_from_user() =E2=80=94 no custom curve */
-=20
  /**
-  * dm_test_brightness_from_user_null_caps - Test Brightness from user nul=
l caps
+  * dm_test_brightness_to_millipercent_pwm - Test PWM brightness to millip=
ercent
   * @test: The KUnit test context
+  *
+  * The user level maps linearly from 0..max to 0..100%, with no curve and=
 no
+  * clamp at min_input_signal, and a level above max is capped at 100%
   */
- static void dm_test_brightness_from_user_null_caps(struct kunit *test)
- {
- 	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(NULL, 100), 100U);
- }
-=20
- /**
-  * dm_test_brightness_from_user_zero - Test Brightness from user zero
-  * @test: The KUnit test context
-  */
- static void dm_test_brightness_from_user_zero(struct kunit *test)
+ static void dm_test_brightness_to_millipercent_pwm(struct kunit *test)
  {
  	struct amdgpu_dm_backlight_caps caps =3D {};
- 	unsigned int min, max;
 =20
- 	caps.aux_support =3D false;
  	caps.min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
  	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	/* no custom curve */
- 	caps.data_points =3D 0;
+ 	caps.data_points =3D 1;
+ 	caps.luminance_data[0].input_signal =3D 128;
+ 	caps.luminance_data[0].luminance =3D 10;
 =20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/* brightness=3D0 =E2=86=92 min + 0 =3D min */
- 	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 0), (u32)min);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 0), 0U);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 1000), 1=
526U);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 32768), =
50001U);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 65535), =
100000U);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 70000), =
100000U);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(NULL, 32768), 5=
0001U);
  }
 =20
  /**
-  * dm_test_brightness_from_user_max - Test Brightness from user max
+  * dm_test_brightness_to_millipercent_aux - Test AUX brightness to millip=
ercent
   * @test: The KUnit test context
+  *
+  * Over AUX the user level runs over 0..1000 * aux_max_input_signal and m=
aps
+  * linearly to 0..100%, with no curve even when ATIF gives one
   */
- static void dm_test_brightness_from_user_max(struct kunit *test)
+ static void dm_test_brightness_to_millipercent_aux(struct kunit *test)
  {
  	struct amdgpu_dm_backlight_caps caps =3D {};
- 	unsigned int min, max;
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 0;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/*
- 	 * brightness=3Dmax =E2=86=92 min + DIV_ROUND_CLOSEST((max-min)*max, max)
- 	 *               =3D min + (max - min) =3D max
- 	 */
- 	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, max), (u32)max=
);
- }
-=20
- /**
-  * dm_test_brightness_from_user_aux - Test Brightness from user aux
-  * @test: The KUnit test context
-  */
- static void dm_test_brightness_from_user_aux(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	unsigned int min, max;
 =20
  	caps.aux_support =3D true;
  	caps.aux_min_input_signal =3D 1;
  	caps.aux_max_input_signal =3D 512;
- 	caps.data_points =3D 0;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/* brightness=3D0 =E2=86=92 min */
- 	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, 0), (u32)min);
- 	/* brightness=3Dmax =E2=86=92 max */
- 	KUNIT_EXPECT_EQ(test, convert_brightness_from_user(&caps, max), (u32)max=
);
- }
-=20
- /* Tests for convert_custom_brightness() */
-=20
- /**
-  * dm_test_custom_brightness_no_data_points - Test Custom brightness no d=
ata points
-  * @test: The KUnit test context
-  */
- static void dm_test_custom_brightness_no_data_points(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness =3D 128;
- 	uint32_t saved =3D brightness;
-=20
- 	caps.data_points =3D 0;
-=20
- 	convert_custom_brightness(&caps, 3084, 65535, &brightness);
-=20
- 	/* No data points =E2=86=92 no-op */
- 	KUNIT_EXPECT_EQ(test, brightness, saved);
- }
-=20
- /**
-  * dm_test_custom_brightness_debug_mask_disables - Test Custom brightness=
 debug mask disables
-  * @test: The KUnit test context
-  */
- static void dm_test_custom_brightness_debug_mask_disables(struct kunit *t=
est)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness =3D 128;
- 	uint32_t saved =3D brightness;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
-=20
- 	caps.data_points =3D 3;
- 	caps.luminance_data[0].input_signal =3D 50;
- 	caps.luminance_data[0].luminance =3D 10;
-=20
- 	/* Set the disable flag */
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() | DC_DISABLE_C=
USTOM_BRIGHTNESS_CURVE);
-=20
- 	convert_custom_brightness(&caps, 3084, 65535, &brightness);
-=20
- 	/* Should be no-op due to debug mask */
- 	KUNIT_EXPECT_EQ(test, brightness, saved);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
- }
-=20
- /**
-  * dm_test_custom_brightness_exact_match - Test Custom brightness exact m=
atch
-  * @test: The KUnit test context
-  */
- static void dm_test_custom_brightness_exact_match(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness;
- 	unsigned int min, max;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
-=20
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() & ~DC_DISABLE_=
CUSTOM_BRIGHTNESS_CURVE);
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D 0;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 3;
- 	caps.luminance_data[0].input_signal =3D 50;
- 	caps.luminance_data[0].luminance =3D 20;
- 	caps.luminance_data[1].input_signal =3D 128;
- 	caps.luminance_data[1].luminance =3D 50;
- 	caps.luminance_data[2].input_signal =3D 200;
- 	caps.luminance_data[2].luminance =3D 90;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/*
- 	 * Set brightness so that scale_input_to_fw yields exactly 128.
- 	 * scale_input_to_fw(min, max, x) =3D DIV_ROUND_CLOSEST(x * 255, max - m=
in)
- 	 * With min=3D0, max=3D0x101*255=3D65535:
- 	 * We need x such that DIV_ROUND_CLOSEST(x * 255, 65535) =3D 128
- 	 * =E2=86=92 x =3D 128 * 65535 / 255 =3D 32896
- 	 */
- 	brightness =3D 32896;
-=20
- 	convert_custom_brightness(&caps, min, max, &brightness);
-=20
- 	/*
- 	 * Exact match: lum=3D50, brightness_scaled=3D128
- 	 * result =3D scale_fw_to_input(max, DIV_ROUND_CLOSEST(50*128, 101))
- 	 *        =3D scale_fw_to_input(65535, DIV_ROUND_CLOSEST(6400, 101))
- 	 *        =3D scale_fw_to_input(65535, 63)
- 	 *        =3D DIV_ROUND_CLOSEST(63 * 65535, 255) =3D 16191 (approx)
- 	 */
- 	KUNIT_EXPECT_TRUE(test, brightness !=3D 32896);
- 	KUNIT_EXPECT_TRUE(test, brightness < 32896);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
- }
-=20
- /**
-  * dm_test_custom_brightness_below_first - Test Custom brightness below f=
irst
-  * @test: The KUnit test context
-  */
- static void dm_test_custom_brightness_below_first(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness;
- 	unsigned int min, max;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
-=20
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() & ~DC_DISABLE_=
CUSTOM_BRIGHTNESS_CURVE);
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D 0;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 2;
- 	caps.luminance_data[0].input_signal =3D 100;
- 	caps.luminance_data[0].luminance =3D 40;
- 	caps.luminance_data[1].input_signal =3D 200;
- 	caps.luminance_data[1].luminance =3D 80;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/*
- 	 * Set brightness low enough that scaled value < 100.
- 	 * scale_input_to_fw(0, 65535, x) =3D DIV_ROUND_CLOSEST(x*255, 65535)
- 	 * For result=3D50: x =3D 50*65535/255 =3D 12850
- 	 */
- 	brightness =3D 12850;
-=20
- 	convert_custom_brightness(&caps, min, max, &brightness);
-=20
- 	/*
- 	 * Below first data point: lum =3D DIV_ROUND_CLOSEST(40 * 50, 100) =3D 20
- 	 * Then: scale_fw_to_input(65535, DIV_ROUND_CLOSEST(20 * 50, 101))
- 	 *      =3D scale_fw_to_input(65535, DIV_ROUND_CLOSEST(1000, 101))
- 	 *      =3D scale_fw_to_input(65535, 10)
- 	 * The output should be significantly less than input.
- 	 */
- 	KUNIT_EXPECT_TRUE(test, brightness < 12850);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
- }
-=20
- /**
-  * dm_test_custom_brightness_interpolation - Test Custom brightness inter=
polation
-  * @test: The KUnit test context
-  */
- static void dm_test_custom_brightness_interpolation(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness;
- 	unsigned int min, max;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
-=20
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() & ~DC_DISABLE_=
CUSTOM_BRIGHTNESS_CURVE);
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D 0;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 2;
- 	caps.luminance_data[0].input_signal =3D 50;
- 	caps.luminance_data[0].luminance =3D 20;
- 	caps.luminance_data[1].input_signal =3D 200;
- 	caps.luminance_data[1].luminance =3D 80;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/*
- 	 * Choose a value between data points 50 and 200.
- 	 * scale_input_to_fw(0, 65535, x) =3D 125 when x =3D 125*65535/255 =3D 3=
2125
- 	 */
- 	brightness =3D 32125;
-=20
- 	convert_custom_brightness(&caps, min, max, &brightness);
-=20
- 	/*
- 	 * The function should interpolate between data points and produce
- 	 * a remapped value different from the input.
- 	 */
- 	KUNIT_EXPECT_TRUE(test, brightness !=3D 32125);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
- }
-=20
- /**
-  * dm_test_custom_brightness_above_last - Test Custom brightness above la=
st data point
-  * @test: The KUnit test context
-  */
- static void dm_test_custom_brightness_above_last(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness;
- 	unsigned int min, max;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
-=20
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() & ~DC_DISABLE_=
CUSTOM_BRIGHTNESS_CURVE);
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D 0;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 2;
- 	caps.luminance_data[0].input_signal =3D 50;
- 	caps.luminance_data[0].luminance =3D 20;
- 	caps.luminance_data[1].input_signal =3D 150;
- 	caps.luminance_data[1].luminance =3D 60;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/*
- 	 * Choose brightness above the last data point (150).
- 	 * scale_input_to_fw(0, 65535, x) =3D 220 when x =3D 220*65535/255 =3D 5=
6533
- 	 * After binary search, left >=3D data_points, clamped =E2=86=92 right=
=3D=3Dleft,
- 	 * so lum =3D upper_lum =3D 60.
- 	 */
- 	brightness =3D 56533;
-=20
- 	convert_custom_brightness(&caps, min, max, &brightness);
-=20
- 	/* Output should differ from input (remapped via curve) */
- 	KUNIT_EXPECT_TRUE(test, brightness !=3D 56533);
- 	KUNIT_EXPECT_TRUE(test, brightness < 56533);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
- }
-=20
- /**
-  * dm_test_custom_brightness_single_data_point - Test Custom brightness w=
ith single data point
-  * @test: The KUnit test context
-  */
- static void dm_test_custom_brightness_single_data_point(struct kunit *tes=
t)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness;
- 	unsigned int min, max;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
-=20
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() & ~DC_DISABLE_=
CUSTOM_BRIGHTNESS_CURVE);
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D 0;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
  	caps.data_points =3D 1;
  	caps.luminance_data[0].input_signal =3D 128;
- 	caps.luminance_data[0].luminance =3D 50;
+ 	caps.luminance_data[0].luminance =3D 10;
 =20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/*
- 	 * Brightness below the single data point triggers the
- 	 * "below first" path: lum =3D DIV_ROUND_CLOSEST(50 * scaled, 128).
- 	 * scale_input_to_fw(0, 65535, x) =3D 64 when x =3D 64*65535/255 =3D 164=
48
- 	 */
- 	brightness =3D 16448;
-=20
- 	convert_custom_brightness(&caps, min, max, &brightness);
-=20
- 	KUNIT_EXPECT_TRUE(test, brightness < 16448);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 0), 0U);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 256000),=
 50000U);
+ 	KUNIT_EXPECT_EQ(test, convert_brightness_to_millipercent(&caps, 512000),=
 100000U);
  }
 =20
  /**
-  * dm_test_custom_brightness_lower_lum_zero - Test Custom brightness with=
 zero lower luminance
+  * dm_test_millipercent_to_user_pwm - Test PWM millipercent back to brigh=
tness
   * @test: The KUnit test context
+  *
+  * Every user level must come back unchanged from its millipercent, and a
+  * millipercent above 100% is capped at max
   */
- static void dm_test_custom_brightness_lower_lum_zero(struct kunit *test)
+ static void dm_test_millipercent_to_user_pwm(struct kunit *test)
  {
  	struct amdgpu_dm_backlight_caps caps =3D {};
- 	uint32_t brightness;
- 	unsigned int min, max;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
+ 	u32 level;
 =20
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() & ~DC_DISABLE_=
CUSTOM_BRIGHTNESS_CURVE);
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D 0;
+ 	caps.min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
  	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 2;
- 	caps.luminance_data[0].input_signal =3D 50;
- 	caps.luminance_data[0].luminance =3D 0;	/* zero lower luminance */
- 	caps.luminance_data[1].input_signal =3D 200;
- 	caps.luminance_data[1].luminance =3D 80;
 =20
- 	get_brightness_range(&caps, &min, &max);
+ 	KUNIT_EXPECT_EQ(test, convert_millipercent_to_user(&caps, 0), 0U);
+ 	KUNIT_EXPECT_EQ(test, convert_millipercent_to_user(&caps, 50000), 32768U=
);
+ 	KUNIT_EXPECT_EQ(test, convert_millipercent_to_user(&caps, 100000), 65535=
U);
+ 	KUNIT_EXPECT_EQ(test, convert_millipercent_to_user(&caps, 150000), 65535=
U);
 =20
- 	/*
- 	 * Choose brightness between data points to trigger interpolation.
- 	 * scale_input_to_fw(0, 65535, x) =3D 125 when x =3D 125*65535/255 =3D 3=
2125
- 	 * With lower_lum =3D=3D 0, code takes shortcut: lum =3D upper_lum =3D 8=
0.
- 	 */
- 	brightness =3D 32125;
+ 	for (level =3D 0; level <=3D 65535; level++) {
+ 		u32 millipercent =3D convert_brightness_to_millipercent(&caps, level);
 =20
- 	convert_custom_brightness(&caps, min, max, &brightness);
-=20
- 	/* Should remap; result should differ from input */
- 	KUNIT_EXPECT_TRUE(test, brightness !=3D 32125);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
+ 		if (convert_millipercent_to_user(&caps, millipercent) !=3D level) {
+ 			KUNIT_FAIL(test, "level %u came back as %u", level,
+ 				   convert_millipercent_to_user(&caps, millipercent));
+ 			break;
+ 		}
+ 	}
  }
 =20
  /**
@@@ -1430,66 -1155,6 +1155,6 @@@ static void dm_test_brightness_to_user_
  	KUNIT_EXPECT_GT(test, result, max);
  }
 =20
- /**
-  * dm_test_brightness_from_user_midrange - Test Brightness from user mid-=
range value
-  * @test: The KUnit test context
-  */
- static void dm_test_brightness_from_user_midrange(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	unsigned int min, max;
- 	u32 result;
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D AMDGPU_DM_DEFAULT_MIN_BACKLIGHT;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 0;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	/* Mid-range brightness should map to between min and max */
- 	result =3D convert_brightness_from_user(&caps, max / 2);
-=20
- 	KUNIT_EXPECT_GE(test, result, min);
- 	KUNIT_EXPECT_LE(test, result, max);
- }
-=20
- /**
-  * dm_test_brightness_from_user_with_curve - Test Brightness from user wi=
th custom curve active
-  * @test: The KUnit test context
-  */
- static void dm_test_brightness_from_user_with_curve(struct kunit *test)
- {
- 	struct amdgpu_dm_backlight_caps caps =3D {};
- 	unsigned int min, max;
- 	u32 with_curve, without_curve;
- 	uint saved_mask =3D amdgpu_dm_get_dc_debug_mask();
-=20
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() & ~DC_DISABLE_=
CUSTOM_BRIGHTNESS_CURVE);
-=20
- 	caps.aux_support =3D false;
- 	caps.min_input_signal =3D 0;
- 	caps.max_input_signal =3D AMDGPU_DM_DEFAULT_MAX_BACKLIGHT;
- 	caps.data_points =3D 2;
- 	caps.luminance_data[0].input_signal =3D 50;
- 	caps.luminance_data[0].luminance =3D 20;
- 	caps.luminance_data[1].input_signal =3D 200;
- 	caps.luminance_data[1].luminance =3D 80;
-=20
- 	get_brightness_range(&caps, &min, &max);
-=20
- 	with_curve =3D convert_brightness_from_user(&caps, max / 2);
-=20
- 	/* Now disable the curve and compare */
- 	amdgpu_dm_set_dc_debug_mask(amdgpu_dm_get_dc_debug_mask() | DC_DISABLE_C=
USTOM_BRIGHTNESS_CURVE);
- 	without_curve =3D convert_brightness_from_user(&caps, max / 2);
-=20
- 	/* Custom curve should produce a different mapping */
- 	KUNIT_EXPECT_NE(test, with_curve, without_curve);
-=20
- 	amdgpu_dm_set_dc_debug_mask(saved_mask);
- }
-=20
  /**
   * dm_test_brightness_range_zero_signals - Test Brightness range with zer=
o min and max signals
   * @test: The KUnit test context
@@@ -2002,9 -1667,10 +1667,10 @@@ static struct kunit_case dm_backlight_t
  	KUNIT_CASE(dm_test_backlight_set_level_reallows_idle),
  	KUNIT_CASE(dm_test_backlight_update_status_no_stream),
  	/* amdgpu_dm_backlight_get_level / get_brightness */
- 	KUNIT_CASE(dm_test_backlight_get_level_pwm_success),
+ 	KUNIT_CASE(dm_test_backlight_get_level_pwm_no_power_module),
  	KUNIT_CASE(dm_test_backlight_get_level_pwm_error),
  	KUNIT_CASE(dm_test_backlight_get_level_aux_success),
+ 	KUNIT_CASE(dm_test_backlight_get_level_amd_aux_lcd_reads_pwm),
  	KUNIT_CASE(dm_test_backlight_get_level_aux_error),
  	KUNIT_CASE(dm_test_backlight_get_brightness_uses_device_index),
  	/* amdgpu_dm_register_backlight_device */
@@@ -2036,23 -1702,11 +1702,11 @@@
  	KUNIT_CASE(dm_test_brightness_to_user_at_max),
  	KUNIT_CASE(dm_test_brightness_to_user_at_min),
  	KUNIT_CASE(dm_test_brightness_to_user_midpoint_pwm),
- 	/* convert_brightness_from_user */
- 	KUNIT_CASE(dm_test_brightness_from_user_null_caps),
- 	KUNIT_CASE(dm_test_brightness_from_user_zero),
- 	KUNIT_CASE(dm_test_brightness_from_user_max),
- 	KUNIT_CASE(dm_test_brightness_from_user_aux),
- 	/* convert_custom_brightness */
- 	KUNIT_CASE(dm_test_custom_brightness_no_data_points),
- 	KUNIT_CASE(dm_test_custom_brightness_debug_mask_disables),
- 	KUNIT_CASE(dm_test_custom_brightness_exact_match),
- 	KUNIT_CASE(dm_test_custom_brightness_below_first),
- 	KUNIT_CASE(dm_test_custom_brightness_interpolation),
- 	KUNIT_CASE(dm_test_custom_brightness_above_last),
- 	KUNIT_CASE(dm_test_custom_brightness_single_data_point),
- 	KUNIT_CASE(dm_test_custom_brightness_lower_lum_zero),
+ 	/* convert_brightness_to_millipercent / convert_millipercent_to_user */
+ 	KUNIT_CASE(dm_test_brightness_to_millipercent_pwm),
+ 	KUNIT_CASE(dm_test_brightness_to_millipercent_aux),
+ 	KUNIT_CASE(dm_test_millipercent_to_user_pwm),
  	KUNIT_CASE(dm_test_brightness_to_user_above_max),
- 	KUNIT_CASE(dm_test_brightness_from_user_midrange),
- 	KUNIT_CASE(dm_test_brightness_from_user_with_curve),
  	KUNIT_CASE(dm_test_brightness_range_zero_signals),
  	/* amdgpu_dm_backlight_fill_props */
  	KUNIT_CASE(dm_test_backlight_fill_props_ac_linear),

--WjD9+FjzFGvFNXqW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIS40ACgkQJNaLcl1U
h9DZtgf+J98oJxrS0gPllPgXiBaPA8UufAhvXzxd/54Pvu/oDNixOBqNHePeNZYs
ybE3zTyYN7H3myCFVTW2zs7U1wrI55OBQn1k1BwT16WhoAKKSc1AZrsIsvY4DuuC
mjSX/dtbCpm+GPfIsweIbOfYCnqnQwbTcNU9eEmh1p9ez1HIne9JyALUcKt12lzX
J2db14FdMreoSANqSUDC7Xm4CqCnGtd8QRUxLDjDLaA4hAZEzZmeBB7zNvZlIoFa
vwz1EWyv0oIECSRrWWmfLixXZR/Dyk/MSQNcdgBDBbDxXQg/eLShn9pVtp1+lQJi
ns8XAa4apSjLUpqm13WLsAVDBj9TQQ==
=hdvT
-----END PGP SIGNATURE-----

--WjD9+FjzFGvFNXqW--
