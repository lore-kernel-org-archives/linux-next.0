Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795802878;
	b=YlejiZdvVd9n11j8tqjBlEz/QGa2CGccw7Rt9o4ONGsSnfgxUVDrP5r5mlt1PRKRLvtY
	 CSawldM1K2d/yD43/65Y1+pN/uSlpezsF+SzKhpkwnfpyiKtneKfLy0Rr1rJU82zLILs9
	 KeXO+cva+iQ6l7P3Wnl/+erDy8uDKjrDJ5HpnyUDdQdMPDbnrJGR1+x782Fn/XeMZzt8M
	 QbjnSeZfbqmzPBfBlckKIBZz7HH33yFKxnHr7FNZ5aZo4bm+GwBj4swQpFjfq6VUF8CCD
	 wsKW0BSmcwSN/EIBg32lxj+eUHx5FeU2aprG5OZJhyJZbgkCz1tXBBPeO8wCBfUxo9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795802878;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=5y3gX47aL+a5ECOhXR31llFpbolTM1SdG6tal4/GfNY=;
	b=UKQ3pmAV7wwA2ShbduszwBKPA8InkOFLKeArQwn0QDPrc70eaLu3Ye2XxSdq2Oua2q3y
	 /jCQsrzgrWHBjzTo8G9x6o7yVzUzWEaVhNZ8ECfx9AlxKnOZg1lGndpfj3VhXdpfLLa2j
	 DX5zQMfmOjLhGPa9F8proqkIJsU9zAf8Tygf2vDCqJdqLMKI34O9dMXMas8wz+Hj56V/l
	 GnJCfY7G5BjXYOx0VaAPGJ7QsSNl0UaF/8PHCzBRx+VGDrc53NQ8CTTPGuhfae7BPBKRM
	 BF6bkuBqY/5nyBeVQbgLjaOirrXVUuo364u9hihnGWfwJGFTF4b7cxyryZ29juqKyQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXS9hp8R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB83606A326
	for <linux-next@vger.kernel.org>; Fri, 27 Nov 2026 18:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SXS9hp8R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3841F00897;
	Fri, 27 Nov 2026 18:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795802877;
	bh=5y3gX47aL+a5ECOhXR31llFpbolTM1SdG6tal4/GfNY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SXS9hp8REsinxtrq74vBhzocfJETxiY6fbEUdjF+c0ajw4aFsaLZ6XlNBjBU4pITh
	 mhH9FqAdsyO8J02fHoWM+1JqIO4DRhJrN0Z4S8JNDGRzFR/9wfocKZbL+RYixrBq42
	 WhnV8P6VgkNyJFleKUIllhQQ3k3U62K+9zOP0RNFbNDLeO3/8+0+5RvSQiIWZKb/bV
	 gn+EEHSnO30JlnDRiVipE1F3vy8/pjTKBMC77tEyhPHaIGzjAaMHwwNPK2tM/uZGMl
	 4ExHfKPzoBSLZgHrsxYbUZRNWp3UAQB14PHQZK9mBk/RLxNVtJ62oeLdLgTzw0SdrR
	 hjRZ3fSsh0rrg==
Received: by traversing.sirena.org.uk (Postfix, from userid 1000)
	id 13DB03475F42; Fri, 27 Nov 2026 18:07:54 +0000 (GMT)
Date: Fri, 27 Nov 2026 18:07:54 +0000
From: Mark Brown <broonie@kernel.org>
To: Magnus Lindholm <linmag7@gmail.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Matt Turner <mattst88@gmail.com>
Subject: Re: linux-next: rebase of alpha-lindholm for-next
Message-ID: <3e2a1072-7013-4655-b71c-18b03a685754@sirena.org.uk>
References: <CA+=Fv5TFkNnRrYRfJUrnABEqyWtLrcGFgqHgWZP9yS05eM=P0A@mail.gmail.com>
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
	protocol="application/pgp-signature"; boundary="avymtHNBNkRMLLlP"
Content-Disposition: inline
In-Reply-To: <CA+=Fv5TFkNnRrYRfJUrnABEqyWtLrcGFgqHgWZP9yS05eM=P0A@mail.gmail.com>
X-Cookie: A watched clock never boils.


--avymtHNBNkRMLLlP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 27, 2026 at 06:48:44PM +0100, Magnus Lindholm wrote:

> I'll update alpha-lindholm, for-next branch, with a non-fast-forward push,
> rebasing the Alpha queue onto Marek's stable
> dma_alloc_coherent_node_api tag at 31f7e12d621b.

That's fine - you don't need to tell me about stuff like this, my
scripts just fetch whatever you've pushed and try to merge it again
=66rom fresh every time I build -next so it's all the same to me.

--avymtHNBNkRMLLlP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCawnG+QAKCRAv73Ows9A4
iQsWAQD7xCIipCGHIX/Hrcv7SbKb35D/egFd8Ue0KztzN2qY2gEApWtwdGj889zG
SgwbIIgm22tDq7Re0BFyZ+q7SOMf7QE=
=gLk4
-----END PGP SIGNATURE-----

--avymtHNBNkRMLLlP--
