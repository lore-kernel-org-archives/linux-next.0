Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795103137;
	b=1Y5oz1DBV27EXlkbJfrGkTJ/uDSJivLhOdxjk5CbmlyDJ0g3su2L0S8nkHynMK+sA5O0
	 61KvRgbw/tPLm8vBuoAJ8FuuyOMXPIIQXL1fSI2B8OCDYai/XTWO7GAOIbcQ+K26YTaFu
	 8VxOYn30A6GsU7U1V0FjpyuQwmHKjyHezPD2RNdzs+KvkpHRieJapjYWnqjkyBc+3RIOV
	 aQ0JK29vjfN0wtpn7A3jwlRrtvpfnh6IGtQIQPDNUd4ZcmawJ2ZL+JaAxZfQWn3YSj9ZP
	 y+O6Yt+Go4bjSV6as+8umXTxYAd9r6QTyLqatzGlIQvIaFT4GmpzJWjPdAmWa/Z4NJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795103137;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:Farom;
	bh=QdkOrWQj9y1BN6Sn95bbETHFhevG0nqUhaeoczAxjKA=;
	b=NzRqUGPq/YFMqasbMFIeYcw1DKlDMExdlgigAj3aVFIvDtVLq8KVT7oI/7fEoei/Rnbz
	 5EVNrd8TVTq2n7QjmxTbX19iF/1Z6shRxGVyEheGvq2XeEqmFwma/qu1sTGTpdgVZqWo1
	 SxCLnv05Gy1pcFZG+oAoFDs1WFyj3ocY4OeaSG24Tl9kLDlXtN3rPJdFFssxLMm3TvMJF
	 MWzqzS+3i2qo+aG9+/vIT+6/SnmTdiolySmFGkzhID69fpsr2DUnQ3AlzyYi3H+pMCWCl
	 vrkk6u6J+TbQar0wLc7W+0h6TFLqku/lNWseeoqiBILGCNCViF42bx3tdjSbYFhISxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQP8A8aE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A13B606A32A;
	Thu, 19 Nov 2026 15:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JQP8A8aE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5961F000C4;
	Thu, 19 Nov 2026 15:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795103136;
	bh=QdkOrWQj9y1BN6Sn95bbETHFhevG0nqUhaeoczAxjKA=;
	h=Date:From:To:Cc:Subject;
	b=JQP8A8aEcEcUtS8xGEN1bERrEGVFhHEiLkETwO1qkXFkF/0xVb4+hpDt4R5SW/CF4
	 /3jYUNnVO9qIU8gLPr6yeNYhdqI0d8deaGBi1Lsn527xPkWwmh/LEOWRK2rbeQc+b3
	 7o6KtbUnnPgEOPdRvoyXsBtmvQyXZE3DzdhDiz+eU5ovNT0S308kbJ0NuLhO7jwmZg
	 /qDAmnfIaNoh8nTYLD7F2fO/+PqgOwLpeNTHssU/nSYBiPwSRhi0gPNfu5Rh4XcW5B
	 aI2c6eU7TGEjSW1zC7sj3a5TkrY7FynUVAQpwo3ZbR3MsOd7VbWycNFnsBXFd5Kz+g
	 iw+c6sNGxzLjQ==
Date: Thu, 19 Nov 2026 15:45:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the fbdev tree
Message-ID: <av8ZkEpTI8GdF20A@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="q+xsiUYLYUJ+lwdd"
Content-Disposition: inline
Farom: Mark Brown <broonie@kernel.org>


--q+xsiUYLYUJ+lwdd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  82b3e4a350659 ("fbdev: smscufx: allocate the size advertised in smem_len")
  40c6df95830de ("fbdev: smscufx: keep the usb_device alive while ufx_data is in use")
  cc8f68ca28201 ("fbdev: smscufx: don't free registered framebuffer on probe error")

are missing a Signed-off-by from their authors

--q+xsiUYLYUJ+lwdd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr/GZwACgkQJNaLcl1U
h9C/lgf7B7FffRWTuGCp0P8bfx0vVWy09P0g5dJIh4woV9g92z6GJ1e5HiMI9Boq
jz/80Ajk5BrOioc2DeGjcmS/efiCZvUJvvOJif0EoZanGxLUE41d9v97lBDo3XaN
T95BxfJd2kbmzU9/OcJjdMz15kQxe01iUwItWIOe6/3Y0J+F8SHx8X2YynMVYNMt
XRHCVXR/RixbBkZFE4owmmYJLFvTIDq9bjALHUFtG8OFZJd3kWm8FLIchxk82gaO
QI8dwRf+vzxjv9YYAzgSM9TNKdMc8HICcrcYM9m1SgYrocgTt9NEFWgPnIv7A3Ov
WGbrbge9h0vlohwGOc0ufgSb7C/MEg==
=KPXI
-----END PGP SIGNATURE-----

--q+xsiUYLYUJ+lwdd--
