Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C4233557D;
	Wed, 21 Jan 2026 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769017651; cv=none; b=RNChAzrVwNanOf3QAg4qHJuZFQbWuvGsbiKXk//d6hIvxtYmuUYT3U58r2ccDFqpn7Dq1x2efRjq9WxZfp4nVq4qTDFJ9rvmmFNYROVvpbjdUKY9B61Kuttxm94eXPd0bCWRocFmOPzxCOsXMvE2rgVoY9cd/5gfoWa7VfuAF4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769017651; c=relaxed/simple;
	bh=O7kS/kTRC6xAS9F7Mn2OcAAsjEPaI6OuZbSoxstfSUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UcaqgU/I0mua985QmD2R/IUZpwB9J/2z1TxH/hrikWQKnXcN5UmYmZtshh5wZOdNBm5AD49dDOUO7+lXkBoOWIde2X0EGfxytEn2oE8VZkMTyDRduLaSfyFqR0ehRvao7kGpqu2wpz38hdymw6RsSnMQpSo1ZK5/XufsNMFm9U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2z76zc+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2z76zc+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 843D3C4CEF1;
	Wed, 21 Jan 2026 17:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769017650;
	bh=O7kS/kTRC6xAS9F7Mn2OcAAsjEPaI6OuZbSoxstfSUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S2z76zc+XbP0Emkp4kXFN8ErIp2yBVHpYSU4pOyl5fuSRQWXvXqUqkaeEGO39Z2Yf
	 yzd4FRAIMjVDwAaE6Cq6ixDD/PLXSK5dbmp4VESgzo96xmZMnR5oH71yYI+ZMsjruJ
	 Tid7eMyZfiSyFPmzLbiqaXnnakpdrp4f4PJ4IDQck5f+JEG6wOStZch/jsMjnLcOqv
	 Z2pkz2M2ybh4ukyiTph131Ex1rseYP2UDWc6G6C15D4ETn0YwV4/9rue/0I+kxujtM
	 xBF2/9xai7rz1vU2NfB/QKrXQKcJ8iht7iuXG08FUgaxfgXtYh74qXvrVfv5s1Tslx
	 Nwalc4l+5YK3Q==
Date: Wed, 21 Jan 2026 18:47:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Fixes tags need work in the pwm tree
Message-ID: <rbxkqwyofcjq3rcf7m574k4wk4txnfenik5w7nedjsyfizfnui@pdskd2ktehso>
References: <aXC16aWHr9SPX07J@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3zqoomxditvh2a76"
Content-Disposition: inline
In-Reply-To: <aXC16aWHr9SPX07J@sirena.org.uk>


--3zqoomxditvh2a76
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Fixes tags need work in the pwm tree
MIME-Version: 1.0

Hello Mark,

On Wed, Jan 21, 2026 at 11:18:01AM +0000, Mark Brown wrote:
> In commit
>=20
>   d2252319f89e4 ("pwm: tiehrpwm: Enable pwmchip's parent device before se=
tting configuration")
>=20
> Fixes tag
>=20
>   Fixes: 5f027d9b83db("pwm: tiehrpwm: Implement .apply() callback")
>=20
> has these problem(s):
>=20
>   - missing space between the SHA1 and the subject

Fixed, thanks for the report (and picking up next maintenance)
Uwe

--3zqoomxditvh2a76
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlxES0ACgkQj4D7WH0S
/k5PPwgAn8LxLY8O9wWaGWqgqjFKmIhKAGDqbtWk2zuglRcm/bX4ulViJ3AS6/M7
NRXbymz+fDPCb3eCpLq5vbF+IrQXG+0G/J9FCOob3ipkVuxF/CqIh5snb45awKo8
TIL8+xgH4rAboiwpr4vDk31parxJBwJVoHuBDm8XGGP7sjRxyL0OvoQNij54lUZ6
pOqJfbv2ulr0bP4ZtHTxXgEg2/P7SuvjQ2i1bPS4CgAPQstpn2fgKOgBHyY//6P8
UBONXLR75+j323tTuyex/xrtPeQCVM7sA1Hf8O3AAbtyoW5/l9QFjsV+LIXwVofQ
7nLdFEcLpmwKuW51bWWoUBAcGoTeXg==
=JIKU
-----END PGP SIGNATURE-----

--3zqoomxditvh2a76--
