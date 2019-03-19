From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the drm-intel
 tree
Date: Tue, 19 Mar 2019 11:51:16 +1100
Message-ID: <20190319115116.5b5892fd@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/pUnUBgG_2I692jZXpr+YLiI"; protocol="application/pgp-signature"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, Uma Shankar <uma.shankar@intel.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
List-Id: linux-next.vger.kernel.org

--Sig_/pUnUBgG_2I692jZXpr+YLiI
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_hdmi.c

between commit:

  fbf08556ed43 ("drm/i915: Precompute HDMI infoframes")

from the drm-intel tree and commit:

  2f146b78d5a9 ("drm/i915: Attach colorspace property and enable modeset")

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

diff --cc drivers/gpu/drm/i915/intel_hdmi.c
index ecfec5d3292e,765718b606d8..000000000000
--- a/drivers/gpu/drm/i915/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/intel_hdmi.c
@@@ -638,70 -469,39 +638,72 @@@ static void intel_write_infoframe(struc
  	buffer[3] =3D 0;
  	len++;
 =20
 -	intel_dig_port->write_infoframe(encoder,
 -					crtc_state,
 -					frame->any.type, buffer, len);
 +	intel_dig_port->write_infoframe(encoder, crtc_state, type, buffer, len);
  }
 =20
 -static void intel_hdmi_set_avi_infoframe(struct intel_encoder *encoder,
 -					 const struct intel_crtc_state *crtc_state,
 -					 const struct drm_connector_state *conn_state)
 +void intel_read_infoframe(struct intel_encoder *encoder,
 +			  const struct intel_crtc_state *crtc_state,
 +			  enum hdmi_infoframe_type type,
 +			  union hdmi_infoframe *frame)
  {
 +	struct intel_digital_port *intel_dig_port =3D enc_to_dig_port(&encoder->=
base);
 +	u8 buffer[VIDEO_DIP_DATA_SIZE];
 +	int ret;
 +
 +	if ((crtc_state->infoframes.enable &
 +	     intel_hdmi_infoframe_enable(type)) =3D=3D 0)
 +		return;
 +
 +	intel_dig_port->read_infoframe(encoder, crtc_state,
 +				       type, buffer, sizeof(buffer));
 +
 +	/* Fill the 'hole' (see big comment above) at position 3 */
 +	memmove(&buffer[1], &buffer[0], 3);
 +
 +	/* see comment above for the reason for this offset */
 +	ret =3D hdmi_infoframe_unpack(frame, buffer + 1, sizeof(buffer) - 1);
 +	if (ret) {
 +		DRM_DEBUG_KMS("Failed to unpack infoframe type 0x%02x\n", type);
 +		return;
 +	}
 +
 +	if (frame->any.type !=3D type)
 +		DRM_DEBUG_KMS("Found the wrong infoframe type 0x%x (expected 0x%02x)\n",
 +			      frame->any.type, type);
 +}
 +
 +static bool
 +intel_hdmi_compute_avi_infoframe(struct intel_encoder *encoder,
 +				 struct intel_crtc_state *crtc_state,
 +				 struct drm_connector_state *conn_state)
 +{
 +	struct hdmi_avi_infoframe *frame =3D &crtc_state->infoframes.avi.avi;
  	const struct drm_display_mode *adjusted_mode =3D
  		&crtc_state->base.adjusted_mode;
 -	union hdmi_infoframe frame;
 +	struct drm_connector *connector =3D conn_state->connector;
  	int ret;
 =20
 -	ret =3D drm_hdmi_avi_infoframe_from_display_mode(&frame.avi,
 -						       conn_state->connector,
 +	if (!crtc_state->has_infoframe)
 +		return true;
 +
 +	crtc_state->infoframes.enable |=3D
 +		intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_AVI);
 +
 +	ret =3D drm_hdmi_avi_infoframe_from_display_mode(frame, connector,
  						       adjusted_mode);
 -	if (ret < 0) {
 -		DRM_ERROR("couldn't fill AVI infoframe\n");
 -		return;
 -	}
 +	if (ret)
 +		return false;
 =20
  	if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR420)
 -		frame.avi.colorspace =3D HDMI_COLORSPACE_YUV420;
 +		frame->colorspace =3D HDMI_COLORSPACE_YUV420;
  	else if (crtc_state->output_format =3D=3D INTEL_OUTPUT_FORMAT_YCBCR444)
 -		frame.avi.colorspace =3D HDMI_COLORSPACE_YUV444;
 +		frame->colorspace =3D HDMI_COLORSPACE_YUV444;
  	else
 -		frame.avi.colorspace =3D HDMI_COLORSPACE_RGB;
 +		frame->colorspace =3D HDMI_COLORSPACE_RGB;
 =20
 -	drm_hdmi_avi_infoframe_colorspace(&frame.avi, conn_state);
++	drm_hdmi_avi_infoframe_colorspace(frame, conn_state);
+=20
 -	drm_hdmi_avi_infoframe_quant_range(&frame.avi,
 -					   conn_state->connector,
 +	drm_hdmi_avi_infoframe_quant_range(frame, connector,
  					   adjusted_mode,
  					   crtc_state->limited_color_range ?
  					   HDMI_QUANTIZATION_RANGE_LIMITED :

--Sig_/pUnUBgG_2I692jZXpr+YLiI
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlyQPQQACgkQAVBC80lX
0GwcOwf+NWXUXmOYQAgH7YS/rY2UXvv9tQnq/BMB3Am4MkpV4j2QOgZ9wLiCzaTY
VdkMbEXDk4FCwhO5hJ9hSX5G3w6Ilm9IxFf8AjdrAD8aQ8fpHQcw50FvgcnZgc6b
xENKPbJ5cW81LcUoeaFo7zZXNDwWYsLhxaJUbv6bYfneUlLt31fSl7KGsO/Zx+es
8A4BErsvPwnYzqE4mKdFbLLS61DTQjpuDc4tBv3HvxUXXWv08pUFtVR7p2sfsoJ3
0yZ4vCyuBwbAdlQt1qwoR8Nq0AXEN15TzATYyIhWPCklNMeGXcsPyq4x7DB5/IuT
wE1RFKqO1El7g6p0BKSJb/gubiXCSw==
=icGM
-----END PGP SIGNATURE-----

--Sig_/pUnUBgG_2I692jZXpr+YLiI--
