Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094103B8920;
	Fri,  3 Jul 2026 15:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783093450; cv=none; b=U3IwT3WQwqDJCOzl7OW1M9X2Bf96nqcghB2IibPQBT6S866CyL3Va0ifwacCt2mi8rjcZ967Ww8OX6niJ02skfxjd0iUZegvVlxPMr2MCea2ONIJ6dIbiZxG7wbxEH9OFhPDAtrM7TCIO/7ibD/STtaEFx620wcCxRKL4xDIrA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783093450; c=relaxed/simple;
	bh=ou8hBbvFtmhH0+1Za9pzsBqHsOLZis80/4/CLnfpKFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y27RIOwVI1RBjB4eUHztZY09C/Tjn8AcLNOTuJIMsCunWhWeY8DFfzFZZ3ef2rjj/Zn6EHkvQ6qyUNIgKsz79US9bCu5NNRI/ZV0O3a11BxPd90lvhY38JmAU38CSymBTI/44GnI5+d9ADqufvmJwnV/mgOecOhhW1CCm7yH//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gAOBo/S7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gAOBo/S7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10421F000E9;
	Fri,  3 Jul 2026 15:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783093448;
	bh=NDN7rnwYIdd7PreDn3cqmv8E1PO0EdGv+rPO4envV6E=;
	h=Date:From:To:Cc:Subject;
	b=gAOBo/S7lesydqP72RXuLuD2fsJo6OWQw4seW+t/K2stIpRGjn8vkDg8SZ1mrN0//
	 RgKRcUnB03C/kA8iprJ6xtAzUgCv9w2oq8uMf0cSbVSuRMv4Gs4hZ5lGM1DojS7vWP
	 06dBeRTwdrEo34XeZKymOHgY0gEuiHnqnhet2A0d2lVwJSwsC3hF7FBvwUCCM2EJBM
	 e1sU98xwDm4I6rpBJQLwZ3xKdBOpoXXhOVLgHRbF2hDCYHllgwc0+BLmPxJCTyMTyR
	 IsoVYs07gCZ2OIY2D1XhBavsK0BowBD9ajJYDmHbIC/GIe3kqk3i2oYvgmq8lrnzUg
	 ESvNnpTvupFLg==
Date: Fri, 3 Jul 2026 16:44:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
	Gustavo Sousa <gustavo.sousa@intel.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Matt Roper <matthew.d.roper@intel.com>,
	Violet Monti <violet.monti@intel.com>
Subject: linux-next: manual merge of the drm-xe tree with the drm-fixes tree
Message-ID: <akfYxPrDcKSXabSu@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yR3zLC6jaLRyRYB6"
Content-Disposition: inline


--yR3zLC6jaLRyRYB6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the drm-xe tree got a conflict in:

  drivers/gpu/drm/xe/xe_reg_whitelist.c

between commit:

  959b5016e4646 ("drm/xe/oa: Fix offset alignment for MERT WHITELIST_OA_MER=
T_MMIO_TRG")

=66rom the drm-fixes tree and commits:

  5ff004fdc7377 ("drm/xe/rtp: Add struct types for RTP tables")
  90511bdcfda97 ("drm/xe/rtp: Add RING_FORCE_TO_NONPRIV_DENY to OA whitelis=
ts")
  c478244a9e2d1 ("drm/xe/rtp: Maintain OA whitelists separately")
  15739920b71ef ("drm/xe/rtp: Keep track of non-OA nonpriv slots")
  c3ff77d7235cc ("drm/xe/rtp: Generalize whitelist_apply_to_hwe")
  3a3c3e56db292 ("drm/xe/rtp: Save OA nonpriv registers to register save/re=
store lists")
  aeaa7d2bb0172 ("drm/xe/rtp: Toggle 'deny' bit to (de-)whitelist OA regs")
  6f73bf8fffa72 ("drm/xe/rtp: (De-)whitelist OA registers for all hwe's for=
 a gt")
  645f1a2589bd4 ("drm/xe/rtp: Ensure locking/ref counting for OA whitelists=
")
  483c9f5451592 ("drm/xe/tests/rtp: Add kunit test for whitelist upper boun=
ds")
  f6c23e4589bdc ("drm/xe/oa: Fix offset alignment for MERT WHITELIST_OA_MER=
T_MMIO_TRG")

=66rom the drm-xe tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.


diff --combined drivers/gpu/drm/xe/xe_reg_whitelist.c
index 526907d2d8246,cab1b578ca0ef..0000000000000
--- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
+++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
@@@ -5,6 -5,8 +5,8 @@@
 =20
  #include "xe_reg_whitelist.h"
 =20
+ #include <kunit/visibility.h>
+=20
  #include "regs/xe_engine_regs.h"
  #include "regs/xe_gt_regs.h"
  #include "regs/xe_oa_regs.h"
@@@ -41,7 -43,7 +43,7 @@@ static bool match_multi_queue_class(con
  	return xe_gt_supports_multi_queue(gt, hwe->class);
  }
 =20
- static const struct xe_rtp_table_sr register_whitelist =3D XE_RTP_TABLE_S=
R(
+ VISIBLE_IF_KUNIT const struct xe_rtp_table_sr register_whitelist =3D XE_R=
TP_TABLE_SR(
  	{ XE_RTP_NAME("WaAllowPMDepthAndInvocationCountAccessFromUMD, 1408556865=
"),
  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(RENDER)),
  	  XE_RTP_ACTIONS(WHITELIST(PS_INVOCATION_COUNT,
@@@ -104,6 -106,7 +106,7 @@@
  				   RING_FORCE_TO_NONPRIV_ACCESS_RW))
  	},
  );
+ EXPORT_SYMBOL_IF_KUNIT(register_whitelist);
 =20
  static const struct xe_rtp_table_sr oa_whitelist =3D XE_RTP_TABLE_SR(
 =20

--yR3zLC6jaLRyRYB6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpH2MMACgkQJNaLcl1U
h9AvJgf+Kuzt1cTCHevtQOAZIjklmkcGXOThx0G0YAwZqSwJhkruJwralJxy2Ppx
sJyIvdOQ3Vs+tyDWPoPWU4pNB5XuZU2LDo0E2PTndHNTNdG1a8gXSFNmfv2zgmqt
9txC+BcxdjkfDxI1ETRMPTAC9ZsfEvA0/s1eWDeUM8C6yyfRciqfD5nWxtBeGc+k
wA9ViN0Kkdx3z8Fvfr8lvSQCes828CLR2F5dTODtYXn9ML6qXgKc7geavJluhoYW
TEFbMNDOHnsoOKcb2d7JpecdlsVCLcfY3kKiptK0omJzs3YS46S1f+Zbwec8C4ZB
zLtM7gv2EX7ne1oNGAzOhyDz8ZklCw==
=oICl
-----END PGP SIGNATURE-----

--yR3zLC6jaLRyRYB6--
