Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E4B38E8B6;
	Fri, 22 May 2026 10:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445434; cv=none; b=p6HYC9NnNmbAwkeiaZB+UKKuLNx7l+n0DwKe0/ZOp8iE95uuH2ITdJ/DWAACnUzh0bTQGPKKxp4Vw1xFdh2PRWpn8fTvVGn/eVknrPueoW8lpslU1mm50oMs5zesbz2fcxnnFBnCT4gj0CMpf2wY795kkDktZpAeJTuPJ9Q0I4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445434; c=relaxed/simple;
	bh=ZhS7ifWzAscLiHq2xthLZayqut51T20NJ3sxDoaMGGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/IWGZF+IwaLmQLH+A/hzuIJe4bc9g5aAB+Z40og4myGpIWdf8cUGpQw+vAi69cjg2I8mAvr3dY/Q8TVx5JaH/MpXVwZXh0Lgk06jhpzEOYEMenG3D6sImOpsc+UDDJWq0jPfmVePaPCQ2VNZCteOhRMVSkvZwPA1HJqE36vH5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M1RP+P8G; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M1RP+P8G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD7871F000E9;
	Fri, 22 May 2026 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779445433;
	bh=8oRVXSvP0tEigmuKh9QaphnQvUwl9+8Zm2LYWy7FLRc=;
	h=Date:From:To:Cc:Subject;
	b=M1RP+P8G8VTXgFiM17WRLIMfOAvCaWam0aOXOVTRc1Qz2N4A75YATseZpxrjE1L6Z
	 wO9861rvUJBC2YAlXwJgckgXQiTQg0w69GbfRh6F76lPh23sfGPtuUVpI1n9lQ67eG
	 14u8UcZdqcXwM8aVCZIeqaeESCGCdCLRw7feZEcfsgz1fOquAlb2KqG2TPn4Fel/tB
	 iihcDDqHlOwhnS7XHfgpdMDwR2ezNX9tIFNLBN3DiJI5I9ePiHXJkV41V+r/KrnWPu
	 C3PfXvKk+U39NJwQtkD+U5EkB3o+oI9oz0a3nqFJxUQpWkXUSQw7rBduoVR7SMU9Dq
	 dmupDrZTeCF4Q==
Date: Fri, 22 May 2026 11:23:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the f2fs tree
Message-ID: <ahAutugqas-sXq8S@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qglcXN6qVgye5W3T"
Content-Disposition: inline


--qglcXN6qVgye5W3T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  6a59aa5442e33 ("f2fs: atomic: fix UAF issue on f2fs_inode_info.atomic_inode")
  cf69827e772ca ("f2fs: fix potential deadlock in gc_merge path of f2fs_balance_fs()")

are missing a Signed-off-by from their authors

--qglcXN6qVgye5W3T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoQLrUACgkQJNaLcl1U
h9DSXgf/WzVKn9Zs2B/RJog1uobJZ9ti+jQUCA9vwa1RURiXatJPLW3WxbrvpKZP
pTPrgFwabUN12PqW5oOdpKV9y8GREVpwq+w+TsU/5HIK4mTWxC6JkIoTZC1ZwNPb
/IFP2iM0Ilpy0A8emfzOdo2mbMnbb/mSxwr007GE0h3BVTNKqPq6OgwFPwuoFgpR
JEpXBcK81fkoulvRxmi4UmkY9Ec69yhMEZniTt53bFH6RtRYmI+dE7eTZvcObGE7
LHsRUsgZs1D7mt6pWpD/aYT4xmhPOPIrFn15h5Ghg0d0/B5RZtUjPyo29pVd0vCP
PiyPa+NQfI1QMWZNWgF3v5Q/ySFWuw==
=huqy
-----END PGP SIGNATURE-----

--qglcXN6qVgye5W3T--
