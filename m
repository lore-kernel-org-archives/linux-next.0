Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66E6313298;
	Mon, 13 Apr 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776099117; cv=none; b=Uvw5NsASHKxx5gIzs3E/YdQliQ/j+CEmpjrNBF9klUhN+dLFs6XTBEaZcH68CLpTNvBp+Tg8cEAmPxkOrTQBN6NbMaOjBRDmWh++f2TTXpQYya5/B/jUW90wEaHn6hd/XoWJ7X3AbO3IDL0seDlfrRrAcUUFU8RXSrV6q5VZuQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776099117; c=relaxed/simple;
	bh=0ccINnM5NeK0xUQHxUk3JNVoWrPpNd1Ks9KaqhHscvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SESoM0AV5r+6/YPWACyYHiU9NGbnO66khzBa1ksbkJ3lNxqgdiE07H5bes5tbkP61VGuFhJN1GRfa1xv9LqbQCg7GPdg1mNbECcfcH14wLYy4glU60MLp3ZY2ri93OGH8hIyS6qye4oRZrE2A7hzWcx5Vb0j9SDFdUIsJLdSZBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aBPAHrsQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aBPAHrsQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D46E4C2BCAF;
	Mon, 13 Apr 2026 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776099116;
	bh=0ccINnM5NeK0xUQHxUk3JNVoWrPpNd1Ks9KaqhHscvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aBPAHrsQkvl4+HuF+BQpqnN3OxMsBLEbeYrFhlmbDMr6MckP3ghkJvWP6cvczvEvA
	 KUYZZuavuWbTUSUVK7U+QOLn9ldIlf+u827w682lBaUUEeThudV+GNLIdrb2kdXE8/
	 bC+kE2a5QE4S/EPZy1rQEZuzWxrCn8krxVTIQBmQ4OaF4tDXYYjs/mF2ecOPTTTmWz
	 hms0yzdsF5vaVaWI70W6kJ6Z7qrjjGjaeqzhmgrH8fOoMtsg2zQDF4tmjOCdCWvYX7
	 Xduw8OEDRjYI9OGexg51SjSdP2PS5nvBMO2dKwP5wlrQAWQ1SMfRSusUXynOh2sEx9
	 6n6JdNSLPosgA==
Date: Mon, 13 Apr 2026 17:51:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the clk tree
Message-ID: <34bb0eba-bfd1-4842-83bd-40893f2fc4ca@sirena.org.uk>
References: <adzISAzZe9EuM-2U@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qme4XKYNnnkQgiZB"
Content-Disposition: inline
In-Reply-To: <adzISAzZe9EuM-2U@sirena.org.uk>
X-Cookie: Driver does not carry cash.


--Qme4XKYNnnkQgiZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 11:41:12AM +0100, Mark Brown wrote:
> Commit
>=20
>   cf6e6ac63c62c ("clk: qcom: rpmh: Add support for Nord rpmh clocks")
>=20
> is missing a Signed-off-by from its author

This issue is still present today.

--Qme4XKYNnnkQgiZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmndHygACgkQJNaLcl1U
h9ATqQf/XxMPeDLKELn+wgcrTJjvgV5Y7r5fVyxV3lCwmV999TQ+NgddT9EX9lDr
jpambfQxE7eESVq3Z6jq4mO2tpecphXzWqDGSlAZrYkFMvVP61iM1VkhSevPLBM5
/P+0ipY+pV35LXXnzvE0H7NpqzCpYhmblR6iWt+sGWycxp9e9dOWod+T19rTMeE/
oaFApGeSCaFKGFQmJUQaZ4n8CoYDSpJ/TiTygttFK5rd2qXNLam7fJzNhTPT7YkH
QPIanBU3e/y0K5p5PrxLcAJIjiQxD+fe9gR97RwyetNeRgxUuMMSh1F7xoHt6qDt
5P4rwyb+keMtDArtglbJi5tVggV+fA==
=wWDX
-----END PGP SIGNATURE-----

--Qme4XKYNnnkQgiZB--
