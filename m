From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Thu, 3 Dec 2015 14:51:39 +0000
Message-ID: <20151203145139.512bebac25c08506a1791a5b@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__3_Dec_2015_14_51_39_+0000_ZWf41pxRoA/7IKiD"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59317 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751201AbbLCOvv (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2015 09:51:51 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, Imre Deak <imre.deak@intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org

--Signature=_Thu__3_Dec_2015_14_51_39_+0000_ZWf41pxRoA/7IKiD
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/i915/intel_hdmi.c between commit ac9b8236551d1 ("drm/i915:
Introduce a gmbus power domain") from the drm-intel-fixes tree and commit=20
69172f210e9fffaf8 ("drm/i915: take a power domain ref only when needed
during HDMI detect") from the drm tree.

I fixed it up (again resulting in a null diff) and can carry the fix as
necessary (no action is required).

--Signature=_Thu__3_Dec_2015_14_51_39_+0000_ZWf41pxRoA/7IKiD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYFb7AAoJECTWi3JdVIfQ6F4H/R98lv9iGhQBwBTc8U2TWUv5
AVAlx57IZ5S+nD7y9fNT3nTOpO55MaxR8a+kRLHUGQYvQNEspNm86cklqco8mcD9
pyI2G6MENCvsrtdYclqLKoxhf4eodQCbuTtjUzxImqEHuMuhL4Msld0D2hqIi2FD
B/T5giNcfuV92onZDLLipHVwEDEmKasE2ZQ1fmDaJQZRVD1XBqW1+jMXUT+Dk1M7
sI+FJXCDrTwTGAL6gKeEly7PygQ0Mbi87TpWWcSMEGPKDKX64GHjoZGVq9r1ySii
rnqXGI+ewFDOJ+KCbtIrrAu20xbwYOxF+zGw38llHnhOeSuHO5ofZRBnfW0FU9A=
=cRKn
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2015_14_51_39_+0000_ZWf41pxRoA/7IKiD--
