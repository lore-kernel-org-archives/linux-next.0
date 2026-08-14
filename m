Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68D643CEC1;
	Fri, 14 Aug 2026 16:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786723972; cv=none; b=oYZ4UlTAgF6Sv3Lr1gHrJ89Xu4sIGdUfywrNcQg0ujVDwT5ZPSjFu1rocL1h1OqxLN/9248hQvJEaFiIfC7BKkZzRvcQfsM1Hg7ClSk3uatT2izJfpkGpsy36kp2eOYf2JemNcFroIPooyjByNdeV3/v96gcfnuOGt/9cEF7QMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786723972; c=relaxed/simple;
	bh=hL4WzUQWh4zkZeVpZS/YkcbG0X/mNcyfDP32IR51Ycw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y/h/6ldq5eNx86dd34E/+V81/PBYCAQa2Ipmn6sPr7Cx7zA1oLIaYoxikhAVJw1KyHBnXG2Z8/kF9PmqVBWlgLkS4dN9A0PaJNEsQ/8QO9fBRSooZay0PvxAzSom0Jb/M9MOFn8sIaN0QkZSgNUp5CFerNa9C3w9Zd8Q0tY4c+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4TmGhSe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4TmGhSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3824B1F000E9;
	Fri, 14 Aug 2026 16:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786723968;
	bh=6BOQblVE+aBrQQmgDPShW0rHG4WBbczQEC174od5f6Y=;
	h=Date:From:To:Cc:Subject;
	b=R4TmGhSevOXFiT9FuVIAonW0TU1/hXbOqS2HbvhL/jsrGsrq1WEmvnDpXFMuBXvmq
	 vUKgZAfkS/CSIQ9Jx1MRUoHiDA5ZUHP+s42z8Em76eVqA22el110nrQuW8c5cdc/WZ
	 vaCeYdUch1JLL+bdglySJCzECsfiv3md8bAB3qenLaY8zllTKpVgXLwmnlwjbgBYJP
	 +u3bbEzdZS6hhwl7irfwjcvJg6cgXwjAiKvGx26BPJWgb9UND2jGKWfN5Zm/pSR5V5
	 Bf7PRZLKqxkZCp7hvfdcg4aHOZptvVyIFwqEuzaqJaCuvvNeaZd+CmPKR6IcYc7U/m
	 OHTfWO0DNJc3w==
Date: Fri, 14 Aug 2026 17:12:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Riana Tauro <riana.tauro@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <an8-fFKBQKlJ3tQ1@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oA4ZQ81ut1kslhao"
Content-Disposition: inline


--oA4ZQ81ut1kslhao
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_device.c

between commit:

  ef526d122b62a ("drm/xe: Fix xe_device_probe() failure")

=66rom the drm-fixes tree and commits:

  5ce3042c67c53 ("drm/xe: Fix xe_device_probe() failure")
  20bc4883c7c0e ("drm/xe/ras: Fix boot-time ras error processing")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_device.c
index 2bf38a7684c64,71111ad324658..0000000000000
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@@ -282,7 -282,7 +282,7 @@@ static vm_fault_t barrier_fault(struct=20
  	pgprot_t prot;
  	int idx;
 =20
 -	prot =3D vm_get_page_prot(vma->vm_flags);
 +	prot =3D vma_get_page_prot(vma);
 =20
  	if (drm_dev_enter(dev, &idx)) {
  		unsigned long pfn;
@@@ -331,7 -331,7 +331,7 @@@ static int xe_pci_barrier_mmap(struct f
  	if (vma->vm_end - vma->vm_start > SZ_4K)
  		return -EINVAL;
 =20
 -	if (is_cow_mapping(vma->vm_flags))
 +	if (vma_is_cow_mapping(vma))
  		return -EINVAL;
 =20
  	if (vma->vm_flags & (VM_READ | VM_EXEC))
@@@ -513,6 -513,17 +513,17 @@@ struct xe_device *xe_device_create(stru
  }
  ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
 =20
+ static void xe_device_parse_modparam(struct xe_device *xe)
+ {
+ 	xe->atomic_svm_timeslice_ms =3D 5;
+ 	xe->min_run_period_lr_ms =3D 5;
+ 	xe->info.num_pf_work =3D xe_modparam.num_pf_work;
+ 	if (xe->info.num_pf_work < 1)
+ 		xe->info.num_pf_work =3D 1;
+ 	else if (xe->info.num_pf_work > XE_PAGEFAULT_WORK_MAX)
+ 		xe->info.num_pf_work =3D XE_PAGEFAULT_WORK_MAX;
+ }
+=20
  /**
   * xe_device_init_early() - Initialize a new &xe_device instance
   * @xe: the &xe_device to initialize
@@@ -539,8 -550,7 +550,7 @@@ int xe_device_init_early(struct xe_devi
  	if (err)
  		return err;
 =20
- 	xe->atomic_svm_timeslice_ms =3D 5;
- 	xe->min_run_period_lr_ms =3D 5;
+ 	xe_device_parse_modparam(xe);
 =20
  	err =3D xe_irq_init(xe);
  	if (err)
@@@ -1141,6 -1151,13 +1151,13 @@@ int xe_device_probe(struct xe_device *x
  	if (err)
  		goto err_unregister_display;
 =20
+ 	/*
+ 	 * Process and log any errors detected by hardware. Possible results can
+ 	 * include declaring the device as wedged, which must be done only after
+ 	 * xe_device_wedged_fini() is registered.
+ 	 */
+ 	xe_ras_process_errors(xe);
+=20
  	err =3D devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
  	if (err)
  		goto err_unregister_display;

--oA4ZQ81ut1kslhao
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp/PnsACgkQJNaLcl1U
h9CJngf+LN+wwQNpQMyo4dyiLgR68aNcK5+6kb7sONHNDk3f21ll2VEMUb3Y/Z0L
MeMRIGYvqBP8gRs6Zx6hjhcmA9yXGPU8VwciL7xJ7HljQLLBDdU59Ow7O3CFOlvF
68KrwgReukxv2AfL9dHTvcwhqz97P0ErT9NntsHhRWHPvTIB/kcv/bC0+aqPw4yi
rmczDwN7f+UX8usUQyzbZ0CTM/yfZHxHXH4iaqxGrRNCLYMiNqxMQHaL5FqRsdN/
Fi1Ii1r+wBvq8L4bnUXmhx2PHHosrnBd1ee7C0IJUdmLX37Pg3eL1Z286UB8OXZd
jEXxUl4yWaMm8Q2SKOU1/GLVaTVnpw==
=+y20
-----END PGP SIGNATURE-----

--oA4ZQ81ut1kslhao--
