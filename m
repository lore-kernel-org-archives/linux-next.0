Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E409C4766B9;
	Fri, 21 Aug 2026 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787313412; cv=none; b=ClcT2MOr2UwNzuasUCLuojrpvM4goatHF2Ougoo+j0tQhK+bLWBwld70yOKeWnFwRnav1RxTE6UESZz4CDcY5lCK3AsqEyryMlPsMyrY+sUOYGoqjEYYBmCfIXk/pNt4rNVWrupRRgekLXFlAiigb7A7+nd9rDVwDlRk3csEuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787313412; c=relaxed/simple;
	bh=mC5ClPhVjLtJYs5hma+TJd0uMfQ2/SzOCyZ/H/UKHWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KwiSSizLJgw+UG60b0OPJTyhmvkW3QFoS6TKuFF4Z4rt1FEtzWUXJFCZRen+KaWD8TVlKrqgcvgxgMjGbiGIfoIUQr7pTVYK/aAjkQmpenBWa+dMrs1uKW+q6GguicyjARfNoK5GgrVH6J3nxsToEGo1BM1SRU+cS/AUQn3SKxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A4u4XS+S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A4u4XS+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1ED31F000E9;
	Fri, 21 Aug 2026 11:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787313410;
	bh=f4MmHGhvqb/HqGEG0HopWR4CC8m6IQaQX+RjcSWnFzw=;
	h=Date:From:To:Cc:Subject;
	b=A4u4XS+SQlpBCfvKJgMIMoY5cR3a+ZXdOcQVl58wlnz/A9GqYEEfXNnDHuLyOZ2IN
	 FM/3O36cNpcpmnzwzKdFxMxDwl4QtEo7WUZwGlBjJrsCSQmfwcuu0q3hR8HON0FToZ
	 dsvYUQ6L+1uAmaGtVF0YcF/hMdeig+gmp5rWFwW4QNs/MVkxX9mnGYM1lBqrxLo+Dz
	 YWczqqhjIiX3bgC6j/ienvjc/5WtxQfyDMI3R9TZP/7iXI1CUcVRahi7qNyrAu2eKz
	 CVt91bCbToveTtGoB4AgaMWtw/u1Y6p5Twa4NOJiz4dRpYTp9IOqQgmJM7dXKl1Kt2
	 DN33DwIRtTZfA==
Date: Fri, 21 Aug 2026 12:56:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the mm-nonmm-unstable tree
Message-ID: <aog8_8UJwW2xSpQT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fFGedz9Yxqr4rkOQ"
Content-Disposition: inline


--fFGedz9Yxqr4rkOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  aa060b1946136 ("USB: gadgetfs: do not WARN about excessively large memory allocations")

Fixes tag

  Fixes: b3c466ce5129 ("page allocator: do not sanity check order in the fast=

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes
  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--fFGedz9Yxqr4rkOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqIPP4ACgkQJNaLcl1U
h9CZwgf/RNdMybslcQW800uNAnNPbUC8sA8iXlOmvHGDtOw2qX3PwF0EjHJrR2XS
N/FQSxCxSucGO44m19m+jRm95Ez4HQmwgM2DXfhCLox8GC7C+CnslVq+NPrqlxf6
Q1t8+/+bPn9yAfZpgEL+Kljgy5Q1+WE0K+17PU2QFP1hVWa3icOA6cozMRqIsTjh
WHLdjW0awcUWj0LCBwtWFazJkNbQs+lCBiW429gVBj7xP6bMBg+MpTpvH8WWi4aX
UDZ5R0/TX+UGXQkhqAkZjPTyge0Tf5HnpaT42PcvWX5J7IHTZGtI66xDxjNCIR6l
O1po5Tz9c1lIVr0OONH+3+/dYN12bw==
=2SVN
-----END PGP SIGNATURE-----

--fFGedz9Yxqr4rkOQ--
