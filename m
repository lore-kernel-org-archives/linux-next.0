Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0B8411FB0;
	Mon,  3 Aug 2026 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767506; cv=none; b=strFqsOvbIL1e6eRv2E8FC65zcql2s4UavnoJ/CwNHjMcrYLGnPVo1QC47NXIdDHzzeQVCTrqv0QwKo7Ir5MXT+JOebjtegCjz7b3F3aFfGfhHlm/PiOGkvhUopir92DNwz8hAZs4IV9yiVA3Msi68nRLqHMLRJJzZYeSGNQFCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767506; c=relaxed/simple;
	bh=onAGw8M2D3BWg8Q2FBcYC3B0jujyMnOLbSCDDl7rEfo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgb7qpRMspqLS5YweDWGUlJDwyyWB7gQJU7tx9ROnSxENbvFdVt5UUBozxGhdnDq/WxQDsO2B04KcgX9WKKfKRLW8W9UAUohlYPebSn4crCnMVezfXRnLD+JIdDABW7X0yA8mqSiFabvQlFIAt+y26T8xdRNX7v0HZNb7R9YM5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b4LaVHGX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b4LaVHGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5CAC1F000E9;
	Mon,  3 Aug 2026 14:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785767504;
	bh=88el9+iGSf0ux2UzsquCzR58VA8fx9m6mztL2PxrMoY=;
	h=Date:From:To:Cc:Subject;
	b=b4LaVHGXbZ6GEIKAWE3wS+Un0zSYGrQCiwkDhPwMYdo3WHt5DN2+GLqVLz6AtYs6o
	 lhCnhb9qE6Z73Wju0+ETfwgTTSoS+QD4jsAhsbCznoZB/WrTcMYQb/oEnL4WCS8z9G
	 pmmVh7BnhWAb+zm0JvKjRQiptZJiXqwGj/17/fxo4uqC9KagsLD9Um4ae+VPfEwRFZ
	 13Zcfxo4YsGAKatUadkJccHTzK6meEE1aKAYOS8Bsu1AOjTYJZzF68kUhP7YLxzHQd
	 Lk4rjU/P3CC7qkfwNE0jsHq5/XKuOkEgO/LoSSfM37Fz5MWBM120Lz2xNmo6Pl+Fn3
	 XL1BiQw0U+lxA==
Date: Mon, 3 Aug 2026 15:31:41 +0100
From: Mark Brown <broonie@kernel.org>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the vhost tree
Message-ID: <anCmTRN_c_wVZcMn@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0lPstnKdZb03lZSc"
Content-Disposition: inline


--0lPstnKdZb03lZSc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  6897fd3bddea6 ("vhost/vdpa: reject overflowing PA map page counts on 32-bit")

Fixes tag

  Fixes: 22af48cf91aa ("vdpa: factor out vhost_vdpa_pa_map() and

has these problem(s):

  - Subject has leading but no trailing quotes

--0lPstnKdZb03lZSc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpwpkwACgkQJNaLcl1U
h9CqWwf/Wvkzdnuuz2eDHaE60FtHgzEBLNIj0gxZVT4MZn2NE6K/NQnUw8V9KnBe
XpjK3ssir7JEw9owIYLeDaEg5RW56OOv3PsQshit+murm7fPJkotsBqnppm9w6bO
OpKQzrBrdQRRwELN1MyOIbRZZx6vGM1uvbOurcB+i9m8glzMYJNJP6D/YrbyoHt+
YVDYRK2OBs62s5RLKk2TufDwQSBnof7sw7hueD2VAqA9FhdOl+XMk9XxkWmxVU7Z
CW0YOMkT9ZrtUz5AdF+iXBI8IQu64W8B3juyNlcKA2zOFJBzJRU2byWzh3y2H+68
1lHLtkcUDD/WHWioP5n+nQYhNLQnFA==
=S0RD
-----END PGP SIGNATURE-----

--0lPstnKdZb03lZSc--
