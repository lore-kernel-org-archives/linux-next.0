From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: linux-next: manual merge of the drm-misc tree with the
 drm tree
Date: Mon, 19 Mar 2018 12:29:29 +1100
Message-ID: <20180319122929.2ac3dfd8@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0071299640=="
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
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel Graphics <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

--===============0071299640==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GSDQn4TkJWUiOKJM8Q9r0sw"; protocol="application/pgp-signature"

--Sig_/GSDQn4TkJWUiOKJM8Q9r0sw
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-misc tree got a conflict in:

  drivers/gpu/drm/i915/intel_color.c

between commit:

  db61d160b3ed ("drm/i915: Remove the pointless 1:1 matrix copy")

from the drm tree and commit:

  d5517a39dce4 ("drm/i915: Remove the blob->data casts")

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

diff --cc drivers/gpu/drm/i915/intel_color.c
index 89ab0f70aa22,768f1c26080e..000000000000
--- a/drivers/gpu/drm/i915/intel_color.c
+++ b/drivers/gpu/drm/i915/intel_color.c
@@@ -140,28 -140,20 +140,27 @@@ static void ilk_load_csc_matrix(struct=20
  	int i, pipe =3D intel_crtc->pipe;
  	uint16_t coeffs[9] =3D { 0, };
  	struct intel_crtc_state *intel_crtc_state =3D to_intel_crtc_state(crtc_s=
tate);
 +	bool limited_color_range =3D false;
 +
 +	/*
 +	 * FIXME if there's a gamma LUT after the CSC, we should
 +	 * do the range compression using the gamma LUT instead.
 +	 */
 +	if (INTEL_GEN(dev_priv) >=3D 8 || IS_HASWELL(dev_priv))
 +		limited_color_range =3D intel_crtc_state->limited_color_range;
 =20
  	if (intel_crtc_state->ycbcr420) {
 -		i9xx_load_ycbcr_conversion_matrix(intel_crtc);
 +		ilk_load_ycbcr_conversion_matrix(intel_crtc);
  		return;
  	} else if (crtc_state->ctm) {
- 		struct drm_color_ctm *ctm =3D
- 			(struct drm_color_ctm *)crtc_state->ctm->data;
+ 		struct drm_color_ctm *ctm =3D crtc_state->ctm->data;
 -		uint64_t input[9] =3D { 0, };
 +		const u64 *input;
 +		u64 temp[9];
 =20
 -		if (intel_crtc_state->limited_color_range) {
 -			ctm_mult_by_limited(input, ctm->matrix);
 -		} else {
 -			for (i =3D 0; i < ARRAY_SIZE(input); i++)
 -				input[i] =3D ctm->matrix[i];
 -		}
 +		if (limited_color_range)
 +			input =3D ctm_mult_by_limited(temp, ctm->matrix);
 +		else
 +			input =3D ctm->matrix;
 =20
  		/*
  		 * Convert fixed point S31.32 input to format supported by the

--Sig_/GSDQn4TkJWUiOKJM8Q9r0sw
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAlqvEnkACgkQAVBC80lX
0GweZAf/copogyhXqggxxyCZ2XPceyPI8qpkM2gOyDupaPdo3rBh1fRPcGRsoDYw
Te7nnbKsk+U6wkyDsXt/8QGuIxZaG2nd6/bASXr7Uu5cph4FSCEkF1yiQWrMoPyY
MHLhGdY6TGsIiT5VR4ZcdO9/NpyNmi0NC/XZlfbdEWL25y0UANbYX9tIBovlvxg8
RXjKejKsV9Fr8zhlJn+N/UglVuwUpYVh+YHtiPvmX0es9kWL3yk+9lIbF/XEMxuZ
FPmGrVKLUYd3JzEFVQU6DI1IBY3MGxLbXB8V9TittURjueCKysoGMGmhRDEtUz/8
ChsJ3QFMrBvTWQ8aDrtzzDJ06ms0SA==
=dgXn
-----END PGP SIGNATURE-----

--Sig_/GSDQn4TkJWUiOKJM8Q9r0sw--

--===============0071299640==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4
IG1haWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==

--===============0071299640==--
