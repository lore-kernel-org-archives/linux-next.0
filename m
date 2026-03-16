Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC68190473;
	Mon, 16 Mar 2026 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773664773; cv=none; b=I6BWrZ1kln6+cZ8RHNl3EPW772TIGL/C8R7xi/lU/9+EIKl2Z/MwQrSJ1EwSKxTo6JoIxh6QxA8jiNPRU2YdwIG3mIYq8/CIidBOz5LhS4+ssJvXtDPACSmvb9XruddstsKDpdnzNWn8jDzBlAi3zOLrULJZ58uaeBNlnuSb8oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773664773; c=relaxed/simple;
	bh=Y26ztZVzePNqEFpatcJ/5y/jybGEpB0EFgJJ4KyiA4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tNnkyF6Zq2c+SMyfvdnpCB7PZe/Jw+38l7nZi3UBQnJMZv0EhmKy3TMWJwdT9Ad9+xBhEu8G+IVa34op4pYvrKq83BRoMQ+lPj/HA6lBL09lxylNWZnq3IYQVinncSrZLaAzr1UkTdBidejie+eV6/Aadnb5+ImdV5Gx4RWoY3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D2r9p+dN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D2r9p+dN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAA1DC19421;
	Mon, 16 Mar 2026 12:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773664772;
	bh=Y26ztZVzePNqEFpatcJ/5y/jybGEpB0EFgJJ4KyiA4g=;
	h=Date:From:To:Cc:Subject:From;
	b=D2r9p+dNI+A8yfW6HWrwxLgtflCObT1MVSpAPSmYxs3AMyJmsVvljCQvKKRiqVPIK
	 652Vw/qVjdX4TJPuL0qk6B3CZw5qQMSMeSEPm3OoYAdr4P1R1MQIUm9jh5N7k3Bugy
	 6hZX53RbnQq44FpcSyLF6HhQbqMpVmLjGTolZpIBBQI9M7gSzQr/Eb++Vsk4C4HR63
	 CfPwpM2yfTbh2Ls2Q8W7Iyjxz9eSQQZQ4S6qYfAwix6KzlPiku/Br69ECdJGo76ppS
	 ohVW3aVEenSNsagoXKoFGIQGBkVi8rfZZXD1hDLasNhZ78blNR3oGaGGEf1bDzOfsH
	 /ybM1MOm5RBhg==
Date: Mon, 16 Mar 2026 12:39:29 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the iommufd tree
Message-ID: <abf6AXKjaNTekKmy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EeKp+dFJuhmphkZZ"
Content-Disposition: inline


--EeKp+dFJuhmphkZZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  a964eaad9356b ("iommufd: vfio compatibility extension check for noiommu mode")

is missing a Signed-off-by from its committer

--EeKp+dFJuhmphkZZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm3+gAACgkQJNaLcl1U
h9BNZwf8CNhmFS7P6wuQtUH3SAykRf4VY2dDEijMDDnUmkxLscuTmSXn6XlYcoj7
Slg8I67zwhT4rTmRj+WbNLAc+rMF91fQTc5iS/RPWvTUvm/uLok1ZJcgvodMO5Aj
5MjDVVV3L1ykJ+dD664umTkcpncN0DQY7m3OF39ZEh/xhoyWOkwf+mOJN6Rpjf5E
7FhSZorwHRFzAihOM9Elzg9u6ZgAWm/Ifg5mreZdkLJrKxw1x+y+ZChwoFtGdmrW
C5RIsILCwEitG/ieqb4kzUXIsdZZOTHCU3xfONgd4pG91ICEKko+lPQ9WmAUZCUe
KQ9cdODtA5XBzE8ZCjcLm3N1fodW4w==
=V5FR
-----END PGP SIGNATURE-----

--EeKp+dFJuhmphkZZ--
