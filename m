Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8C3225403;
	Mon, 16 Mar 2026 12:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664764; cv=none; b=SXTiA976C4+zA95DHg12PTAPjNA/tYUvaK0Wlqn0yBR9EBxEw+/7rpqNiYCAI+aMRMp6tU+rChFKb7QJPfS94TnRrzyvjZz4ENdeDx6anwMyqXCvWghAbZcgV+JxLAXOTi9CeE8VtOglermh1aCbg2/mjnYiR0SEEnmPbobWns8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664764; c=relaxed/simple;
	bh=TNU3AMLpCm7231RB7oUcjatcLbtiv7+dWBPWo5d4YJc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=biDXym5RovKDXGkWzXgZ21qwceW+kjYgQspWqSdMLXQcDhNFsWnV71ac5MT5yl8h3IasIXpQheRiOjTo9JszoH/fgDCizMVJeGSkJP5WtMKotNf9yyzbGsuWG86JcVj7ndQ5Ua5iscYT/3fvx7y3xaTuWAKKUJ5XSfB5DGPDVdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNSz6eWI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNSz6eWI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B85A2C19421;
	Mon, 16 Mar 2026 12:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773664763;
	bh=TNU3AMLpCm7231RB7oUcjatcLbtiv7+dWBPWo5d4YJc=;
	h=Date:From:To:Cc:Subject:From;
	b=tNSz6eWIYkYuG9Z/cmX6+KPbvAIgImFgJRt3EOJhnD9q0/MyCNfm4XcQYPM1iKoLS
	 1FZpkoP5M0iI2nMlbGf1+KK6wcsqpUjjzQ2TflmA6bsv6eWJL9g95m96U1HRRfPbMI
	 ORc5/Lb7q0A+aLDvawHIC226ad1MuHaTM+2jh+ZQKDkBa3SNVSp5F8Q+yzq3RWJaK6
	 0ig7RtFgFUx+Ba6prtwrwpYOfHy/3hjd/hFCb20c37lbAAENmpzhFlMwkLbQ+twWYC
	 89kvx4QfAiohPGaaZWJXaZ7HUDyQL/kxoptzXQ2rBcFN2jeh5fTSii2I1Utsp1QW3x
	 O4VN1+AlbR6zw==
Date: Mon, 16 Mar 2026 12:39:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the imx-mxs tree
Message-ID: <abf599v2LbZcplqW@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cxG6KRoNd9YU8Gdp"
Content-Disposition: inline


--cxG6KRoNd9YU8Gdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  2632979d613ab ("arm64: dts: imx91: Remove TMU's superfluous sensor ID")

is missing a Signed-off-by from its committer

--cxG6KRoNd9YU8Gdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm3+fcACgkQJNaLcl1U
h9BEIgf/U6zLd+ZzmyWoMOAtsW7KNvihspdWVPcwPj7ezM3hmmSJOkIyiGKlFxc1
NlAwXKgU5qPRWNqteSSQWoEPRyTeVHDnkEpGLi+gdxx7NlQPVVG5xrH9ZfkUAOrC
j2ILheesCIZZXQFZgXNs3A7NQ4dH2xcjp0Mu5YODxB/X53dtHT3rtiEo3aY0aFrC
kr2s9VcweXcGtgeq8vc+9XIAye626Qw1nkeorSROrn7yrMnLCSVH1y2yx2wv2t15
Fygvh+yD9wwUW+OFWbZvdg8Evnbzev/ssidJfJykvR7dSM/IXrNfxFc+vLDNqs7k
8P9Ips5jMtwhUmBVjwOkKTac421hrA==
=GSs2
-----END PGP SIGNATURE-----

--cxG6KRoNd9YU8Gdp--
