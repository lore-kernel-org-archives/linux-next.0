Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD56A4854EA;
	Wed, 12 Aug 2026 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549510; cv=none; b=kIfmXHaZgeBD9WDx+DqPp3Xn8otiZrSq+/hIJ3r4Yw5nM1/rF6vbotM1vsNbmaBr4eectRZjlw/POOybl4wkyJV5YUxn9KHh+1uWbBILWHzT7i/tKf3giI7yZKyN2GbqoT9gsohyoWRSCqK5HlReEdrobhWdGnQ96eu7o6Sojrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549510; c=relaxed/simple;
	bh=ZTBJGjOWt+J57CKG5k4D3gmlTq5PDFmJ3VvuIQM/Chc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PwbBOM/ogAlhUECo6Vg756acIiZuEWPe8yKWn4iww9BwNfxQGFIvCkM8k0RR1gfaRLXIY6g3H46ar4OdGzz9sNKjWmePckcYAEFz9RZ5PMnESL2AVbrjKnUCNVTH5amag6wF5D2pEWsgUy7fDuoYs8kQkH5AZCekaZgJPo+WuZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RNawWARV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RNawWARV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77A561F00A3A;
	Wed, 12 Aug 2026 15:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786549509;
	bh=T7JPD4B+641airvUelShyGzuiDCSndbrW7wqSJKw0QY=;
	h=Date:From:To:Cc:Subject;
	b=RNawWARVw8vBCVWBlTUkMSUvulRMorxiATotBZoVwU95Fiw9pDzVUT1zNDl8M9YSd
	 qL2nKdFZSI9J2sji+k7Tlp0ksYjtlrvmxEa5Mdn21Ujpqv8KXJKCkR/IOqVzAEwt83
	 jQzTYGOga6OObHw+sHYxusHAkaLOGNbv0ATO3Vp049nZKAfDO5iURyLv1dKHGBYBwG
	 9czr849QweF7WBQiaQMqGMWo8qb1cvkklIgu+/fII+vz78mok+u/nhVV24kgO1N0XY
	 u7fwWNffWY6XKV5KhosB9YiT8Dirqii/DOo42FW3ksnz/YK/xJPYs6Lyc334Trk4IF
	 +iE3Fiw+jDsog==
Date: Wed, 12 Aug 2026 16:45:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Gangliang Xie <ganglxie@amd.com>, Lijo Lazar <lijo.lazar@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Xiang Liu <xiang.liu@amd.com>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes tree
Message-ID: <anyVAMjiBIKSgktr@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W9FEyKEu0P44CSuu"
Content-Disposition: inline


--W9FEyKEu0P44CSuu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c

between commit:

  67cf83ac8316a ("Revert "drm/sched: Embed run queue singleton into the sch=
eduler"")

=66rom the drm-misc-fixes tree and commits:

  4a33d82e224c8 ("drm/amdgpu: protect XCP scheduler selection")
  fa1531170d2c9 ("drm/amdgpu: add check for xcp id")
  6e8a3c24bd75f ("drm/amdgpu: bounds check xcp_id in release_sched")
  7445035dd3f22 ("drm/amdgpu: bounds check xcp ip block index")
  62d8b452615fd ("drm/amdgpu: Fix kobject cleanup in xcp sysfs")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
index 42be8ee155dde,35faea0ff17ff..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c
@@@ -466,16 -467,20 +467,21 @@@ int amdgpu_xcp_open_device(struct amdgp
  void amdgpu_xcp_release_sched(struct amdgpu_device *adev,
  				  struct amdgpu_ctx_entity *entity)
  {
 -	struct drm_gpu_scheduler *sched =3D
 -		container_of(entity->entity.rq, typeof(*sched), rq);
 +	struct drm_gpu_scheduler *sched;
 +	struct amdgpu_ring *ring;
+ 	struct amdgpu_xcp_mgr *xcp_mgr =3D adev->xcp_mgr;
 =20
- 	if (!adev->xcp_mgr)
+ 	if (!xcp_mgr)
  		return;
 =20
 +	sched =3D entity->entity.rq->sched;
  	if (drm_sched_wqueue_ready(sched)) {
 -		struct amdgpu_ring *ring =3D to_amdgpu_ring(sched);
 +		ring =3D to_amdgpu_ring(entity->entity.rq->sched);
- 		atomic_dec(&adev->xcp_mgr->xcp[ring->xcp_id].ref_cnt);
+=20
+ 		mutex_lock(&xcp_mgr->xcp_lock);
+ 		if (ring->xcp_id < xcp_mgr->num_xcps && xcp_mgr->xcp[ring->xcp_id].vali=
d)
+ 			atomic_dec(&xcp_mgr->xcp[ring->xcp_id].ref_cnt);
+ 		mutex_unlock(&xcp_mgr->xcp_lock);
  	}
  }
 =20

--W9FEyKEu0P44CSuu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8lP8ACgkQJNaLcl1U
h9Bjagf7BsMxK8nfyVpLS47rsL9RcMgypvKEhTNVx5IN4U8LugSzNaNulT4PelwY
28aDjzODL7i/oXQy1z3qOR3YUPZUcQ2zpgifMPml3mWok9GleXGFiCvF0JQKIjJR
LFF2CYeFBLZIA3y5NY3WD8J0iFZsZEhadMDdVlfVtpvypoM1zrpRSXiWmyEcopzK
8Fs7+d9xvkH7QQljrxfpVlQR7OsluZcOlZFd/9rvK01TMPbwl//fkm68C0wfaqtt
tytKwFljitrn3P8DtYVxQaBNx6b9Ufdos0uoD5nh/pZlawlaKB3KuB/M03u9hSMM
0QhZLAuOaWJLbWhoBZnPAmX9gXE8CQ==
=a72N
-----END PGP SIGNATURE-----

--W9FEyKEu0P44CSuu--
