Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793647699;
	b=F8E2Q6AJL5O0xxR43iJWvAfRWdtA+evcgBRwQz82r9Q+5oQ2TCUwk4pClosUAj0l5prj
	 cZSUoZFoWk+oGQuywD8TNSgzpvm88Rsd/lTaap3zfyUc3um58+kDD1o9OfSa+DY+/H8Hl
	 FOea4K9EDBK9FvYSgwsNUVP75ZeqiovNx26qdZtFYFJIMEavtojxLkbcA1Tb8FrXoCYxB
	 AnsvmhzFXvyS542AXL3DRFPw+17/uHXscUzWVbDOPvJUybSGcX7XWJkKYqjXgP5XjTAQ7
	 r8to2FljoKsrRoFR9XNmwt3hSE5KAlvfWoDcfxwE2DU6w6y2qKGxXVO+6OKEyxPRxXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793647699;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=cJqI/4jMSvLwXCoaNyaYCG+gCxa+SKPJp5UtR8d0QxU=;
	b=Ue9XG0dWXoXumqhMrkRL5vNqwsI8DyZ+wfQghZSocMdhcC69YdcjwtdWbr6Uc9bkFNWd
	 zIcqoDtj5iq68na1cYkygTOdo2DFbgdeMhGoRcRF7mCjxdmPxGk+krnSd5JPbrue+TsFi
	 iyt/rmLmInfIUMGAQgKkC9PTqDUle6ESyIdqFTnNSBnBiTzIc3toRZLryIWcXvskS5ile
	 J1/t9LJkSrYXKqaS6d6v9bMSmDxg/SY6+ihikkUQf8+i+Po4qg3X5l2xRv0NR2l8rXpQm
	 KU08hl98/YEtHS1KzMHxAVkX77jeDGwPBeXaalsyRcD4S5RLEvkftHgtqUWYDfF0Cjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXTjEDEQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6BD606A32E
	for <linux-next@vger.kernel.org>; Mon,  2 Nov 2026 19:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WXTjEDEQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 596911F00A1B;
	Mon,  2 Nov 2026 19:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793647698;
	bh=cJqI/4jMSvLwXCoaNyaYCG+gCxa+SKPJp5UtR8d0QxU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WXTjEDEQbYm9qLgu6mBELXnwQbTql0vY/ES6uk6VJsSXS4Sdp6SW0RFqB54ji/Kq8
	 gFdYXgPWgO2lqgAv0B4bdehuz/kcdebx4Q3NR7LBZfyolx2U4mEl/+lzAXQXI0/4B6
	 Tg8CbXNqmpXevJ6Tm8faFOLQi0dRU/9xfCzknywvaR6fAs+b9T+HAwoQ9sFs9W2Ac6
	 EgQm0XGzLEVZWAusTc9sjBjLD2eWImxtUHUvIMvHfDWwLYpggNX+jf0bwVae/blOCS
	 bDv5piFbVf+Jgrz0Aj0ynVM7Xelbasn/OsyoSMtwE886+v5gbt2T9OsEYzXL0dNeNC
	 IZKhSwdT/TdVQ==
Date: Mon, 2 Nov 2026 19:28:14 +0000
From: Mark Brown <broonie@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Matt Turner <mattst88@gmail.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: please add lindholm/alpha.git for-next
Message-ID: <3307ed7e-27ed-4892-935a-2d25693373de@sirena.org.uk>
References: <CA+=Fv5Q-iKk7qhN7TEbv4LuUeNau2iKwSb=vjx_a1w8-6mgEFw@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="DZR0PKippfPjNZCA"
Content-Disposition: inline
In-Reply-To: <CA+=Fv5Q-iKk7qhN7TEbv4LuUeNau2iKwSb=vjx_a1w8-6mgEFw@mail.gmail.com>
X-Cookie: Used with permission.


--DZR0PKippfPjNZCA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 02, 2026 at 08:22:42PM +0100, Magnus Lindholm wrote:

> I'd like to wire up my alpha repo into linux-next, could you add the following
> tree as alpha-lindholm?

>   https://git.kernel.org/pub/scm/linux/kernel/git/lindholm/alpha.git
>   branch: for-next
>   contact: Magnus Lindholm <linmag7@gmail.com>

I see there is actually an alpha branch at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mattst88/alpha.git alpha-next

Is this an additional tree, or should it replace Matt's?  Either option
works, just want to make sure I'm not carrying around stale trees.

--DZR0PKippfPjNZCA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmro5E0ACgkQJNaLcl1U
h9DsOgf/RBZ9zrjQvsWkCAUm7pEUGlf+bX646w+q37yrGeZMu0HQn05Mtrxw+LMl
aqh7lXaAk1OPaEp5Ad+/VelsLIalwRiHQTAQ5xZYkVfExyPnaC7H/Um6G/87OG3B
jsVqWk/FKJ+zVbHi2sq2JT9hRGlC6q2z+vjDLvaSA2hAy4sk/ixAx+dlX598sQqb
Q4+9nOB5kve9e2Mxub7R5EOsnURlwBQ5UVmy9/cgFo1lngEjIxl0k3tYy6/UXyb7
FbwciI5U6unwehcSrzY/9f7VDKgLWG0BCebzCQfQAQxx8Tw8Z+EqrPu1QBhXMZ9e
TSaFlbvPagpgQ8nrw+e3mIaqqs5xiQ==
=alzg
-----END PGP SIGNATURE-----

--DZR0PKippfPjNZCA--
