Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4213DCD95;
	Tue,  4 Aug 2026 12:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785847894; cv=none; b=q2Lmjilc3lgBzoo2v86IX9PlkkjdsRTOdZ6PC/pXlwE6wojGNIBeVbqii3HmzbqTEvM06uEc5nj6z0HCL43eTtMhukdJ6W8Rt68MLhc6I+4N+Dda5KzFFuJUte8RCGOpJoOHDAcOyhZ5RG4i20R54wqoDQkJZu9hqW7RpqvMjss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785847894; c=relaxed/simple;
	bh=Z6ZsrJq7z65djIlUkIUpFCxOSMBfP0Ik353WnkpPaOg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Dd7eeGgmYfJ0//Q+EaX7nc4nvs+ZXj+VlCEc9N+EwhCj9ivlgSJSdRqEKI0b9N1sSvsrL5i9nU4wBMIn6m0A8/IDnStEbdxaik3+3azyp6t/5oNin+vvHvPsQDXKid2RnEkosE+ONG4qlRf6wy/UvwTvS6+0hGahVPIBFcjzYIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2OcDCVI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2OcDCVI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA1C1F000E9;
	Tue,  4 Aug 2026 12:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847892;
	bh=/jqIqJOsZ0cfs1CMk4ar6dr8ud4e3ufG47Z5PEwM9R0=;
	h=Date:From:To:Cc:Subject;
	b=V2OcDCVItvZ523a0XYI4jxld5Zb0wyjJBfkI0AxZESnL5Xo6LezYXgVTqv9aZCiz/
	 Ln5RZfBPfg2H4/PZf9aZ2YlpC6SFFlZNg0n2TsofkJI0AMpR0YCZ+xEnBJYVro8FgF
	 v9IbgaaXdajq0S4J6tQyooHoM6LH4n7vvqmBkg7/GR+8ncK+DjGh+mUE0QkHEt+d5l
	 aC7Pw580xMstznl4bMtwBmSd5TeUebY9pRJfKc8AKgKV2YPuswxdkg9RNMajx9UbH5
	 8M9Y8Qy5b4ORDTdFVKdgiOpkWBa4VtXNfnhTCpp3Cdf5nhWpRPGs8O0lkzv4W06ASU
	 6Yw/+sOMMhhlw==
Date: Tue, 4 Aug 2026 13:51:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the jc_docs tree
Message-ID: <anHgUVqezTD8Usph@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ml2qyhwAUNk10cWX"
Content-Disposition: inline


--Ml2qyhwAUNk10cWX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  7144308f14eae ("docs: pt_BR: process: Translate CVE documentation")

is missing a Signed-off-by from its author

--Ml2qyhwAUNk10cWX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpx4FAACgkQJNaLcl1U
h9A+7gf/ZmZIav+jE48AAHOGT+QrluwFrf8YDErnz6sbaT3mi1LaGwFhCJeMzPTV
GNLfJbwQcAExlwl3wpSzF+GZrW9E8FVXpuh3IPxKGQHb6otv/OZwoXXbIucsbOL0
vxLeVJCfsUFGbA5PG7LSOuZuyYvvFd1qquCUjUJ6t7mdY+S09S24hgoDOOJceElw
wQPWB4y0xUiiVhgjXZl3lc1PAMmKU/Qnta7gXOt7qJJnMgGZmBaNzDreh9O4hKcO
7L9tnlYOM9NxKQhRd+I8ka1bf4eeVIRh58tUpgxEp/qY5GVpbJP4VFMhgRTJuKHI
64Z1bKSy+n3BGKfZJbfwy2fjlZ6tmA==
=RV5G
-----END PGP SIGNATURE-----

--Ml2qyhwAUNk10cWX--
