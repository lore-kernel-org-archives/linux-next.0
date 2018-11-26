From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm tree with the drm-misc-fixes
 tree
Date: Mon, 26 Nov 2018 13:37:15 +1100
Message-ID: <20181126133715.378e8d9d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/qs_cfbgb3z0ReS7cdl193FF"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Lyude Paul <lyude@redhat.com>
List-Id: linux-next.vger.kernel.org

--Sig_/qs_cfbgb3z0ReS7cdl193FF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm tree got a conflict in:

  drivers/gpu/drm/meson/meson_crtc.c

between commit:

  47ebfb6ed13e ("drm/meson: Fixes for drm_crtc_vblank_on/off support")

from the drm-misc-fixes tree and commit:

  f9a2348196d1 ("drm/meson: Support Overlay plane for video rendering")

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

diff --cc drivers/gpu/drm/meson/meson_crtc.c
index 191b314f9e9e,d78168f979db..000000000000
--- a/drivers/gpu/drm/meson/meson_crtc.c
+++ b/drivers/gpu/drm/meson/meson_crtc.c
@@@ -126,8 -115,8 +131,10 @@@ static void meson_crtc_atomic_disable(s
  	struct meson_crtc *meson_crtc =3D to_meson_crtc(crtc);
  	struct meson_drm *priv =3D meson_crtc->priv;
 =20
+ 	DRM_DEBUG_DRIVER("\n");
+=20
 +	drm_crtc_vblank_off(crtc);
 +
  	priv->viu.osd1_enabled =3D false;
  	priv->viu.osd1_commit =3D false;
 =20

--Sig_/qs_cfbgb3z0ReS7cdl193FF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlv7XFsACgkQAVBC80lX
0GzMpQgAmcb2ySHlYwpuRYY+SvS3NKyD66j4nX/WTs/MdCbjJET4e5CNiWegBxwm
+pj7s6p8L9ux54xj+yDJMoNd1nZyblPOPuRtTlDV+/TNEsB5J6OBG7LvSbHZNmvm
VNtCep5DTT4+kFIkj5Mk6kg8KTQEr6Suhv9dTniUOxvvvdwMSt6KyZuiPdsxOp2t
vVPvC8s7jRwvoV2LcL8TXMFulDObpv3NcmSs3q/Bboop1gtT9/QTNFwzOtqKTv6y
cd1Q/MWRHBITB4RupHm32iCASH9qGvvrYkDGjvmMBBZb87/qGr9/G2c/smFP9Jdf
OLFJzLKHXy08L5E+fP0ywXCA3CESxg==
=jSpn
-----END PGP SIGNATURE-----

--Sig_/qs_cfbgb3z0ReS7cdl193FF--
