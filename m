Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6C425863;
	Mon, 20 Jul 2026 13:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553622; cv=none; b=K/AoIJS8QKvCFaLPsOXDtfNnHkueVzTc/kKNP/ylhL36r9R4MerA31Ce/ostKf1F9/yqa9fneTc8CIep+mLCmiLOTjS8SkY5emw5eO8X7UqSQ9oTl6ZaqEPL4SpS1ziHaDTyt4leUY1STqy83E6pqi1QIwla1PPoJQfQgyGNoc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553622; c=relaxed/simple;
	bh=wIiUrQUZ+lcKfE1soPwrzNaTnbM5U7iINyjmMltEYrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B1csCNpBs5EwUyPQzwEX5NkFFUxgzM59OfBgWhMJT6RdGo8MWl9Jhs6am7O264A+N8TiZh4kJk0DP/J5ILdVM+dClxkCJz84A7l0vuo3Pxms8p1fPcK9zFqsWP5F4rcMwho4IUxjhcKjIUesx05UkHtHXtcOPK1l6w0xxpwtwfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBRSNJqm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBRSNJqm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF8D1F00A3D;
	Mon, 20 Jul 2026 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553621;
	bh=RsESOO0DhBueenbqLLK0C56zbNT41Ctke9YXA3EgV3g=;
	h=Date:From:To:Cc:Subject;
	b=jBRSNJqmBkkB2BBb5vkywHcXh+AwDEyhHHsVnKiqnaJAEwYCd6+Mxp9Db08U1bOS7
	 WS1M2XZ5ciGFpH929+iEcFudr9edaiU13yl5QgxTyVsBRPLC7bALZy/AiSp+smwXV0
	 71gbtjevC6iktjKRUoo5Udx2Zg2YdWnFTWGoFf2dRdT1+OfUHgs5xdk4R1z1iUrXpy
	 gbk2xeT1Ut1yrh4LqUBl8MEJ7NeBlCjzJ7e4oUyRLRWQJocHRR61gmtuPwRrAMV56t
	 +acg8Ho4CmaUtZ1zx++6bMfskwWfXFayPi0MOvx+oUgF3Z6Oao/z4sSSpsxWMXqS2y
	 yi+eTsf/Da6Gw==
Date: Mon, 20 Jul 2026 14:20:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma tree
Message-ID: <al4gkYsYK-vHLpnY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oQLoik/zsDK2tabS"
Content-Disposition: inline


--oQLoik/zsDK2tabS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  dab886bc4fab4 ("RDMA/mana_ib: Adopt robust udata")
  9df9de4ea0c2c ("RDMA/irdma: Prevent user-triggered null deref on QP create")

are missing a Signed-off-by from their committers

--oQLoik/zsDK2tabS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeIJAACgkQJNaLcl1U
h9BEMggAhrE3AVRaRutjs+1JjaWCxI1wSvoZcUq62yF0qSYd7H65QSWzAiV7PtRD
vJ9VS9VQQEew2hfjHHJBUSqXNmvL2YSW/tWabCx00crJ5z6XdClTSyo3oR4lL2++
H24LfzRgUcJehiPkcUablJwH6xatqGFr9ME+ALESGfxYR0Ea9Qkcs0MreXlzYQ5G
5ybWLILp3XX/YmqX8oE8Qcr/HyWnNprd9uqK/LdemXUWwjHTa5Tfsgc6XNGsIYX9
REl0wyRjlz7yajkdeo8qC0geUwz88X8wXoJbmwMbMzHuaVshK28aZC8AO+GqGW3z
E46j0t7ncqD9LcGX+dXAloWTUc7Q4Q==
=Tx8i
-----END PGP SIGNATURE-----

--oQLoik/zsDK2tabS--
