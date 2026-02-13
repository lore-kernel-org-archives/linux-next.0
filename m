Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E353644C8;
	Fri, 13 Feb 2026 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770996792; cv=none; b=PTKIyl+KN094D1e3A5iPpmGFj33s0SgGbM3ID8IS2+IaW6lKAW6Yi+Az+emdbklcyVrsLUeVrIfQLu/in0NegMYzYhmUhOgbs8TOZMuKaW13enwta73QwnfvdUKZ6H+zr9Knz+UrS9Df9Q2VkqY67spwwMk5V/Wa3Rtq1wrKVdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770996792; c=relaxed/simple;
	bh=ZK8uP/kmd3VzdrRQXPkf9iS9b9EJnCRQ2WfC4SYx9b0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VR/9Ao2lG3eSEuhm/7KpvSrAG9PYVIBsm1UVB/OeYbl1rpax4skDpdFDF4nOic67nt7CFCaKXHh4xSn519Xa/45fxQ5cqgXuTaYSYwu2e5oAnV/Pk+mdIcJaohyLMZ1+B9+LX4gUv1XO3pQXKsQdPQD7pXfpqwpKdT170oS9/II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d2YcGCxC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d2YcGCxC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D33DDC116C6;
	Fri, 13 Feb 2026 15:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770996791;
	bh=ZK8uP/kmd3VzdrRQXPkf9iS9b9EJnCRQ2WfC4SYx9b0=;
	h=Date:From:To:Cc:Subject:From;
	b=d2YcGCxCkAdAEYmu9bqMD/lLUMd9q2OV6o2H4vMK2jNOGiJwuKcCiqgz5Ake2MGtn
	 23rvx4hqk0SpJed2Trq9nNJHT+KGHqax2pI+6viqU2LiRGHYm/wW2KQ+cp+H3tOVZu
	 zPmSqpOQ+I/J4zrpuRPSN+G2Rch1WaODC3xeqyzJ7lzmxRuRaCZwRfcnAlzPoyocqv
	 7y5Wy4u0+BZ9smn2EL2bJtAmuUVCHT1LKlajSYY6+pJzKKJXwzhVePYpxfVYy7J3Oh
	 U1L3DzXJyhmlz823xVReBnhQjHWUsZd/ZONZzXmQsyZmeUSunxX0KL14vdx+j5qOgx
	 ahQI2+7x8Txyw==
Date: Fri, 13 Feb 2026 15:33:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Colin Cross <ccross@android.com>, Thierry Reding <treding@nvidia.com>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tags could use some work in the tegra tree
Message-ID: <2bc3fc3f-ec1a-486e-a826-b2e6d9a3b8df@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3sVP5X7hK7BVvPl6"
Content-Disposition: inline
X-Cookie: I have become me without my consent.


--3sVP5X7hK7BVvPl6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  8d82d5388cbb2 ("arm64: tegra: Fix CPU1 node unit-address on Tegra264")

Fixes tag

  Fixes: f6d1890e5f4d ("arm64: tegra: Add device tree for Tegra264")

has these problem(s):

  - Target SHA1 does not exist

--3sVP5X7hK7BVvPl6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmPRDMACgkQJNaLcl1U
h9B4pQf/Z+sNqAvmkRh4lp7TXD+6uSSPI1t6HaC7r9IOW8mnGG9X5denefU8ndWS
EdNMl6OYT3l40A784QC21K5oFDnLiqA4XcLluPaZq3RM3berQWlyD4kqfZ1HLTTK
j6S95PQ+7hReHga8+gbi2HTc5e3QTiXjZxQwP5WwniLjB9ijLWy4LA2JUuUX95gN
ghFDOQfQsVQtXnFHL2S/mBnyVFixP6DFLE127SYzh/CRGKE2bdTGd16m13tbz2lG
zu0bDOcSEdppHfMRq+Sl/L4CXAwjxG4hmYPWaeyDaMm/pePdKsSEolDK4u42SyGl
X6GLLZQLGCZrqeJJtRKxLIPEIEErGg==
=XKlI
-----END PGP SIGNATURE-----

--3sVP5X7hK7BVvPl6--
