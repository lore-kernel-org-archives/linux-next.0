Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7ED48A2A2;
	Mon, 20 Apr 2026 13:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776691912; cv=none; b=BURjFzmZlKeoQEoXzxXpZoExZ1vsdu8l86nFLvkLLDoajgQ06ZMK1d46AQOgnMcAjnfVlqBTNESQBMcQvHGPzaO/kHp2n3c1zffsPK/1bELx8PAz+S5z+RF79bnLLv36ujOZIs7/QITt4J++ESZ7VsjoQPHaf7uGKKwSaPs8xuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776691912; c=relaxed/simple;
	bh=rqZRIq8AAZa7H38s6Q8oeBuRfrPm80RW4gTj5s6LXhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bq0KB8qO+tPRET2LwzSfX8VTgr5zz6Ko+OhVbrqvDBEKZhN2ubkmMP+cqVtriOOLyyauptCZ4m3ECmDlNXRyIFzLlHnGfuP4W78m6Ng3d2plF4k4a5IE2lmzbRLry2Ex6TdflwBPNaFECtSPlSf4On8SVvJMmFXXzz67y6Iub6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KLDovQfG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KLDovQfG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80366C2BCB4;
	Mon, 20 Apr 2026 13:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776691912;
	bh=rqZRIq8AAZa7H38s6Q8oeBuRfrPm80RW4gTj5s6LXhY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KLDovQfGMkPrQJ4JMkIpkHfO4elSAxKI8ErVZSfCgq7Pni/qXec1hodibHHvR17TS
	 50zpwg3JD8ygK1aWpq3O6/2+5ffhHf0P9YDHpCyTNevOhmanxplN2aobPLiIYgPkWF
	 ESa7xNBQKT0vnRuLtRy0gV84rEAACx5zSUWKrKiXxI0yV3a0YomQrFG//ZZjwsAioy
	 XOnNRhmhjFQLYKKeIGI1+pck8BGYbiFLHucGefphcTSwo9ruX3ee4kSwJo9zRWtU3C
	 ++shf1iArf+Ld32Jr24zsbz4W4qpNWYuH3rQ/ey3y6AdxKuo2kHNjF26UjFZNC4BNR
	 xalJhXRRayyKg==
Date: Mon, 20 Apr 2026 14:31:48 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the clk tree
Message-ID: <cf870118-7c35-4041-88dc-b2a66e923f16@sirena.org.uk>
References: <adzISAzZe9EuM-2U@sirena.org.uk>
 <34bb0eba-bfd1-4842-83bd-40893f2fc4ca@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tc8kR1IneOcybnN"
Content-Disposition: inline
In-Reply-To: <34bb0eba-bfd1-4842-83bd-40893f2fc4ca@sirena.org.uk>
X-Cookie: Call toll free number before digging.


--2tc8kR1IneOcybnN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 13, 2026 at 05:51:53PM +0100, Mark Brown wrote:
> On Mon, Apr 13, 2026 at 11:41:12AM +0100, Mark Brown wrote:
> > Commit
> >=20
> >   cf6e6ac63c62c ("clk: qcom: rpmh: Add support for Nord rpmh clocks")
> >=20
> > is missing a Signed-off-by from its author
>=20
> This issue is still present today.

And today.

--2tc8kR1IneOcybnN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmKsQACgkQJNaLcl1U
h9DAXQf/YVKKrrGsUqYRV2yrj3ymJYGJUE9VEndObJMg3viPujWAmhUjC0P565Ph
wusFOmT9Gs5gc3G2hfaokiIPohJeEG+o6p8OQcwdWgjHQH9OdMzzteOFM8ne5mZj
9aifkskdgGJdBsskYbHyLFxftQHS6X0LEj8i/diIuvku5bhNa0Kxs48uQwNWuqCB
Zln1FRkzYbqEjcOxFF/4e1Dx7QOMqyiTgl29Av5BNT94FGBg8dMCXr0FvYXexi9i
F6duCj+daQqoReCxxMKnErthtX08kn39odekHINqKyN7sBDIr5ahcuhK9DjDHXfy
1Zdhy7FK/SybIj7OZzVJLU5X96DFtA==
=gC5S
-----END PGP SIGNATURE-----

--2tc8kR1IneOcybnN--
