Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99633B3894
	for <linux-next@vger.kernel.org>; Wed,  1 Jul 2026 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920671; cv=none; b=oumqzZ5U9F1BG9PSplBJLOfpZIJIyQE8xYQO4MLma10P4qfpoA7wa+vDZ3tBzbb9CvV2kYZFC3nO5ZsQNGflhQOYCMxz34o28wdpqtpq2bl55m5iL1XUuJ9Sn1Q2pc5ZNvTpbzjtdaAM+wi85ufWIz4uv7ELGzS4B8Xpgdoqxn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920671; c=relaxed/simple;
	bh=qhXKHc1CTaMtunarsS4iR449ovkIy4TcbptBkPWqy8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKIr++KLqWlrKAmNeAZgFrNCTgNFLjY4MP/9jZNehrmvS9RmNi+58DxXkJeeSXAFYBSd8xRLlB9kgkldmLkQN96kTYthWyGRA254j5KPy+SYdFAd/osHiSNWagZLHqceRmlVIKEJ8QQ7V5vnr8t5Zn5dOS2lV8vlVBsGOpPgAM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvqZVbOi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvqZVbOi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E25AA1F000E9;
	Wed,  1 Jul 2026 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920670;
	bh=CfdmeZdyzNT54Shq4TQkEueGrF1Dd68oktRm+erJNy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WvqZVbOiNAiGxQeWDfZMUkNyOWrv9l04PPDlWQjEFCtgNcbSTMpfCUH84rj2onKnj
	 FhxcqAzbURluPX/4NGAnjvg3pobqPaf4R3IWtyoB8chz5myXkIr6jjj1zeG3KlJJzP
	 glPegEsyCVTLhpIy07NM6gTQ2E9ZSAUM8R3nLexEarh8xlx41V/uaNGWt2WMkmKFuH
	 K7Zti2cu7ImqmP5IHwjZO8Jg5bhBc+kDVj5bpsOn0c2yWKH9i2oaBnnSU/ikid+tnA
	 oO05+250fTtxzYkFB9qh/I57sy7B8gk4QfXbvVeN9S2LPy8zbnsIY54Jtc11Z2PTs7
	 V3kFqLkybvbIw==
Date: Wed, 1 Jul 2026 16:44:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-next <linux-next@vger.kernel.org>
Subject: Re: Update i2c branches
Message-ID: <117e594d-28b0-4bac-b245-66cf2ac6c0f7@sirena.org.uk>
References: <akTXuDVi8jBVAwWu@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A1z8HSNq1Ua9fosX"
Content-Disposition: inline
In-Reply-To: <akTXuDVi8jBVAwWu@zenone.zhora.eu>
X-Cookie: Do unto others before they undo you.


--A1z8HSNq1Ua9fosX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 01, 2026 at 11:08:57AM +0200, Andi Shyti wrote:

> Please include:

> i2c/i2c
> i2c/i2c-fixes
> i2c/i2c-next

> The latter is normally a merge of the first two so that it
> doesn't create any conflict, but very often it contains more
> patches needing some special dependencies.

I'm not sure it is sensible for me to merge all three, if I pull both
i2c and i2c-next then I'll end up having to redo all the conflict
resolutions you've done in i2c-next.  Potentially I'll get conflicts due
to doing something slightly differently, or the additional stuff in
i2c-next only overlapping with conflict resolutions.  If i2c-next
contains i2c it seems more sensible to get i2c via that instead and
avoid the hassle?

--A1z8HSNq1Ua9fosX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpFNdoACgkQJNaLcl1U
h9CdMwf+L+DD5ma4pnyKDXjliJjY7LzF0BvrU+9eSqbxIQe42O6zOr14JgvT3SyI
ikxcmWmi8DRdkF/mu+1ya/7F36Hf+H4tc7u64uWtLJM2JvqTEXgBXDPJAU5F3xtC
Xi/EgSmaRZWlQF5s4g17Aj3x3OSq7W6B7Kh57RfBXYN6Kby7UUvHO6GCoQTbRVWo
hiAZWSlodGehTUI94n/BOki46kMaDmimkHM6I56LVgzxubenXc8dcNilNVNoFYWX
BOgUfiNUjNsxJEZgFU8D42kVkL55CUpGu0ugegU3GWKbLcuwvRd6WGIJNX/wL/7h
lz9G/QRNcdfLokkdD4acrO5OjNMRWw==
=ACe/
-----END PGP SIGNATURE-----

--A1z8HSNq1Ua9fosX--
