Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4266631B83B;
	Tue,  3 Feb 2026 18:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770143218; cv=none; b=kVXLLdYMfz6uaEmP42TzkFRUtJ1KA0PNBnEtCyh/5Qp9BWt7XMiB0CyrvrMBO4P5z5DnoVrwtilRfYTnBUfibtLBIUQuFwYdDem5FFOuV3SkanpLge8tnnxTPtgcWCkn4Ol5x3YoYf16pmgD21+iBsdPfLsGfPKsi3//aAl32Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770143218; c=relaxed/simple;
	bh=zeB2S3w7onqdAeN0kxM9NydRbxSVel7JYqM6jR9Vc98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOZklRZEAGKnPAn1zMlHm8LM9gVtj5JO4q+5NQVd1hjPxyjIG5p6zE4YivevnW+dzAjLpp8nxllVAGkOzWec0wi3BHlgt1KkiYTIluL02MMjw7H6u/XXcV5zNnwS1T1w7gPY4E53FkL1ha4FHr6EiZGXMkYe7iHrSWYtU8bPbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i0hAAtyA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i0hAAtyA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD57C116D0;
	Tue,  3 Feb 2026 18:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770143217;
	bh=zeB2S3w7onqdAeN0kxM9NydRbxSVel7JYqM6jR9Vc98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i0hAAtyAq0X2BMx5erg5o9lETn1cR699mIZcJtrXUmiDEkrN1wf2oqswa1PX3xyyc
	 FQgs5A0UVtcn0Nr0gqpOMiUM8I33FZZgbm10pFJqBt31WZuOb7BAyf0W3pZT2m9dwE
	 bD5MM5U6bID6hIsm5lGBL9Hoj9Tg1nTuiaCtpeQmsOAYLZdSISpHt2y+CbrR7KtJRo
	 UD1SgeOLHS6cT7X5NxMCvYtCA6eXMGkMM9klVFt0fYpIAWJWNnTZSN3C4EWEXwXwYD
	 W+Rt/aK3IxDW8sjNSxYzYssHer2DvhFXZK9PiCRRSX+cyLc8z4pMdFPdXMbdcxYhEm
	 sbYqbPV2dbyRA==
Date: Tue, 3 Feb 2026 18:26:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the leds-lj tree
Message-ID: <3cd56914-a83d-468f-9a1c-76c24cfd2c5e@sirena.org.uk>
References: <20260109124558.25b0eebc@canb.auug.org.au>
 <aca32e97-9fc5-4cb7-908c-a4410ff98055@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c5J9nDVkPWFSbzY6"
Content-Disposition: inline
In-Reply-To: <aca32e97-9fc5-4cb7-908c-a4410ff98055@sirena.org.uk>
X-Cookie: Your supervisor is thinking about you.


--c5J9nDVkPWFSbzY6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 02, 2026 at 02:56:27PM +0000, Mark Brown wrote:
> On Fri, Jan 09, 2026 at 12:45:58PM +1100, Stephen Rothwell wrote:
> > Hi all,
> >=20
> > After merging the leds-lj tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
>=20
> This issue is still present in today's -next, the leds-lj tree is still
> using the version from 8th January.

This means that these commits have never been in -next and we're at -rc8
now:

Daniel Mack (3):
      dt-bindings: leds: Add issi,is31fl3293 to leds-is31fl32xx
      leds: is31f132xx: Re-order code to remove forward declarations
      leds: is31f132xx: Add support for is31fl3293

Nam Tran (3):
      dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
      leds: Add basic support for TI/National Semiconductor LP5812 LED Driv=
er
      docs: leds: Document TI LP5812 LED driver

Steffen Trumtrar (3):
      dt-bindings: leds: Add LP5860 LED controller
      leds: Add support for TI LP5860 LED driver chip
      leds: lp5860: Fix unused-but-set-variable warning

Jishnu Prakash (2):
      dt-bindings: leds: leds-qcom-lpg: Add support for PMH0101 PWM
      dt-bindings: leds: qcom,spmi-flash-led: Add PMH0101 compatible

Lukas Timmermann (2):
      dt-bindings: leds: Add new as3668 support
      leds: as3668: Driver for the ams Osram 4-channel i2c LED driver

Duje Mihanovi=C4=87 (1):
      leds: expresswire: Fix chip state breakage

Haotian Zhang (1):
      leds: qcom-lpg: Check the return value of regmap_bulk_write()

J. Neusch=C3=A4fer (1):
      dt-bindings: leds: Allow differently named multicolor LEDs

Krzysztof Kozlowski (1):
      leds: lp55xx: Simplify with scoped for each OF child loop

Vivek BalachandharTN (1):
      leds: lm3692x: Fix kernel-doc for struct lm3692x_led

The leds-lj tree in -next currently contains only:

Lukas Timmermann (2):
      dt-bindings: leds: Add new as3668 support
      leds: as3668: Driver for the ams Osram 4-channel i2c LED driver

--c5J9nDVkPWFSbzY6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmCPe0ACgkQJNaLcl1U
h9Atrwf/X4IQkDzAS0fJiefJ6Z4YDz3y5kR1fLMvEcHMbxB/sGSlRvUs19+tdugT
eORVmPYLd+OQDH8k93LSr+EjeuODDjhu/tjG2qGo4ylEI4H77GlZBj9GmH//o7S6
G3XtlHVsohrcYMkB7Kq9Yy+WZ6exalCFo1Q6KwlQtn7iiIPpXZMAtmEUS5+8Gpdr
0FEKYgabKwyF5cTbDe4KGPJ566ElMgCKPJiETSVbY9o2kvtLm4nt92iuWE9XLbgj
xE2DhHZiEr1b98Jpuhu0nJWx3RwrKmBYMveWA8VCxbJ+VhnuvacmEJlSGpCkVY9U
/Gkk6zgfl8gqIFZNW7IP2jFZzYyXXw==
=+BgO
-----END PGP SIGNATURE-----

--c5J9nDVkPWFSbzY6--
