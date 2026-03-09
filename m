Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751EC3B9610;
	Mon,  9 Mar 2026 12:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060342; cv=none; b=a4hXSGiMSGFK2dkpAOaEJeBytiFbobTdh1EcKNOt71aL/Wy0G1shM3lCXXs/lgc5Gqwtw7jctxTIymr+U0gcajnwRWi3l46MyX4usRsAXh9SNTdnqIPFWGccRR2hNm3OglyDXO6YTW4FsRD8vB2HKKm1Uj9Xl2ex/7+/CNwkn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060342; c=relaxed/simple;
	bh=9jK5E2xmr0KKQg/hDgDPjqzFNuGnboGp8xGxNd+lecY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BeSx0/LW8Q5/sShi3YDGuFO8az0JrDTutLzA70avJPhRm0AfD5gWAgcWHtkzxDgdIWGHeXWCb8RPd3jxItRLVUca2ZthtpW+u60c9P6YzAwq5ibLGciG5R08QTsD9feeh0YOmOdjy2gjjf0qdL1BJXbzUHtjOVYlVGH7/jw0yQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjkukXjm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjkukXjm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEB2C4CEF7;
	Mon,  9 Mar 2026 12:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773060342;
	bh=9jK5E2xmr0KKQg/hDgDPjqzFNuGnboGp8xGxNd+lecY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjkukXjmf4teKYMaOpSGSnl4+gpLayCu6XNbgB57JRXjpgv84t1kCOJM7EowJRd0d
	 y8/gQJzV+5rb47ksbBqhQKmr6I+bQZVvSYr2vR9UigWCTiDQeAqS3fwJLyAp33Uifi
	 p29R1STLeSlSoaj6Xq7A8BB3vMIpyPvhtTaPMYji9SOx1el/hldBFBIEjeBzazJ3C+
	 lkH+Qk83HQHYJHu97LoOLF1t8WQD+XQ1SFaMNTyu1eMeyGSrg1u63/AUcD66d7px07
	 yg4cGOa83uPsbDXBdNuOMiT0zlHs48YJWsNMP/TEFWzcoJDABOig+mztVn7CcmlqOx
	 rjJsTH287BZNQ==
Date: Mon, 9 Mar 2026 12:45:38 +0000
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the imx-mxs tree
Message-ID: <21389946-95a4-42b4-9ad2-190eba25a5a2@sirena.org.uk>
References: <aa6qnpEoSaiP4B--@sirena.org.uk>
 <aa6_zUCpS9vnREJg@QCOM-aGQu4IUr3Y>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h4aHAbo5cpvyiVWw"
Content-Disposition: inline
In-Reply-To: <aa6_zUCpS9vnREJg@QCOM-aGQu4IUr3Y>
X-Cookie: Do not dry clean.


--h4aHAbo5cpvyiVWw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 08:40:45PM +0800, Shawn Guo wrote:

> Could you update imx-mxs contact to be Frank?

Done (looks like everything except the fixes tree was already up to
date).

--h4aHAbo5cpvyiVWw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmuwPEACgkQJNaLcl1U
h9C+XQf/XN2FQiPcQr+ay7LdootOjHIORd3NK6R8xlmyM5wE4V9aEFrw5OD5N8FX
0VKxYe7eAYdv48tQMF+G2ezu+itAhI1l20bn9MzCsQa1H+jhphMRNYZIbWqOdnQS
b+w9GsqHA1Kz0hHS2SrZ+orYzwQyYLBlL2qpFem7sZVPNmS7EUe2GLrui2Ac7/cH
FcDcGdvLLkZH57eE9TV2N/PUwvJ1FA7CG4/nhuIq1fb+u3rCXgsxSgaHH66GQB6w
4aOe3n7qMdozqF/zHQ5dhC/0WARFuvAwbwLl3mdNZBizvituEQyOFqChWlAquqNF
f/V/EF8crQwzY/9XkKORwYcqBx/Juw==
=jtP8
-----END PGP SIGNATURE-----

--h4aHAbo5cpvyiVWw--
