Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C4D4503B;
	Tue, 18 Aug 2026 19:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080662; cv=none; b=o8FrNiHuGNxn597R6Dz2K1RPJDCDdijrhy0LC9KU3XUqtrGBW43fRNHt5AkYGnaTwgZCFbrReWbCEVU1XAGdy8/VC6IC0f9KFYfZVu1gcIF8yXH+aGvJTc3BKycCk1PBVtHHR7tTqoffOExG6nh12nKs2VCMuMUwrdfzCpglwRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080662; c=relaxed/simple;
	bh=VvEUb/+lG11PoIjLmSdgoWFRSZwS4uIvggGCegbjAKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ixH+lmyPkhatlu4Ywn/wJePydZWUp33oh/3nIvmECpwe9WWtp+XfJc4ktsqc3jCyZGq7s/uP4DO+bToCNtf3+bIEIkwDQ4MCAbZv5CBwckLls2AxyNAVeCDIAiA0fzPpnA7vau7dhCjdul2oEoYoMCB6T7S7YY5405IBQdQ41GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSbcKZUe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSbcKZUe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E783D1F00A3A;
	Tue, 18 Aug 2026 19:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787080661;
	bh=RFJC0RPGE7wWQLEcr764nfFDJrhN57PaGsLdf10EvSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fSbcKZUeg5NpWg6dFYTfCEsLr04uUPDhOxHOVbAoovKwAQ0DPioomi5VnHOYrFM6x
	 eskT7o7xgeP9YvdP9PnqzfaZ3gIKhZJWMMnZoKxDtgZZGkd2PPRFLtu9kGVUzmgZBp
	 OnR5cvzSaRN8aobiOxIEn2sBWts7SjRAE/Hsn7mWKDvvc1A099/jiQmv13mLHivP7y
	 8Az+S1m66YhbCVTfUo4APUNjOgJ/Fm/y+bMymQ4JdtjV3zMBlnqo0U0I7LxlaHggp6
	 BP5e4NK/uGfZ1yuLwa4eGTeoFUW8kS37NSAQVCXtMUA/UGCtREsSTsaM4U27n91mBY
	 mf00iHiQCoZdg==
Date: Tue, 18 Aug 2026 20:17:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Shuah Khan <skhan@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	David Gow <david@davidgow.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the kunit-next tree
Message-ID: <a2b3ede8-0cc8-45d2-9841-0d8d460cf021@sirena.org.uk>
References: <alrCeerj_TmaqUuP@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dOiYU2O7I386aJ0t"
Content-Disposition: inline
In-Reply-To: <alrCeerj_TmaqUuP@sirena.org.uk>
X-Cookie: Smile!  You're on Candid Camera.


--dOiYU2O7I386aJ0t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 01:02:01AM +0100, Mark Brown wrote:

> After merging the kunit-next tree, today's linux-next build
> (arm64 kunit) failed like this:

> [23:00:36] # gpio_unbind_with_consumers: ASSERTION FAILED at drivers/gpio=
/gpiolib-kunit.c:393
> [23:00:36] Expected ret =3D=3D 0x0001, but
> [23:00:36]     ret =3D=3D 0 (0x0)
> [23:00:36]     0x0001 =3D=3D 1 (0x1)
> [23:00:36] [FAILED] gpio_unbind_with_consumers
> [23:00:36] # module: gpiolib_kunit

> This is caused by commit

>   a05cfd98c5eca (gpio: kunit: add test cases for software node hogs)

> which was from the gpio-brgl tree, it has only just become visible since=
=20

>   34b5c0132952c (kunit: configs: enable GPIO kunit test cases in all_test=
s.config)

> was added causing the gpiolib tests to actually be run though neither of
> these commits was added today (the KUnit tree did not change for a
> while).  I'm not clear why this has started failing today, presumably
> some third commit from another tree has started triggering a regression
> since neither of these trees has changed.

> I have left this for today.

This issue has now reoccurred, the KUnit tree landed in mainline but
none of the gpiolib changes did including presumably whatever fix David
mentioned.

--dOiYU2O7I386aJ0t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqEr9AACgkQJNaLcl1U
h9DGzQf+M0e8pm6nFimzeypiJs34taUb+gLsMp8sHmW1D91bA+OpyuFGu1bPgb/d
tW1xF4fLFybIw5QjwIHWGLTaGy9hHszyhyiIhte9ZbMAF+IBo2W6sFfF7jRqMztR
uksXyv+qUy95vxiSHuZqd/aZEFhS2byjsz3+NbWNLa4Gcyzm6o+MK0Eq2bEDZarG
gw6RkZpuECuTlMra0CX2SavJACT7CYDZc8edgF+DzTMs0bOp2p6E8q/DobvHzy80
jiE0AVmdfi1ols+7rUmkwQgmDGYgY1TI7fyGo8IJtWE9w9q7d3Y0LiZlltE4cHfw
uB0nLsZZFDnQZG/2co7d1RNsJ9ReNQ==
=uGM/
-----END PGP SIGNATURE-----

--dOiYU2O7I386aJ0t--
