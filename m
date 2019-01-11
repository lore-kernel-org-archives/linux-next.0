From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with Linus' tree
Date: Fri, 11 Jan 2019 11:14:50 +1100
Message-ID: <20190111111450.2358b6b9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/hVXfCvL.k0i.sH88Htde6NQ"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/hVXfCvL.k0i.sH88Htde6NQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/omapdrm/omap_encoder.c

between commit:

  3c613a3bddd3 ("drm/omap: fix incorrect union usage")

from Linus' tree and commit:

  13d0add333af ("drm/edid: Pass connector to AVI infoframe functions")

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

diff --cc drivers/gpu/drm/omapdrm/omap_encoder.c
index 933ebc9f9faa,4566e0a75cb8..000000000000
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@@ -52,37 -52,6 +52,37 @@@ static const struct drm_encoder_funcs o
  	.destroy =3D omap_encoder_destroy,
  };
 =20
 +static void omap_encoder_hdmi_mode_set(struct drm_encoder *encoder,
 +				       struct drm_display_mode *adjusted_mode)
 +{
 +	struct drm_device *dev =3D encoder->dev;
 +	struct omap_encoder *omap_encoder =3D to_omap_encoder(encoder);
 +	struct omap_dss_device *dssdev =3D omap_encoder->output;
 +	struct drm_connector *connector;
 +	bool hdmi_mode;
 +
 +	hdmi_mode =3D false;
 +	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
 +		if (connector->encoder =3D=3D encoder) {
 +			hdmi_mode =3D omap_connector_get_hdmi_mode(connector);
 +			break;
 +		}
 +	}
 +
 +	if (dssdev->ops->hdmi.set_hdmi_mode)
 +		dssdev->ops->hdmi.set_hdmi_mode(dssdev, hdmi_mode);
 +
 +	if (hdmi_mode && dssdev->ops->hdmi.set_infoframe) {
 +		struct hdmi_avi_infoframe avi;
 +		int r;
 +
- 		r =3D drm_hdmi_avi_infoframe_from_display_mode(&avi, adjusted_mode,
- 							     false);
++		r =3D drm_hdmi_avi_infoframe_from_display_mode(&avi, connector,
++							     adjusted_mode);
 +		if (r =3D=3D 0)
 +			dssdev->ops->hdmi.set_infoframe(dssdev, &avi);
 +	}
 +}
 +
  static void omap_encoder_mode_set(struct drm_encoder *encoder,
  				  struct drm_display_mode *mode,
  				  struct drm_display_mode *adjusted_mode)

--Sig_/hVXfCvL.k0i.sH88Htde6NQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw33/oACgkQAVBC80lX
0GwdPwf+L1iuXJ1KVz9RQrU0643VbuMDGjIidPlbyVDtUQc8vO+CjwK15i5H/qaQ
MRM2LfTxqbOujRVtXPwq0Y+9ahgwhv/cqobXPAS6U5PIXOTnmdXkD+5kdxC2p8M6
/tPMM8tssmszR+zAG1GGB9E2Q+sFhZpCrRUXhR39jcYNZbYb/XUerRUe6zdX5YAG
nWS7Zn47fIKJSRZVxSn6nPKyzWrcT4FSQhUkSrxJphVYzKO8QY+Miye1/Sp9gc49
XbvsGfzA46hkDc/o5a6k8ndlYwnSA0YxXpal4MVcXUXhXPANmgSLvhrvAsypoBIT
atynkCUCEjxSZ92MfUAsfWbLfD5Vpw==
=dFqU
-----END PGP SIGNATURE-----

--Sig_/hVXfCvL.k0i.sH88Htde6NQ--
