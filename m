Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063A3AE6F7;
	Tue,  7 Apr 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775562429; cv=none; b=G/eqSpzaJy8VJgDm2pfewhK8d3hHnzSkIgpyQhIQ2648GzKAfTxtJOclkQe3BITCmzaVnV8FMXCbedKUQnB+uH8ahbfLSF01h++9ye98mFqwxaMOrE0PziE8AyncQREP1jdR0yjF25jdxcOoZbXS3E44bnLRWNDv5o413NprWHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775562429; c=relaxed/simple;
	bh=7gK7KFzTNvneiU5D+1UacaahsV0j/bx+RgHNDl4SKRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByEE13dVqcCf5Z/fYUpcJJGtmbnW7Yiix0VggSLvb6u2cUkiIQjOlEzNrggbaRz27HyLUr0n6rSYMym9las2CtXi1Ux4WNKE6w2OaBUtz9mbSMX0LYcniDyb7UFTC7ZYJ7tbblXEoXEGgomVffb5a66Wc0oKSPyRqLB4cuQ2IUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFMxPzM/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFMxPzM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27469C116C6;
	Tue,  7 Apr 2026 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775562429;
	bh=7gK7KFzTNvneiU5D+1UacaahsV0j/bx+RgHNDl4SKRE=;
	h=Date:From:To:Cc:Subject:From;
	b=WFMxPzM/9qOqJ5n3rFybeetbIZVCdJi9FeLs5Ehe1PsFobf3tkS9iKk2OcS4hqI5V
	 D1MgdMwhsDnRtfrPeJaAzHwdS63MjLTsLC4UQ24gLYtGeMM0JGu7JgAXX0kSw7NEfc
	 j4nXjmjFpisJDLaWo7KpFI0KXlBCKRqMu49daY6i29YVW1XGc9Uf5zeviBA6DjGKXW
	 dLs4Bvm0gykPMzENRmD3Fcg68pRS2ZeT13d0iIuYSbvM2rH3GG04PyWdhelkzzVPXe
	 vGpWUbZxujj0dgDig/T3Dac8qkWaaD2gZBeoq0S5Mp5lH54DYpSZBEHoQpmaTT6ssR
	 P8QxpXKN0RBCA==
Date: Tue, 7 Apr 2026 12:47:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Marshall <hubcap@omnibond.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the orangefs tree
Message-ID: <adTuuT0AkOUwxC6H@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="y3QrnpskPRA6nOPD"
Content-Disposition: inline


--y3QrnpskPRA6nOPD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  43bf488aba642 ("orangefs: validate getxattr response length")

is missing a Signed-off-by from its committer

--y3QrnpskPRA6nOPD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnU7rgACgkQJNaLcl1U
h9AvwAf9Gp17WdUz3xxy9sYQ/34vndCvvmn8LXddIopN45w9yyvVfz+xOcFUAaxB
q4XoB2R5nHiTUz3hZkv/vaASsClvdnai8kpeaXMHvnz3v+Vz4zB1EY8pmpak+wms
nCj17+ysv080KxfYxn8pcDMVJ+Y7X31DwdbkyCJCRBBv+sUbbk9NelJRYIEJUgmT
7vG6ewvjJWBXBrW8TiteIrWwYLF/4SpTKNJkqOyJoMssmQpicTX8vg5mfsiJdC9F
fyEk3fQTZEIe77nZWNPO4u6b+kc9r7b2mqtWVD68yxjdg1udTLTz+S19OA/7w6rS
uCcjiIFR2aDFx+Hbpt6XVv+brSwroA==
=rX7F
-----END PGP SIGNATURE-----

--y3QrnpskPRA6nOPD--
