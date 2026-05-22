Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA253B4EA7;
	Fri, 22 May 2026 10:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445452; cv=none; b=V9uJAcDLiO+7AXQHZBj5qdxqH0FpU+WynMgmUpX29Qdzhu0hsKLY2E5ynZyELem/u/S2vbQr73W0pgRY7o1MdDjun/P+y4Ud1h0wQQAv6AQfM+NuCmq95RF66T7me3HQOYIGDSs1d69XhIE7HuF7d+ec40HqME70qauMr19IigM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445452; c=relaxed/simple;
	bh=gCorhgT8NLfAOiriClYYlSNb2MoTaxPHCkyYEOQGO34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+UVKW6+aDgmDIN7VHr1eDBEAtzc8SnywgaRiMHoGuFX6Mm774KQ1JGiwqyDYXyS3Pyi75W46l1NZ2jiKVWziO8UGKNPyMryh81SZKsBDCsflwUlqU9l6PSteojcKqVDoqSORnuFA/ch4SLiuHHalrWl1ZfHvuvS2t9hDf3wbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZM7WCaW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZM7WCaW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16AA91F000E9;
	Fri, 22 May 2026 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445450;
	bh=RqHCA6a8l9kQ/EdvTp/PfcwACDlonGJPQNOoI2xfuyA=;
	h=Date:From:To:Cc:Subject;
	b=NZM7WCaWrpew56Cc1RtvDIQol3TzWIcXawxDDGnN+neMsA1Ghc4nAVM70gbzJDURP
	 FmzxWjtoswSZZYHxFM8h8dK4jVKLUHlu8StOdmB065MKmkzQsbnjDM43uXmW81nd9a
	 lN0aClTP2J/RHOwITtPFy4xYkXYNu9XdcSOFhbe+d+lBE9u/zXqcxm/pOuyN7hljZQ
	 zAxeYraaW4DHEUrTzzlPPWm4/0E6NDvoTQnjhIvjdTX0zx99sBokISnkEZEJg3RVPj
	 j2Zwn4+svayTENnZg55SJTbWHDsNomJ79iOwkIPidhgJPb0dLjP5G349UCvzJquS9q
	 U/nxxCBUQP4sQ==
Date: Fri, 22 May 2026 11:24:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the vfs-brauner tree
Message-ID: <ahAux25Oy4Knb5dE@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xccG1n4IIKThS4g6"
Content-Disposition: inline


--xccG1n4IIKThS4g6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  71556f3d55ee3 ("signal: clear JOBCTL_PENDING_MASK for caller in zap_other_threads()")

is missing a Signed-off-by from its author

--xccG1n4IIKThS4g6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQLsYACgkQJNaLcl1U
h9Abegf/bYB76yUup7wYqegpz52+6MLCFTsVgEvFMyerQwJ9j6hqJmMlnaaTQiIl
KnysS82pH97XCeCmePX9GzkNCT7sFP9sjEpetexihoYAdmurDOVJu7D7YqQ56Lcv
mhBDGOsMs3ra0pDxajdf2TFMZZ7f5FgPoHHuiSuoo5O3n1wE5lNT+hFnV9TwlrnS
TB2vAoOT97FXRLqLNxeCZTvEG/INv+0AxoKZZDbL1BBqwSNSo7QhR2aJBh4EP/4V
3tpbcxbRLLg2MJsDsWtmClV+bDTMEldfu9RUg7Wsxy3LXpVJP8WGlnCgIsqIQvYG
gOW3w/Slu6+vSw0oE7JH1dpC+GYDzA==
=eFy2
-----END PGP SIGNATURE-----

--xccG1n4IIKThS4g6--
