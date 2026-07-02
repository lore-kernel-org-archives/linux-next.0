Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8E04BCAD7;
	Thu,  2 Jul 2026 14:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001064; cv=none; b=nozyh0/2BMmMG1z/xy2MEIfinC9OmsQhTUkcPMQ1764nY9ffUQDqHNkiznC1Twz8Muysvk1G96JhhrXdbX1rMJ7Y7t01VSLGVPTvJqExs/qosFPxkzUkFZOm3Kpphzp7SsXvI8tWCFHWfttRkIYWUbQ0cuybOrdY4dEYR6N2vXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001064; c=relaxed/simple;
	bh=nnW/vUYqREzvAO9XESZGw3kB6P13HupWKslgg+BRuuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qXz6KS0TiS7D2lf5EdabiswFqkRKX/bPBeB2lTw9bKLbT5VOui0JwM7XJKA0ZP2YpZur1Zk35CzIfo3F7/bgrw+W88c+V5G01yq8m4fTExjKhGMQDs702empjpOdXwvJZTvVtCYCgISIz4W3T9bAjAji3yUI9hUMKqyc5pu2jnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5cxrwwz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5cxrwwz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A031F000E9;
	Thu,  2 Jul 2026 14:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001063;
	bh=0pf0gqJzSvL/OFzLnb/O5BfHoBUxNPyT4YJyDFQAep0=;
	h=Date:From:To:Cc:Subject;
	b=i5cxrwwz4L0A18P189lYt39fLPyz6y/GjpXY5mX8zXV6R0VkMlo44BQfSqxuXfkLl
	 cG+JerhzVGYI3YpRpVgNdenQ9pyzql/utzyzoG0P+fdN6OMDRbKF/MXl4eM3QtzKb0
	 cgZzWHTsCcchvKaKpv7BHSvVCm71pOcUSF7K1Uc9jizbfQqOXGoDRER5/WajDHLQav
	 r09sN/UxyTYZun2jch/tTCk7h7/IcrnrWaAULCqH6wx9qWrvTVVRi5SmMoG7csksPR
	 CN30zL0gaBI03AmLxY8tkS9Tne1HQbU4SbKYsMELytYwg1qfa57EvmUlgCBZj4+ULf
	 +znv7FIoFF2Iw==
Date: Thu, 2 Jul 2026 15:04:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the amdgpu tree
Message-ID: <akZv5PQS_yeeZ2mS@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Em8T0tc6Ig0QWXeP"
Content-Disposition: inline


--Em8T0tc6Ig0QWXeP
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

--Em8T0tc6Ig0QWXeP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGb+MACgkQJNaLcl1U
h9DsZAf+NnZaWjMNAqSmyM9EVb6tPJxBpGGlsc80fuDGptKe+ja805ZDZMB29v39
xg0ITjKTtgfElqPPUyRukkUG7sQY8ArlHlQf39r73pI+6YDVMGmgD0iNe0H+XjJB
xCNwZ60awdIFfhEH3Nb/ml6g10uECa2+qbdLGIg4STj7OwmRF+W8a2sB7yJh0Wq+
TXrza7ToPjNA6RGuY8dqvqliuS/msVpOgNOSbSv04GDQPAXVJkJFQg1ujeMjD7X2
TOT22E/f9G8l76KEyOPefSJu+JRm2OBjiO2gYHLYaU41KdcQ4D9wbSziCvjAd7r7
2iSsy2h/TrO56xXQXLiqZXCDkxT5Aw==
=Tkd7
-----END PGP SIGNATURE-----

--Em8T0tc6Ig0QWXeP--
