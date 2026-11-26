Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705523;
	b=kSjHYJTfmET6KRtoqUZ5s0/zHgPDiPwgUsk7SRxlPngYuf6PfdQy8JXmDk2N/L3ed3TB
	 xB6vGr7maVsae2hCPav/cHvELkfoXPxOioMLtWeE2KPQjd/MMQE9yggKuXOpshLrguTE8
	 WWCzI80lyoY43rYwBv+Egyfl5zrVdufZHprMdgBAaiNYEPMNDkGnccnnXu6oPUWuN7Khs
	 m4HUKoUSymXlu/fRhJq05HriIq01SQGMpeSgb914WDKDaR555E7gHTu4BLiOqsjsS5sDY
	 WCPtqGyShZoOrPzEdnta4kMNQjun0zhn+nLgEsYP8KyCP+R4uQdF4ARfsC6Ap6UyNBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705523;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=YvokoAOy0a19UX4sPsknIKqr7EAtQvmA6miF4Jks09k=;
	b=CKIGnSH8/QgAY3Mwq1LXlG+oEouB3XvpiD9L6dxLFWC9KTOinhNuRom2TouHaHk0E4eE
	 7bvb/nVEYlqqFch8eZcmDyJ6ad8cdGCuaz5Vzb/OhxcwAUUXHOsHNxBtVzYbKVBtp4oX4
	 NfoHlFypLAEWaW0G/rZUQQxHRGU+EIxJmd+gRBAixsbNbqGX+Cnkq0+Bh6j/g5UzTlDuT
	 w5Tx5+1/3s9vQn4g6d0tsC5YCNmEXm6AQrC602WJBfCRwtuK1hqS4dxG//HmLn46YPtDW
	 0YYiEhvTYcUISGMb4Rv27R/fQeRpfOBAfibiSCTGNvPL+YzC65q6i0t0JgYbRn4LT8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gc4DXHdS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98663606A31E;
	Thu, 26 Nov 2026 15:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Gc4DXHdS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AB81F000EE;
	Thu, 26 Nov 2026 15:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705523;
	bh=YvokoAOy0a19UX4sPsknIKqr7EAtQvmA6miF4Jks09k=;
	h=Date:From:To:Cc:Subject;
	b=Gc4DXHdSsRwBXnY6NwergtTyQQBnGKfvOth1sIUoreLWYs0OnQg532RdHZZQE3Pd8
	 PiU1ALzV520yASfkRKhct541c6kMUNJHx/7UG+4smgE0pg0ezm1eUNsYh5wVxLOXWW
	 FR1sYckpkcOMpaWK2Cxo5rNSq6pL0jq0LGoCX3g0gAiytgWN+A7w36j7UjU34mOi17
	 bAuZrO59ADsM3TEfROoRIg3L2RXfn+Nc7Zx1XFagQmaweH3qS7WOty59t7HtYlKEsL
	 0C5qxEjUR35zLdQTvg4rnkY297Tfq/486MLPYnt0RGowR2k1nkFU4Sc7M+oKzhrzE4
	 qjARVPE54oBfA==
Date: Thu, 26 Nov 2026 15:05:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
	Dave Airlie <airlied@redhat.com>,
	Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matthew Auld <matthew.auld@intel.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Matt Roper <matthew.d.roper@intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the origin tree
Message-ID: <awhKrF41vLIOFkKf@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="euPJhX6bzYrQgnGb"
Content-Disposition: inline


--euPJhX6bzYrQgnGb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_device.c

between commits:

  7539edbca32d6 ("drm/xe/pat: Return error from xe_pat_init_early() on unkn=
own platform")
  8801081e5991e ("drm/xe/gt: Use GT ordered workqueue for wedging")
  402567ac0875b ("drm/xe: Drop xe_device_set_wedged_method()")
  031cc955b33b0 ("drm/xe: Move xe_device_wedged_fini() registration to xe_d=
evice_probe_early()")
  b828d2b7326b5 ("drm/xe: Make xe_device_declare_wedged() IRQ safe")
  72296e02b46a3 ("drm/xe/hwmon: Unregister hwmon before the device is unplu=
gged")

=66rom the origin tree and commits:

  2c0f72dd1483f ("drm/xe: run compute rebind worker on device NUMA node")
  f8bb5c0459f4d ("drm/xe: Add a userptr repin timeout sysfs attribute")
  3b4cc31db4407 ("drm/xe/vsec: Support late bind fw information")
  344b7ec704ee0 ("drm/xe/vsec: Update VSEC probe order")
  6bae3d8f56944 ("drm/xe/hwmon: Unregister hwmon before the device is unplu=
gged")
  17615c99ccc8e ("drm/xe/wopcm: Use the size from HW when excluding the wop=
cm range from GGTT")
  61df0d1929e7e ("drm/xe: Add a per-client debugfs file reporting bo NUMA n=
ode distribution")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/xe/xe_device.c
index 8148c66eb7da9,36693df655941..0000000000000
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@@ -8,7 -8,9 +8,9 @@@
  #include <linux/aperture.h>
  #include <linux/delay.h>
  #include <linux/error-injection.h>
+ #include <linux/nodemask.h>
  #include <linux/units.h>
+ #include <linux/workqueue.h>
 =20
  #include <drm/drm_client.h>
  #include <drm/drm_gem_ttm_helper.h>
@@@ -127,6 -129,8 +129,8 @@@ static int xe_file_open(struct drm_devi
  		put_task_struct(task);
  	}
 =20
+ 	xe_debugfs_client_add(file);
+=20
  	return 0;
  }
 =20
@@@ -387,6 -391,9 +391,9 @@@ static void xe_device_destroy(struct dr
  	if (xe->preempt_fence_wq)
  		destroy_workqueue(xe->preempt_fence_wq);
 =20
+ 	if (xe->rebind_wq)
+ 		destroy_workqueue(xe->rebind_wq);
+=20
  	if (xe->ordered_wq)
  		destroy_workqueue(xe->ordered_wq);
 =20
@@@ -437,6 -444,10 +444,10 @@@ struct xe_device *xe_device_create(stru
  	if (err)
  		return ERR_PTR(err);
 =20
+ 	xe->userptr_repin_timeout_ms =3D num_online_nodes() > 1 ?
+ 		XE_USERPTR_REPIN_TIMEOUT_MS_NUMA_DEFAULT :
+ 		XE_USERPTR_REPIN_TIMEOUT_MS_DEFAULT;
+=20
  	return xe;
  }
  ALLOW_ERROR_INJECTION(xe_device_create, ERRNO); /* See xe_pci_probe() */
@@@ -516,10 -527,11 +527,11 @@@ int xe_device_init_early(struct xe_devi
 =20
  	xe->preempt_fence_wq =3D alloc_ordered_workqueue("xe-preempt-fence-wq",
  						       WQ_MEM_RECLAIM);
+ 	xe->rebind_wq =3D alloc_workqueue("xe-rebind-wq", WQ_UNBOUND, 0);
  	xe->ordered_wq =3D alloc_ordered_workqueue("xe-ordered-wq", 0);
  	xe->unordered_wq =3D alloc_workqueue("xe-unordered-wq", WQ_PERCPU, 0);
  	xe->destroy_wq =3D alloc_workqueue("xe-destroy-wq", WQ_PERCPU | WQ_MEM_R=
ECLAIM, 0);
- 	if (!xe->ordered_wq || !xe->unordered_wq ||
+ 	if (!xe->ordered_wq || !xe->unordered_wq || !xe->rebind_wq ||
  	    !xe->preempt_fence_wq || !xe->destroy_wq) {
  		/*
  		 * Cleanup done in xe_device_destroy via
@@@ -934,6 -946,10 +946,10 @@@ int xe_device_probe(struct xe_device *x
  	override_has_cached_pt(xe);
 =20
  	for_each_tile(tile, xe, id) {
+ 		err =3D xe_tile_wopcm_init(tile);
+ 		if (err)
+ 			return err;
+=20
  		err =3D xe_ggtt_init_early(tile->mem.ggtt);
  		if (err)
  			return err;
@@@ -1086,18 -1102,18 +1102,18 @@@
  	if (err)
  		goto err_unregister_display;
 =20
+ 	xe_vsec_init(xe);
+=20
  	xe_debugfs_register(xe);
 =20
  	err =3D xe_hwmon_register(xe);
  	if (err)
- 		goto err_unregister_display;
+ 		goto err_unregister_vsec;
 =20
  	err =3D xe_i2c_probe(xe);
  	if (err)
  		goto err_unregister_hwmon;
 =20
- 	xe_vsec_init(xe);
-=20
  	err =3D xe_sriov_init_late(xe);
  	if (err)
  		goto err_unregister_hwmon;
@@@ -1112,6 -1128,8 +1128,8 @@@
 =20
  err_unregister_hwmon:
  	xe_hwmon_unregister(xe);
+ err_unregister_vsec:
+ 	xe_vsec_remove(xe);
  err_unregister_display:
  	xe_display_unregister(xe);
  	drm_dev_unregister(&xe->drm);
@@@ -1122,6 -1140,7 +1140,7 @@@
  void xe_device_remove(struct xe_device *xe)
  {
  	xe_hwmon_unregister(xe);
+ 	xe_vsec_remove(xe);
  	xe_display_unregister(xe);
 =20
  	drm_dev_unplug(&xe->drm);

--euPJhX6bzYrQgnGb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsISqsACgkQJNaLcl1U
h9DPKgf8Dc97/sBDlroQt5qpU1AjJCB57ogqv6GJwWZdDY54WAD55YyCQlcZxj3P
pj/o3PEmxjs7D8VbSRqw2+9BAKyTt7RbTI1F1MveWzDO3BnkbkNK6DFdU4ii/8bW
RumJvyv08S7xBs8cTvv6vF6A66//v5jh4meyY8tOftBBlW3ibrKbkgicRGiy7BD8
YV630hh9OAnRwcGY3kZjCs8Ok4HgzsDPw9CfUgviEaCa88vJH0otEsSAqf/o8ZWo
Ih6IxvNiA6qq14g8KtNhSOt+lje9c+zabkEuCZ7pulWgqjkUjU0mr7GMt7sVH1kQ
eP/1tt8Sla6O2rPSYr4Eevs8u2V69g==
=nddl
-----END PGP SIGNATURE-----

--euPJhX6bzYrQgnGb--
