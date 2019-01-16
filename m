From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm-intel tree
Date: Wed, 16 Jan 2019 12:27:07 +1100
Message-ID: <20190116122707.066059a2@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2044451340=="
Return-path: <intel-gfx-bounces@lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============2044451340==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/j0dvh.y9SAu7o7kTGCAl45A"; protocol="application/pgp-signature"

--Sig_/j0dvh.y9SAu7o7kTGCAl45A
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got conflicts in:

  drivers/gpu/drm/i915/intel_dp.c
  drivers/gpu/drm/i915/intel_drv.h

between commits:

  e845f099f1c6 ("drm/i915/dsc: Add Per connector debugfs node for DSC suppo=
rt/enable")
  f6bff60e927b ("drm/i915/icl: Fix HPD handling for TypeC legacy ports")

from the drm-intel tree and commit:

  96550555a78c ("drm/i915: Pass down rc in intel_encoder->compute_config()")

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

diff --cc drivers/gpu/drm/i915/intel_dp.c
index 0a3ac98a779e,d18b72b5f0b8..000000000000
--- a/drivers/gpu/drm/i915/intel_dp.c
+++ b/drivers/gpu/drm/i915/intel_dp.c
@@@ -2062,11 -2055,11 +2066,12 @@@ intel_dp_compute_link_config(struct int
  							&limits);
 =20
  	/* enable compression if the mode doesn't fit available BW */
 -	if (ret) {
 +	DRM_DEBUG_KMS("Force DSC en =3D %d\n", intel_dp->force_dsc_en);
- 	if (!ret || intel_dp->force_dsc_en) {
- 		if (!intel_dp_dsc_compute_config(intel_dp, pipe_config,
- 						 conn_state, &limits))
- 			return false;
++	if (ret || intel_dp->force_dsc_en) {
+ 		ret =3D intel_dp_dsc_compute_config(intel_dp, pipe_config,
+ 						  conn_state, &limits);
+ 		if (ret < 0)
+ 			return ret;
  	}
 =20
  	if (pipe_config->dsc_params.compression_enable) {
diff --cc drivers/gpu/drm/i915/intel_drv.h
index 5e5ceec7c004,19d9abd2666e..000000000000
--- a/drivers/gpu/drm/i915/intel_drv.h
+++ b/drivers/gpu/drm/i915/intel_drv.h
@@@ -1816,10 -1805,10 +1815,10 @@@ void intel_dp_sink_set_decompression_st
  					   bool enable);
  void intel_dp_encoder_reset(struct drm_encoder *encoder);
  void intel_dp_encoder_suspend(struct intel_encoder *intel_encoder);
 -void intel_dp_encoder_destroy(struct drm_encoder *encoder);
 +void intel_dp_encoder_flush_work(struct drm_encoder *encoder);
- bool intel_dp_compute_config(struct intel_encoder *encoder,
- 			     struct intel_crtc_state *pipe_config,
- 			     struct drm_connector_state *conn_state);
+ int intel_dp_compute_config(struct intel_encoder *encoder,
+ 			    struct intel_crtc_state *pipe_config,
+ 			    struct drm_connector_state *conn_state);
  bool intel_dp_is_edp(struct intel_dp *intel_dp);
  bool intel_dp_is_port_edp(struct drm_i915_private *dev_priv, enum port po=
rt);
  enum irqreturn intel_dp_hpd_pulse(struct intel_digital_port *intel_dig_po=
rt,

--Sig_/j0dvh.y9SAu7o7kTGCAl45A
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlw+iGsACgkQAVBC80lX
0Gyv+wf/SDNIeUwXGpNlHeuiZP/adinJrh6a2mSjuJxPu/pFtafC2/wnhQMz6RWB
IYXn/8KHf4lHIHbNdVJWCYeNNSLeYdlBvQzgPqV49PhYeZJADLJL1vD3irnUPLPe
kLac4r2p6xSR6Apk/TNBUD9au882nWD/ch07yHvA1nhtSo41yk4yH1J9miuD7RKU
C1gwhA1T5dUencscQn074m88XHWqeJlGXym5vhRBT3Dd4zDaMTVuK2M/I1U1nm5u
rsR7dY89wPhG7mr3JjGO70xl+jGk8sR69jjIse5LM2VOxgLhFWStTMBjqM9aUh1/
KYsQ3evsqbNU5NWR8fxwPseM8KTifA==
=iw9M
-----END PGP SIGNATURE-----

--Sig_/j0dvh.y9SAu7o7kTGCAl45A--

--===============2044451340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============2044451340==--
