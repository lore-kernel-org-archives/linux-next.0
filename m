Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8731A346AE8;
	Mon, 10 Aug 2026 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401513; cv=none; b=OeJd7kw763V4vAaJvFJOYyp1+0IgyNMSs4ZVuJPlZqfYfHuNY6BU8Ulk69QwcKFaVTtBY574W98m3oaXxblnuWpHjt+Lt9EQfNrD98LRqdR1kgRUv9jjKBEMC7y9WJ/o4G1bIoCYMSFfm8ti9a6nFKGTlTnm9Njn2JP0DoKKlWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401513; c=relaxed/simple;
	bh=MjUxfZt/nVuHQNpZidlX11Q5WcVRPj4KrKdon5mMttQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WqWggkF6Ty03pR/YGZRhDWPREvkeGIOFfzsYPbYeIjzg7RnjHn6O+e4IkdP/NPusbOCiqxvOV2NW8ALS8heBiDMgx6f0sOvj0sDeGgsOaIMZVtDlZBPXTwzFU8AzrCx4lHjT5TDKQuScsLpBFMrOkjdn7ymZX3A29NqiPd0taJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U89KR6/2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U89KR6/2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6708F1F000E9;
	Mon, 10 Aug 2026 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786401512;
	bh=QMnid/HgycTQ4b9Ziij1wpugGBhe1ZotETjjZokMUWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U89KR6/2Yhosk9mkaZZx9tsqniy8o5VcJubEfiwkpPzP/l6a2+pbo73oX3EEDbRQT
	 W8x99VcQlqa1QE1R8B58Xl7+CMKDE//eFefN280XqJkawRwSZMCWeUryWnGvUpNfEP
	 vqFmni0fx7BwojJEZG0d0L/n2CQTvl2xquwbh5EBDSvjEp4M4zy2MtDcasyXuW1QvM
	 dtm8K9xJUX4SS58gJY8yycG5skr0ygv+h6ZDLn+ViWf7A3JjeaTJTuzJsygwvbmvlJ
	 64c5+t0zeNNDl7+oP/rWPOJFzgtF09m3iIgD/kZV5IGpHjIC47glXZLvVw06REVHjs
	 FlmuyZxtSsVTA==
Date: Mon, 10 Aug 2026 23:38:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the gpio-brgl-fixes tree
Message-ID: <88aa37c5-991c-478a-ab7a-09a64417128c@sirena.org.uk>
References: <annCPWw4OuVUI24u@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tIUb+RVrk8vORn0b"
Content-Disposition: inline
In-Reply-To: <annCPWw4OuVUI24u@sirena.org.uk>
X-Cookie: I thought YOU silenced the guard!


--tIUb+RVrk8vORn0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 01:21:17PM +0100, Mark Brown wrote:
> Commit
>=20
>   600411ea1f244 ("gpio: ml-ioh: use raw_spinlock_t for the register lock")
>=20
> is missing a Signed-off-by from its committer

This issue is still present today.

--tIUb+RVrk8vORn0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp6UuMACgkQJNaLcl1U
h9CImQf/c3nI0UkjltI0Q5jOLidjEKoIVCya0vsOBbVuNQq4MzjOkzkRmuCd5Nxh
EWKj9lJOtyW5gazx7b3D0IOp2ZYyj8oFTi5UEMlf7K5+BtLhEeVkhlWsBbaIxAeE
WUPqNxIYcNK2Jm3wb7Pl0PXstlqJaYmt5xS82ij0XqxOsWHwhuA+zHp24m/YnrSU
nh0j23lXfe3z78IdAQkAEZQGuB5KFvGCzZTGQDmKcxEd32yOoMF+/COFlpV2oh5w
wGYH4ZcI1uFWOHm3OkR0/LcoYM/F+jBbKOBpJzen6FapNF5ULNfGk1T6pl9QDeYI
VvrZaX5xKib29HEg2i6Iqs+oU36SNQ==
=/tDK
-----END PGP SIGNATURE-----

--tIUb+RVrk8vORn0b--
