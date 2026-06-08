Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFE5367B6C;
	Mon,  8 Jun 2026 11:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780918202; cv=none; b=ClhSEm21VAhefnDt6lLyF20jMCH2Ks3rB5PeOQZ4xefb5Z+w7SFduvBpgk0V0T1p/MtQ9HRZiTYmiXE4VhFT8DuFItEzJWQDHYyoiHk7kPXPRy6ZJOPr7RoSxS5A9InCFsFAJXPXJigH5OZWRYouMgcKZvculmHsfw+ygrJMSPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780918202; c=relaxed/simple;
	bh=epqlkbq8QBxnedircVCWioq8LBeRImA+U3RLUKsyvbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S9AgWdvVgIfUZ44nCfFbZydktQkWj/6UKh1sao/3o30Up57LZ/CivRfoRZLyb0HUAIUgJat2db73IdUkyz7HJGVForAakNyUCpbHQ6nMqAofb51JYeYXnQTEKemgLlnMLiGXXgX/J/AeXs6CrkkI4zEAkkea53jItPl9LSGfFKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jCSn7TW3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jCSn7TW3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2031F00898;
	Mon,  8 Jun 2026 11:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780918201;
	bh=V3FF+RMvmeZ1pLXAM5kOMBxyJ3iqpdMmECNIMLWua2s=;
	h=Date:From:To:Cc:Subject;
	b=jCSn7TW34apFhEefQHUaPvfKNFY28HChQ/1ii7egz/nujq3+g0zu6nEYr2WgYLLEd
	 JPbwShOI5dQnrwTyNUn1qu1N7PZel+8Ash+gpF30HpXmFKmjDCf/JrU0odKWFuvP4/
	 3I13KcrtSVtLFn3vO3WQ8AgjI1Pau8qBeS6cYtPI9QEUKL0OXzEUgeU17VnjBL+mg8
	 nNdoA515d/cevphgG/0gKFck7OHDtdE2cDWrLkoER+FhyXd9AYYYp1GglCOB/7vNB2
	 4yoL3L5cxq19B+koBUO1Mwil2/6lVDhHNB1TRvQMZbH0GiBIqPDmTQ2V0P5XRvjOEO
	 vF/pHbFoest6g==
Date: Mon, 8 Jun 2026 12:29:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the amdgpu tree with the drm-fixes tree
Message-ID: <aiantThfzBd9yRkF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SywqDH/VIVWUHDMl"
Content-Disposition: inline


--SywqDH/VIVWUHDMl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c

between commit:

  40396ffdf6120 ("drm/amdgpu: restart the CS if some parts of the VM are st=
ill invalidated")

=66rom the drm-fixes tree and commit:

  59720bfd8c6db ("drm/amdgpu: restart the CS if some parts of the VM are st=
ill invalidated")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 548a4f14a9f81,fc071efd4c255..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@@ -60,11 -60,6 +60,6 @@@ static int amdgpu_cs_parser_init(struc
  	if (!p->ctx)
  		return -EINVAL;
 =20
- 	if (atomic_read(&p->ctx->guilty)) {
- 		amdgpu_ctx_put(p->ctx);
- 		return -ECANCELED;
- 	}
-=20
  	amdgpu_sync_create(&p->sync);
  	drm_exec_init(&p->exec, DRM_EXEC_INTERRUPTIBLE_WAIT |
  		      DRM_EXEC_IGNORE_DUPLICATES, 0);
@@@ -850,6 -845,7 +845,6 @@@ static int amdgpu_cs_parser_bos(struct=20
  	struct amdgpu_vm *vm =3D &fpriv->vm;
  	struct amdgpu_bo_list_entry *e;
  	struct drm_gem_object *obj;
 -	unsigned long index;
  	unsigned int i;
  	int r;
 =20
@@@ -960,7 -956,7 +955,7 @@@
  		goto out_free_user_pages;
  	}
 =20
 -	drm_exec_for_each_locked_object(&p->exec, index, obj) {
 +	drm_exec_for_each_locked_object(&p->exec, obj) {
  		r =3D amdgpu_cs_bo_validate(p, gem_to_amdgpu_bo(obj));
  		if (unlikely(r))
  			goto out_free_user_pages;
@@@ -1157,7 -1153,7 +1152,7 @@@ static int amdgpu_cs_vm_handling(struc
  			return r;
  	}
 =20
 -	r =3D amdgpu_vm_handle_moved(adev, vm, &p->exec.ticket);
 +	r =3D amdgpu_vm_handle_moved(adev, vm, drm_exec_ticket(&p->exec));
  	if (r)
  		return r;
 =20
@@@ -1200,6 -1196,7 +1195,6 @@@ static int amdgpu_cs_sync_rings(struct=20
  	struct drm_gpu_scheduler *sched;
  	struct drm_gem_object *obj;
  	struct dma_fence *fence;
 -	unsigned long index;
  	unsigned int i;
  	int r;
 =20
@@@ -1210,7 -1207,7 +1205,7 @@@
  		return r;
  	}
 =20
 -	drm_exec_for_each_locked_object(&p->exec, index, obj) {
 +	drm_exec_for_each_locked_object(&p->exec, obj) {
  		struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(obj);
 =20
  		struct dma_resv *resv =3D bo->tbo.base.resv;
@@@ -1280,6 -1277,7 +1275,6 @@@ static int amdgpu_cs_submit(struct amdg
  	struct amdgpu_vm *vm =3D &fpriv->vm;
  	struct amdgpu_bo_list_entry *e;
  	struct drm_gem_object *gobj;
 -	unsigned long index;
  	unsigned int i;
  	uint64_t seq;
  	int r;
@@@ -1323,14 -1321,14 +1318,14 @@@
  		e->range =3D NULL;
  	}
 =20
- 	if (r || !list_empty(&vm->invalidated)) {
+ 	if (r || !list_empty(&vm->individual.moved)) {
  		r =3D -EAGAIN;
  		mutex_unlock(&p->adev->notifier_lock);
  		return r;
  	}
 =20
  	p->fence =3D dma_fence_get(&leader->base.s_fence->finished);
 -	drm_exec_for_each_locked_object(&p->exec, index, gobj) {
 +	drm_exec_for_each_locked_object(&p->exec, gobj) {
 =20
  		ttm_bo_move_to_lru_tail_unlocked(&gem_to_amdgpu_bo(gobj)->tbo);
 =20
@@@ -1361,7 -1359,7 +1356,7 @@@
  	cs->out.handle =3D seq;
  	leader->uf_sequence =3D seq;
 =20
 -	amdgpu_vm_bo_trace_cs(&fpriv->vm, &p->exec.ticket);
 +	amdgpu_vm_bo_trace_cs(&fpriv->vm, drm_exec_ticket(&p->exec));
  	for (i =3D 0; i < p->gang_size; ++i) {
  		amdgpu_job_free_resources(p->jobs[i]);
  		trace_amdgpu_cs_ioctl(p->jobs[i]);
@@@ -1796,7 -1794,7 +1791,7 @@@ int amdgpu_cs_find_mapping(struct amdgp
  	*map =3D mapping;
 =20
  	/* Double check that the BO is reserved by this CS */
 -	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) !=3D &parser->exec.ticket)
 +	if (dma_resv_locking_ctx((*bo)->tbo.base.resv) !=3D drm_exec_ticket(&par=
ser->exec))
  		return -EINVAL;
 =20
  	/* Make sure VRAM is allocated contigiously */

--SywqDH/VIVWUHDMl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomp7QACgkQJNaLcl1U
h9BYhQf/ZNS0aYlLNZKSOIOMKzgAl/SCa51R+v/7F1HnNwGgmvpW6K18Y9PpogT7
m3+alzSOf3GQyX5kzhjgLByiO+O0rQvuqiMQbzHqElwJXKa4Q7ONFoQSsGgfYwVX
sut7SJuXybz6fNsXJz82+VmfVtOr5V3RTfpIfX/YxPu2TqN9bWvG5+wLT576iMjk
AWaw5BAA+vW12HCRjAfr6aKGpJegPWYTeLrXw+qGygOGN+Y/bR9xBe6PDSjzoLAg
G8/m0luMkJwmAk6hpwWHI+xaCMnOIKqmNAy9NgAz7txhT3YjFE429Jpi7XZShpdc
Z0T3JO8dKv+NKJdJr2fYK/T0iunI4A==
=F0Xb
-----END PGP SIGNATURE-----

--SywqDH/VIVWUHDMl--
