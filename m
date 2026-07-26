Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA97E3D9DBB;
	Sun, 26 Jul 2026 17:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785088192; cv=none; b=OHa4PxcTh7+GVUlFohMHwdqnLR0hSEViLIkth/50i72mHQM4zW7afxtBNV838O+P/yTWyB0CRsrlEv8q9stiKW7FP0QQXxF8TcLgCLR0uLZQAoV0Au0Hb8DzSKwBNVqfRb7UCrlR+Uub9tckZFfs7JDGqP/Lco3/WJeeHqrMEb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785088192; c=relaxed/simple;
	bh=GiPXXbUPGYTc6AhuSXHxOZM7A7a3z9qY+5FgURMm99A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=slkeoxGx/+COnYnr1ZXRSA9M1DZghtQmTx3PabQnneBYRq1yfvpTNGJGFSmZWctERwDdPBSdsB6X2nnUbm00nQIFx8SrWGzGUSjBDdlrnB9ETb7yd+h7IANgmC7VLBqa+xwuj3QRSH/nDTvkj3q/At2Z0z8wdZ679CHYB7rPnBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=alkFvKgG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="alkFvKgG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8373C1F000E9;
	Sun, 26 Jul 2026 17:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785088190;
	bh=Jvh8vsTj6hKSL+YydJFazqAEslbJ45cQVIZoj9AnmlI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=alkFvKgGwRktjC/rUU7gcUqa2aCQXojZAHnLkyC2eV/pLVXtP8I/cOMxbMLQHPp0M
	 CRn7u0f0NEUkRJWUy7sFr97H2XGmdsYnTwukkVKipb5ogk6OO8zVSTkH+jEukvFUhG
	 J6oaevr/EoVOK9A8prwF4ERsjsSkHgv3pWlQzuSxXT+59hKvh5xOznB84b2iYcSoUa
	 PZo2DrFUErET/CVEcL4Law1nhB9wYYl9UYfb19xM49DNWHMDmK6WBPkPm2GVZe3cCk
	 ItYenKWiKZOmektAo9sgHNUUwkPxQUcKqzy7UEP7u3d2Cgesi8to/nkj+74SEMkUFg
	 lWAmHD/niw1/g==
Date: Sun, 26 Jul 2026 18:49:44 +0100
From: Mark Brown <broonie@kernel.org>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Theodore Tso <tytso@mit.edu>,
	Alexander Potapenko <glider@google.com>,
	Christoph Hellwig <hch@infradead.org>,
	Aleksandr Nogikh <nogikh@google.com>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>, linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	peterz@infradead.org, will@kernel.org, longman@redhat.com,
	mingo@kernel.org, gregkh@linuxfoundation.org
Subject: Re: Policy regarding linux-next only changes
Message-ID: <0e5ea495-07a2-4f83-8fd7-c90563bc12c4@sirena.org.uk>
References: <CAG_fn=Vf==zhGjSNPcFC0=n9cw+NrBp+AqXgcmcV0uQBAcL9TA@mail.gmail.com>
 <c0bd6bc6-17de-468d-850d-df9955e2c142@I-love.SAKURA.ne.jp>
 <CAG_fn=UEo8PNvjAcTTqmskfPrJNSjshhuXsR_PaH0-YLWwMTRw@mail.gmail.com>
 <bc3703bd-65ee-4182-a742-56603d9b9bac@I-love.SAKURA.ne.jp>
 <amEAzMTbA9R9HgN7@mit.edu>
 <2c903636-532f-47b5-9894-00470f235682@I-love.SAKURA.ne.jp>
 <amNsDFyTbsyAASjt@mit.edu>
 <58689827-9211-4f26-9777-51c0b5e1eebb@I-love.SAKURA.ne.jp>
 <CANiq72nXO0noq7qqLqvQuuAGjP1DE+k8=C6sZ7DZ2xYFCTSPPA@mail.gmail.com>
 <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4jII3kbUPluXFWYr"
Content-Disposition: inline
In-Reply-To: <8c3d90d5-747e-451b-bdcb-1cfe1d5fce53@I-love.SAKURA.ne.jp>
X-Cookie: Necessity is a mother.


--4jII3kbUPluXFWYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 25, 2026 at 12:44:17PM +0900, Tetsuo Handa wrote:

> Excuse me, but what does "successfully unit tested" mean? Broken patches
> that do not build, or trigger oops by just "/bin/cat" _are_ arriving at
> linux-next tree, which in turn preventing continuous testing by syzbot.

You're supposed to make some reasonable effort to ensure that things
work, if you break things badly enough and pay little enough attention
your tree will get kicked.  To even get merged in -next on a given day a
tree has to build in some of the more common configurations, and not
break KUnit.  It's not expected that everything will be perfect, people
can't be reasonably expected to to test all possible configurations - a
big part of the point of -next is to pool coverage - but it's expected
that people will be making a reasonable effort.

> I am OK to post my debug patches to the relevant mailing list. But without
> responses from developers / maintainers, my debug patches won't be able to
> find a route to linux-next, which in turn prevents us from debugging.

The other side of this is that the reason people are noticing that you
have added these patches is that you are causing breakage and disruption
for them that catches them by surprise, a lot of what's coming through
here is that you need to work actively with other people.

--4jII3kbUPluXFWYr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpmSLgACgkQJNaLcl1U
h9DS8Qf+KMkd/HoVb+nCK4wwPjTnKea7jDUu6gETxmGwGOZsLQhbPVWjenyfuGj1
V2xz/3I4f3iTFXWTLuO98BzbmAt/GvKNlVTPjtJe68HtFEdizyElCwiUntGUp2B0
aIGp91rKSWpzGyi0jCpjQ77msgel7OTLramYa8rp1+/Ihubab2mQFQQNoaEhh6cY
hHUx6J2sdzsHIeI1VtvS8f+TzR34qFeCpR3QykJTlQfPZxWFLTl3QmSLawTCsjfu
jjk0z74BMol+ZexJuycQHzDATTdyWpq/U5nWW4tpql4o2TLisMVLeQU5AM+t1yBk
yii5pt8YT3S0As1cEQxjlz2Gpoutfg==
=vT+n
-----END PGP SIGNATURE-----

--4jII3kbUPluXFWYr--
