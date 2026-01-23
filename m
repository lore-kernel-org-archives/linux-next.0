Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9CC2D8DB0;
	Fri, 23 Jan 2026 22:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769206971; cv=none; b=WmCKGHbwkKe0E4CCm1zelPkkO92BDxf9ofBpmgn+KXD37mictLWqtBXeweqf3tEhMEfCnFnLjSflOHBtCPegvI63+fAXa9o93D3RJgn4UqQrRUjQUZQyuTHfvzuSeZzWVvA+mPbYaPYIgOVVkriFsCUvelkaXujmukUodLzYZv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769206971; c=relaxed/simple;
	bh=DX9ASRxTttsKhanb+eCf4D3srztaOAl1kUdhGTQe2zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cp2E6vgz/CYzYUbGx31d97OgHuBW1RoyW5O5nYaJXABvOhPgw0xleRSikYSoGGAu9OTuRHxHOPutG4tJL0xs9cuChFiMZR8j9l7RmbwGjYYSTv9QUvr9HGAJYj71GXrmJa5IDyPw/1RCYvHzDDB881FvsDxKS0z+hgIv9pVXEng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BjZw+r5W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BjZw+r5W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C8C2C4CEF1;
	Fri, 23 Jan 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769206971;
	bh=DX9ASRxTttsKhanb+eCf4D3srztaOAl1kUdhGTQe2zw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BjZw+r5WGe56iueFI39XmxFglpJbtgCHdVGZl7h4DwFGLCFM7uQiXLftU93A/9XAA
	 Ofs+ng0AX7rNTrYx4eFWMRyF1XWQlSJ10uBeMmXtPQlrbUOw37QAnAHyAYBTo4vUBh
	 Cf98zkuVjAnh3I3IMYd8KQJpfFNgnHldV8ddNFOecKqwx27sDhSlkDMe5K2BVwm8H3
	 LrUbKfSELJAt3J1vQSJwKLdhgawYYv/NNhRs6L+Qk03kH+qMXeVkayqWxzQ3iWN/gS
	 Yd8Dd97psT+9OCOPeVanJN7C20vnhJsAEPV5xZ/CdGGcVt+BBvq0zSn5Ih76FAop6G
	 yK+BdS2Qq4yFQ==
Date: Fri, 23 Jan 2026 22:22:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the random tree
Message-ID: <12f27fef-34d1-48ff-a89f-47df92bcb7c0@sirena.org.uk>
References: <aXPso7beaFvlUYiP@sirena.org.uk>
 <aXPudNLOPmXd-U2O@smile.fi.intel.com>
 <f0a1812e-4235-4d32-ac72-f2d8f1cb0d5d@sirena.org.uk>
 <aXPzxa58ZA38QIG-@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LP0kxyKOOahhYiA/"
Content-Disposition: inline
In-Reply-To: <aXPzxa58ZA38QIG-@smile.fi.intel.com>
X-Cookie: HAIR TONICS, please!!


--LP0kxyKOOahhYiA/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jan 24, 2026 at 12:18:45AM +0200, Andy Shevchenko wrote:

> Okay, I need to reproduce that.

I'd suggest testing some other configs/arches too, the -next build gives
up as soon as one thing errors out so there's possibly other things with
issues.

--LP0kxyKOOahhYiA/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlz9LYACgkQJNaLcl1U
h9B86gf/T3pXPbYAMjfUAQagC6NCLCIid3TH2vIGEwIPA/xgXm9Lg9jce8UXBfxu
zlaYHEQ7k0J67OsqnUev6Mj4FI4n4TuTyc9wa4tt/fonmOZq54AU56NAY3wIn+fE
Xri/zbYacD1sQ0oZd9HkEMW/wTiMub7vhsVydBMKAzcISWGMLuiSqFLHJMRPjHyU
QIJV+HAaCE557lIyDgsRJO0ylluTWPTBxGIP5MUHdKP9zaCNgDV7xVuWzhKlrHDq
Yjjwv6uXX7hGRFdOoHvA+rikVbViAHYPZzsoMh85Kt/bmkWqqM5uL5csIt9HysVV
Lmdb9SA1HP4VNUU9RD7iebijjtIVAA==
=q+kk
-----END PGP SIGNATURE-----

--LP0kxyKOOahhYiA/--
