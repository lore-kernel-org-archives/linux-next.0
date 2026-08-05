Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40AC3C943F;
	Wed,  5 Aug 2026 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785927544; cv=none; b=a9WL6SSqBIY36VQUzpZvs2M3FJMuu8SA3OUbo2szQpOsbCxqf4fH8BW2b2hdRM8R5Bguj6vuYe/1gd4Hzm5s4oMaJ7JUGgMsbzywg1SRxGclPSU1t74eDN2SCHVyey1zkloSgEt67VAUGWJgwpJLgJBQnjQ86jLFQrDp35ZpLa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785927544; c=relaxed/simple;
	bh=0c5YkBgGlWOLvgVISG2YLTV6+07lf6CNeuTCZubibak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mZXdbzpjYUuKxOUjxNobtCOuWEdIBIUKfnayoK9UqWXtqgCFiwUi48Ff7ziIK84E/MekPhzU/vgPOcvgC+6EwRsJFi5CMEDZfOYYsuII92yZAsB54ThKsx/cphL3tWDXglVlkRLPfeGBehr4ikhFHOVQ4i98kBISkyxbf7vJtjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bF+G5ryX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bF+G5ryX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A48931F000E9;
	Wed,  5 Aug 2026 10:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785927541;
	bh=9yuYhgyti2M1lpyUXbIeIuIOJNdltYcbyOdVlm7exdM=;
	h=Date:From:To:Cc:Subject;
	b=bF+G5ryXrTOSvPsS4vbVynQ6Y/SLve83YTTGcqoEXI6+OD2fa2vIDkvkXv2DWM/Vu
	 JfTqWN6G2dC6J2WnsNOOTELWizc5QXkM2LAVO6ZjWgsDkeXS43Wqz41sXLQXMA67pR
	 BWOwh3jaPYM8onOKIWnDlqPK+2CWT+aBZHBRK5J3YcQBFxJCmFY1gpLAFsm8fnId9C
	 90xvftsRwniQbcu9xlURbCQScfJYVcTsNW1is6zGBSwfIbQg0RGilcA/YiHohU+B+i
	 kO423urrvPvUz4xlug36uprfrVbj5HcJitWUC0zz9Z3boYTAxtM4ZlYzlFOIpHv8Iw
	 fQNs870hX9TEw==
Date: Wed, 5 Aug 2026 11:58:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the input-current tree
Message-ID: <anMXcUERgpvSGpVz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uW2nrYijrK0/ElBi"
Content-Disposition: inline


--uW2nrYijrK0/ElBi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  08dfae0f8bed3 ("Input: synaptics-rmi4 - propagate F54 worker errors to V4L2 queue")

Fixes tag

  Fixes: 3a762dbd5347 ("Input: synaptics-rmi4 - add support for F54 diagnostics")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--uW2nrYijrK0/ElBi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzF3EACgkQJNaLcl1U
h9DMJwf+Mh/ZjhHljxDD9zq2YQ/XQ8vZIRAUU7qu/1YWGACTt+8k/nXTpuW0gKBn
SNeA2oC/sDyNylnzADcCzen2MlXPx9wysMb8glrP1UMJ5Nm5rX427L+5fiTsnjCM
EGnJb84faCvG37ah6GZYN/rPbCiyzlUEZLg9gFb9P7LJsPanvEVK0/aWjaS0T5rw
yQBiL2hvjE94WLoykV/JjiSxQw0eNl+JOARYZXHAM7xwmp5XkGT5WIbIyJ6oqLLT
JZTDLpgqoMW3gRhjVTRTjgH4KDeTrkbKsHmeM3iuvB3cSYVnIeOVPInWzwQt5SlD
S5OGfBfUis44SO1LQpbWzv1vcUOU0Q==
=XLEa
-----END PGP SIGNATURE-----

--uW2nrYijrK0/ElBi--
