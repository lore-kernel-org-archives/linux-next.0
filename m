Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF371329369;
	Thu, 22 Jan 2026 11:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080040; cv=none; b=GGyB70cF7tM9npdtVTGL2ClkPDqtTAPcl2xmCUAXFzOzDxL6g8rkIDcprJ+znBjlMq90buD2DVcK71wDsdUHnU4ErLBNrJJEF+IwZk5l48HtpNjIacCJQ0a/pKnbfkWQfGY3Xe4bvZ8daONNsCFdb3nbAXn7tEITpJ2k+yrDsYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080040; c=relaxed/simple;
	bh=wCskrtV1vTAIimCYHSZJ8MASmgCn4WYSaPKSwqGfEE4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hBHfz2KmTmh3fHQlVoOukfTEJujKdBdQOXaP85bHR06X8HNXmGpdbo5mZj0uaISjJgbQp9xgSsh9o0PRRCaVj3NIIJqEYm+LaMAT8pSORE/tfHL/vgtWVy/TlyRV00h2OR67oIrolwdhAUbo3ppct7VIWF7IyyTB271jKjovkbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=utuFE27Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="utuFE27Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C176C116C6;
	Thu, 22 Jan 2026 11:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769080040;
	bh=wCskrtV1vTAIimCYHSZJ8MASmgCn4WYSaPKSwqGfEE4=;
	h=Date:From:To:Cc:Subject:From;
	b=utuFE27ZY3d2pGxCoVp/meN9dZvHHMqajUbjgE3IuKgPU19Fi3i+5dnRjFz07BUpn
	 r7AhUMsmYyov2Df+PZkXMxypEjVCGEsvz5w4Awl20HNf6KSAEMt0HMpl9mm3ODwnLK
	 kYCC1Fp9EBFhYV5kRIYaO51roYi2I4oNAP5icHK6gFUqrxNTOyCUvrcdR8Y8D2wkMa
	 xb8CVaSiS6PKHaOi2dYaBfr/fWLKmo9naBIX+/XbvyInh1j8yZTkXiSuMq6HRCCHbz
	 KL5Ach2F+ccmjeL66w11QlWCDyGWYs9wkhCOw3q+EjEf3UTkFDoDKVCi8NsfMpFQlw
	 l4cHHGrO7115w==
Date: Thu, 22 Jan 2026 11:07:12 +0000
From: Mark Brown <broonie@kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags in the device-mapper tree need work
Message-ID: <c45a17d7-85f8-4669-bf1e-961085d081db@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sURALWFib0pMlA8t"
Content-Disposition: inline
X-Cookie: Don't read everything you believe.


--sURALWFib0pMlA8t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0f1e16b3a8634 ("dm-verity: fix section mismatch error")

Fixes tag

  Fixes: 033724b1c627A ("dm-verity: add dm-verity keyring")

has these problem(s):

  - Target SHA1 does not exist

--sURALWFib0pMlA8t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyBN8ACgkQJNaLcl1U
h9BsLQf6AzuB+0Kl1OKXQgEyEG71IpNgQQUOsyAC5aeMQ6GxqP+FnBXOPu97JWae
qpXM/rFKg2NnV3nLUHJppYcga0YcPRkl2WciXAmkjVLtn2HOZEcvm5s9I/Y1aXse
WQCQYsZzQBodxfIIqAhNVVAxS7hsMbMGaG+RFRP73/EdOhknWaeGJrb79i5NkTI5
Uqx4bBvzeZE1qG/xsCMnhnzhKcCU3EpedAPJEGgPNrcN11Wzhusgz0yMHqBZnmMk
ETNTPLELSZwCgwiv4NWfYBhsL9XrZXLkQiCVFapAzr3WzAstDivDY13ad9FTALU0
9YJdsdJAlkWzLSywjzmUrfw/faXkZw==
=B2oJ
-----END PGP SIGNATURE-----

--sURALWFib0pMlA8t--
