Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1BB437472;
	Mon, 13 Jul 2026 14:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951648; cv=none; b=Riej5pbmbL2PVDRboqhiH636Yf6x/HZf8RxbHtFekyJ/k0TE5ixSesFm+TCW5q2dUsHBp9UzNaSX5Dkm5aVl7/LRQ/k5vnmJVBMkOcmYMEODwxAtydvpfGkD4b6RE26c5pm1vQKwXaH88QLYAqMIyIv9kkC6meAy9xZtzBj2Xs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951648; c=relaxed/simple;
	bh=GHo43P61dYi7Jz9yUm4euxfenfOF24b+F4LSRBZQpu0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pl4Wex9KI+Rq1Fha/TL/wiVITIUc8TBEZ5xvMGvk4M6als9AZBALUp7P/Wwi1bQcY9TyWzZHC+j38qFZJ/PCBKNExTZlRHUV6SFiUj6708Y1eb4mNM4GmN4Ln5leLmH/O8PTqPis/SGb4RBDMmXToeuKFdnVytnfC80PFsa4vFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4jRy14A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4jRy14A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F79F1F000E9;
	Mon, 13 Jul 2026 14:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783951646;
	bh=SfcZwsKgrCemr6HFrRt6BaMBTKwPC0veq92aad68aEo=;
	h=Date:From:To:Cc:Subject;
	b=W4jRy14A8IL8pZWsi84h95wlVt7pYOcVcIoKF0t41UuVWAsZBsvs0M9czq2FBI8nF
	 NcviDXVZsR5Q0L8JwExbyW7Crd+A/oNb7lHko2sIiGXHETA0bWjU/3Eby9XhEPb1Zx
	 C7tc28S+VR6TvPnFSfUOypsCHUrKUPAeah6s3HNSOZBJG5089wMPqNIE8Cy3Ww+JD+
	 /pvRKy6jTNEdsD41INg64d04Q2czo38TlxaNURRL3y8fc3gGB6nIkHCEuJYVE7EO4t
	 VoMqjhE7xlxg4cXci9Z6E0uixG2JdPyV3O8H3xp1K4jjTzP0q1LzCI3lFOCq5SUZN/
	 urledTSricXCg==
Date: Mon, 13 Jul 2026 15:07:22 +0100
From: Mark Brown <broonie@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <seanpaul@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-msm-fixes tree
Message-ID: <alTxGiEoais-zauF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5/X0ar4IrRXtw0Ox"
Content-Disposition: inline


--5/X0ar4IrRXtw0Ox
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6cd33b6f4155e ("drm/msm/dsi: round 6G byte clock rate to the PLL-achievable value")

Fixes tag

  Fixes: 6b16f05aa39f ("drm/msm/dsi: Split clk rate setting and enable")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--5/X0ar4IrRXtw0Ox
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpU8RkACgkQJNaLcl1U
h9CmxAf+IYzDWnwAAiAp5seSvKQXBQ5rq1kJm7VCA0TegEdl4hEd/PRszxvhCrSg
v5V0vAWzlTXzIO1VMjuqWBzUMHVEquL3KWjvLHsRduZShLNFa+XuSr4/z36Cn6GS
Mk+VjuqujTd5LFWULSFwJQmbltPD5Hb/fIcCjcMqpVdIQnrAvuLXfjaZVc95uvPQ
bC5R/sBdGLa45/RtK/BCLD+TUbym/WOyUnxclpKOKaYSBUiTnZTEtZMBFGLX9vqb
fyY6YYIHxRvy4eCvOtVb4DIaM/3vrRleFqrbrQAsy+ES9ihEgAaswvvf5Xd74oe1
qWsOFg+8iNDNhhu0XAc4GZ3aDqbPGQ==
=0oN5
-----END PGP SIGNATURE-----

--5/X0ar4IrRXtw0Ox--
