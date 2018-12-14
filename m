From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-fixes tree
Date: Fri, 14 Dec 2018 12:51:43 +1100
Message-ID: <20181214125143.3ecb367b@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/gp/1vY5NFFltj0I6Ijc1CqF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Thomas Hellstrom <thellstrom@vmware.com>, Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
List-Id: linux-next.vger.kernel.org

--Sig_/gp/1vY5NFFltj0I6Ijc1CqF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c

between commit:

  fd567467753f ("drm/vmwgfx: Protect from excessive execbuf kernel memory a=
llocations v3")

from the drm-fixes tree and commit:

  a64f784bb14a ("drm/ttm: initialize globals during device init (v2)")

from the drm tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index f88247046721,154eb09aa91e..000000000000
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@@ -42,93 -42,3 +42,39 @@@ int vmw_mmap(struct file *filp, struct=20
  	dev_priv =3D vmw_priv(file_priv->minor->dev);
  	return ttm_bo_mmap(filp, vma, &dev_priv->bdev);
  }
 +
- static int vmw_ttm_mem_global_init(struct drm_global_reference *ref)
- {
- 	DRM_INFO("global init.\n");
- 	return ttm_mem_global_init(ref->object);
- }
-=20
- static void vmw_ttm_mem_global_release(struct drm_global_reference *ref)
- {
- 	ttm_mem_global_release(ref->object);
- }
-=20
- int vmw_ttm_global_init(struct vmw_private *dev_priv)
- {
- 	struct drm_global_reference *global_ref;
- 	int ret;
-=20
- 	global_ref =3D &dev_priv->mem_global_ref;
- 	global_ref->global_type =3D DRM_GLOBAL_TTM_MEM;
- 	global_ref->size =3D sizeof(struct ttm_mem_global);
- 	global_ref->init =3D &vmw_ttm_mem_global_init;
- 	global_ref->release =3D &vmw_ttm_mem_global_release;
-=20
- 	ret =3D drm_global_item_ref(global_ref);
- 	if (unlikely(ret !=3D 0)) {
- 		DRM_ERROR("Failed setting up TTM memory accounting.\n");
- 		return ret;
- 	}
-=20
- 	dev_priv->bo_global_ref.mem_glob =3D
- 		dev_priv->mem_global_ref.object;
- 	global_ref =3D &dev_priv->bo_global_ref.ref;
- 	global_ref->global_type =3D DRM_GLOBAL_TTM_BO;
- 	global_ref->size =3D sizeof(struct ttm_bo_global);
- 	global_ref->init =3D &ttm_bo_global_init;
- 	global_ref->release =3D &ttm_bo_global_release;
- 	ret =3D drm_global_item_ref(global_ref);
-=20
- 	if (unlikely(ret !=3D 0)) {
- 		DRM_ERROR("Failed setting up TTM buffer objects.\n");
- 		goto out_no_bo;
- 	}
-=20
- 	return 0;
- out_no_bo:
- 	drm_global_item_unref(&dev_priv->mem_global_ref);
- 	return ret;
- }
-=20
- void vmw_ttm_global_release(struct vmw_private *dev_priv)
- {
- 	drm_global_item_unref(&dev_priv->bo_global_ref.ref);
- 	drm_global_item_unref(&dev_priv->mem_global_ref);
- }
-=20
 +/* struct vmw_validation_mem callback */
 +static int vmw_vmt_reserve(struct vmw_validation_mem *m, size_t size)
 +{
 +	static struct ttm_operation_ctx ctx =3D {.interruptible =3D false,
 +					       .no_wait_gpu =3D false};
 +	struct vmw_private *dev_priv =3D container_of(m, struct vmw_private, vvm=
);
 +
 +	return ttm_mem_global_alloc(vmw_mem_glob(dev_priv), size, &ctx);
 +}
 +
 +/* struct vmw_validation_mem callback */
 +static void vmw_vmt_unreserve(struct vmw_validation_mem *m, size_t size)
 +{
 +	struct vmw_private *dev_priv =3D container_of(m, struct vmw_private, vvm=
);
 +
 +	return ttm_mem_global_free(vmw_mem_glob(dev_priv), size);
 +}
 +
 +/**
 + * vmw_validation_mem_init_ttm - Interface the validation memory tracker
 + * to ttm.
 + * @dev_priv: Pointer to struct vmw_private. The reason we choose a vmw p=
rivate
 + * rather than a struct vmw_validation_mem is to make sure assumption in =
the
 + * callbacks that struct vmw_private derives from struct vmw_validation_m=
em
 + * holds true.
 + * @gran: The recommended allocation granularity
 + */
 +void vmw_validation_mem_init_ttm(struct vmw_private *dev_priv, size_t gra=
n)
 +{
 +	struct vmw_validation_mem *vvm =3D &dev_priv->vvm;
 +
 +	vvm->reserve_mem =3D vmw_vmt_reserve;
 +	vvm->unreserve_mem =3D vmw_vmt_unreserve;
 +	vvm->gran =3D gran;
 +}

--Sig_/gp/1vY5NFFltj0I6Ijc1CqF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlwTDK8ACgkQAVBC80lX
0GwWKQf/f9Tlmbt5Jvzi1hkZTvwBluO3OQ1eX7ahLgUiA3gD/LDgBUI7YHnkU705
+zWqxFeY9rJAMAr5ZTdxOjkPK2e/qXIxIeSm9Wj02Vd+qAJiWQf1IBGw50o3xfEm
OvtJI2/dsA+DtaGeLNBClurlYcizMZvBybdxwQ/6vZPXZ7v1H+6AmTr2w1VWGIII
ZmsIHo1pHBt/9Oa45A3wLrUQGPkqLTLVG1MD77AEJfClEVf0YXOK8gsXzZTujt5Q
gCEcGk0ZxkXnHHV46g5JQ6iW9VXsxgKq5DRxpNk5nsI8+aT+WLWaT6CNCxr5W/LV
1TRoAzz5Aw2U2925h7XwvxzNNf4M/Q==
=1amb
-----END PGP SIGNATURE-----

--Sig_/gp/1vY5NFFltj0I6Ijc1CqF--
