Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7605E429CDB;
	Fri, 17 Jul 2026 14:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299266; cv=none; b=B4uYlU6DjolYajmVPLxzHQoozz4uhUM95sj7DZWkGUrHqczjIz6ZiHgAqwjgfOcMIh8LWGh4AOhWk0BxuXPUKy6rw5ySEyZseGoThPslntgfyj52+zHG9mjYFreRWGN7UUoXXpQNl+uxF80C+JUT+ca/OTnlRLqoEYquwddnz3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299266; c=relaxed/simple;
	bh=BMp5GzTLz06im3eMG+KF8SF/rOQHGx3L5GOlKNyi5bw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Yxpi5aSfa7H31iAlhCbuUtwtZfGdgPnGhWeq7vOr5A8WYb5pnhcvZ3H0ZNslYNdefDsIkLmWl1n8j1vG8hG/PEK/2B0DOzZkR12cAJWqqIZQ6oS3OWfzLT6dMWmBchQvyVumdSWV3+v+tmxFiQ9NmkwpdDSoyh02Xi9baEcWlnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BSWz+Qlv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BSWz+Qlv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 538B71F000E9;
	Fri, 17 Jul 2026 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784299265;
	bh=K/BRkWxDJI8Kh5sczuL4DQbT4oWat23rlDExPcifJzo=;
	h=Date:From:To:Cc:Subject;
	b=BSWz+QlvL9gsyu8eTwHPW+wi2x08zt6EIfvXw6CRUCjS2Gtr2BUhLYZvuvXIBbWkz
	 We3k5E58iZd6QqQ4SWYd96nP33WZQUgkg60D1P1Xg7//7Fbx3y4H2QXvpN2FLfMQ0F
	 ZOJZQJA8hvf4SlpnEe8KWF+XF2tZk6apOVkxniJF2o2tjKpw2P90DUNgYTrrFEtzSU
	 ypdHIR8irnY/tb/BwV1BBYTV8iHT7HcaN82/1EWBFHDYf8bGFnfHa5uivuXszOt9Bx
	 WtqGB/k6ONUhR99Zf93tiSDBWHLDIJOYTu6tmlHYa1AZhRtrnrspuz68/e44WMrZcm
	 RiomJ3VHLE0+w==
Date: Fri, 17 Jul 2026 15:41:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>, Ce Sun <cesun102@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Yang Wang <kevinyang.wang@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <alo-_M1a8v-NN3CM@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uzW1W57Wu56gyMt/"
Content-Disposition: inline


--uzW1W57Wu56gyMt/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h

between commit:

  6e4bc34568e38 ("drm/amd: Create a device link between APU display and XHC=
I devices")

=66rom the drm-fixes tree and commits:

  07c93d7eeb0d9 ("drm/amd: Create a device link between APU display and XHC=
I devices")
  958430a1f068f ("drm/amd/pm: retire legacy smu ras driver framework")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
index e3a89e9a9df41,7ea7c4a5279be..0000000000000
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/amdgpu_smu.h
@@@ -852,8 -852,6 +852,6 @@@ struct pptable_funcs=20
  	 */
  	int (*set_default_dpm_table)(struct smu_context *smu);
 =20
- 	int (*set_power_state)(struct smu_context *smu);
-=20
  	/**
  	 * @populate_umd_state_clk: Populate the UMD power state table with
  	 *                          defaults.
@@@ -906,16 -904,6 +904,6 @@@
  					      struct
  					      pp_clock_levels_with_latency
  					      *clocks);
- 	/**
- 	 * @get_clock_by_type_with_voltage: Get the speed and voltage of a clock
- 	 *                                  domain.
- 	 */
- 	int (*get_clock_by_type_with_voltage)(struct smu_context *smu,
- 					      enum amd_pp_clock_type type,
- 					      struct
- 					      pp_clock_levels_with_voltage
- 					      *clocks);
-=20
  	/**
  	 * @get_power_profile_mode: Print all power profile modes to
  	 *                          buffer. Star current mode.
@@@ -1357,11 -1345,6 +1345,6 @@@
  	 */
  	int (*register_irq_handler)(struct smu_context *smu);
 =20
- 	/**
- 	 * @set_azalia_d3_pme: Wake the audio decode engine from d3 sleep.
- 	 */
- 	int (*set_azalia_d3_pme)(struct smu_context *smu);
-=20
  	/**
  	 * @get_max_sustainable_clocks_by_dc: Get a copy of the max sustainable
  	 *                                    clock speeds table.
@@@ -1378,18 -1361,6 +1361,6 @@@
  	 */
  	int (*get_bamaco_support)(struct smu_context *smu);
 =20
- 	/**
- 	 * @baco_get_state: Get the current BACO state.
- 	 *
- 	 * Return: Current BACO state.
- 	 */
- 	enum smu_baco_state (*baco_get_state)(struct smu_context *smu);
-=20
- 	/**
- 	 * @baco_set_state: Enter/exit BACO.
- 	 */
- 	int (*baco_set_state)(struct smu_context *smu, enum smu_baco_state state=
);
-=20
  	/**
  	 * @baco_enter: Enter BACO.
  	 */
@@@ -1651,12 -1622,6 +1622,6 @@@
  	int (*ras_send_msg)(struct smu_context *smu,
  			    enum smu_message_type msg, uint32_t param, uint32_t *read_arg);
 =20
- 	/**
- 	 * @get_ras_smu_drv: Get RAS smu driver interface
- 	 * Return: ras_smu_drv *
- 	 */
- 	int (*get_ras_smu_drv)(struct smu_context *smu, const struct ras_smu_drv=
 **ras_smu_drv);
-=20
  	/**
  	 * @set_power_dep: Create or destroy a power dependency link
  	 * from an integrated xHCI controller to the GPU so that the GPU is
@@@ -1962,7 -1927,13 +1927,13 @@@ int smu_link_reset(struct smu_context *
 =20
  extern const struct amd_ip_funcs smu_ip_funcs;
 =20
- bool is_support_sw_smu(struct amdgpu_device *adev);
+ void amdgpu_smu_early_init(struct amdgpu_device *adev);
+=20
+ static inline bool is_support_sw_smu(struct amdgpu_device *adev)
+ {
+ 	return adev->is_sw_smu;
+ }
+=20
  bool is_support_cclk_dpm(struct amdgpu_device *adev);
  int smu_write_watermarks_table(struct smu_context *smu);
 =20
@@@ -2005,7 -1976,6 +1976,6 @@@ int smu_set_pm_policy(struct smu_contex
  		      int level);
  ssize_t smu_get_pm_policy_info(struct smu_context *smu,
  			       enum pp_pm_policy p_type, char *sysbuf);
- const struct ras_smu_drv *smu_get_ras_smu_driver(void *handle);
 =20
  int amdgpu_smu_ras_send_msg(struct amdgpu_device *adev, enum smu_message_=
type msg,
  			    uint32_t param, uint32_t *readarg);

--uzW1W57Wu56gyMt/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaPvwACgkQJNaLcl1U
h9A2igf+OztYrmUSNtXsytXTnqLezPi68dmq8SMC+mUDrONs+/u8Ul1+j96oIHPb
q7Q9YplF/4rs7pRRrtjbq6bX+j00NC55+zTJ0vbNKq8EhFv+QLxiZlBUUrw/xrwt
PMbkLsRZmCHMfj5eYOlwrcitmmeJZc9C1YgFTYgwIE6ME3FxUnQrOBCLPoehwfHw
hvDlgGSIc49MfO0H3rsjoUXNvSySWmzQXzKRpw4NKX2azU24Qz7Wk7ahjSmSlVqq
YKoTW1wUkGjeLH/Jl2X1EamWuDZVufJrkXShQaUtqkqbdrQDIQ1vyKhBZAmClMxI
/EitAo9apNm/pqfLQZClmHZPiSiglA==
=0oW6
-----END PGP SIGNATURE-----

--uzW1W57Wu56gyMt/--
