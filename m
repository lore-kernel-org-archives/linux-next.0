Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54CFF1C84C0;
	Tue, 17 Feb 2026 13:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771336075; cv=none; b=kt7ZhSgzzk6TP6eMRjI1vtGM/x6NV+bzqquiWN2AWIYiiACr2SI0ya/t/XltVjPsX/lj4zfrm7uZ1C3Ecca9ktuVDEsLPXOzYFvAY0iLMXG24YM2I3cNm72haxEj+sZw3E///a0QZe3y+wgnOL6W+FGw04re5gkc3sXfm0UUJhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771336075; c=relaxed/simple;
	bh=RQIjdcdItFH9+ofRxm0FwWypycWAt3R3Ea3hyr+HsCc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X8OphtGvDfFZeYnT2twAfrn1l0StO4WVEp1LygNhkaQ2YSa79klM3Y2HioPrvrBETTU09mRU7gnhmeS7B7/77LjW1ZTXuXSs85nDVDaUVoyyEslAAatdNeglBjzjPCAvGl9LW8+F5MQczRfOLJ5XF0UAvrMyXX4+GmmHAgIIwY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XHbly9be; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XHbly9be"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 649F8C4CEF7;
	Tue, 17 Feb 2026 13:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771336074;
	bh=RQIjdcdItFH9+ofRxm0FwWypycWAt3R3Ea3hyr+HsCc=;
	h=Date:From:To:Cc:Subject:From;
	b=XHbly9beOSTcXLA2Hy3OXPFcAXLhr8+95VvpOK7zhYE7kQ0QQAxddRRB5Tp5IqgAs
	 0hd3bXdE5+10g/oUhey6OHNaqxnCbJeBO46SiCytqqD1BQvo4XsqL47dpdrG3qcvUE
	 D/YDpRwlrQOUeZASAXCUfnXbnXP+gZpGrYlJ/VtfMzmgxMI96lCPlGXW/JBbHiNwU+
	 6V3VQqhG/1uZIoMZkUql1BjNXzZWDG0X7XbZ3nzVwqJjq3VZZEvXCrsX03mUSwb1zV
	 LhM/n37Iu28LtSjlQme+Vj+uaNRgyx5Lh/VGHQ2ESYNudSYYp+yBt09fhKEF972WYo
	 oR2ctywRj6MOg==
Date: Tue, 17 Feb 2026 13:47:50 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Alex Hung <alex.hung@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Melissa Wen <mwen@igalia.com>, Ray Wu <ray.wu@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <aZRxhkZNxo_FlQUh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lVLGIQPtnXVkVTIJ"
Content-Disposition: inline


--lVLGIQPtnXVkVTIJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c

between commit:

  d25b32aa829a3 ("drm/amd/display: extend delta clamping logic to CM3 LUT h=
elper")

=66rom the origin tree and commits:

  0274a54897f35 ("drm/amd/display: extend delta clamping logic to CM3 LUT h=
elper")
  92ff6a83cefeb ("drm/amd/display: Check return of shaper curve to HW forma=
t")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
index 518794fad9e1f,a0aaa727e9fa3..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn32/dcn32_hwseq.c
@@@ -52,6 -52,7 +52,7 @@@
  #include "link_service.h"
  #include "../dcn20/dcn20_hwseq.h"
  #include "dc_state_priv.h"
+ #include "dio/dcn10/dcn10_dio.h"
 =20
  #define DC_LOGGER_INIT(logger)
 =20
@@@ -485,7 -486,7 +486,7 @@@ bool dcn32_set_mcm_luts
  	struct dpp *dpp_base =3D pipe_ctx->plane_res.dpp;
  	int mpcc_id =3D pipe_ctx->plane_res.hubp->inst;
  	struct mpc *mpc =3D pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
- 	bool result =3D true;
+ 	bool rval, result;
  	const struct pwl_params *lut_params =3D NULL;
 =20
  	// 1D LUT
@@@ -508,10 -509,10 +509,10 @@@
  		lut_params =3D &plane_state->in_shaper_func.pwl;
  	else if (plane_state->in_shaper_func.type =3D=3D TF_TYPE_DISTRIBUTED_POI=
NTS) {
  		// TODO: dpp_base replace
- 		cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
+ 		rval =3D cm3_helper_translate_curve_to_hw_format(plane_state->ctx,
  							&plane_state->in_shaper_func,
  							&dpp_base->shaper_params, true);
- 		lut_params =3D &dpp_base->shaper_params;
+ 		lut_params =3D rval ? &dpp_base->shaper_params : NULL;
  	}
 =20
  	mpc->funcs->program_shaper(mpc, lut_params, mpcc_id);
@@@ -957,13 -958,13 +958,13 @@@ void dcn32_init_hw(struct dc *dc
  	}
 =20
  	/* power AFMT HDMI memory TODO: may move to dis/en output save power*/
- 	REG_WRITE(DIO_MEM_PWR_CTRL, 0);
+ 	if (dc->res_pool->dio && dc->res_pool->dio->funcs->mem_pwr_ctrl)
+ 		dc->res_pool->dio->funcs->mem_pwr_ctrl(dc->res_pool->dio, false);
 =20
  	if (!dc->debug.disable_clock_gate) {
  		/* enable all DCN clock gating */
- 		REG_WRITE(DCCG_GATE_DISABLE_CNTL, 0);
-=20
- 		REG_WRITE(DCCG_GATE_DISABLE_CNTL2, 0);
+ 		if (dc->res_pool->dccg && dc->res_pool->dccg->funcs && dc->res_pool->dc=
cg->funcs->allow_clock_gating)
+ 			dc->res_pool->dccg->funcs->allow_clock_gating(dc->res_pool->dccg, true=
);
 =20
  		REG_UPDATE(DCFCLK_CNTL, DCFCLK_GATE_DIS, 0);
  	}

--lVLGIQPtnXVkVTIJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUcYUACgkQJNaLcl1U
h9ClXwf+I8+Gm1O3gDmjBLbuZPjFwlRjNeMTbbqAuw3nYfjZGZ8vt4hzWYCMY+xc
fGYcg1KQPe4m+8c1kJu/2oqUjUEDt3vb42O5IgrJFuyNpbYxtmUxzchE43f4s5dT
b4ro/M6VqTmOfUDu/3e64evjdifccsXgpP1eVW8ldicPcn/2hSX7UGe2YBB2Revz
XqoLeP0T0oCnpXiw7mG3DQjUsLW19GDqi0JuDm6fDJpSbttS8sMP2J2aWwk/NKLO
+jQDbACgnYliQUzSF3QmXqw5fOm5FvrNnR0T93WMeF1PQUMVKEPOvJDgfW336mdI
CTyRu0knt50ce1z1Bxmkrd77z0WIRA==
=7odP
-----END PGP SIGNATURE-----

--lVLGIQPtnXVkVTIJ--
