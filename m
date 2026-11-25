Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610464;
	b=rbwGCxBKjjN4qORBVYaV/jy1/+wIyLPiIbViy6qfScHs7kK92YosqGDPsC8/wBBWNXuu
	 nDXgzn7PpewfKt85ZqcCWJkcWfPtzbAH70VrPkyLwq6ai2QC4IqFZLI2ZNgvN5dekRnxm
	 uGiEFJ1MKmAYeYo21KBTEx75H0h+H2Yld8WN5pH5E7WXlubfBfsTUPadpYNAO407x+qhO
	 1S2q5Yo3LPFlCjRIxqLnTP3n+LPVp3LGYvQpQfASzhuI2uiXzqg+vgwmskAPzDCqk5MnH
	 foYgm7cxDChOcgvjqZxP5uAmDJYs3sLUBcN857czF0FKQHcLE5XR5J55ElfybBLoXEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610464;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=Th8ypC2i7X8SrUv1GB3XA83WB7FjmNvRS0IcGOcru+k=;
	b=DKKNjZrIrUFCD+XXapk/UKmVemrcDprLFVU8wps7CJO9oSS8PBFqSD4NGOGkKxlVKqmv
	 OiWGA6wCEKbYAHe9B1xXBO92hMOvB5B7kypwrsTE1gLeizLf0/Hu4mjdhB4z5AS9ikNxP
	 6mldMCD80DZTKEQS1CVd1jwJEj3OK5DDuRDDE6kdrPw7ojLWsxqOfoaSuCOoyC6d6YwX8
	 FdbeJmgn6fMUnp+IpysO8nF5PC1hZnRAb8gISw3j1nfQTUeGolbgcLI6AsJoT00otxWZ3
	 vyO+iUBMjtuGpEWYj0egWLlsbypD1HvcblIIxG9NfVoLLNo13OcK723w2ANfbC43o2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYAA6tYG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A1606A323;
	Wed, 25 Nov 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hYAA6tYG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3BDE1F000C0;
	Wed, 25 Nov 2026 12:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795610463;
	bh=Th8ypC2i7X8SrUv1GB3XA83WB7FjmNvRS0IcGOcru+k=;
	h=Date:From:To:Cc:Subject;
	b=hYAA6tYG9nV4AXvKeIWdtEQPcuPQe7fl9joKX1vAlBtVLRRUM4JrjtLSKUjEec4zJ
	 Rz9YvmqJK3wK+9Gb7KbIG5qnB8UMedWByNWDt2/KysiHMGnQ+0KAzWt+Dn52fnzj1L
	 X2vUiG1w1znQRvXQIdxK3TIfPhY+WUlz6XaMCGl0He8nQPG45+L9Xb7xMHPdokuG7A
	 mr6pD8pkam0MExyTh5ccWt+tDmrsiEP2Sf6vWs5a5TuFEed8GQdWBoQbyyu0e8b0+u
	 XagGynR7AhpJr4Mu3+HyBRhEo8ODZH3OXbCzdg4uwmIlJZbjP0VkLw1d+zKC6w8ct8
	 GlBtZ6gixLUKw==
Date: Wed, 25 Nov 2026 12:41:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbXXBtvt90qdnJo@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="y4iqspBdjKAEA47H"
Content-Disposition: inline


--y4iqspBdjKAEA47H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  72181782908e8 ("arm64: dts: imx8mp-skov: fix input supply properties")

Fixes tag

  Fixes: 6d382d51d979 ("arm64: dts: Add SKOV IMX8MP CPU revB board")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--y4iqspBdjKAEA47H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG11sACgkQJNaLcl1U
h9Br1Qf/Vnm4DdUw44npfw7hjIFV8U+l60jtRkJtz9KxPUNDQX+KGLbZ40mLFo1s
8PXSIMIbGC+pu7z6JSHyrKdbWPVTTyHX+nJ7LPtQYrMv60hfeGFSh3ZFHwpXw3ZM
vE7wkdr2Mcgimwbdk1QHbTv4baZ6AK6TstjYSt/TFjXYeyFNY0AgXEZlefWtFMjx
f88q1+AtO4NOVj78b/PrV3nr3BgIdWTzESoOUMu7DYgJD7i94K6qPHI8CgByHVXq
EYbgcnO/shUVeDAKSTldZEg3QpAso09G2ennhSh04PR6eL3m60K+qfD1MBVjRUXy
SDYsTE9g2swuMj80MtERu7VcM3hEiA==
=vRxb
-----END PGP SIGNATURE-----

--y4iqspBdjKAEA47H--
