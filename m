Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1914A8B;
	Tue, 19 May 2026 11:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779190818; cv=none; b=fkfwmoWAqaSWY9/vu7qa4Y1S1mxxhTJpD8R9cnwPgGzNOY0xq0m9kUY++7wnsXtuIR0y6sPIASKYsmVoL0XVBNUdiA5grpTTLwJiFvdg6JX5KmOV12a0qk1+KLSbDdHsqwieVlgpPrmHPUbIAdlOnWv9u0kselP1ktPFBkYeeUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779190818; c=relaxed/simple;
	bh=LH0UCAEce3BBUTkRnO2UAWCOmxXXbJ81462Qli1m+KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FneRXBTLTBolDZ8hDnkztavLCYcRTLUK+xpbzheOO10Z8v8m2x/lDG/aCYRg2Oekz16rS/D09AZlsoJq30JWyO64zTOtfwu8yRhNBeDSIBSuF7kzZe/XqtG+dGJHGjFh2vdbX/2l+QJu6GNkjdrIMnwE5t9MEfX0Fs75lV6oKIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mX/Lb2pN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mX/Lb2pN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6E3FC2BCC6;
	Tue, 19 May 2026 11:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779190817;
	bh=LH0UCAEce3BBUTkRnO2UAWCOmxXXbJ81462Qli1m+KQ=;
	h=Date:From:To:Cc:Subject:From;
	b=mX/Lb2pN6cnMV/dFWc4fy7XEPQi3PvnsfrBDStqNRb6shj2VOtPNgYaHUc+Vz512V
	 DjDfaGbCAMlrNhHu5RNJ9gbOK3impMmfPzbXyzjyjf95GhorOlwdHmVjPqrIpBlgZV
	 gaqDPZa42IEabZktoODuo2WfJLUomE8aHjHcPnmOx8LL+aKLQlxMGsIxvYvZWlcZmR
	 o8Ao2IVEYBxl3k1v3JryskpgcYaIIPyKh/305GEsXNvNQ69vHC9VlVsgtsEartk80/
	 tlapikRH9tbpwasER5LgUw1CRsqpk6zosEypo8ef40sFWejEukCvaKACgLQ2iXQTvj
	 61deTKqwGiD0w==
Date: Tue, 19 May 2026 12:40:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: build failure after merge of the amdgpu tree
Message-ID: <agxMHc5MZjmgKM2I@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjVC+bxJU6RfhZDy"
Content-Disposition: inline


--wjVC+bxJU6RfhZDy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

After merging the amdgpu tree, today's linux-next build (x86_64
allmodconfig) failed like this:

/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_psr.c:64:6:
error: no previous prototype for 'amdgpu_dm_psr_fill_caps'
[-Werror=missing-prototypes]
   64 | void amdgpu_dm_psr_fill_caps(struct dc_link *link, struct psr_caps *caps)
      |      ^~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors make[7]:
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.c:163:6:
error: no previous prototype for 'process_output'
[-Werror=missing-prototypes]
  163 | void process_output(struct hdcp_workqueue *hdcp_work)
      |      ^~~~~~~~~~~~~~
cc1: all warnings being treated as errors make[7]:
*** [/tmp/next/build/scripts/Makefile.build:289:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_hdcp.o] Error 1
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:429:1:
error: no previous prototype for '__extract_blob_lut'
[-Werror=missing-prototypes]
  429 | __extract_blob_lut(const struct drm_property_blob *blob, uint32_t *size)
      | ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:446:1:
error: no previous prototype for '__extract_blob_lut32'
[-Werror=missing-prototypes]
  446 | __extract_blob_lut32(const struct drm_property_blob *blob, uint32_t *size)
      | ^~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:467:6:
error: no previous prototype for '__is_lut_linear'
[-Werror=missing-prototypes]
  467 | bool __is_lut_linear(const struct drm_color_lut *lut, uint32_t size)
      |      ^~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:498:6:
error: no previous prototype for '__drm_lut_to_dc_gamma'
[-Werror=missing-prototypes]
  498 | void __drm_lut_to_dc_gamma(const struct drm_color_lut *lut,
      |      ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:538:6:
error: no previous prototype for '__drm_lut32_to_dc_gamma'
[-Werror=missing-prototypes]
  538 | void __drm_lut32_to_dc_gamma(const struct drm_color_lut32 *lut, struct dc_gamma *gamma)
      |      ^~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:558:6:
error: no previous prototype for '__drm_ctm_to_dc_matrix'
[-Werror=missing-prototypes]
  558 | void __drm_ctm_to_dc_matrix(const struct drm_color_ctm *ctm,
      |      ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:592:6:
error: no previous prototype for '__drm_ctm_3x4_to_dc_matrix'
[-Werror=missing-prototypes]
  592 | void __drm_ctm_3x4_to_dc_matrix(const struct drm_color_ctm_3x4 *ctm,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:873:1:
error: no previous prototype for 'amdgpu_tf_to_dc_tf'
[-Werror=missing-prototypes]
  873 | amdgpu_tf_to_dc_tf(enum amdgpu_transfer_function tf)
      | ^~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:904:1:
error: no previous prototype for 'amdgpu_colorop_tf_to_dc_tf'
[-Werror=missing-prototypes]
  904 | amdgpu_colorop_tf_to_dc_tf(enum drm_colorop_curve_1d_type tf)
      | ^~~~~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:926:6:
error: no previous prototype for '__to_dc_lut3d_color'
[-Werror=missing-prototypes]
  926 | void __to_dc_lut3d_color(struct dc_rgb *rgb,
      |      ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:937:6:
error: no previous prototype for '__drm_3dlut_to_dc_3dlut'
[-Werror=missing-prototypes]
  937 | void __drm_3dlut_to_dc_3dlut(const struct drm_color_lut *lut,
      |      ^~~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:983:6:
error: no previous prototype for '__to_dc_lut3d_32_color'
[-Werror=missing-prototypes]
  983 | void __to_dc_lut3d_32_color(struct dc_rgb *rgb,
      |      ^~~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.c:994:6:
error: no previous prototype for '__drm_3dlut32_to_dc_3dlut'
[-Werror=missing-prototypes]
  994 | void __drm_3dlut32_to_dc_3dlut(const struct drm_color_lut32 *lut,
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors make[7]:
*** [/tmp/next/build/scripts/Makefile.build:289:
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_color.o] Error 1
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:48:32:
error: no previous prototype for 'dm_parse_crc_source'
[-Werror=missing-prototypes]
   48 | enum amdgpu_dm_pipe_crc_source dm_parse_crc_source(const char *source)
      |                                ^~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:66:6:
error: no previous prototype for 'dm_is_crc_source_crtc'
[-Werror=missing-prototypes]
   66 | bool dm_is_crc_source_crtc(enum amdgpu_dm_pipe_crc_source src)
      |      ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:74:6:
error: no previous prototype for 'dm_is_crc_source_dprx'
[-Werror=missing-prototypes]
   74 | bool dm_is_crc_source_dprx(enum amdgpu_dm_pipe_crc_source src)
      |      ^~~~~~~~~~~~~~~~~~~~~
/tmp/next/build/drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_crc.c:82:6:
error: no previous prototype for 'dm_need_crc_dither'
[-Werror=missing-prototypes]
   82 | bool dm_need_crc_dither(enum amdgpu_dm_pipe_crc_source src)
      |      ^~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors make[7]:

Caused by commit

   3c108046e1d6f (drm/amd/display: Add power module on Linux)

I have used the version from next-20260518 instead.

--wjVC+bxJU6RfhZDy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoMTB0ACgkQJNaLcl1U
h9BgmAf/f8YK5pQcKiL/1T3qYAmsORWAuwsEQLgN/Rm2OyIpJBb2kitASV8cQSVw
zkuHRUKzyM2fLGF/abFf3uwDoinoEGIpfI8KNh90WQPdvI4OdkzssBnlzNcLgh9U
XEI31s54uCvBHI+3obNTxayyN7FSVtdIo7RA6xIkPrVPbMj4DV5dtk0Cp28/8ANx
jVc5FqwRS5MPJgXXG7+QSIYxjU2+4QasYh0YWuN+YaXnqI+8J+aJ4/IHdMwu+8ca
6eSlkUC2yyAeXYaffhy+ksuMcUEGd6gjS9Jwn3zuveNuJg4brhHRu+6MI5pWvIwF
AXIgVUGBOKuqzZc9Pckm8VZjjjPhcg==
=v6hS
-----END PGP SIGNATURE-----

--wjVC+bxJU6RfhZDy--
