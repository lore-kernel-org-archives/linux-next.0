Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D68193783C4;
	Mon, 10 Aug 2026 12:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786364481; cv=none; b=MmG22+EKrcED3MZMNGJTaU38L9qTo7jjp8mH5hKZHk5LjfwRt4nohHVL/7b7qFWaXcpzI0NLDGf3MRk+AABVngtUkPyZ8ApuxpHPFQHORETJz+uajCX2KgRsB/n2Y7lMN1dSaygyOoBYG1fJW25ehGbZ7z3PBJryGG4EIlCXPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786364481; c=relaxed/simple;
	bh=gjFoZW274+aRTegOWSPLGoe4NXGI6fYQh+R04sE7vNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rQ5QcH5NKZWIZtPZ68QoLZaNc0GBJj8QK9PUY2KBdKKs4s/qeOT/vawwrTp47CAdZLyN25Zvg/Pd2bVHypHopfwrLov2LzDsStZvTYXDcjzYeZQGL6K/ubZWfoQj+z2rtcR0MC8cpWB+hKT7eSx9NWvmHNkmLjHkxiDlOOKPDIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ewh2L7ZA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ewh2L7ZA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF181F00A3A;
	Mon, 10 Aug 2026 12:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786364480;
	bh=Of6GXECER+r/uqS+CsFWO/VvQNdsCV20mn/yr/Br/ss=;
	h=Date:From:To:Cc:Subject;
	b=Ewh2L7ZAd0chqjI6hg2F+VERPfXjilalYZe6+dL5QGSR8k9j4rHfNl/w0Hqaq9J57
	 9Y1b4x+T/7kDDFddJDzfl8uMl2FlfLB1Tg7Y+aKJUS03Ik5efVhleTDsizCDGePZmz
	 ldzclE6XubK64Rnw2eawCkPZgFgZ0xWntYqGvc1NMY1A1MyySm3lgzybmwD0VGS77G
	 hVyoBsES9ZkrJutilHktS7tA0JHIr6MwlTzCZ69A+ga0We2Ialut4Fki4It9e12A+Z
	 B7Zj8HuWQuIW8LD7E5FQHo/GoadtJg39BgKlSYJAf0qSYtjYgnUCrdcgMkUUCz3Wsw
	 k+ShPdkEy3Njg==
Date: Mon, 10 Aug 2026 13:21:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the gpio-brgl-fixes tree
Message-ID: <annCPWw4OuVUI24u@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GuVicVFqpwwQR+3a"
Content-Disposition: inline


--GuVicVFqpwwQR+3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  600411ea1f244 ("gpio: ml-ioh: use raw_spinlock_t for the register lock")

is missing a Signed-off-by from its committer

--GuVicVFqpwwQR+3a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp5wjwACgkQJNaLcl1U
h9AD9Qf9HtjgWxRyaDqXMjAc2ya3oQp8E+ThVaVjPcigi/C3REcxXX6SZeRhuocC
h0B5DDzu3qFB2K0gXIv1ynDRdJZIbv6LDGYjKR53z1QhgYXJI14SfXDY8gGmDY2q
uxusKBNPZXlLqcYmJw4jxMNf0lmPO1BQWMZr+St3Rueq1s72OexWAApeo4ujxzuX
juTXYS5glQmXxyCYzsa2bGlHS+JSmfVq1Jp9g2eEeAk/2zOHajvMieswSSel0aAW
7iGcjMF5H6mf8KbDeegb3q/uZJDz8TnuZHCzMugqbZyooQKfC55qQwca/Obf6cHI
SmfFbqGg+k6u0kht+qPNCkWWPIYpaw==
=V7Am
-----END PGP SIGNATURE-----

--GuVicVFqpwwQR+3a--
