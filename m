Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433C421C9E5;
	Fri, 23 Jan 2026 19:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769196846; cv=none; b=Sw9JN6Nm6+i6xm6WMWGl0v0PcwGjhj9EUF8LakzYqB3ZZL/6vZLRmUQzjcwMLNnFC9RTZlBitF5kHy6wDjoHmhcqdtscXDAuKn936IYMGGOasQ8Yb4TmKtLAidYtqrY53lgld/lplQZi38BeDs9gWnWkfBOFav92XxjQs2/RBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769196846; c=relaxed/simple;
	bh=C1hDKoccvnXwqFf6jIwRffYDiTPm81MZ1Wk7IAPPrC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r690gH3L7BRk9W+dCC5cShGSk2I2go1Bl0c+qsOzqBA2JrxF+J2rW5Il1zOoSU07YA/RRDZTc9ng/glQMsmP2SkRD8TzBYLjcG0w/OGBECkJN15r8O081pFr45VAxDyZpWBEHhvGNKt1KxF7usic6uMkYzYKopUoCIrVGIQrLt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyvIF4I7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyvIF4I7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9F31C4CEF1;
	Fri, 23 Jan 2026 19:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769196845;
	bh=C1hDKoccvnXwqFf6jIwRffYDiTPm81MZ1Wk7IAPPrC8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FyvIF4I78htQlfjOAZRq5puqSgpTm55jV9mYpkzWIO8pOlH2bXcFoytPakTacwTq6
	 MF+5naccU1LEgyT6+ruipBRgHEW7rArcOKiC1hZBhMLFr+TdlgMuKKiPwGOXyL0SgW
	 WvoFEtidRYDFFmjBBV1+jv4T0bap7FFFGbTT2+nokuJAJDnYwbC9k8E5tuhOQMgrIU
	 ZpkFbVgc3aC1cmkBr1+KGX0U48kdSrwDrlZ2em2R5w0DfpFqNtc7C7gSSe75tB2d+u
	 rejHk+CaJo5YCenI1k6W5/IhtvIGzkandkPFpxJB8g8zROuopAYhvwM4ObTTxQLABk
	 EdZj8+jVsJ/IA==
Date: Fri, 23 Jan 2026 19:34:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Jens Axboe <axboe@kernel.dk>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the block tree
Message-ID: <521f2cf0-45c4-4e20-be36-aded868edaf9@sirena.org.uk>
References: <aXOzI6sVTBTdJE5j@sirena.org.uk>
 <cb962e32-7d04-44a1-b99c-4d1889ffdbf5@kernel.dk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iTcJTDvr9wN09WiY"
Content-Disposition: inline
In-Reply-To: <cb962e32-7d04-44a1-b99c-4d1889ffdbf5@kernel.dk>
X-Cookie: HAIR TONICS, please!!


--iTcJTDvr9wN09WiY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 11:00:55AM -0700, Jens Axboe wrote:
> On 1/23/26 10:42 AM, Mark Brown wrote:

> >     inlined from 'io_uring_populate_bpf_ctx' at /tmp/next/build/io_uring/bpf_filter.c:33:2:
> > /tmp/next/build/include/linux/fortify-string.h:480:25: error: call to '__write_overflow_field' declared with attribute warning: detected write beyond size of field (1st parameter); maybe use struct_group()? [-Werror=attribute-warning]
> >   480 |                         __write_overflow_field(p_size_field, size);
> >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

...

> memset(bctx->pad, 0, sizeof(bctx->pad) + sizeof(bctx->resv));

> which should clear from offset 10 (start of pad) for a total of 6 + 48
> bytes, which is 54 bytes. The size of the struct is 64b.

I think so, it's checking that you're not overflowing the field you
specified rather than the struct containing the field.

> I guess the part it doesn't like is that it thinks we're clearing the
> pad field, which would of course be way overwriting it. Guess we can do
> something ala:

> memset((void *) bctx + offsetof(struct io_uring_bpf_ctx, pad), 0,
> 	sizeof(bctx->pad) + sizeof(bctx->resv));

> to make it happier.

Lovely.

--iTcJTDvr9wN09WiY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzzSkACgkQJNaLcl1U
h9DpwAf/QbhlkUtpPiG6Aba91DDjepPQayVktgoBo7cBuLAzc0LB1Klw4SRCPvdn
SNpNKSccUxp/w5xrIujWwrmaxa2u25fjBgRhh7G3K5LmIhSwz7t1PbPdAQRlmYnL
827zvWmT+OE+EkGnkMYG+CM2yBwBJNEtHwLplSOBAMENTT6L48+YE76FW3B/ZM1Y
99bkiOcHjo9xxerIydsr6g5MODgDD9+zWm533Ca+19muimphVtFGvfN4dwxkv20l
bLWw8wHCIo4lGZtZpoQE3Jo8EPvL75Ho8NCEXXg4TFk1tP6a+yqDsfgu4jNBg14T
9n+G1LZmwBUqjk1YDbhYnwqAbS3gFw==
=3jhM
-----END PGP SIGNATURE-----

--iTcJTDvr9wN09WiY--
