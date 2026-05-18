Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC03D3E0724;
	Mon, 18 May 2026 08:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779091882; cv=none; b=Fbfe2fH/Gymt5leiyhkkACA2h+1tHd1Wh2ZZFinuCGwSpmb0n5dk1f38IUSk6WxYHB9GZXMvUToRgJdx35zD/LZmcyk1cQMxG8IasdaEwOSjT9/SC+yQl7ZYmzeQD45C9CWphYTCpy3hfA1OEcZaxRCg3Z46u/rAmN+WcpAgpo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779091882; c=relaxed/simple;
	bh=4U3h6b4jlZdsyRMqNardZKbXQxYoapgmoL7LRi/ZABc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YBdJPPaabeSM7gMeDyyetzVV9HpTPRxFwtDyW7yGGqN4N4NlTB840M+amCApZZrv77+eeXnA2Oi2HsZ+XSSRZwmEG0msADkWaqVOKATM8UvWKfewjkQB57KLszXynUu+XhcugqSqxgrre5gGXbw7w+kLOHjTtokbv4AuY52QsyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ltvsMXw3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ltvsMXw3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9657BC2BCB7;
	Mon, 18 May 2026 08:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091882;
	bh=4U3h6b4jlZdsyRMqNardZKbXQxYoapgmoL7LRi/ZABc=;
	h=Date:From:To:Cc:Subject:From;
	b=ltvsMXw31EJCLLw71EIVyhmf4IJhcEpPsED/2PP27EarYkgw5Rg2jHNDvjWcteLQ6
	 JM0iCLIZZhlhQgn/7OIuCPGmnoQ91A0pMrtvh2PxTn8pK66DaB9kh+ZcSiB34Ry+PN
	 m58QwtUTOfVq43pEsnsBVi0cNctognpGDoXa5Or+/Er/zo54vd03wn1uDxQMx3UTGL
	 CImXV24YWfZjbhbZAxxfEUEpdr3fpzxrrOsyrg+ShgZfzJSzT16mJPgQzUlD1fGbTS
	 hED0Rx+LcN7jiyICDaoqd9XLUESlbDxewcm6du/KeddL52J1cpVHfJn3CEhXVh7NLW
	 2N1atsmoVHAZw==
Date: Mon, 18 May 2026 09:11:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vfs-brauner tree
Message-ID: <agrJpsmor9usxRd5@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ksqx3ibt8xdqIP3r"
Content-Disposition: inline


--Ksqx3ibt8xdqIP3r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  f478134e08cc9 ("dcache: fix typos in comments in dcache.h")

is missing a Signed-off-by from its author

--Ksqx3ibt8xdqIP3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoKyaYACgkQJNaLcl1U
h9C3lgf/YY32Rby87fDNfU1vfD+NissHmyUs1YjDpVCMcShaLpq2AE9VMYvAuoSH
q8ofmcpAvciQB4hl0ID9g5L+jUlF64uq7mdB/iQg2nJpoByrJivK1jReceq9YB9/
I5DWzPVtQECq2eBnCmOj9KD+lKNvRwZpoX3WMvOwwhP7dAavPwLNDuQSU3P6v/6x
pBk2WssDTR0Fgt4EdMpTGtrh4SsTRRdtA7HWH1TCnI/uspPiBqqgjr/KyME8qyEs
ZeGKhZBU4w+y8WNGSrkK/eRtY5iXyAm+4WSKE0p7iqhGd99k+6SpIwrZONFb2TPr
pP1Ul1SQisCoXGCQAbpTEI4Zv5o+dw==
=QlLJ
-----END PGP SIGNATURE-----

--Ksqx3ibt8xdqIP3r--
