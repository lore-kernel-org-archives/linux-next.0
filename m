Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF5A29DB9A;
	Mon, 22 Jun 2026 10:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782125120; cv=none; b=N0AiXViLQvm8q9voAFNnItIqeL/TLwmG2TpZxW3bYP5zSU/Af7Bj3oa5dieqW2x3C/bzUBYoNNmnckf4+wyoeYzbLqdXsvqp1OnVeZyYe67bPikHofsO4xaiAnnByeO7pc62Zp+TEkvM1hvhmXsdzAl/TUmY38e9jF11/r3dJPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782125120; c=relaxed/simple;
	bh=8ORAToMRvxRUl7ZO+XoD1ol4Afh+rRDy3vLYek2AZMg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A6JDoYDGpqJ9BoaFcv0FKKDpBAtNk1I6vQh5YMzO4ZLOSx3JmvX2povLdAIxDyG+uF6qqa0A1SGWwiGtt5gkz3p/jOYdqiFdd1n8B5q1g07J7XdxsLwbpxJ61zHw5M8eeh7LvxXB1BQGPaap59wjO8kjq9Yor/3LVdVV6k60Y+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mt2LQOIA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mt2LQOIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A791F000E9;
	Mon, 22 Jun 2026 10:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782125119;
	bh=Qzd3PXS3/fdY2eOfY4OqU9CZlDOmAqCe8JZkAZo2JQM=;
	h=Date:From:To:Cc:Subject;
	b=mt2LQOIAz4rtEv68lotvGk7krOVssNlRIxOGotSuMrSqBKGPgO87kwdpdTxZk97D9
	 xGBXgnCEJF9yYKsAZPTSbIdylNE6PwC06urOf/kKvAU5MbFM7rbteuDHJ0KUZsWagG
	 RQJCbhwh8Gmihb9U5zNVEdo5aXscI3zEkvEmGn046kxgyR1ZzGNLVZIdeuNrcxRpqD
	 ltXGLBcOeF6NC5f+8+uQy2v5IRebBW2L4mukBfL4NxGY0PibPgOChSg5qv69fYjWZ7
	 CxrT+4u3AbUocweX+pZ9LS4ZdKvLqnkgH6ASTUSKd1R2KChBcgsyXhHv9xgxDUaYmE
	 GvM8vkt10X/rA==
Date: Mon, 22 Jun 2026 11:45:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: linux-next: manual merge of the amdgpu tree with the drm tree
Message-ID: <ajkSO-8T0Rqc5CZn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2QucsCwWAf/E3sZ6"
Content-Disposition: inline


--2QucsCwWAf/E3sZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c

between commit:

  a2b270c0ecf6d ("drm/amdgpu: initialize irq.lock spinlock earlier")

=66rom the drm tree and commits:

  7dba3e10ecdee ("drm/amdgpu: initialize irq.lock spinlock earlier")
  6eadd448d7e7d ("drm/amdgpu: Choose SOC15 RLC register read write function=
s at init time")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 211d30f03d25f,c66d3a24f54e8..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@@ -3677,6 -3677,10 +3677,10 @@@ static void amdgpu_device_sys_interface
  		amdgpu_pm_sysfs_fini(adev);
  	if (adev->ucode_sysfs_en)
  		amdgpu_ucode_sysfs_fini(adev);
+=20
+ 	amdgpu_discovery_sysfs_fini(adev);
+ 	amdgpu_preempt_mgr_sysfs_fini(adev);
+=20
  	amdgpu_device_attr_sysfs_fini(adev);
  	amdgpu_fru_sysfs_fini(adev);
 =20
@@@ -3773,6 -3777,7 +3777,7 @@@ int amdgpu_device_init(struct amdgpu_de
 =20
  	spin_lock_init(&adev->irq.lock);
 =20
+ 	amdgpu_early_init_rlc_reg_funcs(adev);
  	amdgpu_device_init_apu_flags(adev);
 =20
  	r =3D amdgpu_device_check_arguments(adev);
@@@ -4210,6 -4215,7 +4215,7 @@@ void amdgpu_device_fini_hw(struct amdgp
 =20
  	if (adev->mman.initialized)
  		drain_workqueue(adev->mman.bdev.wq);
+=20
  	adev->shutdown =3D true;
 =20
  	unregister_pm_notifier(&adev->pm_nb);

--2QucsCwWAf/E3sZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5EjoACgkQJNaLcl1U
h9C3TAf+LrI1F60CtaDTUUkwLhTD8W5Kf25nrX3UzvdrpYITYTAsSaBQM4pZUcA0
6395DbMAZZGcWRTFK/saj7LyMbQlw/faJi2mivbed+71q0XpYxNesVXYWZOjahKP
hcqF9oPVYSQn+rUmfZIuFT4P90Xoehz5FEZhZF4kvc6xjh/wYLJmaqPZkNyFBqnY
zSRNvOrsWI3bd5Uzf9MMLD3N6p8nClXRg04BaBUWN5HBbNIehR5/2KN2FkUMCG60
F/J1qkNAbhPNebbMSxrUf16HCGFkTH25YVmjxcMfk+ZZEM+rjOKX3J4lIpe/MOvg
1+u6b6k8b23ctOxtlGn/tzNOFJFDbw==
=KKFx
-----END PGP SIGNATURE-----

--2QucsCwWAf/E3sZ6--
