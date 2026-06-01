Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C6032B9BB;
	Mon,  1 Jun 2026 18:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780338124; cv=none; b=Jsw87SLsQQteio9sKh1i1LBrcaX+MWX+n6iQcNTnd6JJXPk5M6usJlvI3li6NnZyfwVtbEmDjpY3m8Lscrr3UvfGF5hSJHeOpogFSYpmi2TlFinzMOSOh9eoQi4IEjN0vBzsHG4jUp3z/ED3K37foySsOQfksvW6S6wQn+fhE1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780338124; c=relaxed/simple;
	bh=7wkVs80hSIWfVC8eHq+f8SDv3bsC/fXWnrkaR1rUcSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SJuPkMLBxdz35c3Od9TbSRbmZ96QFm8PYyB5KgZ801JTZdRLpaVHTLdGn2N8RRTwCvaxrOs6VbstHXH5Eqt11eg15Ly+XXLrgetbFLjK6Ta1RGkxxGzOLnLteka+Gba+T0BSuvxB1FktQjeiTee4LIcwPPTbLGEBm0c138cb+N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F/+Bbfpe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F/+Bbfpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E7281F00893;
	Mon,  1 Jun 2026 18:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780338122;
	bh=QLdvrc+xVr6wS+HX80jTKZGib+E80PHHIOLxSWupEu8=;
	h=Date:From:To:Cc:Subject;
	b=F/+BbfpelJjzwXekEroeorUDYk68JO8gCybJ74Rt3UpcFBRKuo4MO0/kw8Pg2heRo
	 9fmZuBom2z9I633tHxHk4A3ziEotwtrjnzgtuHi7cbRdclx+gqmDKy0SzSSYud8ViP
	 BTSJpz/RbO5tw07SK2adKkWKNFYDZqPzKsRgIx5/K6iTw152bZnseV/2hLHiFsvW4n
	 f6HL6T732WkO8efizGuwQ2XYiI4t/qvbuiod//0IZvcF9Mwk5pk4tlNyqq2dSc8qEe
	 E1cCTSxJ0iBsSbftawz0QDGiJOLcLhLbj54xBDR3xtZGWyofSuoSjWC1ZU8u9lXnHW
	 jT+LfrpQfl6cA==
Date: Mon, 1 Jun 2026 19:21:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.1-rc6
Message-ID: <83f77b2b-8c00-424d-b6f9-b044e7ea1ee7@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAhwH4CBRgpelgtF"
Content-Disposition: inline
X-Cookie: Have a nice day!


--eAhwH4CBRgpelgtF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

We're reaching the peak of conflicts for this release cycle but
fundamentally everything is pretty quiet at the minute.

Trees being held at old versions:

  ext4           	next-20260528	(allmodconfig failure)
  thermal        	next-20260526	(patch for this went out today)
  vfs-brauner    	next-20260522	(patch on the list)

Trees with signoff problems:

  bluetooth	(missing committer)
  edac		(missing committer)	(A fixed commit was merged as well)
  pm		(missing author)	(ACPICA backports from BSD people)
  rpmsg		(missing committer)
  vfs-brauner	(missing author)	(syzbot generated commit)

Non-merge commits relative to Linus' tree: 8830
 9927 files changed, 518905 insertions(+), 197074 deletions(-)

Top trees adding commits to -next:

  1166	drm
  790	net-next
  357	v4l-dvb
  274	tip
  273	mm-unstable
  221	iio
  199	staging
  188	sound-asoc
  168	crypto
  164	arm-soc

Thanks,
Mark

--eAhwH4CBRgpelgtF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmodzcYACgkQJNaLcl1U
h9AF5wf9H6QlmEBFqgs/Yd/QdKcD4laCnE6K7hj/ns3E9X7TlIq5yJngLyQlhegI
rxmn2m/RfrXrrX7kpfGdhW2HHRklpCb2v9BjZ30g/E1xCyqn+OwTnZn6Ajo2c9PG
luz5dpsSYZIeBeVeRM3b3AdbcBrPqo0iIkfA1Upquonunkc4Hc85CaeSsGOErIrm
3zFh/RKyYkVDTxL10o4vCkBwq1qTErFaXHUcl2w6UoEbEzfOZDtvCicJrOGCkpgN
FfuVWgKnxxazie9cWaI25EUec0RZeLPqJn1zeSS8IzOIOrZlcjheYaSZBR1nFDfT
G4LQo6FOLiBdsndEZN9b/TUVPhBNYA==
=6Nrf
-----END PGP SIGNATURE-----

--eAhwH4CBRgpelgtF--
