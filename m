Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615959;
	b=QwahGz6eS3GsCbP96WnB1eAmocamMYkXcQUW3NOvEVOXz2Gd+iXh1QXUxJVXsXyiAkAV
	 oGkgHthN5ewbj5YlVPkykeACx7RxosC3MdH2IVXcm7diMCj+FQGOvBqh2ngjxu2BwSwe3
	 6BDW+8zJ5z38uOiDBKUcX7FnFRDyB36X3v3+SDTXKuCu69p+qyN604w0DKQRF1hsBarcd
	 2ozHdSdYouguJXSCNQcIsl3TDqpeEXhEs245sCT6hRbZ42+MAo8pVqnWd/2H+jNWYqybj
	 yV3Fam+2m3wbRPfqhojr7u2koo4etozukX9y2r8SUTLFVacWHo8GTAOHsQ0+QE1uAlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615959;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=8cI8mj1aPoyrbQVohtDiH9o6Dnrz8xQCLIzcFUmPAA8=;
	b=XHnmfKq7EDRWvCaBuL4BMf77Iv/5VhLvheRTs9Hcd8oINLjN8jv6/zMcu2c0Kbf0VlbZ
	 ww5LCy3kSxN3NYp946auIqFWlG78G5hH9GhHp7ZzzlLEqgRO1QAxkw8hu7Al+AgrT8AVd
	 xG6hRfwQgmQArbYcaFCeMGZCK/zkH7GcHubC2G6amdhwSB5qErEt8xIcLl0z5VqYXg0qg
	 jhuhP5+PfdH17DLZZy4oo57ky5Zr6RWXrlBJBeU8GEnm86rGWdjGMTbmcRmJ3NJT9zAEB
	 vEIFFLdJ/+no752gifhamhSuhOC7a8Fg4g69Vh/8o5+7JRYlEPmgTpFffSdMQ+VXcrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kR1IjXsT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E647F606A329;
	Wed, 25 Nov 2026 14:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kR1IjXsT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825D61F000CA;
	Wed, 25 Nov 2026 14:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615958;
	bh=8cI8mj1aPoyrbQVohtDiH9o6Dnrz8xQCLIzcFUmPAA8=;
	h=Date:From:To:Cc:Subject;
	b=kR1IjXsTt/C2tRpmTbfhQlIILc2NPRA/S+aVx1tZPCMRz+DdHf9rj0fNCK7ni+ciD
	 jSavcItl47O9YXYK/OmxiAx0EFfXPgH7P2c13UbktKH5raYq90G5/+Gzhv9GIm8ExV
	 lb1VsOCMK6JDjIxIz2aa5ueS3PuVUaK1oi9iHx2dyJ98AuTKsGO1FrvNzs629IBChM
	 n9f59pr+Cdtes+GwHMp+o7CuIzUoVvEkBBBTZMpHEH0IpuW2IZK2gRMvuhh8VzH/RP
	 Qmq1l0tab6sQa16KaGX2fUz2IGCUGsp7ueJDz+r6URhXrUKs081W+d9Pt5Ax/SEUL8
	 gDnqjwN19STVQ==
Date: Wed, 25 Nov 2026 14:12:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbs0mLIUQNX8ZJD@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="u+OTyQeKJrSXjUgS"
Content-Disposition: inline


--u+OTyQeKJrSXjUgS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  c7a887a1777bc ("arm64: dts: imx93-imx91-toradex-osm-dev: Fix USB_A source PDO to 900 mA")

Fixes tag

  Fixes: e8a8c86875f4 ("arm64: dts: Add Toradex OSM iMX93")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--u+OTyQeKJrSXjUgS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7NEACgkQJNaLcl1U
h9BoZwf+Kv+4m1J4CvXX4l050Ln9V6MKZzO3N08BEUybyWxFxpQmpq7m2+/aZBie
M7xXrxqpM7wHRB6yVBXY8x/mBUR1a+pQWqS5gtzlxGvnuyAQadrMGqqV/G6AYaVD
88v9kPHsQwif0RSOCEmKteMy0h16lQMdGztQ2zBKCon9MSxhBfglvOf2dXbC9U5P
c/VTnmHUqXG3AHBSG8JIM6qKPPxl6Lh0D3LpEgmiv5Ime39roL0NAlMOpgbC9CEe
lwF3TREY6zdIkYLWId2HV1qgUka+o2ymdYKRySi1WImKs+7ZKSpSrjTHXiwBQgkt
B3+A0blaCzGhNIG+XLfGY/fG42FT1Q==
=1gHv
-----END PGP SIGNATURE-----

--u+OTyQeKJrSXjUgS--
