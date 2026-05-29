Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC894288D0;
	Fri, 29 May 2026 22:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780092037; cv=none; b=hf9KDmpKhdNA0YJJgATgq1okQp2t/hNKCF7vmiYMgQOh2SNHiy0AiJ0Rf8d/tJ9WiHEiPNjS4KeHEBM7jbn/vD3Fy5WoktwZwid4bztlUQXNPIICleFPZhkgTHD0qRoS1tLv8bKz030VO5z8YZpq1NHck4Hf0/VBjrOoZ++q7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780092037; c=relaxed/simple;
	bh=GNPzzErdtVnezWbfLAD1trLPiqOr+hILKOlJbZmKm8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GHoYChZzGAt2BA2ax60AF0CoGrwRe30ArAxKSPwdR1y6cSuceESHVNccuvnRUXk/BF+ylNp2olKzarh9/tzg7Y1jV3WmfNSy/+DpWS7wGSnVfIg8HYjbmVOY3DtrZsCu9/tkZKpGW3KLJ6E4huElq0B9On4t3OKw7d6AvUOb5m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jq/hnTMz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jq/hnTMz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D2A21F00898;
	Fri, 29 May 2026 22:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780092036;
	bh=+42eiyHA15Orwbnpyv4/0KMsTUq8tUbuOuwO5RtK91o=;
	h=Date:From:To:Cc:Subject;
	b=Jq/hnTMz5sfTxuD/PbMddYfxO9jw/vBbjYSfP5KTO88LhAg2r7Ajrf0iRfuSz0NWY
	 1zaq2JZZhEVojGnvQXFYM423L2mNZk/QCTYXmB5ykB/4BN2Tp8jugwNHgDojEyWwUY
	 1YC/ihnWhLUj2CkvijOb2yvbTM+1fWBwq7Bs+ksfZCbh0naQGYuXhEGRb5Vr+pB1jn
	 tWTRtHHxuGOsOmS4tdIf2qAkNBcujf3ZQERlYdD4LgcFUcM2wA7B6twNh3iZ7tv442
	 Pmnx3d7Z1h1ByI87Xs+TKC1DqYeUcTUEfKVaRkPRZbWBxHucR1FHLUyufSoHuV+C84
	 sSROAlAVv2nmQ==
Date: Fri, 29 May 2026 23:00:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <ahoMgAKQjN8AaJfg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u2azjrDFmhE+oAsu"
Content-Disposition: inline


--u2azjrDFmhE+oAsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c

between commit:

  1c824497d8acd ("drm/amdgpu: fix calling VM invalidation in amdgpu_hmm_inv=
alidate_gfx")

=66rom the drm-fixes tree and commit:

  4cdbba5a16aaf ("drm/amdgpu: restructure VM state machine v4")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index c9f88ecce1a75,a99d01f9dc750..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@@ -1629,9 -1598,8 +1598,9 @@@ int amdgpu_vm_handle_moved(struct amdgp
  			   struct amdgpu_vm *vm,
  			   struct ww_acquire_ctx *ticket)
  {
- 	struct amdgpu_bo_va *bo_va;
+ 	struct amdgpu_bo_va *bo_va, *tmp;
  	struct dma_resv *resv;
 +	struct amdgpu_bo *bo;
  	bool clear, unlock;
  	int r;
 =20
@@@ -1645,19 -1609,17 +1610,18 @@@
  		r =3D amdgpu_vm_bo_update(adev, bo_va, false);
  		if (r)
  			return r;
- 		spin_lock(&vm->status_lock);
  	}
 =20
- 	while (!list_empty(&vm->invalidated)) {
- 		bo_va =3D list_first_entry(&vm->invalidated, struct amdgpu_bo_va,
- 					 base.vm_status);
- 		bo =3D bo_va->base.bo;
- 		resv =3D bo->tbo.base.resv;
- 		spin_unlock(&vm->status_lock);
+ 	spin_lock(&vm->individual_lock);
+ 	while (!list_empty(&vm->individual.moved)) {
+ 		bo_va =3D list_first_entry(&vm->individual.moved,
+ 					 typeof(*bo_va), base.vm_status);
+ 		resv =3D bo_va->base.bo->tbo.base.resv;
+ 		spin_unlock(&vm->individual_lock);
 =20
  		/* Try to reserve the BO to avoid clearing its ptes */
 -		if (!adev->debug_vm && dma_resv_trylock(resv)) {
 +		if (!adev->debug_vm && !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) &&
 +		    dma_resv_trylock(resv)) {
  			clear =3D false;
  			unlock =3D true;
  		/* The caller is already holding the reservation lock */

--u2azjrDFmhE+oAsu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoaDIAACgkQJNaLcl1U
h9Db6gf/QhCEpJ8H503F+3q2ysApQ+nxQdrykW/+OlSEWBTs1fLOHziSsW2OO+71
BwVTgUtJ7gjWRcmF0x6uZA7BRe5TaouzQoktd6i8wXytRYfiTcII/CK2ILcT3jBs
zDEX4e+Lz40X9OJgGyhIG+FoEYTYhariLb4g5F+8NHB4Qo/PpKtW4MmPk3FnISat
+HTo+WwqYLULQC8jB/SMr4mE7pzq4SvTXbIEnOzIvF5i6DHF2Dwaw+yErCM8OJf+
8UD9+TFEinIWiN8zL83SnNhMPqPN6GVWA0ud2r+cCMFbKoDZEjy+h+xfg+BJk2Cq
Wsky7Foc3C1dNj7jcefd4k9u7UOXyg==
=iNeF
-----END PGP SIGNATURE-----

--u2azjrDFmhE+oAsu--
