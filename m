Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDF3CB2C1;
	Wed,  1 Apr 2026 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039087; cv=none; b=tFoXZW32ehOV7K3cLB+I/C8WfSUfaxcAocQmT+bD0RkgyweOPF/ZD+XDRiVv7VwjwbdOtKFcTgye3rTPnfcDZXIOv8uWThpKE74TqPkCwpmYTZDnFVOMdALh0d2SuIWZrEPYB1UBzwnFC85H5wZnPFgmsKSaZZLSYhP6iGLPME4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039087; c=relaxed/simple;
	bh=IFjlRqT0aFtdx9pm/vKRssLd6RHFH99Gc9Zm12gJEJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JCKcNvsge3+wmnm1ADhy/HGPq6pXxYk+fzMUNrbmafuDpTDR9x0RckGcokTCPOs7LhhhIc88+QuRgWvIdgbmfkNDkIDdYHBcAuVvEV38sU5naXPmMuuiV4aVH2SkkF1q7vHXCXj1sbvAwudL9cnQRaM5OPdYbdlp74/fLiszXks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eguKlqSd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eguKlqSd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C37DCC4CEF7;
	Wed,  1 Apr 2026 10:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775039086;
	bh=IFjlRqT0aFtdx9pm/vKRssLd6RHFH99Gc9Zm12gJEJQ=;
	h=Date:From:To:Cc:Subject:From;
	b=eguKlqSdy0bAHX7GF1mGT7599qzBJgyZdMDIlJRqMkhjWOEcrkUNHhwLH6qg96Z4z
	 Q/rrPSaHwjO9pH0m2gzxJvfqSJiTOVuY5co5z0kq0FylnOvodKNpj+Pb1V9s55L+Q2
	 VWFU+bLmWqHHaCdabIoZCCgb0fpREscvPxoq4UzlkzFQss9sRoP1ZuLiaRbHqfxKi7
	 EsUd1B0Onjj/uUOsAO4tzjvd7RU1aQEzbbDX312MnEyTlJAvzkIAJ1p2vCk3W1ZNZa
	 aIgiBvEHYJ6R2s4cfe+OJXIVNg/XGPoAdseirWWpvl6EO7MM7FIrz+GEMC3UEmocWs
	 kPz6/rYBhhAtA==
Date: Wed, 1 Apr 2026 11:24:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>,
	Dave Jiang <dave.jiang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the cxl tree
Message-ID: <aczyakZMFpvuVnlI@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gZ87W1bI/nXcU2IS"
Content-Disposition: inline


--gZ87W1bI/nXcU2IS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  16413cc33cfd1 ("cxl/region: Fix use-after-free from auto assembly failure")

is missing a Signed-off-by from its author

--gZ87W1bI/nXcU2IS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnM8moACgkQJNaLcl1U
h9BNbQf+IDDfW7ckINkVvr9/vk7Dnhw/3MQNhvFQGivYIcWtYNdb4AtoGLN1lAQu
Ivx1oLWSFT2qjFXmVbI7zEoBVbH+D21znjD1JwSoYYrmaRMhqkyAY9aoF/njM2tf
rCE0ie1P35md2qd8OsLI3TwC08ZNvXvLMcT1+vmoWDClA4Yj6Y4jJGXw1co7HETU
6bFMzPftT3V+cHZuZ/kb6s3o/p5hzO5gfAwLfQmq5ztI+FWdvdcme17f5HHPeEsg
Chp9+7zwtjBpbyKXvK4xxaTVfMtnPOsZ7NxFywOV2sM8J9Jiprt3DwFKzO2CkZns
o9fle2IM1D9aM/TBVBxnZD5CoovUtg==
=bF5M
-----END PGP SIGNATURE-----

--gZ87W1bI/nXcU2IS--
