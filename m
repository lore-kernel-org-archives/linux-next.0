Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4AF1DE4EF;
	Sun, 26 Jul 2026 16:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785083232; cv=none; b=DcGoSyBmw7c5GWZy25dPlhA0j15T0dQ/jevkj1d7t2Uz23kpeT0P7NUDGfx3qOT839MCpfxkJ+OdJZj8YFtBbM8mdeoZPW4BsC7U+x25ZakuYGAkiLjQNeobuvf1rAF5tfEyEfDh3LwScI2xMSbthDC+FLm7D9AwvnIQZDGaW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785083232; c=relaxed/simple;
	bh=yHlLRDA5xcUYcMTwNBLf9RiWPoGXLJYwmXVo7uRUjKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IH1FMmLQmuxJdBH/x/fSMiP0S0gQ7mfSH/BdFs7j6Wc6S4hWu3VVDrJ0IS494rPmIxgcK7nK0rRxZQOQBdeol3mFwKKzjrNTGQBEwAa+ZghRUPsB+4yPIVo8TZGxQl47WRq+HuArb4LRt7inPEPhWGjLDLmDGxxXeDu1Oev6l/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LTtyk3th; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LTtyk3th"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DCB31F000E9;
	Sun, 26 Jul 2026 16:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785083231;
	bh=N7p3Arby5oQhzg+dJw39voYtvKHSDdON+WU2sr7VMV0=;
	h=Date:From:To:Cc:Subject;
	b=LTtyk3thX7o66qLa9k06t90OpRW42rO+b7BNyWVI6l7S2OmIjF2xrfwePowoI3Uel
	 H6v3HX2+YB93PzaBWfeequqQYmv02IxI8kGHHJ87Z7SVXskEG9Ca0l2q7yX8oeH/VP
	 DW+m739+oNK+PNHEMkKHq4/Oxei+dEjz6Bxksbdx/TsKAYNR+TX25609dvPoCjL8gY
	 IfquHI6wlkJzb8sH1WRtx8I7gB8qTCUcGC9f4NxpUm/9v5DphzNNxX7nY7kDPnXT1G
	 +WXjpIedpKFIxEyp9YLV6oVUPShYlI7TQc8gafMRiTWjtE+q3dNxwFsaSkshGaevJX
	 ALPoyI+L1w0PA==
Date: Sun, 26 Jul 2026 17:27:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mm-unstable tree
Message-ID: <amY1W3jQG3GCFjrD@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FKE1R+9QEc3Pyn65"
Content-Disposition: inline


--FKE1R+9QEc3Pyn65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  6955eebb93dca ("mm: page_alloc: move capture_control to the page allocator")

is missing a Signed-off-by from its author

--FKE1R+9QEc3Pyn65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmNVsACgkQJNaLcl1U
h9CXNAf/ckOzjGn15JFAdhre8oe36TiHR5oxPZyJFNdYbEA6L2sax312KhY5tHpk
dwH151ZduX8R26ypp7mzZ3qS40EdiEk1fDOWG0IzqVn/LhdFIveSOer+KL9PqfHJ
pfAzv6qS9E4dxDroiMcCBF15lq3Tcq0xTYMA9NfxHwWNRi22jn4/AO78RM53EXqW
mLsq2gug7u/hYO6m0FhqAZ0R5VvDFmgaXPLsKIGDwbWAjZKoEW6aUshDkUOKgMWT
4CV7pdO9OeWwKGpgjOjAYu0MqsfY67Zj/MeIqvGfD1YfQkUuNGeYRV8Je+WVwy6k
Jt85xmx0Fkm3GvOqwAoQgsDwyZGhtg==
=AljL
-----END PGP SIGNATURE-----

--FKE1R+9QEc3Pyn65--
