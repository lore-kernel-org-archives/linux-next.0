From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: build failure after merge of the drm-intel tree
Date: Fri, 13 Jul 2018 11:54:19 +1000
Message-ID: <20180713115419.1270c385@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ukd8t872aUce3nu=jWPV_hd"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Changbin Du <changbin.du@intel.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Dave Airlie <airlied@linux.ie>
List-Id: linux-next.vger.kernel.org

--Sig_/ukd8t872aUce3nu=jWPV_hd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

[Dave cc'd because this will probably turn up in the drm tree soon.]

After merging the drm-intel tree, today's linux-next build (x86_64
allmodconfig) failed like this:

drivers/gpu/drm/i915/gvt/kvmgt.c: In function 'gvt_dma_map_page':
drivers/gpu/drm/i915/gvt/kvmgt.c:188:17: error: 'pfn' undeclared (first use=
 in this function); did you mean 'gfn'?
  if (!pfn_valid(pfn)) {
                 ^~~

Caused by commit

  79e542f5af79 ("drm/i915/kvmgt: Support setting dma map for huge pages")

interacting with commit

  39b4cbadb9a9 ("drm/i915/kvmgt: Check the pfn got from vfio_pin_pages")

from Linus' tree (v4.18-rc1).

I added the following merge fix patch:

From: Stephen Rothwell <sfr@canb.auug.org.au>
Date: Fri, 13 Jul 2018 11:48:41 +1000
Subject: [PATCH] drm/i915/kvmgt: merge fixup for "Check the pfn got from
 vfio_pin_pages"

Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kv=
mgt.c
index 718ab307a500..4d2f53ae9f0f 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -185,12 +185,6 @@ static int gvt_dma_map_page(struct intel_vgpu *vgpu, u=
nsigned long gfn,
 	if (ret)
 		return ret;
=20
-	if (!pfn_valid(pfn)) {
-		gvt_vgpu_err("pfn 0x%lx is not mem backed\n", pfn);
-		vfio_unpin_pages(mdev_dev(vgpu->vdev.mdev), &gfn, 1);
-		return -EINVAL;
-	}
-
 	/* Setup DMA mapping. */
 	*dma_addr =3D dma_map_page(dev, page, 0, size, PCI_DMA_BIDIRECTIONAL);
 	ret =3D dma_mapping_error(dev, *dma_addr);
--=20
2.18.0

--=20
Cheers,
Stephen Rothwell

--Sig_/ukd8t872aUce3nu=jWPV_hd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAltIBksACgkQAVBC80lX
0Gy3/gf/ZgYmthzwh270WyxJkEcN0ex3baK1oqLrLfd7fjBLXDkphWQDOQBNMcO/
vl/NBEIKiK4iHAOxpemphYFubyc5edvOGZwCCd/kMbBHVHAzpgXNTHOiszP2zk7I
XLZomArFUkIDn3J6QKq0n41q3Mf9qTcd3t8pH4iR5lmSZCXk+2J1dyb6K3RZwdjp
xdz/Zy9Ib0MPbk9zeMnIafJ6uSZ7StN6q+C7j5quXzjd3qbFDb0VILxpwqS10xrh
VUG7qhDuxyLQg9Dru3JSt0UCjxE4bbLnWi67INfcedsslOSETbMCyI0sTgizJioa
g34xZk10I1PIse5SY6hbAomfgicVZg==
=VLDk
-----END PGP SIGNATURE-----

--Sig_/ukd8t872aUce3nu=jWPV_hd--
