Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0924749CA;
	Wed, 22 Jul 2026 15:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735849; cv=none; b=BjLnb5hWBBqDZA9dF3HszJE+0nGZhVc1GU/1cCaqQgCYLEiSewnK6HV9BhDPZ4q3LT9iN4kTnZ8VdvtTS1HOZ/22GLu/4QN5e6w/JHgY2OfNWk/GJjFPB/j/wa3R0Jypd7Jlnjnii6KDIq8TOydfJP87dR/u/+yrqX3SONvOcoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735849; c=relaxed/simple;
	bh=6tZOhKD81OvJnitsWWVg5oEt6qx8fvrOcqnsiNyCu2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bY32btO3aETvbgyO7CZGo2VtM7S1LfBXlLY/RrvyaFvjmHMfkqae/LHubwM2MGUZMxxkttaca0MIUOOj+ZQzjIQL2LPs/sfdbbBRVdAMb277madRnX3aERFtthuP1zOMKbFv2c5pvNFLCyi9U+S+7OB8UAaZ1gLB30mak3jOxJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ee1kDiOz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ee1kDiOz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C351F000E9;
	Wed, 22 Jul 2026 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784735847;
	bh=dVibXLOI70MuFj61hE/Eu1lqp9BV8uenrgKm5u+oorM=;
	h=Date:From:To:Cc:Subject;
	b=ee1kDiOz7EDLiGRP1dzaRm0xH6fi1NOMJ9Duv2Bb2zuWK6U5IYaH2INOPBOysFtDl
	 HaIVThhXCo8Z9op8rSQHWR/sbC0QRRu0zpF5rBzrRq1S1AZ6YRUJ8QWUgyRZkMIuU7
	 Z/dccgNygbmbeovNgJ44CBuwkaBAT88nKSFY6Mh/TAtokhJEA4r8aIzXHWMi/RMjF7
	 AbO53EkC/bxUktpDM8ltpkRDDMfoY0B/qI3En/A0yI0Dn4McuCyU3kSorNdrSi444+
	 Y2vve4D0Ihx+mV3WX9zDIE9PP5Cf2YrBG4kXijk+DWdoHXWHmP2d0OwfWIXnz7xAdg
	 asFVTYGDs7aqA==
Date: Wed, 22 Jul 2026 16:57:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-msm tree
Message-ID: <amDoY5NoAOzrxMFL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIXbcC45zXOc/RDM"
Content-Disposition: inline


--XIXbcC45zXOc/RDM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--XIXbcC45zXOc/RDM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpg6GIACgkQJNaLcl1U
h9Cm+Af/Uq3IFdOa4NBS9B3BtyJZPtnu2yoozjykypvMliECm3g1OubGxXl7L7e2
CzXTJubWuQ3HIodg3kSJ65JhAPns0d/SquQ3nETDFwFHymJz/3854PXsMSharMRb
qZ+G/R65fdJiVcpigg2YbZlSpNNJvQkRFMaV5e0EF6gWSGvUXgEUhaF9jQ8kLy6z
7EGVJfNBWp4nbee3dY4fcRY/kfCfx98j4+Wmx6lF/n88YTi6idNFiJeGWSwFOxvC
q7/xQLG4+/xyEGbPEv4bh2c/M9wPDJQfETkxaSjQvxJtcH5HWUiOfAbF7QAjL72A
WSiYJlk5jwsQc0VbkJH5NOSl/79Dbg==
=Zj1C
-----END PGP SIGNATURE-----

--XIXbcC45zXOc/RDM--
