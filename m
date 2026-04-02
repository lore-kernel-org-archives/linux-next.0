Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561E03BF66C;
	Thu,  2 Apr 2026 12:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775133669; cv=none; b=ITmFPmC2Kt1EC8a5ve0HmEXLHAa8uOuFJKs77HYQnRE68BB4QaZRJRq4/Bu3i/q7bZGDKv2plp1nQuo2PkJPdOaW5XFm6i8lxNfO6GpObtSCS8S+whEioOa3vJah1sCZzstaNbb3thq55XRxjeBofR9poAEorx+wvNM2MrkRO4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775133669; c=relaxed/simple;
	bh=2FqV0nNYreuZKhUDWDNRwSZVbPavYaC+ek/2sOViiK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hjvJod+A2A5ODEcSeRTksC03B6QUItkusn7vSe6mDbQNRjLP6yFn82rsJWFhXJy7u9ZBrpprh9DbXfXjXnErVtM85xi6U+fIUzolap1FIZ6WicK7txN3K2FEYxbgTg5VC+pLMg7FPJudhCjWWVso7zBCW16FvmXVD+718nz6P9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FP62KsZK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FP62KsZK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D841C116C6;
	Thu,  2 Apr 2026 12:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775133668;
	bh=2FqV0nNYreuZKhUDWDNRwSZVbPavYaC+ek/2sOViiK8=;
	h=Date:From:To:Cc:Subject:From;
	b=FP62KsZK6g3fjy9BlGk7cbAQuLJAHFI1RZCGuUAVXuymyy/CI5QhCLWH86JWv98Rr
	 AyJCZ6O3O1ZcKho2bXkp4OcWaQZtZeU/+Fh1v3pWOxS+l0ZpgxQKHJzYD5mt1j36tY
	 v/Ew49YlbxpVeTz1Ngr8mpHse+nQrMJZ6xfcFJJHzyIzzt2ObGKymXHMW3d7NHuDKq
	 saOAQNSD7yOjSKUOOAFjSqt3bvj1y5txROvVka8Ip5FrCSGa2eerdCRkqQeW7egwaV
	 o6DFbXzU8kSA4BI4JXMibUKPnFAjTeOxu/HL5DIfGdjn/AOruokTyrAysk7ycoTQ5i
	 vhvjiS5KM/iwg==
Date: Thu, 2 Apr 2026 13:41:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm-next tree
Message-ID: <ac5j4J_0gSqclXvp@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmaCgHqGdqyb80A3"
Content-Disposition: inline


--nmaCgHqGdqyb80A3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c

between commit:

  86117c5ab42f2 ("drm/amd/display: Fix NULL pointer dereference in dcn401_i=
nit_hw()")

=66rom the drm-next tree and commit:

  e927b36ae18b6 ("drm/amd/display: Fix NULL pointer dereference in dcn401_i=
nit_hw()")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
index 53d70db372a97,7e6bdefb5471e..0000000000000
--- a/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
+++ b/drivers/gpu/drm/amd/display/dc/hwss/dcn401/dcn401_hwseq.c
@@@ -140,7 -140,7 +140,7 @@@ void dcn401_init_hw(struct dc *dc
  	struct dc_bios *dcb =3D dc->ctx->dc_bios;
  	struct resource_pool *res_pool =3D dc->res_pool;
  	int i;
- 	int edp_num;
+ 	unsigned int edp_num;
  	uint32_t backlight =3D MAX_BACKLIGHT_LEVEL;
  	uint32_t user_level =3D MAX_BACKLIGHT_LEVEL;
  	bool dchub_ref_freq_changed;
@@@ -368,20 -368,19 +368,19 @@@
  		    dc->res_pool->funcs->update_bw_bounding_box &&
  		    dc->clk_mgr && dc->clk_mgr->bw_params) {
  			/* update bounding box if FAMS2 disabled, or if dchub clk has changed =
*/
 -			if (dc->clk_mgr)
 -				dc->res_pool->funcs->update_bw_bounding_box(dc, dc->clk_mgr->bw_param=
s);
 +			dc->res_pool->funcs->update_bw_bounding_box(dc,
 +								    dc->clk_mgr->bw_params);
  		}
  	}
  }
 =20
- void dcn401_trigger_3dlut_dma_load(struct pipe_ctx *pipe_ctx)
+ void dcn401_trigger_3dlut_dma_load(struct dc *dc, struct pipe_ctx *pipe_c=
tx)
  {
- 	const struct pipe_ctx *primary_dpp_pipe_ctx =3D resource_get_primary_dpp=
_pipe(pipe_ctx);
- 	struct hubp *primary_hubp =3D primary_dpp_pipe_ctx ?
- 			primary_dpp_pipe_ctx->plane_res.hubp : NULL;
+ 	(void)dc;
+ 	struct hubp *hubp =3D pipe_ctx->plane_res.hubp;
 =20
- 	if (primary_hubp && primary_hubp->funcs->hubp_enable_3dlut_fl) {
- 		primary_hubp->funcs->hubp_enable_3dlut_fl(primary_hubp, true);
+ 	if (hubp->funcs->hubp_enable_3dlut_fl) {
+ 		hubp->funcs->hubp_enable_3dlut_fl(hubp, true);
  	}
  }
 =20
@@@ -389,11 -388,8 +388,8 @@@ bool dcn401_set_mcm_luts(struct pipe_ct
  				const struct dc_plane_state *plane_state)
  {
  	struct dc *dc =3D pipe_ctx->plane_res.hubp->ctx->dc;
- 	const struct pipe_ctx *primary_dpp_pipe_ctx =3D resource_get_primary_dpp=
_pipe(pipe_ctx);
  	struct dpp *dpp_base =3D pipe_ctx->plane_res.dpp;
  	struct hubp *hubp =3D pipe_ctx->plane_res.hubp;
- 	struct hubp *primary_hubp =3D	primary_dpp_pipe_ctx ?
- 			primary_dpp_pipe_ctx->plane_res.hubp : NULL;
  	const struct dc_plane_cm *cm =3D &plane_state->cm;
  	int mpcc_id =3D hubp->inst;
  	struct mpc *mpc =3D dc->res_pool->mpc;
@@@ -491,41 -487,25 +487,25 @@@
  			mpc->funcs->program_lut_read_write_control(mpc, MCM_LUT_3DLUT, lut_ban=
k_a, 12, mpcc_id);
 =20
  		if (mpc->funcs->update_3dlut_fast_load_select)
- 			mpc->funcs->update_3dlut_fast_load_select(mpc, mpcc_id, primary_hubp->=
inst);
+ 			mpc->funcs->update_3dlut_fast_load_select(mpc, mpcc_id, hubp->inst);
 =20
  		/* HUBP */
- 		if (primary_hubp->inst =3D=3D hubp->inst) {
- 			/* only program if this is the primary dpp pipe for the given plane */
- 			if (hubp->funcs->hubp_program_3dlut_fl_config)
- 				hubp->funcs->hubp_program_3dlut_fl_config(hubp, &cm->lut3d_dma);
+ 		if (hubp->funcs->hubp_program_3dlut_fl_config)
+ 			hubp->funcs->hubp_program_3dlut_fl_config(hubp, &cm->lut3d_dma);
 =20
- 			if (hubp->funcs->hubp_program_3dlut_fl_crossbar)
- 				hubp->funcs->hubp_program_3dlut_fl_crossbar(hubp, cm->lut3d_dma.forma=
t);
+ 		if (hubp->funcs->hubp_program_3dlut_fl_crossbar)
+ 			hubp->funcs->hubp_program_3dlut_fl_crossbar(hubp, cm->lut3d_dma.format=
);
 =20
- 			if (hubp->funcs->hubp_program_3dlut_fl_addr)
- 				hubp->funcs->hubp_program_3dlut_fl_addr(hubp, &cm->lut3d_dma.addr);
+ 		if (hubp->funcs->hubp_program_3dlut_fl_addr)
+ 			hubp->funcs->hubp_program_3dlut_fl_addr(hubp, &cm->lut3d_dma.addr);
 =20
- 			if (hubp->funcs->hubp_enable_3dlut_fl) {
- 				hubp->funcs->hubp_enable_3dlut_fl(hubp, true);
- 			} else {
- 				/* GPU memory only supports fast load path */
- 				BREAK_TO_DEBUGGER();
- 				lut_enable =3D false;
- 				result =3D false;
- 			}
+ 		if (hubp->funcs->hubp_enable_3dlut_fl) {
+ 			hubp->funcs->hubp_enable_3dlut_fl(hubp, true);
  		} else {
- 			/* re-trigger priamry HUBP to load 3DLUT */
- 			if (primary_hubp->funcs->hubp_enable_3dlut_fl) {
- 				primary_hubp->funcs->hubp_enable_3dlut_fl(primary_hubp, true);
- 			}
-=20
- 			/* clear FL setup on this pipe's HUBP */
- 			memset(&lut3d_dma, 0, sizeof(lut3d_dma));
- 			if (hubp->funcs->hubp_program_3dlut_fl_config)
- 				hubp->funcs->hubp_program_3dlut_fl_config(hubp, &lut3d_dma);
-=20
- 			if (hubp->funcs->hubp_enable_3dlut_fl)
- 				hubp->funcs->hubp_enable_3dlut_fl(hubp, false);
+ 			/* GPU memory only supports fast load path */
+ 			BREAK_TO_DEBUGGER();
+ 			lut_enable =3D false;
+ 			result =3D false;
  		}
  	} else {
  		/* Legacy (Host) Load Mode */
@@@ -577,6 -557,7 +557,7 @@@ bool dcn401_set_output_transfer_func(st
  				struct pipe_ctx *pipe_ctx,
  				const struct dc_stream_state *stream)
  {
+ 	(void)dc;
  	int mpcc_id =3D pipe_ctx->plane_res.hubp->inst;
  	struct mpc *mpc =3D pipe_ctx->stream_res.opp->ctx->dc->res_pool->mpc;
  	const struct pwl_params *params =3D NULL;
@@@ -638,6 -619,7 +619,7 @@@ static void enable_stream_timing_calc
  		struct drr_params *params,
  		unsigned int *event_triggers)
  {
+ 	(void)dc;
  	struct dc_stream_state *stream =3D pipe_ctx->stream;
  	int i;
 =20
@@@ -1415,6 -1397,7 +1397,7 @@@ void dcn401_dmub_hw_control_lock(struc
  		struct dc_state *context,
  		bool lock)
  {
+ 	(void)context;
  	/* use always for now */
  	union dmub_inbox0_cmd_lock_hw hw_lock_cmd =3D { 0 };
 =20
@@@ -1835,41 -1818,42 +1818,42 @@@ void dcn401_perform_3dlut_wa_unlock(str
  	 * This is meant to work around a known HW issue where VREADY will cance=
l the pending 3DLUT_ENABLE signal regardless
  	 * of whether OTG lock is currently being held or not.
  	 */
- 	const struct pipe_ctx *otg_master_pipe_ctx =3D resource_get_otg_master(p=
ipe_ctx);
- 	struct timing_generator *tg =3D otg_master_pipe_ctx ?
- 			otg_master_pipe_ctx->stream_res.tg : NULL;
- 	const struct pipe_ctx *primary_dpp_pipe_ctx =3D resource_is_pipe_type(pi=
pe_ctx, DPP_PIPE) ?
- 			resource_get_primary_dpp_pipe(pipe_ctx) : pipe_ctx;
- 	struct hubp *primary_hubp =3D primary_dpp_pipe_ctx ?
- 			primary_dpp_pipe_ctx->plane_res.hubp : NULL;
+ 	struct pipe_ctx *wa_pipes[MAX_PIPES] =3D { NULL };
+ 	struct pipe_ctx *odm_pipe, *mpc_pipe;
+ 	int i, wa_pipe_ct =3D 0;
 =20
- 	if (!otg_master_pipe_ctx && !tg) {
- 		return;
+ 	for (odm_pipe =3D pipe_ctx; odm_pipe !=3D NULL; odm_pipe =3D odm_pipe->n=
ext_odm_pipe) {
+ 		for (mpc_pipe =3D odm_pipe; mpc_pipe !=3D NULL; mpc_pipe =3D mpc_pipe->=
bottom_pipe) {
+ 			if (mpc_pipe->plane_state &&
+ 					mpc_pipe->plane_state->cm.flags.bits.lut3d_enable &&
+ 					mpc_pipe->plane_state->cm.flags.bits.lut3d_dma_enable) {
+ 				wa_pipes[wa_pipe_ct++] =3D mpc_pipe;
+ 			}
+ 		}
  	}
 =20
- 	if (primary_dpp_pipe_ctx &&
- 			primary_dpp_pipe_ctx->plane_state &&
- 			primary_dpp_pipe_ctx->plane_state->cm.flags.bits.lut3d_enable &&
- 			primary_dpp_pipe_ctx->plane_state->cm.flags.bits.lut3d_dma_enable) {
- 		if (tg->funcs->set_vupdate_keepout)
- 			tg->funcs->set_vupdate_keepout(tg, true);
+ 	if (wa_pipe_ct > 0) {
+ 		if (pipe_ctx->stream_res.tg->funcs->set_vupdate_keepout)
+ 			pipe_ctx->stream_res.tg->funcs->set_vupdate_keepout(pipe_ctx->stream_r=
es.tg, true);
 =20
- 		if (primary_hubp->funcs->hubp_enable_3dlut_fl) {
- 			primary_hubp->funcs->hubp_enable_3dlut_fl(primary_hubp, true);
+ 		for (i =3D 0; i < wa_pipe_ct; ++i) {
+ 			if (wa_pipes[i]->plane_res.hubp->funcs->hubp_enable_3dlut_fl)
+ 				wa_pipes[i]->plane_res.hubp->funcs->hubp_enable_3dlut_fl(wa_pipes[i]-=
>plane_res.hubp, true);
  		}
 =20
- 		tg->funcs->unlock(tg);
- 		if (tg->funcs->wait_update_lock_status)
- 			tg->funcs->wait_update_lock_status(tg, false);
+ 		pipe_ctx->stream_res.tg->funcs->unlock(pipe_ctx->stream_res.tg);
+ 		if (pipe_ctx->stream_res.tg->funcs->wait_update_lock_status)
+ 			pipe_ctx->stream_res.tg->funcs->wait_update_lock_status(pipe_ctx->stre=
am_res.tg, false);
 =20
- 		if (primary_hubp->funcs->hubp_enable_3dlut_fl) {
- 			primary_hubp->funcs->hubp_enable_3dlut_fl(primary_hubp, true);
+ 		for (i =3D 0; i < wa_pipe_ct; ++i) {
+ 			if (wa_pipes[i]->plane_res.hubp->funcs->hubp_enable_3dlut_fl)
+ 				wa_pipes[i]->plane_res.hubp->funcs->hubp_enable_3dlut_fl(wa_pipes[i]-=
>plane_res.hubp, true);
  		}
 =20
- 		if (tg->funcs->set_vupdate_keepout)
- 			tg->funcs->set_vupdate_keepout(tg, false);
+ 		if (pipe_ctx->stream_res.tg->funcs->set_vupdate_keepout)
+ 			pipe_ctx->stream_res.tg->funcs->set_vupdate_keepout(pipe_ctx->stream_r=
es.tg, false);
  	} else {
- 		tg->funcs->unlock(tg);
+ 		pipe_ctx->stream_res.tg->funcs->unlock(pipe_ctx->stream_res.tg);
  	}
  }
 =20
@@@ -1888,6 -1872,7 +1872,7 @@@ void dcn401_reset_back_end_for_pipe
  		struct pipe_ctx *pipe_ctx,
  		struct dc_state *context)
  {
+ 	(void)context;
  	struct dc_link *link =3D pipe_ctx->stream->link;
  	const struct link_hwss *link_hwss =3D get_link_hwss(link, &pipe_ctx->lin=
k_res);
 =20
@@@ -1943,7 -1928,7 +1928,7 @@@
  		 * the case where the same symclk is shared across multiple otg
  		 * instances
  		 */
- 		if (dc_is_hdmi_tmds_signal(pipe_ctx->stream->signal))
+ 		if (dc_is_tmds_signal(pipe_ctx->stream->signal))
  			link->phy_state.symclk_ref_cnts.otg =3D 0;
  		if (link->phy_state.symclk_state =3D=3D SYMCLK_ON_TX_OFF) {
  			link_hwss->disable_link_output(link,
@@@ -3263,6 -3248,7 +3248,7 @@@ void dcn401_update_writeback_sequence
  		struct dc_state *context,
  		struct block_sequence_state *seq_state)
  {
+ 	(void)context;
  	struct dwbc *dwb;
  	struct mcif_wb *mcif_wb;
 =20
@@@ -3468,6 -3454,7 +3454,7 @@@ void dcn401_enable_plane_sequence(struc
  				 struct dc_state *context,
  				 struct block_sequence_state *seq_state)
  {
+ 	(void)context;
  	struct dce_hwseq *hws =3D dc->hwseq;
  	uint32_t org_ip_request_cntl =3D 0;
 =20

--nmaCgHqGdqyb80A3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnOY98ACgkQJNaLcl1U
h9Bl0wf/YPY+f++IIJIvzKrB6iKYVY+laBzQbiTD4DEc4BFubysrjamUBkFl22mS
yk40y9WCILTawuGUejbzIzNa3rWSi0AvRy8mmjJZv5+Rrr8wqr1bNArwOTfaEedW
ZNUGBYywBf70dk2XB5lw8HJcYcpP1VU5Em2nUrlh3/5id2D9Pxty+Lqz6kLdyIjv
glY/oAjeI7SgXPwB46BvHQ3i4kkblD2IjnfMPtOTNaKo4fM1MCDrJG1l+qO+uVro
YcKU68/rDrEhOgV31ChfzMfnyuVABohSrO03hS2dKsokltLROxpjkly0W1W6ygCP
tuVkbyYRakKLtQIiXeg8kItMTqnOOw==
=s6ii
-----END PGP SIGNATURE-----

--nmaCgHqGdqyb80A3--
