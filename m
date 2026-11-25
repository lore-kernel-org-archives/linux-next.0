Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616003;
	b=RPcXKYiTvzbnaKCpKxoM1c5b5bdo3YAINU1a2PFOan0TGTDNNwCECB2Ry6wEvLYDdLrj
	 iDDNa51d07dAxVwEwQYOK2Yn8cNV8G+/b0yy1q2sREUr4oIrDfOgFxtiSHebh4Eg+vVk4
	 oI07okF5CfODkAJvTyrptdmgowKb0Q7Jw8QkCLABQmUx4Tj/hn44wHmYJVIodpf35ZxBG
	 29ZzfQXZQs3SYyd1qQiGPu2x7D/Yx7e0Eai5P1amAzBvC5zkTzNP4shPiLnGdqKe901Df
	 vGDDA/denwR9IRUBW2BMMcuuaK/nH2RZd2WFNA4FAl7bv4o582BqXQEV03vm6ZB1oBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616003;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=/hTW19NLRpt1lg5+stC7dfPKWRzuPmHUCGh7o8r11hY=;
	b=L0uQhjDaHXjeYX3zeoBoz81Y4dBU/BDxEX++cAgu3TbvJ58oiECYzhFwK8b024bPXbA7
	 4lF/B3qHm7uVdQUN2RfnshX/Lp22zyJ2SAq1OgvGoM8uFzDb7+DXX0Y0vMVXA9nVrNy9Z
	 evLiqtAZU5JI1XHzg5SiIoyj3T/c3tPcFHAvK260JbLYpM7YOwqPWIk4uOSCvHgwAgLWo
	 2wZPiZxZlu2xcObqlQPeDglWPu5jlWQ6EIew8RHhcl69tC1bzQZrdkv66U21cUCrt5X9A
	 E5iihWe5FQWMh4xslKJfBa8jAph8HxlQBvqPaUuQtqX9A85uP5JmiFqmunicKyThshA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWoap1mE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB42B606A321;
	Wed, 25 Nov 2026 14:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hWoap1mE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D61991F000C0;
	Wed, 25 Nov 2026 14:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795616003;
	bh=/hTW19NLRpt1lg5+stC7dfPKWRzuPmHUCGh7o8r11hY=;
	h=Date:From:To:Cc:Subject;
	b=hWoap1mEmCiJ+zJBuQhGk06jmrzLRpsaqvRgVbnCm2lLin0zMJc3I8re9cZ7uFyTv
	 vb8ioztz/2GMsA9dTZIq5pJnBk49gvyYsXfupDDMoZaXfLkyz6I59lRUGXMhhtV6aO
	 ranXKijTdR+s5XTiabwmslLbnvs0eGI3hOsi2q0BJheKurkGVFqT3HjnTWs8jJTNi4
	 G2YZnvV6Z3sx98vDo30sNBKWrQltFTe+fphBJHfcpLhfsNIkaFcC96g7K6Bizz5EvK
	 gWs4/ncmzdY6hUePxMCrS+5Y8dGmhaQJ6LRwvd46e27xDSYOlQlGskAYeGt7iNLRG5
	 erWIXgfRyBWSQ==
Date: Wed, 25 Nov 2026 14:13:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbtAIIIOpO6FQs-@sirena.org.uk>
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Post: <mailto:linux-next@vger.kernel.org>
List-Help: <mailto:linux-next+help@vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-next+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AgCI7soORuFWRCbq"
Content-Disposition: inline


--AgCI7soORuFWRCbq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  b13962755ff34 ("arm64: dts: imx95-verdin: fix vdev buffer reserved memory node name")

Fixes tag

  Fixes: 676d7ce22f00 ("arm64: dts: Add Verdin iMX95 support")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--AgCI7soORuFWRCbq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7P8ACgkQJNaLcl1U
h9D0VAgAgXh0oGfog7b3L4viWzo8nIWtZaUPs31WBzlkJite0rKE4b5W4zGhJx71
Izh2pU3va5UXCes+Zd+RWU1/3Q5+3D0DbLfGXwXrXouD1msg6kTHde0TXR8D6eY0
22BeDabGGzPHrHLeSLL9VtEYNtQNhow+thm+Q9N7E6lcHc5SG6Js+w+G0ozvNn8y
T+UKJJ002eDuCQdPi2aslX3mrom2t6xz+BPq6B6mg4cF7hRKFl29JYdVc/Gasss5
fyH9CEbxZa8l4xPm9PHEyPQogSb2ky1aGWLcvUyLQKpXKfDlgFMW/dhBEDDxipoF
haTjSfYoTeGLopOzlP7rdZjZo7wQGA==
=Lf1i
-----END PGP SIGNATURE-----

--AgCI7soORuFWRCbq--
