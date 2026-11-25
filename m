Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615943;
	b=pFkKcszvq5q40GNGbdx4mK6hg/7dUAkeCE1V6VlK+lPvuq/ucU1APYe6plJE+4qjvsXt
	 xoCFYoUCBKIOZZKLxjwSa2yk1Gkchzn1WGk+j1NpLKdOP04TS4FwMwEvd8yJmTMKsbqXD
	 GgIv4Cu7vREXYJUPm3n2GbLasN36skxtlAAWw1qDwGOFwehnXisVrWGsICAVeonwf/5RO
	 NVc4Mf1gxYbpQjelpyeE3xw/vPVVT8nO8GlT5ODeu0GjcevJ0VF/d6t0cNCNMytn/xu64
	 zAfI/HabVKYq8JzJdOt37sW0UpoFvfKKvgRSquGjJXuImXmGQvA2Wv5BcxwpSJ5XM+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615943;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=jcczwHUhndcee4vsjRsyrd98MuPYeGQIlLc6va1wNRs=;
	b=kEKUYofIHEhp4jNPuWrxpnT6i6fpfY0/fBmHwvSL4VtYzROiti+Ufppl0SIybCdLLjGy
	 trWmbpGOlAOJo+FAjLIWXlOHyCGQ1gtp7f0PKAY3GE/mDan1TIxORxhnD2S/lHENTDSCH
	 tYcwUpddf74HGv+EYIze0CzXk+045A2fz33b8mdq73JmeZa4EsiUSb6Z2G1ozgfyZkYG4
	 8z47K81FOcRSWqNmukdUaBIbNO08mpLXAqLsACq3uKM1EvD9KjbimqsBSfnEYlLXLUm4+
	 d2olxwGNqAeJ0Bq6SaSLmfagogkkH1pqeQNcUHFS35v3haPkklnZUndV22mJM7Fc9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiozcYB3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DCA606A335;
	Wed, 25 Nov 2026 14:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eiozcYB3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B19A31F000C0;
	Wed, 25 Nov 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615942;
	bh=jcczwHUhndcee4vsjRsyrd98MuPYeGQIlLc6va1wNRs=;
	h=Date:From:To:Cc:Subject;
	b=eiozcYB35VaEvho3BWvQbT/2rR/6YZURuEcNFNeOn6UhLSJSLLznSmf5vmp1cYI0u
	 fxVMIAOBIqrfUdSzCNUHSV6AeDXfHuww344/+lc9oQzDy6sLClrmZAum4i/2RtigKO
	 8Rga+DoTQ5lbv9Br76zZwUKJJp4le8Mvfza1njU2ddFhmPWRlaExxie9CzlCwRM4HR
	 hgqxSusrHibSwl79ckhsF6ca2FE+NkwFMYC08FH/hnhZcEa6Rr9ruPoG6QiCSesX6B
	 5aZvySlqQl3cSthkn8wTIxQJShaEc4R/Y1nmTqf47jTzdnaLJv032NJiony6KcflJo
	 4Dnkt4Zb4xUbQ==
Date: Wed, 25 Nov 2026 14:12:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsw8jUpDppgopT@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="/RXoARh4jtr1fAey"
Content-Disposition: inline


--/RXoARh4jtr1fAey
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  4fe918fe76242 ("arm64: dts: imx95-toradex-osm-dev: Remove ETH_A PHY interrupt")

Fixes tag

  Fixes: 39be5a7e3ecc ("arm64: dts: Add Toradex OSM iMX95")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--/RXoARh4jtr1fAey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7MIACgkQJNaLcl1U
h9Bszgf+OoiYum255zBr3c0pPQp57xacTNsnzg7mvHOmfjhVLjJHeYc1gvlgfi86
Gs2BUr36De5ir4PBRj8XAkVzKqONcInBwpY4wGjrYRsVKGms65s/37m7eU0Vf3Qz
kbUAT7JoGIL5w5/JawyTgrVngY6382KBFMPehhHU0CRNhX+Tn0ucbX4SIdbUMCeB
o1LajvDoXVPnuQ4YwkV68DcPPB03Gdx0ZMpYKci8XxPq5SNqrgspflNaTMr37nMD
PCdMNct3Wj+ASrsssuuO6uri5pJaJh2us4kFkt6EYZ+rAEhNMS1uCICX4wcON/dC
drir20f/1SzPunEPjVJn7G9sw8NfhA==
=YfCp
-----END PGP SIGNATURE-----

--/RXoARh4jtr1fAey--
