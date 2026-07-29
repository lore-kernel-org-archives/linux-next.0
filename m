Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74914484229;
	Wed, 29 Jul 2026 13:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331717; cv=none; b=HflE4mUnsNMGIzTVjCiB61XookLYdDyPtaQraT4i2lzOUOvU7LP20znE05S+ktFYnKXmt/ofIODjvjfMOpj1nRT8kakJtM/9ZvCOqhWLugfn2P4/RcE7J0wxps7TlfMOxEfHQBKuBvYDasU8v1KfYmjF2weoGKSVSxhoSkTkoz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331717; c=relaxed/simple;
	bh=jo8BysWtaIGbJlQa9d/CeYbiB8DxY4EBJdxdwsYxbXY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b86USTZ2Sz4AA2Ynv9PgKq0aJ7hH2qwLfMW8DIg2YFc5XePaZPCypNbjVO8HN4kuw0Jy38WzHGFfmz9U1/7LRKhMVMSGHnVvmUG9b46sDhYITtpRUYhiKqCnzFA1VV7u47tW5I1vCkhsZFezhaLidE17JOZMGQT28a9PjFvsAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKqgZngd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKqgZngd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97F921F000E9;
	Wed, 29 Jul 2026 13:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785331714;
	bh=dUx9cMsSvlF6fmlycfgvYcoFki7t9SesH2ySwMva3Zo=;
	h=Date:From:To:Cc:Subject;
	b=dKqgZngdn28bFlQZcZtb70oVZNYzpqCI1PNfQnLOxGAJiAWh0aV8KzvwFhsW1YgsW
	 uyjb9WuoV2hgf53b5I91l/PCwcsJe09JRSo8QwEqFjPK0fgYBMSyc7MAyykWjDr+lQ
	 hkiOZWmWHGtPMxER0UtkQkjen1dWqIgKv922PvTDHgvNSyI6iCspkIWHjG9Ngvfibg
	 VLc4Tp9Xu75V24guX0xD1yM4RCmsAXvLUAKnDJq3BNB1he/sLim0Q9ZpvGdpPxgi8f
	 hPzcS3tATVwMJTHX7I7ru0gEBcyBCnsiyzuiMJRNZ4K8leaRJNzAyO5qFLL9n8HpwO
	 +re5GWx5qDQww==
Date: Wed, 29 Jul 2026 14:28:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: linux-next: manual merge of the amdgpu tree with the origin tree
Message-ID: <amn__sSHvuJ0WeVU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l1UPJwcmm8PocUO/"
Content-Disposition: inline


--l1UPJwcmm8PocUO/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the amdgpu tree got a conflict in:

  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c

between commit:

  82730dba0cf9d ("drm/amd/display: Fix flip-done timeouts on mode1 reset")

=66rom the origin tree and commit:

  7e1b4bdb0e05a ("drm/amd/display: Fix flip-done timeouts on mode1 reset")

=66rom the amdgpu tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

diff --combined drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index ff308ee40909e,079d4ccc88da6..0000000000000
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@@ -34,7 -34,7 +34,7 @@@
  #include "amdgpu_dm_plane.h"
  #include "amdgpu_dm_trace.h"
  #include "amdgpu_dm_debugfs.h"
- #include "amdgpu_dm_kunit_helpers.h"
+ #include "dm_helpers.h"
  #include "modules/inc/mod_power.h"
 =20
  #define HPD_DETECTION_PERIOD_uS 2000000
@@@ -287,8 -287,6 +287,6 @@@ static inline int amdgpu_dm_crtc_set_vb
  	 * is enabled. On DCE, vupdate is only needed in VRR mode.
  	 */
  	if (amdgpu_ip_version(adev, DCE_HWIP, 0) !=3D 0) {
- 		rc =3D amdgpu_dm_crtc_set_vupdate_irq(crtc, enable);
- 	} else if (dc_supports_vrr(dm->dc->ctx->dce_version)) {
  		if (enable) {
  			rc =3D amdgpu_irq_get(adev, &adev->vupdate_irq, irq_type);
  			drm_dbg_vbl(crtc->dev, "Get vupdate_irq ret=3D%d\n", rc);

--l1UPJwcmm8PocUO/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpp//4ACgkQJNaLcl1U
h9A1kwf/SdKCo1GjhgNcsyCFEUOCinEwuZL4VrtU+7kc5/B6OH+xSc65aCbux22I
hVaaprttEFyyCN5BTd9/a1lR7Ygoe2gBVNz3qhSMgPQmh/Vd9Ux8mf2muTTH6xgM
Dyvw2bHnk3xmpE7uM7juWfx59HzhyOaT0yVRpwfznG9FL0y9i7jf7wCqEbGCCAtY
tnQSoteAaOJwKKuCk0CDlxfUZs0ANlSVCFPEh/w42RkuxK3qzdVYAexeBIw6Qnfj
djPWH8myzlKRkNkibqe2C3K0pUnFIUYXgVcUWfMvDWpc0pzgun3fDwz5k4zSpQkL
On/XN41/YkGZv+z9UrEndJHFX7aKBQ==
=PZsc
-----END PGP SIGNATURE-----

--l1UPJwcmm8PocUO/--
