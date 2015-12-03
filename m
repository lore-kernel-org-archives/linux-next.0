From: Mark Brown <broonie@kernel.org>
Subject: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
Date: Thu, 3 Dec 2015 14:47:41 +0000
Message-ID: <20151203144741.8c03178c8344950783fa32db@kernel.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA256";
 boundary="Signature=_Thu__3_Dec_2015_14_47_41_+0000_lsQ_OD30kMvQzMRE"
Return-path: <linux-next-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:59310 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760206AbbLCOrz (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Thu, 3 Dec 2015 09:47:55 -0500
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Dave Airlie <airlied@linux.ie>, Imre Deak <imre.deak@intel.com>, Patrik Jakobsson <patrik.jakobsson@linux.intel.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

--Signature=_Thu__3_Dec_2015_14_47_41_+0000_lsQ_OD30kMvQzMRE
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dave,

Today's linux-next merge of the drm tree got a conflict in
drivers/gpu/drm/i915/i915_drv.h and drivers/gpu/drm/i915/i915_debugfs.c bet=
ween
commit ac9b8236551d ("drm/i915: Introduce a gmbus power domain") from the
drm-intel-fixes tree and commit dfa5762793a40b4b03 ("drm/i915: Add a modeset
power domain") from the drm tree.

I notice that the modeset commit is missing a signoff from Imre who is the
committer by the way, the commiter should have a signoff.

I fixed it up (resulting in a null diff) and can carry the fix as necessary=
 (no
action is required).

--Signature=_Thu__3_Dec_2015_14_47_41_+0000_lsQ_OD30kMvQzMRE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWYFYNAAoJECTWi3JdVIfQkHwH/Ag6qiHorlpcOibff92l0IAl
A3GWWr9OowK6btaxOAYdVT57ysXtyOtFmU92o6P2fdovaAUpWxif4UM/V2ujFa+W
dDOcrAQripeI3owFqbxsfNldErfTM9RrqM4t7GfL9iymw/t5zZeLHV6T1OTCMIgO
JT6w1i2npbw+Z1YqZPV7NToIgM+hK8KbhxxAlXpaI4GC4lH5sts5n+SN8fve+9nP
zn8rlamXPZ3C/xGOy3YVeQfpDGubFBBJk+CQS0xTo1UXLrO8G7cep5yiR8qI1Fzo
LWkNePd9zvO1YZh1O/Jt3T6gvf2a8V9eE2yn1gq/SnOfRwhQsQlQf5dMI8FjoHE=
=UP76
-----END PGP SIGNATURE-----

--Signature=_Thu__3_Dec_2015_14_47_41_+0000_lsQ_OD30kMvQzMRE--
