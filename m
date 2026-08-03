Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45145415F27;
	Mon,  3 Aug 2026 14:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785765806; cv=none; b=jQI5HmWwPabOuXEYwJyXeYtQFlxIqygRAJ+r6qZkE0rHkWjFALs1P0QqeMEg90PgX8eE7yx9krmtdUg/fQSI4QLPFWTn7dxm5peRNtIPUk/bMDCjqymYnHFnyWesHEdt+80ELvsuAlGUMr3/z5+nnKx4SN6cBPU91EOTDmpKUCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785765806; c=relaxed/simple;
	bh=Vd/NZF44gupftWpi2tP2WFL4LB1rzreJFbks34a+OEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Haj3QwZ8fi15Rl9ZGdkAKheIXxlYcxT7ZYtD5jEaYSJ8gIW0azLlgmBvBH4mIxLr89B+fyVBw8oAeQzdyh0Cj8Vx6E+cI1Xa556kwbPMCnJpaRlT8jlT71Y5UAKOokLqM5SAjMrsPTD1AW1Wmr2fzQETJv29wlzCdFUPpOUvKwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YlzVYGoG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YlzVYGoG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 283121F000E9;
	Mon,  3 Aug 2026 14:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785765805;
	bh=zt/C+BKarhbyUgZNx3W5ktZx4Dp94k+gEDTBNjcZEfs=;
	h=Date:From:To:Cc:Subject;
	b=YlzVYGoG/V1L/czGyyAUSJt+KjI2yZnDtKRXBLCTYvjebC+QvSpoLhzl7qLR9WEVc
	 6ZVut6nRkOMLoqSU7PYNJEQg81hER/7uaFYqa4o5A9DP19HETDRUUqAWljXbWXv4nE
	 FTwOgcKYp8QVT44CEmLGG5HStSWZBp5soggEHx73q6PJrSn2D/LZX3iXk9h8ASWCIZ
	 AY7xcnkoGV/2bEEw8GP26ZZsrQPc2mktFEFLp7Yoa2brZqGmT/Ui6kqJRtPvZ4QfHI
	 DouW5ONMH85TMMrQ2qu++6CUwhUhawzoT3RgGK7CIrFArJPlWZEVJVl2g6vy9O+Zlt
	 Mm18V1+yIRINg==
Date: Mon, 3 Aug 2026 15:03:21 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-msm-lumag tree
Message-ID: <anCfqUmoJbq1N0nh@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B6oaQWiSE0NZuoIA"
Content-Disposition: inline


--B6oaQWiSE0NZuoIA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--B6oaQWiSE0NZuoIA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwn6gACgkQJNaLcl1U
h9Bb9gf/W8sin0qGDFFpXEXhaneICEJRDzROpxu74oqiclC61yZnVl49wK8PFz3C
IY6fn2+bSC7bUDZXQCTtgnuxD2L8J7RdIiONvYpseW5YmLaXc97ynin5Ga4PZuYc
Gl2JaxKkCGqg72YecJo/9mmf/Vy/rbe7r4aNMqz4Djhrel8cRs2KL33zHKXxaLQn
bVGc2q8VwVN5uqNubEHS8yQxEUgJaAkN9KCDLhqfCY1Z6kN9eSvDjB0iESv5Ylu2
SgJx6XLX9Tz7coOiL8Ajx58MGW+gjFDY2j79QGZjKhKXfYbVwmz1aZd24Dyeu48i
15wh60ccI6OkQ61nJjXdRRXBTAUK3w==
=k9NO
-----END PGP SIGNATURE-----

--B6oaQWiSE0NZuoIA--
