Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8DB374722;
	Fri, 29 May 2026 21:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780091875; cv=none; b=PwS2WtEZlsXXAvMlJCCoIBcwbzrtV8rl7Ek+42r06V+g8eTT5Dhz63A/LR5yVBFu+fUOWRtF+QrCTi5rFmCF7D1y18sEy3FTQJxq0e6Yp+qSMlUo29efSVGdXNBOAF9T35FDZrBEHHpiDcudp2n8O1vzel6eO0aiLDwFCPuHCKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780091875; c=relaxed/simple;
	bh=LVKydVwunkChf/HK6Bjq3HJqt+MFnTpYW7ZlPCt2wQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NXgrXEhtHG+lclyAw4H+kM1l82y9Loh+kvgBuCJWeoLk/ZWQQ+Q+YBR9LZQFw76+p+AaeDEivNb/7gKvD4jA2Smd/9Hz9a+zqcwyLJKYCeIGZfjr6FMsGgloEhaea3Y0HgU4zB5PgVTo9qhgxEH4euml9hMz5uays2TubJUrXzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QJnypJ4T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QJnypJ4T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6511F00898;
	Fri, 29 May 2026 21:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780091874;
	bh=XAr1wEXs216FIfpn8t8cY407fBdZGRfGmOm2HZPGGK0=;
	h=Date:From:To:Cc:Subject;
	b=QJnypJ4TYeB3p+cr71CPwX19CL2ZTakptHKRU99CfVgwoET8hzEpeSLW2bzlsuEc8
	 fN1pEamCFlUlRTYgZyS9Stm9NchN4VSa3mAECgJsB9crvZRvvfWFOQioeq9OqGO16a
	 iCXMx8ltgon6RPzvbYgSFCk8iHfigq/ZycnQXi55G8qvdG2vVejG79wBcCNfxBznxG
	 a3jWMfEwu2V/0onGc29ANyUmxXRiculbvGvACMHfca8oPM3k2wDHu73oOA3A0jW7VV
	 njV3s7EYgFui4TBOAs+vOXd7hJEjBUDt8ioAfbJPL6s+v5iWtJGoMz/nuNoOz8zB1A
	 baWApJZ0gP2nw==
Date: Fri, 29 May 2026 22:57:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the edac tree
Message-ID: <ahoL3l2gWBBS_e0_@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/FnKsd3GhNbDCgSv"
Content-Disposition: inline


--/FnKsd3GhNbDCgSv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  3b48fd01d94cd ("EDAC: Consistently define pci_device_ids using named initializers")

is missing a Signed-off-by from its committer

--/FnKsd3GhNbDCgSv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoaC90ACgkQJNaLcl1U
h9C8Fwf/f4NZ73MgTvnA/wwxeTjfx2HwxIcgTtSvqBos4S24UkO6vXaiAWoOKvZZ
ZAIhNBDVV9fEx4BfTs1lyqAPTKk5jitQXGxeRA1+MfQ2QrPR/D1eBXQmfdQV7J2W
Gvb+0bJpigGVQNJAy5QF+CjdhSblxH9VBGhaFrmAnrl3LeDILReyYDXXJINl6dGS
hBf31RgHXbxvkgTMSDnEJq/bvZASdk1KpgXrf3m2P1u+uiP7f76clVWSB3FahLbl
TMg0TEq25brPgmSQyABb+Pjc578Oiww30Avaw05zBBebdw6NrlpzqdwGi0r5acAt
D7H2WNeLX9ID/z4T0yxzKQsAMHzmLw==
=8o9U
-----END PGP SIGNATURE-----

--/FnKsd3GhNbDCgSv--
