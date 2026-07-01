Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10EA9360EFF
	for <linux-next@vger.kernel.org>; Wed,  1 Jul 2026 15:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782921019; cv=none; b=s6Z8TkMdXG3vXksVud8h2HBWkegcWcv2glxxOWdcpXFkw59+2HMV32pGojm6UZzAyZInKeePoLns/9bJpaxVnyQnBqsAY9l64IXSduXBKFuugWMLvlZhwoBLJ2uqJIPWgBEG+N8awpyuZjqQbMAgKuvFITeHX8GtdUGRL2Gsb5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782921019; c=relaxed/simple;
	bh=FnKnSSQ1y2H/JwPm5L+Pm2EZ0l2gh6AOBD1Sq3jZk8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fu+tmIMItf85oTHaE9DEzJyV+9f6290jKCTwawvUzT8fQM0lPS7bzOwsSj0kX/TAM56Q2BqXTlbBenGJcqPks3tqE3mvSBL/4UD+hej9yorch0gXaW9ZeaQdX5hUId2DE11S2D6++Om4U41MReGIY97FelNIU037jl/SYEbWXu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9rv+shM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9rv+shM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 118971F000E9;
	Wed,  1 Jul 2026 15:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782921018;
	bh=FnKnSSQ1y2H/JwPm5L+Pm2EZ0l2gh6AOBD1Sq3jZk8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M9rv+shM0HSTIW+PYJqOkhE3WuJELZTjDc+qzz+vwo9pm4eI0P8b8xLzLWKqh5fvx
	 X4saK+G77WzSs7GeB9LY8PQ7kinlKWGAHpzS4L9v6VTra21TriOqnHvBuKQCj8bt2n
	 Z+d2117oVt6PmQDNV3wv9FnbKEcv3HFjETcVwqJIS2xNDHQh7curZfL/EPG1twS659
	 lgrXhlNtrB1hXTs4LPyKv3ajh1h/1/LOV38TjxNWlUv3My1UdUcJ+Y4dO+s9Cu4/Gu
	 lBVEItC4PxEuk80uOdMJhFpE0nptiX2MmZ0/7XeulBOjyn3merPhIrLpd9fX+hdShL
	 1ECYkBSoGJWNw==
Date: Wed, 1 Jul 2026 16:50:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>
Subject: Re: Update i2c branches
Message-ID: <c4c49e08-262a-4dc3-8a63-b0c68a4f98f1@sirena.org.uk>
References: <akTXuDVi8jBVAwWu@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vrZXyfx8VjDWBuUV"
Content-Disposition: inline
In-Reply-To: <akTXuDVi8jBVAwWu@zenone.zhora.eu>
X-Cookie: Do unto others before they undo you.


--vrZXyfx8VjDWBuUV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 01, 2026 at 11:08:57AM +0200, Andi Shyti wrote:

> i2c/i2c
> i2c/i2c-fixes
> i2c/i2c-next

I've updated the configuration for the fixes branch, that'll be used
=66rom tomorrow.

--vrZXyfx8VjDWBuUV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFNzYACgkQJNaLcl1U
h9D3mgf/SRCQ1KYjVZMM3ReluU+T3vXldVBO6qvJuMCS3nhw3vNhX7P4J7yHT8pu
ey52B2efLoaEGMRFK93ZXFsnPQWmXU26W6EfeBjgYAwx6Tq6TB+f+7ZRblEioACW
gYgMIlB47r+WknfnWOg/5jkdaKxfE5BDKtZDcuZqdTGXmshydEgn3giM84/A0ojT
WZvgdG8ho8cITgTyGnmkDOCP1xh6tL5cq2w4pFVbZNSC3shI2DiV0GMMsW/XeQUX
4iYfKvMJLMMzSUHjcn9hlKr1zqx26VyUrRWRwHYhob/QIdGi2bS5lO3b7Bh/xIcn
gXh3lCIVhBJijDJ+gCPVeoNjt2V/KQ==
=dG8K
-----END PGP SIGNATURE-----

--vrZXyfx8VjDWBuUV--
