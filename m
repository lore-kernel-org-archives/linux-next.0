From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm tree with the  tree
Date: Thu, 3 Dec 2015 14:41:47 +0000
Message-ID: <20151203144147.b0f3aef5c02437f44cae6a5d@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__3_Dec_2015_14_41_47_+0000_XNm5MUT=haBahf+I"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Dave Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@intel.com>, Patrik Jakobsson <patrik.jakobsson@linux.intel.com>, Imre Deak <imre.deak@intel.com>, Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
List-Id: linux-next.vger.kernel.org

--Signature=_Thu__3_Dec_2015_14_41_47_+0000_XNm5MUT=haBahf+I
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in=20
drivers/gpu/drm/i915/intel_runtime_pm.c between commit
ac9b8236551d11 ("drm/i915: Introduce a gmbus power domain") from the
drm-intel-fixes tree and commit 73dfc227ff5c8e005 ("drm/i915/skl: init/unin=
it
display core as part of the HW power domain state") from the drm tree. It
also seems like the gmbus power domain commit has been added in both trees.

I fixed it up (resulting in an empty diff) and can carry the fix as necessa=
ry
(no action is required).

--Signature=_Thu__3_Dec_2015_14_41_47_+0000_XNm5MUT=haBahf+I
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYFSrAAoJECTWi3JdVIfQJrQH/2yX7cwK0z3mqhJR7FmAGMOJ
S88wiRXRJOtSZBa8rpkwAOuZVjFOICN0yrSCT5mA7ad4WKDjA3ZTu7s7WWRhFmiS
mKpxFzXPSUGQWikBqXyOqx+MELyBiN3PrVCgtap5xlmRAxaA/r47B/SAhVN5lNnj
O9/y0SsKoAJXXMlYJOn1KahHAhsRPPXJzOQhPeEVAspfBufzHB1i4TWwCafaoNfc
LYK3KNKtat6d0xrhr8dJHhXv6eFSm0UsBtkhERQVSSZk/Xux3w5/HNPJnzX+K/Yt
T+WAs6dDpDWS84MZpwiCvx1kVaG6h7cHt1J4ijGzqXUGls9OuYKNH1gEltwYxOE=
=YCDi
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2015_14_41_47_+0000_XNm5MUT=haBahf+I--
