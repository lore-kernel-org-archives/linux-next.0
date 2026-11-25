Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615915;
	b=GWneyibsp2Qb7PC+Ol3LWmJjx8TN0QekeA08pSZ8p2x3EzEkO3ClUxmfNlWelEgSHyLW
	 MCz12r/Eim2lkQHO3Y4nxRDsnAi4wvvfQYx1q44LTs+ebc/EjQsFiBb2dTqC2eGl2SCH4
	 xvEbhhdmuS3NsXowTOy5gTLpGzKa4dxbSKcmyb1hTVIaztqBhdvBKHgPESifpAOxOzjvo
	 BFKwBp+SS4T45jneFWVDYk1TjmwlNqg0+pZmj05VDBSFkC8RG5+P5bbSyhBkJfhhYIMRm
	 1YObi+y4VkXjFVt56R0MQmrabHA+JnEHHp5rpEE4m+2j35U7aH0ROJqOZkVxR6qyy+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615915;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=rO/Tl6pHWBHhyHqBktTZb7TNwOTsad49Fd6hjoD7bmo=;
	b=24WFXn+A0sMuqFloth1YZ6Q2hwVWLu7Xc+IvzX0P0kGgQ6GVQ3oketXS/oStlum5CgkC
	 vlCcRCBrYZ2kMymNxyHjpJEB63ofMkBu0AGqXP4rGqueXySR896KRqi2KRK0BRdPz/D53
	 KVQhOOcjpWRtwzuEXKWmD9MiqDuvvGHzcgcXrM6YAZqhQI8i/y3SvngReQ8WcXhaWMPfW
	 52rBUhPYjlh4LP1Ln431akUkArdBXLQ+ly5Zu/X47E411nhUdlKAfzr95rBIfiOO26G0D
	 QbJiJ8WJ7S4VvwhK1cQvuyDvpLtckY6QI9pFfpwmwYT0oHDzpAKcte1exaGoXDuohew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcrVCKGw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229D5606A321;
	Wed, 25 Nov 2026 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kcrVCKGw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2667C1F000C4;
	Wed, 25 Nov 2026 14:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615914;
	bh=rO/Tl6pHWBHhyHqBktTZb7TNwOTsad49Fd6hjoD7bmo=;
	h=Date:From:To:Cc:Subject;
	b=kcrVCKGw1i1OHGM71XD8Xf/goSGMPP2p/8VwDuY6jbSMbTfXMIVUAE9PsWfJFM/AB
	 97sR7OvEFNru5f0/fUI+WoC6v9J+fnslJ19x2Sp56wqWxxEIAfZTHMCdt1hoHyIMuk
	 41221CrK6chs9WQpvCAydEoJkSnq4ls6OqiRj/EjCmiH/kSlMv2fSkmkm0qMbDRmY1
	 6aAgMQQxBELZ/HmoS2HpP9I6weKeGmtfAdX85AMVA6Q9nZwnMFbeuO02YPuTK3Hzgk
	 CKebnVsnPHOIcxw9o15MpSwdHcc7rSpuoDYtK+DIDEtl5b1dlWtUkz+rb+W/xgR9L8
	 zxc6v6cIEoQ/w==
Date: Wed, 25 Nov 2026 14:11:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsp88dPlGqevvT@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="6+nMzZaHGojJan7X"
Content-Disposition: inline


--6+nMzZaHGojJan7X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  5dc14544e6809 ("arm64: dts: imx95: fix gpio clocks")

Fixes tag

  Fixes: 5e3cbb8e4256 ("arm64: dts: add i.MX95 basic dtsi")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--6+nMzZaHGojJan7X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7KYACgkQJNaLcl1U
h9CgfQf/QOeLFNyM3pCbyU3iaElsBkyOaABoQmQGXZ5F/UvTrNBt+zBABk+TcJWd
NkvSvCH65U09A0R9GkWOBgOVlrwRp1qjQTznvgOQSkBTexh22TDJUGVIh2ej7gue
lB5ACR6BnBrBOVBOmxeGkbvgcjDFOr/yi2UY3kIfHCFeJv5Chy32mrswDCnDXlvF
Q9o+FbQ0Lb+Os7zRlKHNMyg4WSca7YjJMbGdOP4wBmc6We2t0UfiTOO6+8IjGmKd
PCLpjzqZ4RUQgQpVFE4iW2M3KuIltX0d6mjF6/9wB31SOWlOuQ89amYdxUw6macX
9q4tdVtuLGZKPAjUeShD8fs0Axqz0g==
=SkVl
-----END PGP SIGNATURE-----

--6+nMzZaHGojJan7X--
