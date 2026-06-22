Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB2525A2DD;
	Mon, 22 Jun 2026 10:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125135; cv=none; b=JFa1zJzkwe9cMmF7VTLISbMgSuRSrQwnhwaePrCI6TuHd9sbuB5PUwXL3ZuB14GW38fDNCq3L8ae7W287KLR4vXoOplgg3jolBX3jBa1XlQGmRBP6aBPHQJIhK967LSg9HuTn36BrhiFOeEhlwW3zM0xY6yukf3waRZUU5K7IpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125135; c=relaxed/simple;
	bh=t7gsUXlpqZuPMbOWExhcdv0rxAlFlQ1uMLEH7tCy1O8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d306LMuW7TZJ7JVjQKitCb1RdhR7yypj5P/37zyqLftb3xrmC7Jk361AxTorBaCD5q49fpKn46KW6ZnQhsODf+dRLXMDAiJ6ONkZbD+ebKo9KWqMBG6UUkDgzCDPHfn5deRewT+Xd994ndi312srIMt5QKqeUes0LiAQ2PO0Reo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0TiJxEe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0TiJxEe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DACE1F000E9;
	Mon, 22 Jun 2026 10:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125133;
	bh=j64EUkN8kFFeNpwGtv1yCNvDEMMNkeDf3URN0HaH1n0=;
	h=Date:From:To:Cc:Subject;
	b=g0TiJxEeN772aHaFUGhxzmZFFDuVmW9M5yT2gLnpaABSHGmtYokXc2mqkqDYBiNVz
	 d5xSuUVcrDpoZ6JnI3Cg/Id1i3eXO9Oyh6mIoFWINRA2955Si24aTTO8JqPhFA66ET
	 vejupWglx+XrGPu7AXq1bsIs1d6DWaVqvvS6EIgFVEY0q9NMLedpEffUtpkG6owJcC
	 Qy29mI5wwByjZVor4s8lkrUW5ntLGUkAJZ27tchaQbPGsuSC+UbLajG1gRKrfTyqRY
	 w2UU/lXhV+opZxGvbdOkm1/GYfFBmgwuS2s0gJxtKsUPOruT49aCZ4b3cLJ5BrVvW4
	 3+LXdVo2JFWNA==
Date: Mon, 22 Jun 2026 11:45:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <ajkSStP_3-j20Qcx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pYU/dV4aCOBxi4KJ"
Content-Disposition: inline


--pYU/dV4aCOBxi4KJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c

between commit:

  c1dc4ccb82c9e ("drm/amdgpu: Fix context pstate override handling")

=66rom the drm tree and commit:

  1b5e413713c0a ("drm/amdgpu: Fix context pstate override handling")

=66rom the amdgpu tree.

diff --combined drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index ce35b415093d6,b15ed4a534f17..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@@ -283,6 -283,8 +283,8 @@@ static ktime_t amdgpu_ctx_fini_entity(s
  	if (!entity)
  		return res;
 =20
+ 	drm_sched_entity_destroy(&entity->entity);
+=20
  	for (i =3D 0; i < amdgpu_sched_jobs; ++i) {
  		res =3D ktime_add(res, amdgpu_ctx_fence_time(entity->fences[i]));
  		dma_fence_put(entity->fences[i]);
@@@ -294,32 -296,20 +296,20 @@@
  	return res;
  }
 =20
- static int amdgpu_ctx_get_stable_pstate(struct amdgpu_ctx *ctx,
- 					u32 *stable_pstate)
+ static u32 amdgpu_get_stable_pstate(struct amdgpu_device *adev)
  {
- 	struct amdgpu_device *adev =3D ctx->mgr->adev;
- 	enum amd_dpm_forced_level current_level;
-=20
- 	current_level =3D amdgpu_dpm_get_performance_level(adev);
-=20
- 	switch (current_level) {
+ 	switch (amdgpu_dpm_get_performance_level(adev)) {
  	case AMD_DPM_FORCED_LEVEL_PROFILE_STANDARD:
- 		*stable_pstate =3D AMDGPU_CTX_STABLE_PSTATE_STANDARD;
- 		break;
+ 		return AMDGPU_CTX_STABLE_PSTATE_STANDARD;
  	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_SCLK:
- 		*stable_pstate =3D AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK;
- 		break;
+ 		return AMDGPU_CTX_STABLE_PSTATE_MIN_SCLK;
  	case AMD_DPM_FORCED_LEVEL_PROFILE_MIN_MCLK:
- 		*stable_pstate =3D AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK;
- 		break;
+ 		return AMDGPU_CTX_STABLE_PSTATE_MIN_MCLK;
  	case AMD_DPM_FORCED_LEVEL_PROFILE_PEAK:
- 		*stable_pstate =3D AMDGPU_CTX_STABLE_PSTATE_PEAK;
- 		break;
+ 		return AMDGPU_CTX_STABLE_PSTATE_PEAK;
  	default:
- 		*stable_pstate =3D AMDGPU_CTX_STABLE_PSTATE_NONE;
- 		break;
+ 		return AMDGPU_CTX_STABLE_PSTATE_NONE;
  	}
- 	return 0;
  }
 =20
  static int amdgpu_ctx_init(struct amdgpu_ctx_mgr *mgr, int32_t priority,
@@@ -355,7 -345,7 +345,7 @@@ static int __amdgpu_ctx_set_stable_psta
  	enum amd_dpm_forced_level level;
  	struct amdgpu_ctx *current_ctx;
  	u32 current_stable_pstate;
 -	int r;
 +	int r =3D 0;
 =20
  	lockdep_assert_held(&adev->pm.stable_pstate_ctx_lock);
 =20
@@@ -383,9 -373,9 +373,9 @@@
  	if (current_ctx && current_ctx !=3D ctx)
  		return -EBUSY;
 =20
- 	r =3D amdgpu_ctx_get_stable_pstate(ctx, &current_stable_pstate);
- 	if (r || current_stable_pstate =3D=3D stable_pstate)
- 		return r;
+ 	current_stable_pstate =3D amdgpu_get_stable_pstate(adev);
+ 	if (current_stable_pstate =3D=3D stable_pstate)
+ 		return 0;
 =20
  	r =3D amdgpu_dpm_force_performance_level(adev, level);
  	if (r)
@@@ -416,7 -406,7 +406,7 @@@ static int amdgpu_ctx_set_stable_pstate
  	return r;
  }
 =20
- static void amdgpu_ctx_fini(struct kref *ref)
+ void amdgpu_ctx_fini(struct kref *ref)
  {
  	struct amdgpu_ctx *ctx =3D container_of(ref, struct amdgpu_ctx, refcount=
);
  	struct amdgpu_ctx_mgr *mgr =3D ctx->mgr;
@@@ -504,53 -494,26 +494,26 @@@ static int amdgpu_ctx_alloc(struct amdg
  	if (!ctx)
  		return -ENOMEM;
 =20
- 	mutex_lock(&mgr->lock);
- 	r =3D idr_alloc(&mgr->ctx_handles, ctx, 1, AMDGPU_VM_MAX_NUM_CTX, GFP_KE=
RNEL);
- 	if (r < 0) {
- 		mutex_unlock(&mgr->lock);
+ 	r =3D amdgpu_ctx_init(mgr, priority, filp, ctx);
+ 	if (r) {
  		kfree(ctx);
  		return r;
  	}
 =20
- 	*id =3D (uint32_t)r;
- 	r =3D amdgpu_ctx_init(mgr, priority, filp, ctx);
- 	if (r) {
- 		idr_remove(&mgr->ctx_handles, *id);
- 		*id =3D 0;
- 		kfree(ctx);
- 	}
- 	mutex_unlock(&mgr->lock);
+ 	r =3D xa_alloc(&mgr->ctx_handles, id, ctx, xa_limit_32b, GFP_KERNEL);
+ 	if (r)
+ 		amdgpu_ctx_put(ctx);
+=20
  	return r;
  }
 =20
- static void amdgpu_ctx_do_release(struct kref *ref)
- {
- 	struct amdgpu_ctx *ctx;
- 	u32 i, j;
-=20
- 	ctx =3D container_of(ref, struct amdgpu_ctx, refcount);
- 	for (i =3D 0; i < AMDGPU_HW_IP_NUM; ++i) {
- 		for (j =3D 0; j < amdgpu_ctx_num_entities[i]; ++j) {
- 			if (!ctx->entities[i][j])
- 				continue;
-=20
- 			drm_sched_entity_destroy(&ctx->entities[i][j]->entity);
- 		}
- 	}
-=20
- 	amdgpu_ctx_fini(ref);
- }
-=20
  static int amdgpu_ctx_free(struct amdgpu_fpriv *fpriv, uint32_t id)
  {
- 	struct amdgpu_ctx_mgr *mgr =3D &fpriv->ctx_mgr;
  	struct amdgpu_ctx *ctx;
 =20
- 	mutex_lock(&mgr->lock);
- 	ctx =3D idr_remove(&mgr->ctx_handles, id);
- 	if (ctx)
- 		kref_put(&ctx->refcount, amdgpu_ctx_do_release);
- 	mutex_unlock(&mgr->lock);
+ 	ctx =3D xa_erase(&fpriv->ctx_mgr.ctx_handles, id);
+ 	amdgpu_ctx_put(ctx);
+=20
  	return ctx ? 0 : -EINVAL;
  }
 =20
@@@ -559,20 -522,12 +522,12 @@@ static int amdgpu_ctx_query(struct amdg
  			    union drm_amdgpu_ctx_out *out)
  {
  	struct amdgpu_ctx *ctx;
- 	struct amdgpu_ctx_mgr *mgr;
  	unsigned reset_counter;
 =20
- 	if (!fpriv)
+ 	ctx =3D amdgpu_ctx_get(fpriv, id);
+ 	if (!ctx)
  		return -EINVAL;
 =20
- 	mgr =3D &fpriv->ctx_mgr;
- 	mutex_lock(&mgr->lock);
- 	ctx =3D idr_find(&mgr->ctx_handles, id);
- 	if (!ctx) {
- 		mutex_unlock(&mgr->lock);
- 		return -EINVAL;
- 	}
-=20
  	/* TODO: these two are always zero */
  	out->state.flags =3D 0x0;
  	out->state.hangs =3D 0x0;
@@@ -586,7 -541,8 +541,8 @@@
  		out->state.reset_status =3D AMDGPU_CTX_UNKNOWN_RESET;
  	ctx->reset_counter_query =3D reset_counter;
 =20
- 	mutex_unlock(&mgr->lock);
+ 	amdgpu_ctx_put(ctx);
+=20
  	return 0;
  }
 =20
@@@ -619,19 -575,11 +575,11 @@@ static int amdgpu_ctx_query2(struct amd
  {
  	struct amdgpu_ras *con =3D amdgpu_ras_get_context(adev);
  	struct amdgpu_ctx *ctx;
- 	struct amdgpu_ctx_mgr *mgr;
 =20
- 	if (!fpriv)
+ 	ctx =3D amdgpu_ctx_get(fpriv, id);
+ 	if (!ctx)
  		return -EINVAL;
 =20
- 	mgr =3D &fpriv->ctx_mgr;
- 	mutex_lock(&mgr->lock);
- 	ctx =3D idr_find(&mgr->ctx_handles, id);
- 	if (!ctx) {
- 		mutex_unlock(&mgr->lock);
- 		return -EINVAL;
- 	}
-=20
  	out->state.flags =3D 0x0;
  	out->state.hangs =3D 0x0;
 =20
@@@ -671,7 -619,8 +619,8 @@@
  				      msecs_to_jiffies(AMDGPU_RAS_COUNTE_DELAY_MS));
  	}
 =20
- 	mutex_unlock(&mgr->lock);
+ 	amdgpu_ctx_put(ctx);
+=20
  	return 0;
  }
 =20
@@@ -680,26 -629,26 +629,26 @@@ static int amdgpu_ctx_stable_pstate(str
  				    bool set, u32 *stable_pstate)
  {
  	struct amdgpu_ctx *ctx;
- 	struct amdgpu_ctx_mgr *mgr;
- 	int r;
+ 	int r =3D 0;
 =20
- 	if (!fpriv)
+ 	ctx =3D amdgpu_ctx_get(fpriv, id);
+ 	if (!ctx)
  		return -EINVAL;
 =20
- 	mgr =3D &fpriv->ctx_mgr;
- 	mutex_lock(&mgr->lock);
- 	ctx =3D idr_find(&mgr->ctx_handles, id);
- 	if (!ctx) {
- 		mutex_unlock(&mgr->lock);
- 		return -EINVAL;
- 	}
+ 	/*
+ 	 * The get path is odd in this uapi - it will check whether the context
+ 	 * id exist, but otherwise does nothing with it. In other words, the
+ 	 * uapi has historically been implemented as being able to query the
+ 	 * global device state, as long as the caller supplies a random valid
+ 	 * context id.
+ 	 */
 =20
  	if (set)
  		r =3D amdgpu_ctx_set_stable_pstate(ctx, *stable_pstate);
  	else
- 		r =3D amdgpu_ctx_get_stable_pstate(ctx, stable_pstate);
+ 		*stable_pstate =3D amdgpu_get_stable_pstate(adev);
 =20
- 	mutex_unlock(&mgr->lock);
+ 	amdgpu_ctx_put(ctx);
  	return r;
  }
 =20
@@@ -778,23 -727,14 +727,14 @@@ struct amdgpu_ctx *amdgpu_ctx_get(struc
 =20
  	mgr =3D &fpriv->ctx_mgr;
 =20
- 	mutex_lock(&mgr->lock);
- 	ctx =3D idr_find(&mgr->ctx_handles, id);
+ 	xa_lock(&mgr->ctx_handles);
+ 	ctx =3D xa_load(&mgr->ctx_handles, id);
  	if (ctx)
  		kref_get(&ctx->refcount);
- 	mutex_unlock(&mgr->lock);
+ 	xa_unlock(&mgr->ctx_handles);
  	return ctx;
  }
 =20
- int amdgpu_ctx_put(struct amdgpu_ctx *ctx)
- {
- 	if (ctx =3D=3D NULL)
- 		return -EINVAL;
-=20
- 	kref_put(&ctx->refcount, amdgpu_ctx_do_release);
- 	return 0;
- }
-=20
  uint64_t amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
  			      struct drm_sched_entity *entity,
  			      struct dma_fence *fence)
@@@ -928,8 -868,7 +868,7 @@@ void amdgpu_ctx_mgr_init(struct amdgpu_
  	unsigned int i;
 =20
  	mgr->adev =3D adev;
- 	mutex_init(&mgr->lock);
- 	idr_init_base(&mgr->ctx_handles, 1);
+ 	xa_init_flags(&mgr->ctx_handles, XA_FLAGS_ALLOC1);
 =20
  	for (i =3D 0; i < AMDGPU_HW_IP_NUM; ++i)
  		atomic64_set(&mgr->time_spend[i], 0);
@@@ -938,13 -877,13 +877,13 @@@
  long amdgpu_ctx_mgr_entity_flush(struct amdgpu_ctx_mgr *mgr, long timeout)
  {
  	struct amdgpu_ctx *ctx;
- 	struct idr *idp;
- 	uint32_t id, i, j;
+ 	unsigned long id;
+ 	int i, j;
 =20
- 	idp =3D &mgr->ctx_handles;
-=20
- 	mutex_lock(&mgr->lock);
- 	idr_for_each_entry(idp, ctx, id) {
+ 	xa_lock(&mgr->ctx_handles);
+ 	xa_for_each(&mgr->ctx_handles, id, ctx) {
+ 		kref_get(&ctx->refcount);
+ 		xa_unlock(&mgr->ctx_handles);
  		for (i =3D 0; i < AMDGPU_HW_IP_NUM; ++i) {
  			for (j =3D 0; j < amdgpu_ctx_num_entities[i]; ++j) {
  				struct drm_sched_entity *entity;
@@@ -956,45 -895,21 +895,21 @@@
  				timeout =3D drm_sched_entity_flush(entity, timeout);
  			}
  		}
+ 		amdgpu_ctx_put(ctx);
+ 		xa_lock(&mgr->ctx_handles);
  	}
- 	mutex_unlock(&mgr->lock);
+ 	xa_unlock(&mgr->ctx_handles);
  	return timeout;
  }
 =20
- static void amdgpu_ctx_mgr_entity_fini(struct amdgpu_ctx_mgr *mgr)
- {
- 	struct amdgpu_ctx *ctx;
- 	struct idr *idp;
- 	uint32_t id, i, j;
-=20
- 	idp =3D &mgr->ctx_handles;
-=20
- 	idr_for_each_entry(idp, ctx, id) {
- 		if (kref_read(&ctx->refcount) !=3D 1) {
- 			drm_err(adev_to_drm(mgr->adev), "ctx %p is still alive\n", ctx);
- 			continue;
- 		}
-=20
- 		for (i =3D 0; i < AMDGPU_HW_IP_NUM; ++i) {
- 			for (j =3D 0; j < amdgpu_ctx_num_entities[i]; ++j) {
- 				struct drm_sched_entity *entity;
-=20
- 				if (!ctx->entities[i][j])
- 					continue;
-=20
- 				entity =3D &ctx->entities[i][j]->entity;
- 				drm_sched_entity_fini(entity);
- 			}
- 		}
- 		kref_put(&ctx->refcount, amdgpu_ctx_fini);
- 	}
- }
-=20
  void amdgpu_ctx_mgr_fini(struct amdgpu_ctx_mgr *mgr)
  {
- 	amdgpu_ctx_mgr_entity_fini(mgr);
- 	idr_destroy(&mgr->ctx_handles);
- 	mutex_destroy(&mgr->lock);
+ 	struct amdgpu_ctx *ctx;
+ 	unsigned long id;
+=20
+ 	xa_for_each(&mgr->ctx_handles, id, ctx)
+ 		amdgpu_ctx_put(ctx);
+ 	xa_destroy(&mgr->ctx_handles);
  }
 =20
  void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
@@@ -1002,21 -917,21 +917,21 @@@
  {
  	struct amdgpu_ctx *ctx;
  	unsigned int hw_ip, i;
- 	uint32_t id;
+ 	unsigned long id;
 =20
  	/*
  	 * This is a little bit racy because it can be that a ctx or a fence are
  	 * destroyed just in the moment we try to account them. But that is ok
  	 * since exactly that case is explicitely allowed by the interface.
  	 */
- 	mutex_lock(&mgr->lock);
  	for (hw_ip =3D 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
  		uint64_t ns =3D atomic64_read(&mgr->time_spend[hw_ip]);
 =20
  		usage[hw_ip] =3D ns_to_ktime(ns);
  	}
 =20
- 	idr_for_each_entry(&mgr->ctx_handles, ctx, id) {
+ 	xa_lock(&mgr->ctx_handles);
+ 	xa_for_each(&mgr->ctx_handles, id, ctx) {
  		for (hw_ip =3D 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
  			for (i =3D 0; i < amdgpu_ctx_num_entities[hw_ip]; ++i) {
  				struct amdgpu_ctx_entity *centity;
@@@ -1030,5 -945,5 +945,5 @@@
  			}
  		}
  	}
- 	mutex_unlock(&mgr->lock);
+ 	xa_unlock(&mgr->ctx_handles);
  }

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--pYU/dV4aCOBxi4KJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5EkkACgkQJNaLcl1U
h9Bqagf9EOPasgzTB2TYbWzzp/h95urh1h60rVX0pLZY3RdctvWIWOreRv9cZQBr
w58bJXW4qxvWV95htR8iHz8ZJoMcAcJUG7VKZjKpx6pxU1zZTCjmOlvQsr2dRSIK
jWRo+4kBiDecJMgtTDi39dpAROIbZwSxga6XC/8oy7gDkzFQVwF1T8f3nIt7WSEU
vHe6KVPiNKSYh5vdDCrUDD9sVJll1Ldyi30nZrnYvObDs+8uQzcw7sMs7230DEr+
q+Caav6FyJus/0kjpn18sJdCafAA6hL4Um+ZN6/3/4DIIFh5sR2d1pt0ndbvefIk
A+WAr1qaSjN/CQnnw6QYzO5CKvScIA==
=PA9+
-----END PGP SIGNATURE-----

--pYU/dV4aCOBxi4KJ--
