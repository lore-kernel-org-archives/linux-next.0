Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D40347C6;
	Tue,  3 Mar 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543392; cv=none; b=A3cNoH6fvBj+neBF1Iq0oR2z9NigVMmYR3DEZJfwgQrtVjkC21x8uefueaMTQ35aeYfz1gIbyqdCOeIMKFTEZ83g92ABzM1lqMfKLW4Id1teliT8nHc6NJzGE8ediBwNbFsRwnmt47HIUz/vEHw6wOm9UeIqaop7xxEsq3j3bEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543392; c=relaxed/simple;
	bh=pVnO/Jh/dU2Z94gbVgRhWuFt02nCi9NutwWQTNoX4Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D8AJY/CxgE465sgWJV9nylBH4C2IOyIClfF1VJ7DryePajVKnQzwsVhFbbMEzOiUvnj3XWIfzvIynQ1iYHV3KB3hqseeIxm6Vkd9PunHkqnNXF80q4QchMOHnj9mD7nZjk9U5dan4mk6Hfzp7K3ETNi5kzHeo7t9mjekhlhLNt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=glCkWHeb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="glCkWHeb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7CF3C116C6;
	Tue,  3 Mar 2026 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772543392;
	bh=pVnO/Jh/dU2Z94gbVgRhWuFt02nCi9NutwWQTNoX4Jk=;
	h=Date:From:To:Cc:Subject:From;
	b=glCkWHebhnWfQIKLPI26yRTR3cHSYaLnzQv8zPZz0P9kbKjdtaOn8IEYJaqJEAaz3
	 BG7KhRmNRRd6N+eqmFAo11euh6ezjjCUyt2hqcJyPr0zw24SX5sBKdg4wDO+o9gEBC
	 D0dPVWQiEi3VTck/9ri56/YAssmVoVg4hX3KoO1qvjVzq68sTS8AgYN5rSAUG2maPx
	 FRVmNZwCMc3qRqf0DxhZS7aD7LEdAF5SPtrPgHPt2n7ldSuRcBt7/v7As5U94UPyqX
	 C1sLtx2J5C9t9UZee/a4LlD/INd66WKamGNQ+6GipCN09HSXoaMulWFDsT9qHMaT9e
	 EJlKX/G8yKQeQ==
Date: Tue, 3 Mar 2026 13:09:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Sunil Khatri <sunil.khatri@amd.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <aabdnK9y8UiLAExu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wi7NxE3rXDAQx8l2"
Content-Disposition: inline


--Wi7NxE3rXDAQx8l2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c

between commits:

  ea78f8c68f4f6 ("drm/amdgpu: add upper bound check on user inputs in signa=
l ioctl")
  64ac7c09fc449 ("drm/amdgpu: add upper bound check on user inputs in wait =
ioctl")

=66rom the origin tree and commits:

  be267e15f99bc ("drm/amdgpu: add upper bound check on user inputs in signa=
l ioctl")
  fcec012c66424 ("drm/amdgpu: add upper bound check on user inputs in wait =
ioctl")
  750cbc4fbd490 ("drm/amdgpu: Drop redundant syncobj handle limit checks in=
 userq ioctls")
  2de9353e193fd ("drm/amdgpu/userq: Use drm_gem_objects_lookup in amdgpu_us=
erq_wait_ioctl")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index 7e9cf1868cc9f,d31cadf47b3b5..0000000000000
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@@ -461,33 -461,31 +461,31 @@@ int amdgpu_userq_signal_ioctl(struct dr
  			      struct drm_file *filp)
  {
  	struct amdgpu_device *adev =3D drm_to_adev(dev);
+ 	struct drm_amdgpu_userq_signal *args =3D data;
+ 	const unsigned int num_write_bo_handles =3D args->num_bo_write_handles;
+ 	const unsigned int num_read_bo_handles =3D args->num_bo_read_handles;
  	struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
  	struct amdgpu_userq_mgr *userq_mgr =3D &fpriv->userq_mgr;
- 	struct drm_amdgpu_userq_signal *args =3D data;
- 	struct drm_gem_object **gobj_write =3D NULL;
- 	struct drm_gem_object **gobj_read =3D NULL;
- 	struct amdgpu_usermode_queue *queue;
- 	struct amdgpu_userq_fence *userq_fence;
- 	struct drm_syncobj **syncobj =3D NULL;
- 	u32 *bo_handles_write, num_write_bo_handles;
+ 	struct drm_gem_object **gobj_write, **gobj_read;
  	u32 *syncobj_handles, num_syncobj_handles;
- 	u32 *bo_handles_read, num_read_bo_handles;
- 	int r, i, entry, rentry, wentry;
+ 	struct amdgpu_userq_fence *userq_fence;
+ 	struct amdgpu_usermode_queue *queue;
+ 	struct drm_syncobj **syncobj =3D NULL;
  	struct dma_fence *fence;
  	struct drm_exec exec;
+ 	int r, i, entry;
  	u64 wptr;
 =20
  	if (!amdgpu_userq_enabled(dev))
  		return -ENOTSUPP;
 =20
- 	if (args->num_syncobj_handles > AMDGPU_USERQ_MAX_HANDLES ||
- 	    args->num_bo_write_handles > AMDGPU_USERQ_MAX_HANDLES ||
+ 	if (args->num_bo_write_handles > AMDGPU_USERQ_MAX_HANDLES ||
  	    args->num_bo_read_handles > AMDGPU_USERQ_MAX_HANDLES)
  		return -EINVAL;
 =20
  	num_syncobj_handles =3D args->num_syncobj_handles;
- 	syncobj_handles =3D memdup_user(u64_to_user_ptr(args->syncobj_handles),
- 				      size_mul(sizeof(u32), num_syncobj_handles));
+ 	syncobj_handles =3D memdup_array_user(u64_to_user_ptr(args->syncobj_hand=
les),
+ 					    num_syncobj_handles, sizeof(u32));
  	if (IS_ERR(syncobj_handles))
  		return PTR_ERR(syncobj_handles);
 =20
@@@ -506,51 -504,19 +504,19 @@@
  		}
  	}
 =20
- 	num_read_bo_handles =3D args->num_bo_read_handles;
- 	bo_handles_read =3D memdup_user(u64_to_user_ptr(args->bo_read_handles),
- 				      sizeof(u32) * num_read_bo_handles);
- 	if (IS_ERR(bo_handles_read)) {
- 		r =3D PTR_ERR(bo_handles_read);
+ 	r =3D drm_gem_objects_lookup(filp,
+ 				   u64_to_user_ptr(args->bo_read_handles),
+ 				   num_read_bo_handles,
+ 				   &gobj_read);
+ 	if (r)
  		goto free_syncobj;
- 	}
 =20
- 	/* Array of pointers to the GEM read objects */
- 	gobj_read =3D kmalloc_array(num_read_bo_handles, sizeof(*gobj_read), GFP=
_KERNEL);
- 	if (!gobj_read) {
- 		r =3D -ENOMEM;
- 		goto free_bo_handles_read;
- 	}
-=20
- 	for (rentry =3D 0; rentry < num_read_bo_handles; rentry++) {
- 		gobj_read[rentry] =3D drm_gem_object_lookup(filp, bo_handles_read[rentr=
y]);
- 		if (!gobj_read[rentry]) {
- 			r =3D -ENOENT;
- 			goto put_gobj_read;
- 		}
- 	}
-=20
- 	num_write_bo_handles =3D args->num_bo_write_handles;
- 	bo_handles_write =3D memdup_user(u64_to_user_ptr(args->bo_write_handles),
- 				       sizeof(u32) * num_write_bo_handles);
- 	if (IS_ERR(bo_handles_write)) {
- 		r =3D PTR_ERR(bo_handles_write);
+ 	r =3D drm_gem_objects_lookup(filp,
+ 				   u64_to_user_ptr(args->bo_write_handles),
+ 				   num_write_bo_handles,
+ 				   &gobj_write);
+ 	if (r)
  		goto put_gobj_read;
- 	}
-=20
- 	/* Array of pointers to the GEM write objects */
- 	gobj_write =3D kmalloc_array(num_write_bo_handles, sizeof(*gobj_write), =
GFP_KERNEL);
- 	if (!gobj_write) {
- 		r =3D -ENOMEM;
- 		goto free_bo_handles_write;
- 	}
-=20
- 	for (wentry =3D 0; wentry < num_write_bo_handles; wentry++) {
- 		gobj_write[wentry] =3D drm_gem_object_lookup(filp, bo_handles_write[wen=
try]);
- 		if (!gobj_write[wentry]) {
- 			r =3D -ENOENT;
- 			goto put_gobj_write;
- 		}
- 	}
 =20
  	/* Retrieve the user queue */
  	queue =3D xa_load(&userq_mgr->userq_xa, args->queue_id);
@@@ -629,17 -595,13 +595,13 @@@
  exec_fini:
  	drm_exec_fini(&exec);
  put_gobj_write:
- 	while (wentry-- > 0)
- 		drm_gem_object_put(gobj_write[wentry]);
+ 	for (i =3D 0; i < num_write_bo_handles; i++)
+ 		drm_gem_object_put(gobj_write[i]);
  	kfree(gobj_write);
- free_bo_handles_write:
- 	kfree(bo_handles_write);
  put_gobj_read:
- 	while (rentry-- > 0)
- 		drm_gem_object_put(gobj_read[rentry]);
+ 	for (i =3D 0; i < num_read_bo_handles; i++)
+ 		drm_gem_object_put(gobj_read[i]);
  	kfree(gobj_read);
- free_bo_handles_read:
- 	kfree(bo_handles_read);
  free_syncobj:
  	while (entry-- > 0)
  		if (syncobj[entry])
@@@ -654,92 -616,64 +616,64 @@@ free_syncobj_handles
  int amdgpu_userq_wait_ioctl(struct drm_device *dev, void *data,
  			    struct drm_file *filp)
  {
- 	u32 *syncobj_handles, *timeline_points, *timeline_handles, *bo_handles_r=
ead, *bo_handles_write;
- 	u32 num_syncobj, num_read_bo_handles, num_write_bo_handles;
- 	struct drm_amdgpu_userq_fence_info *fence_info =3D NULL;
  	struct drm_amdgpu_userq_wait *wait_info =3D data;
+ 	const unsigned int num_write_bo_handles =3D wait_info->num_bo_write_hand=
les;
+ 	const unsigned int num_read_bo_handles =3D wait_info->num_bo_read_handle=
s;
+ 	struct drm_amdgpu_userq_fence_info *fence_info =3D NULL;
  	struct amdgpu_fpriv *fpriv =3D filp->driver_priv;
  	struct amdgpu_userq_mgr *userq_mgr =3D &fpriv->userq_mgr;
+ 	struct drm_gem_object **gobj_write, **gobj_read;
+ 	u32 *timeline_points, *timeline_handles;
  	struct amdgpu_usermode_queue *waitq;
- 	struct drm_gem_object **gobj_write;
- 	struct drm_gem_object **gobj_read;
+ 	u32 *syncobj_handles, num_syncobj;
  	struct dma_fence **fences =3D NULL;
  	u16 num_points, num_fences =3D 0;
- 	int r, i, rentry, wentry, cnt;
  	struct drm_exec exec;
+ 	int r, i, cnt;
 =20
  	if (!amdgpu_userq_enabled(dev))
  		return -ENOTSUPP;
 =20
- 	if (wait_info->num_syncobj_handles > AMDGPU_USERQ_MAX_HANDLES ||
- 	    wait_info->num_bo_write_handles > AMDGPU_USERQ_MAX_HANDLES ||
+ 	if (wait_info->num_bo_write_handles > AMDGPU_USERQ_MAX_HANDLES ||
  	    wait_info->num_bo_read_handles > AMDGPU_USERQ_MAX_HANDLES)
  		return -EINVAL;
 =20
- 	num_read_bo_handles =3D wait_info->num_bo_read_handles;
- 	bo_handles_read =3D memdup_user(u64_to_user_ptr(wait_info->bo_read_handl=
es),
- 				      size_mul(sizeof(u32), num_read_bo_handles));
- 	if (IS_ERR(bo_handles_read))
- 		return PTR_ERR(bo_handles_read);
-=20
- 	num_write_bo_handles =3D wait_info->num_bo_write_handles;
- 	bo_handles_write =3D memdup_user(u64_to_user_ptr(wait_info->bo_write_han=
dles),
- 				       size_mul(sizeof(u32), num_write_bo_handles));
- 	if (IS_ERR(bo_handles_write)) {
- 		r =3D PTR_ERR(bo_handles_write);
- 		goto free_bo_handles_read;
- 	}
-=20
  	num_syncobj =3D wait_info->num_syncobj_handles;
- 	syncobj_handles =3D memdup_user(u64_to_user_ptr(wait_info->syncobj_handl=
es),
- 				      size_mul(sizeof(u32), num_syncobj));
- 	if (IS_ERR(syncobj_handles)) {
- 		r =3D PTR_ERR(syncobj_handles);
- 		goto free_bo_handles_write;
- 	}
+ 	syncobj_handles =3D memdup_array_user(u64_to_user_ptr(wait_info->syncobj=
_handles),
+ 					    num_syncobj, sizeof(u32));
+ 	if (IS_ERR(syncobj_handles))
+ 		return PTR_ERR(syncobj_handles);
+=20
 =20
  	num_points =3D wait_info->num_syncobj_timeline_handles;
- 	timeline_handles =3D memdup_user(u64_to_user_ptr(wait_info->syncobj_time=
line_handles),
- 				       sizeof(u32) * num_points);
+ 	timeline_handles =3D memdup_array_user(u64_to_user_ptr(wait_info->syncob=
j_timeline_handles),
+ 					     num_points, sizeof(u32));
  	if (IS_ERR(timeline_handles)) {
  		r =3D PTR_ERR(timeline_handles);
  		goto free_syncobj_handles;
  	}
 =20
- 	timeline_points =3D memdup_user(u64_to_user_ptr(wait_info->syncobj_timel=
ine_points),
- 				      sizeof(u32) * num_points);
+ 	timeline_points =3D memdup_array_user(u64_to_user_ptr(wait_info->syncobj=
_timeline_points),
+ 					    num_points, sizeof(u32));
+=20
  	if (IS_ERR(timeline_points)) {
  		r =3D PTR_ERR(timeline_points);
  		goto free_timeline_handles;
  	}
 =20
- 	gobj_read =3D kmalloc_array(num_read_bo_handles, sizeof(*gobj_read), GFP=
_KERNEL);
- 	if (!gobj_read) {
- 		r =3D -ENOMEM;
+ 	r =3D drm_gem_objects_lookup(filp,
+ 				   u64_to_user_ptr(wait_info->bo_read_handles),
+ 				   num_read_bo_handles,
+ 				   &gobj_read);
+ 	if (r)
  		goto free_timeline_points;
- 	}
 =20
- 	for (rentry =3D 0; rentry < num_read_bo_handles; rentry++) {
- 		gobj_read[rentry] =3D drm_gem_object_lookup(filp, bo_handles_read[rentr=
y]);
- 		if (!gobj_read[rentry]) {
- 			r =3D -ENOENT;
- 			goto put_gobj_read;
- 		}
- 	}
-=20
- 	gobj_write =3D kmalloc_array(num_write_bo_handles, sizeof(*gobj_write), =
GFP_KERNEL);
- 	if (!gobj_write) {
- 		r =3D -ENOMEM;
+ 	r =3D drm_gem_objects_lookup(filp,
+ 				   u64_to_user_ptr(wait_info->bo_write_handles),
+ 				   num_write_bo_handles,
+ 				   &gobj_write);
+ 	if (r)
  		goto put_gobj_read;
- 	}
-=20
- 	for (wentry =3D 0; wentry < num_write_bo_handles; wentry++) {
- 		gobj_write[wentry] =3D drm_gem_object_lookup(filp, bo_handles_write[wen=
try]);
- 		if (!gobj_write[wentry]) {
- 			r =3D -ENOENT;
- 			goto put_gobj_write;
- 		}
- 	}
 =20
  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
  		      (num_read_bo_handles + num_write_bo_handles));
@@@ -983,43 -917,25 +917,25 @@@
  			r =3D -EFAULT;
  			goto free_fences;
  		}
-=20
- 		kfree(fences);
- 		kfree(fence_info);
  	}
 =20
- 	drm_exec_fini(&exec);
- 	for (i =3D 0; i < num_read_bo_handles; i++)
- 		drm_gem_object_put(gobj_read[i]);
- 	kfree(gobj_read);
-=20
- 	for (i =3D 0; i < num_write_bo_handles; i++)
- 		drm_gem_object_put(gobj_write[i]);
- 	kfree(gobj_write);
-=20
- 	kfree(timeline_points);
- 	kfree(timeline_handles);
- 	kfree(syncobj_handles);
- 	kfree(bo_handles_write);
- 	kfree(bo_handles_read);
-=20
- 	return 0;
-=20
  free_fences:
- 	while (num_fences-- > 0)
- 		dma_fence_put(fences[num_fences]);
- 	kfree(fences);
+ 	if (fences) {
+ 		while (num_fences-- > 0)
+ 			dma_fence_put(fences[num_fences]);
+ 		kfree(fences);
+ 	}
  free_fence_info:
  	kfree(fence_info);
  exec_fini:
  	drm_exec_fini(&exec);
  put_gobj_write:
- 	while (wentry-- > 0)
- 		drm_gem_object_put(gobj_write[wentry]);
+ 	for (i =3D 0; i < num_write_bo_handles; i++)
+ 		drm_gem_object_put(gobj_write[i]);
  	kfree(gobj_write);
  put_gobj_read:
- 	while (rentry-- > 0)
- 		drm_gem_object_put(gobj_read[rentry]);
+ 	for (i =3D 0; i < num_read_bo_handles; i++)
+ 		drm_gem_object_put(gobj_read[i]);
  	kfree(gobj_read);
  free_timeline_points:
  	kfree(timeline_points);
@@@ -1027,10 -943,6 +943,6 @@@ free_timeline_handles
  	kfree(timeline_handles);
  free_syncobj_handles:
  	kfree(syncobj_handles);
- free_bo_handles_write:
- 	kfree(bo_handles_write);
- free_bo_handles_read:
- 	kfree(bo_handles_read);
 =20
  	return r;
  }

--Wi7NxE3rXDAQx8l2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmm3ZsACgkQJNaLcl1U
h9AfWQf+Ow0awX2HqjiNPsm/fULtVzdXxumiQIR8VjKaiviUuZYbSljD7oVbbM8x
y7ZfbHvQlXFg/NGUf7+WwTXYvTc4oEEy0bUyVewA21PQHIxMzWhpEi4oCwp5QNRj
ZEhFWtSX3PzqfnYPa8hV5FiOTLFNcxGAlqVukY2YIWa/fOKsuGggryLfZiS+fTt9
pnkUFGrJSgGFwJF9COutwEhD3i1Cev30k6nWqVFEncDqor5LR2n4dELSXs6iloYc
EQ+fPx5qb6QDRWrpHc4yWNImW+vXrUpY34O8BHVSqsXN2YBGqpt6FQRscxC8txch
tad7nuYdD9QuL4kCVVtPj8BnyRB/UQ==
=F8vp
-----END PGP SIGNATURE-----

--Wi7NxE3rXDAQx8l2--
