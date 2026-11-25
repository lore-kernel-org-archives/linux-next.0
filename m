Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795615898;
	b=VKiL0fhqzbXFUkwR5jSrexaPQnFwB1Rsr+lfi+SNGw8LwDW5CxpFWe/QIPnbomrpQ8rn
	 YD4DMyESBtExPYENje8+uW2f0MRM2jRiwkDrJeCofR0xzM2hsUoJu1czGw5cgQtSivHDq
	 t2Z56s6l4LwEUEhE7cY9Gew9qfZ8/9SKP3rxEEqhJ+4+k5YktctySAUOMahc8HHzIZObo
	 DnU6pSyozYtrtNXxRu1bpqVqrs2Aiq8YUyMC1+fUcMkhLaec9m9XOfsfNqhzfc2GJYya3
	 fQJJ4u4PhKaaEZl4JhLlSdR5EkyxaY1zbiDInpRVHeLbZpQAPm0S13WM27Xc5VDIKWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795615898;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition;
	bh=oqfEPrUnIAFyRLR9ZxyjgF7tj6rXLKufI8qE1WBwPf8=;
	b=T4t2ZE3nOSb4aEOIq+1vHrsNzRqjtdyAEte6soFvoBFO+mg+X1N38qmDZ4ZfMhRxqyy1
	 PtkOOw6HywQcemC6S2lLAHdiapCjVU9dtyAcYa19Mazv4YuI1r5I9ccdcpMkxmbwZyklX
	 7u/tMwQNpYlhw+/+Xd61i3FkxgeElbVyOP7EH/4YnramTRGbQ8cVW7GChKHnAriNGCNw5
	 NUiWARiMp5N5yRibsW+sJIC+CovzBez9zYVlEMhJY2dz5qcM0cyIqwsefO2Ta9aVM4bom
	 vk1OnrSr6Huz5KSjPkbuuCRaIzyxzvkRYTGyROjZcjI0HuWaIlXbkyRwPL6RdnJgOlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCSWN8Ko;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDDB606A31E;
	Wed, 25 Nov 2026 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OCSWN8Ko
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDF1A1F000CA;
	Wed, 25 Nov 2026 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795615897;
	bh=oqfEPrUnIAFyRLR9ZxyjgF7tj6rXLKufI8qE1WBwPf8=;
	h=Date:From:To:Cc:Subject;
	b=OCSWN8KoUJ26JfFoOB7sjoTUYWsykIMXavCN3g/yDMVbIQoxG/yU95dSrUeH7Miny
	 P8hT1g6b9eTvq6mNkGXMdI4/m/NOsEaVsMVElLb0mHD53wMCMT+p9f5bBc5tjcDBAO
	 coHpyCAP7EmPIrbHRgdqxcRvGch6bQLIvkKFpck67ZtP7+qlG1TBYXvnNhGNY3pWlI
	 Oi9qYQm7iidZUgmCqNGPJT5HyC2TLa2jDOs50QbS3GH4zJfd4UKlLeKZPrlqHcYqZ2
	 0TQL+9PzDNNYEXP5ohsDTIw8O9CSENuiDOC19hX48uhIksLio7yJ/P7fycWorq8+yG
	 +xGnYjZdL2O6w==
Date: Wed, 25 Nov 2026 14:11:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the imx-mxs tree
Message-ID: <awbsll7Q8DuHIjZ7@sirena.org.uk>
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
	protocol="application/pgp-signature"; boundary="bdCaIi2IVO4YGV8w"
Content-Disposition: inline


--bdCaIi2IVO4YGV8w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  78beca8d4a24d ("arm64: dts: imx94: add clocks for gpio controller")

Fixes tag

  Fixes: b0d011d4841b ("arm64: dts: Add basic dtsi for imx943")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--bdCaIi2IVO4YGV8w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmsG7JUACgkQJNaLcl1U
h9A1RAf/Toy+6xPzjt2M3fFs8e2V3CRjtnE4EYJcnRDphX449SOq/In3aKDh9/ys
NcHAIWQDkQgEGEYVzuiWlsRNWRAXhIymg4qY8Bx3AWt3CTN82bCOhjhHXGEKC45q
NCDHHF1RoifygF+HiuMr/kyZ/kgB5BQUUIYANiqq0BNpHo20Su74P4lVidKbCLuh
n9h6bEhlXtffRiIegy8KbGvyEzVYnyG+wjiDMwgVc4CW2aJJmY7s4IvwYT80jUlk
MrZ2kI6CBeD9mW1X803mXK9zkHAG5ViJFQfHCK2wYtiFuL/u/t+eQ0/97cYIoBPj
dOgAy4GqtHoYglG1Taj+Yak1AwnZ1Q==
=Y7V5
-----END PGP SIGNATURE-----

--bdCaIi2IVO4YGV8w--
