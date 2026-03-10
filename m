Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD66839936E;
	Tue, 10 Mar 2026 13:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149700; cv=none; b=UBJ7OspPZnZZzJnKnn5QhVFbUa5wGT/urlofZRlHf3Pm9rnjXBsG7xzE5TuiTF4q1yuFs1m85GSwjfIL9igLg7471kQBYSAOkHjvkwXXfcAlnSaHoK7FrQN3kcze9OR7m3HgNQWeIR2AqrM/QsqzPG2euYMD0Uk2hdXUlcfrQzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149700; c=relaxed/simple;
	bh=tm1nj2lmOriJREfH+Qu5V0vXny3pFbW7dtCrEGIG9vA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RZ3PXhbTMhyS6EK+U27UV9845GdUWRfhzwpY8Yy29Q0/geni/MknrCBlDAlpx8snZRoF9eudgSGVdNRK8GvCdMFJBprRKTALBzyWGz2mJv+G+AsMDmYIzrn78GYL17E1cs/2Aa2x/whGyFfo9JT9Vo+qA2JRpL+mBeZdvTnmVSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/JgThux; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/JgThux"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A11BC19423;
	Tue, 10 Mar 2026 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773149700;
	bh=tm1nj2lmOriJREfH+Qu5V0vXny3pFbW7dtCrEGIG9vA=;
	h=Date:From:To:Cc:Subject:From;
	b=n/JgThuxRT38ZOULF1t6gOR2jYFQExTDH3wGlXKd6q5CO1LtfYGXYo/btPRdimHsK
	 GKfv+/F1g9zEuNmDthwA3M9LZgTeU0Hp+RvjNhDaAB9GC1V9tCqGC/p/uAM91MSSfy
	 Rh1WGIJmafh8hFOJqU9pyLKqt9pU9tNV1cgV0f1AKqczZUIsluVigGKQdFRRLh+Ixn
	 dnBzAQdRQsWGi7jOwtlT9BesDyncvj8auLONTgNmF+z3ZsLqvqwC/ml7DZwLmvoB3s
	 ri0S3RkqYISW4E7Gg+ci6dsaAAXZKDR0hKlashXZ+BIJ/cyD6TJx59Uis9jmBbEMmR
	 uGHPrDRxzOs8g==
Date: Tue, 10 Mar 2026 13:34:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: Imre Deak <imre.deak@intel.com>,
	Jouni =?iso-8859-1?Q?H=F6gander?= <jouni.hogander@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Subject: linux-next: manual merge of the drm-intel tree with the
 drm-intel-fixes tree
Message-ID: <abAd_71qonm8fvk7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B7OPzjIj5t59VfcG"
Content-Disposition: inline


--B7OPzjIj5t59VfcG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-intel tree got a conflict in:

  drivers/gpu/drm/i915/display/intel_vdsc.h

between commit:

  bb5f1cd10101c ("drm/i915/dsc: Add helper for writing DSC Selective Update=
 ET parameters")

=66rom the drm-intel-fixes tree and commits:

  c8698d61aeb3f ("drm/i915/dsc: Add helper for writing DSC Selective Update=
 ET parameters")
  91f0a94974144 ("drm/i915/dsc: Add intel_dsc_get_slice_config()")
  889ff8dd4679a ("drm/i915/dsc: Track the detaild DSC slice configuration")

=66rom the drm-intel tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/i915/display/intel_vdsc.h
index 99bb9042592a4,3372f8694054d..0000000000000
--- a/drivers/gpu/drm/i915/display/intel_vdsc.h
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.h
@@@ -13,10 -13,16 +13,16 @@@ struct drm_printer
  enum transcoder;
  struct intel_crtc;
  struct intel_crtc_state;
+ struct intel_display;
  struct intel_dsb;
+ struct intel_dsc_slice_config;
  struct intel_encoder;
 =20
  bool intel_dsc_source_support(const struct intel_crtc_state *crtc_state);
+ int intel_dsc_line_slice_count(const struct intel_dsc_slice_config *confi=
g);
+ bool intel_dsc_get_slice_config(struct intel_display *display,
+ 				int num_joined_pipes, int slice_per_pipe,
+ 				struct intel_dsc_slice_config *config);
  void intel_uncompressed_joiner_enable(const struct intel_crtc_state *crtc=
_state);
  void intel_dsc_enable(const struct intel_crtc_state *crtc_state);
  void intel_dsc_disable(const struct intel_crtc_state *crtc_state);
@@@ -38,5 -44,8 +44,8 @@@ void intel_vdsc_state_dump(struct drm_p
  			   const struct intel_crtc_state *crtc_state);
  int intel_vdsc_min_cdclk(const struct intel_crtc_state *crtc_state);
  unsigned int intel_vdsc_prefill_lines(const struct intel_crtc_state *crtc=
_state);
+ int intel_dsc_get_pixel_rate_with_dsc_bubbles(struct intel_display *displ=
ay,
+ 					      int pixel_rate, int htotal,
+ 					      int dsc_horizontal_slices);
 =20
  #endif /* __INTEL_VDSC_H__ */

--B7OPzjIj5t59VfcG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwHf4ACgkQJNaLcl1U
h9CSyQf/XmNfjVo/DztUas+fZw27q1oFWsl2dxPE/uzNxZCTn+qKXsYYQc8dYF9T
JFRqWcEQhjx0cuRI7G+Cd3D8O+19Y1lDP5NKk37fCEPmgQ6r8MFl/fAKfky7c5kJ
LaofBuR67US4+edLJh1PKw9Dz88CWqlRV7Ip+JDTBVbFWE2TPW2gTtVsOGkhRZe/
h9ECzW8HTnG2qKGcY6dbqX5MFcqxV8uYdiPsETFF84nBfZeqg1fei7qmJ2kqYSs/
fSv7yg+yBe3A7D/cMCaBDIIW2CF1JU6dy+upSYkRLasW8LX7mElj7ehtQeY5a7fg
7/FJU2op/jKA/nNHBjrgjbHMfjTg+Q==
=Uwwm
-----END PGP SIGNATURE-----

--B7OPzjIj5t59VfcG--
