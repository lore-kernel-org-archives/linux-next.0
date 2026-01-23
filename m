Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 806121BDCF;
	Fri, 23 Jan 2026 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769190340; cv=none; b=L/ZUiWyMEgbMudNMh7Qoc2D7Z5xUJInu6AxTBCR1NLpbVcnk44L7FD7MJIn4TqEkzHPJGIy2Cbf3BV8kJJXpP9NlGFzOcF/dXTdc/stpt60/bzSxd7QwkxbFm6SXycudNnqmSXzDR2QCg+utZAgf/w8Ol8M9VYV5ZVMNE4Gkvt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769190340; c=relaxed/simple;
	bh=On5W4DpasCDZqy0SIpDx69gtPIvdnD3pmryfp09bKPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mCFov0JQBQVbbzCFtqubvW4HMG6Q17S69Ua07hdHw3asUqWUmjo1F3nmihFPEpr/2G3T+68xnZnJgiBvSny5cbHftqevO1bwIZrMR2NWOm0f+7gfYNgiLgaBF2n0gwVsuMw45oFkCpL7AN8iDPro72ihuwqYG48O5rWDjdi3CQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiwJBok4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiwJBok4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4ED8C4CEF1;
	Fri, 23 Jan 2026 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769190340;
	bh=On5W4DpasCDZqy0SIpDx69gtPIvdnD3pmryfp09bKPg=;
	h=Date:From:To:Cc:Subject:From;
	b=aiwJBok4Dt5ZV0cMTWceCmYjAw8lFwmn+gVqMUMpizTAW+AiB2R2NS0IagmbdIr8s
	 +3ttDY/oD5IHDVaaa7EwP6LRWMO4tLEYYwi2D/zXu9iBUAJ3X7yWEIPkzrYIsbjIzO
	 OdZzEnNMXtVS88t8g9Qri4LdSvPO6U4dncACZP07ZYfZwaiPC4yXwfAeSBukm1HbUf
	 y+VuD09X/y7CVuzufadfXZNDhE1BlkBw8x0h8Zut+Y1uG36U9WOMgVzGYS6yviGDqD
	 Iu/SVFeHyAqsHo/4Nw1htTicX/Y9yqm7fkfiQUl23B8tODpLGrQqr72a0SK1kxsNmk
	 Eu6AzKChhjQRQ==
Date: Fri, 23 Jan 2026 17:45:36 +0000
From: Mark Brown <broonie@kernel.org>
To: Dave Airlie <airlied@redhat.com>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Message-ID: <aXOzwL50DYVm570X@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t7Mo67/N8DZDOQvB"
Content-Disposition: inline


--t7Mo67/N8DZDOQvB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  include/drm/drm_pagemap.h

between commits:

  754c232384386 ("drm/pagemap, drm/xe: Ensure that the devmem allocation is=
 idle before use")
  bdcdf968be314 ("drm, drm/xe: Fix xe userptr in the absence of CONFIG_DEVI=
CE_PRIVATE")

=66rom the drm-fixes tree and commits:

  a599b98607dec ("drm/pagemap, drm/xe: Add refcounting to struct drm_pagema=
p")
  75af93b3f5d0a ("drm/pagemap, drm/xe: Support destination migration over i=
nterconnect")
  77f14f2f2d73f ("drm/pagemap: Add a drm_pagemap cache and shrinker")

=66rom the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --cc include/drm/drm_pagemap.h
index eb29e5309f0ab,46e9c58f09e01..0000000000000
--- a/include/drm/drm_pagemap.h
+++ b/include/drm/drm_pagemap.h
@@@ -209,19 -243,56 +243,69 @@@ struct drm_pagemap_devmem_ops=20
  			   struct dma_fence *pre_migrate_fence);
  };
 =20
 +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
 +
 +struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct page *page);
 +
 +#else
 +
 +static inline struct drm_pagemap *drm_pagemap_page_to_dpagemap(struct pag=
e *page)
 +{
 +	return NULL;
 +}
 +
 +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
 +
+ int drm_pagemap_init(struct drm_pagemap *dpagemap,
+ 		     struct dev_pagemap *pagemap,
+ 		     struct drm_device *drm,
+ 		     const struct drm_pagemap_ops *ops);
+=20
+ struct drm_pagemap *drm_pagemap_create(struct drm_device *drm,
+ 				       struct dev_pagemap *pagemap,
+ 				       const struct drm_pagemap_ops *ops);
+=20
+ #if IS_ENABLED(CONFIG_DRM_GPUSVM)
+=20
+ void drm_pagemap_put(struct drm_pagemap *dpagemap);
+=20
+ #else
+=20
+ static inline void drm_pagemap_put(struct drm_pagemap *dpagemap)
+ {
+ }
+=20
+ #endif /* IS_ENABLED(CONFIG_DRM_GPUSVM) */
+=20
+ /**
+  * drm_pagemap_get() - Obtain a reference on a struct drm_pagemap
+  * @dpagemap: Pointer to the struct drm_pagemap, or NULL.
+  *
+  * Return: Pointer to the struct drm_pagemap, or NULL.
+  */
+ static inline struct drm_pagemap *
+ drm_pagemap_get(struct drm_pagemap *dpagemap)
+ {
+ 	if (likely(dpagemap))
+ 		kref_get(&dpagemap->ref);
+=20
+ 	return dpagemap;
+ }
+=20
+ /**
+  * drm_pagemap_get_unless_zero() - Obtain a reference on a struct drm_pag=
emap
+  * unless the current reference count is zero.
+  * @dpagemap: Pointer to the drm_pagemap or NULL.
+  *
+  * Return: A pointer to @dpagemap if the reference count was successfully
+  * incremented. NULL if @dpagemap was NULL, or its refcount was 0.
+  */
+ static inline struct drm_pagemap * __must_check
+ drm_pagemap_get_unless_zero(struct drm_pagemap *dpagemap)
+ {
+ 	return (dpagemap && kref_get_unless_zero(&dpagemap->ref)) ? dpagemap : N=
ULL;
+ }
+=20
  /**
   * struct drm_pagemap_devmem - Structure representing a GPU SVM device me=
mory allocation
   *
@@@ -246,8 -317,23 +330,25 @@@ struct drm_pagemap_devmem=20
  	struct dma_fence *pre_migrate_fence;
  };
 =20
+ /**
+  * struct drm_pagemap_migrate_details - Details to govern migration.
+  * @timeslice_ms: The time requested for the migrated pagemap pages to
+  * be present in @mm before being allowed to be migrated back.
+  * @can_migrate_same_pagemap: Whether the copy function as indicated by
+  * the @source_peer_migrates flag, can migrate device pages within a
+  * single drm_pagemap.
+  * @source_peer_migrates: Whether on p2p migration, The source drm_pagemap
+  * should use the copy_to_ram() callback rather than the destination
+  * drm_pagemap should use the copy_to_devmem() callback.
+  */
+ struct drm_pagemap_migrate_details {
+ 	unsigned long timeslice_ms;
+ 	u32 can_migrate_same_pagemap : 1;
+ 	u32 source_peer_migrates : 1;
+ };
+=20
 +#if IS_ENABLED(CONFIG_ZONE_DEVICE)
 +
  int drm_pagemap_migrate_to_devmem(struct drm_pagemap_devmem *devmem_alloc=
ation,
  				  struct mm_struct *mm,
  				  unsigned long start, unsigned long end,
@@@ -269,6 -356,7 +369,10 @@@ int drm_pagemap_populate_mm(struct drm_
  			    struct mm_struct *mm,
  			    unsigned long timeslice_ms);
 =20
 +#endif /* IS_ENABLED(CONFIG_ZONE_DEVICE) */
 +
+ void drm_pagemap_destroy(struct drm_pagemap *dpagemap, bool is_atomic_or_=
reclaim);
+=20
+ int drm_pagemap_reinit(struct drm_pagemap *dpagemap);
++
  #endif

--t7Mo67/N8DZDOQvB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzs78ACgkQJNaLcl1U
h9DgFwf/VYWqILaSRQFpmD336OmNc9V1ARzwvyBLXNiGytt9cobc+dKCsHi8Rm0/
zIKLYcFSdgU2FPkPBWpJQDNcNaFhQyS+gJhIlw+XecMeQTpchlsgHTsPe3Rrfbc/
ilnEdjx6Fz/Sogf0ck8m3ZPbyTywTR/lGvPYfZSBn8l2GG8xxeRDcacj72slymKC
1gAvJohLItWvN0C+ymQqV10PQGv2mSG04SFtWm+Lv6ySyQGFmpIhpdCWHiGlx6Vr
bBCRGI6BYCHMpcpROn4ArD4b4byWWVP/bwWie22bol88o2tYUf7X6pE0WifZCmrn
rlbfEi4CH5SC9OZwaN/PVUSkPuO13A==
=PhOR
-----END PGP SIGNATURE-----

--t7Mo67/N8DZDOQvB--
