Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710119;
	b=HxDuHtsPI18FWyzZesBfKROrqXccWB+bj1nZ6qnqplWTuMcsJPbaRya3+6h15l6Y9FxO
	 9O1ZjkehduuD/sUi/adbC4oggkygpZ6SPtNJRQ8CSlwAd9dYF7Z1ZYU7fR7rqQp/gIMhh
	 6uoy46xT7QIYUBgarhFQjge2j8zOYpkSz9PqLqsyEEI4mJ0DUoEcGC4qIjZUXCThOGwyk
	 QvLswLo/Pcyh8vFr6I/i0OZdA8fjSY23I45ijMa3IJBecWMzlLSkia3ul/L4V5jx9ycDf
	 iuD5XHsqUlQRg7jQayApJN11kDpn5BaUdj0FlFXO6uV5OveakMzYjos78KQkK7jksPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710119;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=DjyoSkeHrskFt/VYYeEDxpGNevCb5BMjjorrIb9Hv70=;
	b=qKiJLtjHn6aOj0pm7DGGQgCStl1GgLzT9jijQgAy1zg6QflKGe+8yW2MpaCQXcNLaIUk
	 gRIf5c2iEUP7lOAdDOCO96NuXp6FRVGp2h7g2V423HupIhoBuJRZtMMFP2gwIBzyIvgdO
	 Vrsgm6aDYuyeaY7bbi1lRFs1peq/lG/QvCW2XmQRUbLoRfo6RFJCKi9YX5wQgvpWJbGuj
	 YJYYkjXvUBj/F1VeyHMfY104VBo6vTnQxrQgNa2dA8VBSpTnBgvEqBzz/nU1Xv5sOjM+M
	 tVMwPoF3M9bjB6tI3+8PEbpS1cf27BvMN7lq2Y8DxkiN5tuaVcqepGD1MSxwQBOHHAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmsqiBeY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC200606A321;
	Thu, 26 Nov 2026 16:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmsqiBeY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2361F000C6;
	Thu, 26 Nov 2026 16:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795710119;
	bh=DjyoSkeHrskFt/VYYeEDxpGNevCb5BMjjorrIb9Hv70=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmsqiBeYc6RDYZctmjbZuGZMGiE3JyFPSGidWSwuw77KjnA9Hjlre0bzdxI13wt0Z
	 rHN8RtjyQn/WGuzK+6ipQI8Q7/knQBz9kSowsBtd9RB0AUtdPWgtqkWE704BfjbxbF
	 sKRm6qhFoRc3rm3hyz5qED5PkbyHSGMd8qlHrNkDL758qUk7vomxKdGORjQY4Jhmh9
	 xBhf0rWzODe6gZUsThipnazNeo1/fLj2buSZvNBhI0FvJcFCiOOWB+5CBFz5em0EhV
	 XqGG23WlJ2ruIHo1nyT5QQeZlsQ/kqA/g54LNgmU4484wnPG0SG5b1kNDvunRh2tvK
	 rl8jUMT24NGcw==
Date: Thu, 26 Nov 2026 16:21:55 +0000
From: Mark Brown <broonie@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Please add the agents tree to linux-next
Message-ID: <db9d3e7d-0bbe-4856-9fb0-b7c396650458@sirena.org.uk>
References: <20261126150925.2347325-2-sashal@kernel.org>
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
	protocol="application/pgp-signature"; boundary="qEPQn2E+6CsevQu9"
Content-Disposition: inline
In-Reply-To: <20261126150925.2347325-2-sashal@kernel.org>
X-Cookie: Sank heaven for leetle curls.


--qEPQn2E+6CsevQu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Nov 26, 2026 at 10:09:25AM -0500, Sasha Levin wrote:

> Could you please add the following branch to linux-next:

>   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git agents

> It contains the agent skills series, which I intend to send to Linus.

No problem, it should be there tomorow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--qEPQn2E+6CsevQu9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsIXKMACgkQJNaLcl1U
h9AGRgf+IqwzLEcBzrwBc+mj1/LpeXDHFo4ry9MVdAzlLdLN68GRFbfbDR73vHgn
RdhccHPt49bJ9Ng5TMVA/Fzhg0SIICYKvjY5lwVTjbUaOEoUkszqKNd1NwWDFdqe
eWjV0QUbWcYMs2kOnIv1gmCGR/6yiBi1IgCy1H8+L9ROU1d56YVnG4aCnEQUr2HV
mjpSFBkWd/MTZeJ50zCCLewUcEMLQNVOvTJjZxNcGgCsHZZxsVXbnpuhrcj9gq2R
m0/p4nGZ5kAvUtneK2sCNjtNEv8RDmPv3T00yfxB3rofTaQoNyoU3mDdb2dZkh3N
jPXZvAmc9Kt8keZBbentNHqxDUCMPA==
=06V9
-----END PGP SIGNATURE-----

--qEPQn2E+6CsevQu9--
