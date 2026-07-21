Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD12710F1;
	Tue, 21 Jul 2026 00:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784592514; cv=none; b=ffKgfYGTusktmEuLCHUzq9yXuIj8fhcxjXsb0JWq9UCvBCNJz8WcDa32RFGjzDCGE/QNEsUSCILiaqNuTvDP+hBRQlZC8MnSJhSApX6WZRnB4LeJQLgsOYzP/bahlYD0ZUnO59PMEoEN4q8PIhrz6WR4cUCXpMxGY6orlBjW32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784592514; c=relaxed/simple;
	bh=r0O6jNYVr/c+bE2xFvMSaWqplom+8UvXYKSm6czy5HA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s68t0zuiMV4ZMLzn9BSbDk+mawIAVQNQbS0vD+WWr05HZ/987wjnNERJwhmK7LLsiChjMC9DW0SAVArvyHPtULK7Ogj2jRof1DX1AHr9UEBPvJG0JtwQhLWn3mDhPoXX2mVgN6ftD+OJQXuYeZI8O+5xPrHLTrKjkvlso8Rk8/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NaOVWh3J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NaOVWh3J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D20A1F000E9;
	Tue, 21 Jul 2026 00:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784592513;
	bh=DctBsks0MJrg2KuQheiuuLxOBhUFVBZt5CMalwGdLTU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NaOVWh3J5ZkK68bLPRjjTkRLAWGdQ0L5fQ1WidP8KQqnRLek6EHlCPd1rWyrWCCfS
	 tG03sQjNeKSou+KuUEaYi7ey8pg9GsF1HoTNalwrQ8GTRTPN3j/QW//BYfeo0BZVn0
	 xuxwrBGPNjuMM8eOghnl66Xba9Xp05NQQUjqYSrLNXfSMC/cfjpd5eSFy7kg1wJ4/o
	 YLW9XE+RHRV8LnNHpVlVzKffzfbGpaIzSTyDmwe1HKWIlCfCiT6K8o0Bi1ePmQwzLv
	 VAzEsfMsHRGAIoEhtq+Yl7BItmfzpHm27NlYoTpXgOw3x5qD06TcRJZuNhVrhibBiE
	 7JKfZQwviRp3g==
Date: Tue, 21 Jul 2026 01:08:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the ntfs3 tree
Message-ID: <6bfccbc7-2b99-47ce-bc50-9cbb95b8969c@sirena.org.uk>
References: <aldqIGRdMoJgNkER@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sNZhLhfBaWh3ro8+"
Content-Disposition: inline
In-Reply-To: <aldqIGRdMoJgNkER@sirena.org.uk>
X-Cookie: To love is good, love being difficult.


--sNZhLhfBaWh3ro8+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 12:08:16PM +0100, Mark Brown wrote:
> Commit
>=20
>   f023839df8010 ("fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in repar=
se/objid init")
>=20
> is missing a Signed-off-by from its author

This issue is still present today.

--sNZhLhfBaWh3ro8+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeuH0ACgkQJNaLcl1U
h9Czpwf+N3bpruabpx7LiOvUw8XoNepoRWaztiFjCC3hBFC5E9hqa72x+vuU9D62
xDNZlR6Uww80Sm1gaF+GGPMOLeaVXqI6hDXsdQwWMNO8AbxXJ45AUJdQZxun/0rg
jcP+3SCLY682VZvZJ/XowMSxWJQ6vuK8tXtsa7hhKUq1DfvAigy9wRAsgk9rvl5e
b2FwWCguBLBv5Mp1CWHf8ZDPtEpXTb8iPy0MvUDDWaJaSEj4/T5G+CDjt2UCdZ/s
RAlcwOl/qMnizwnSX+ymskyO+m0jOPo5zKurTvnYAitJLVte6ztBfqt7vDShXTUk
J3QV0B4jfRLiTDi91zr1+EJ7b5qPkA==
=vK7c
-----END PGP SIGNATURE-----

--sNZhLhfBaWh3ro8+--
