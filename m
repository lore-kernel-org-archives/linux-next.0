From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm tree
Date: Tue, 18 Sep 2018 11:31:46 +1000
Message-ID: <20180918113146.15bb1cf2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/KEIqFDM7hYTINl1IY8AxRrQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-Id: linux-next.vger.kernel.org

--Sig_/KEIqFDM7hYTINl1IY8AxRrQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/i915_drv.c

between commit:

  55ac5a1614f9 ("drm/i915: Attach the pci match data to the device upon cre=
ation")

from the drm tree and commit:

  1feb64c49d7f ("drm/i915: Clear DRIVER_ATOMIC on a per-device basis")

from the drm-misc tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc drivers/gpu/drm/i915/i915_drv.c
index 5dd7fc582e6f,61199defb470..000000000000
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@@ -1384,14 -1336,22 +1384,14 @@@ int i915_driver_load(struct pci_dev *pd
  	struct drm_i915_private *dev_priv;
  	int ret;
 =20
- 	/* Enable nuclear pageflip on ILK+ */
- 	if (!i915_modparams.nuclear_pageflip && match_info->gen < 5)
- 		driver.driver_features &=3D ~DRIVER_ATOMIC;
 -	ret =3D -ENOMEM;
 -	dev_priv =3D kzalloc(sizeof(*dev_priv), GFP_KERNEL);
 -	if (dev_priv)
 -		ret =3D drm_dev_init(&dev_priv->drm, &driver, &pdev->dev);
 -	if (ret) {
 -		DRM_DEV_ERROR(&pdev->dev, "allocation failed\n");
 -		goto out_free;
 -	}
--
 -	dev_priv->drm.pdev =3D pdev;
 -	dev_priv->drm.dev_private =3D dev_priv;
 +	dev_priv =3D i915_driver_create(pdev, ent);
 +	if (!dev_priv)
 +		return -ENOMEM;
 =20
+ 	/* Disable nuclear pageflip by default on pre-ILK */
+ 	if (!i915_modparams.nuclear_pageflip && match_info->gen < 5)
+ 		dev_priv->drm.driver_features &=3D ~DRIVER_ATOMIC;
+=20
  	ret =3D pci_enable_device(pdev);
  	if (ret)
  		goto out_fini;

--Sig_/KEIqFDM7hYTINl1IY8AxRrQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlugVYIACgkQAVBC80lX
0GxuaAf8CY063ClLqU8zaxTWpu5fbgqmPE8WvWknQ5BSL5zx77ECteHbpRkkgtw9
hDgVl0s8+pyOO0QFyiCyrvYmVZbeOMMHFqlBoiSaJL/laASTfgexZhgpsDqSQ9/r
lpkadGq2a3JAjyWVhFYYTug9S6Bps7dPVLVdSVRHagLYRFs5wr8JYstRywtxceL1
CLE8lLbZv7GYU4zv8Ea/Q/qgJcNC0zTQsfn4jvImBPn7fXsaPKu5BxC13FOrbMX2
sA+bfb6MjazTsvYhpu9M4G11zYkZ8gkiF+iyusn7Uo3wQIi9PCn5GIASnv3R9Jep
5J1PmzE6JNUUuLsqVkpG7DItbeQnRw==
=flOU
-----END PGP SIGNATURE-----

--Sig_/KEIqFDM7hYTINl1IY8AxRrQ--
