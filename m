Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACB23B3898;
	Wed,  8 Apr 2026 10:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775643493; cv=none; b=PcxYVdGIVoD6UB2QYdZ23A/SrtaMk2WEjptC0hDPdb6DyV84PiviOtDsYpsmMdtr3YZCHCbcV6DkWlwYPeS+Q8Yubq54Uj1Kt0Vfz3FhtP/7PWtXC6ivCbLruUkPPUU/zJ2oUCCMUIBxTGR9dZawv1Gs6n5Cpj9bwOkrzlOHyZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775643493; c=relaxed/simple;
	bh=2CAFhAsQPnl0jayxTgOWArsre98BpaUEo0lya5ireyc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILGuQqnK1tsTrYFHnIIWrp29/rF6lJt8I9V7Na9jLs4KYKpcLvS/dK/jXGRAMKzeT8VuIp3o5nlsf+oVVDpPJiBhfs1MwG3cq+15NVyzzOvP/98e7m7NDt0P8r6m1C4IJLuK4W65w20/lQt8W8nSznAgsb/UF48ys5fHHuxl8mY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G1dZqoPF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G1dZqoPF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAAAEC19424;
	Wed,  8 Apr 2026 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775643492;
	bh=2CAFhAsQPnl0jayxTgOWArsre98BpaUEo0lya5ireyc=;
	h=Date:From:To:Cc:Subject:From;
	b=G1dZqoPFtIbE22OcCTOown5468qQe+ztB91ViUU4zUabCu81uWoGuL3wQhd65NJ6H
	 KVR7cD8/VH9o2j+IAiG62O89MlHUKyBQ1aZrWsqX/zrjF0oIqCLIt0QENMtMsp/Ffr
	 EHuZwUTwdVgezqJVp93wl3M36O+uQWKCmxPZ7JO9WjhhI8Y4GHvA9ZeJEQ3wBfgWAC
	 NQEzLoJEvngkygI0Vf9O8p3dnFv+l1toh8GH5V1FbH+mmL57R3cICPYsorHVmS8rCx
	 IpDp5CexmLxGTi/A7BCyJlcVPE/tpL12chc+xT6yTH3gDqOZA/8gu+s63lrK4tmshP
	 Czcjm0g0JPw5w==
Date: Wed, 8 Apr 2026 11:18:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the amlogic tree
Message-ID: <adYrYHY4Vn4JbEt4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1olU4M1oI2KwxLhe"
Content-Disposition: inline


--1olU4M1oI2KwxLhe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  98da3e91a6157 ("arm64: dts: amlogic: t7: Fix missing required reset property")

is missing a Signed-off-by from its committer

--1olU4M1oI2KwxLhe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWK2AACgkQJNaLcl1U
h9BTdgf/UqIY5E/JPsyyyW7igdvzED5EdvdxXKh0bOI5i1zX5e8Bm6g4ujK44Bcs
R7ftry4rBOSuc7nU4T7fwkmDUlYTDKBr/tyr5ED/M+Rf9sm3Y2l2Ze76fvPwgmXa
QqEqnFYhFCMNAyI+MmOByznf7LikUr0daobmjsNE2NHBbt1njDrrBKfezXmGzrIY
beCvY4/r3gWTrtuGYQxP/XSxwCirqYRVof9JarekcJ0grhpPF3LToVBRt5h/pC/T
LmCJGrDeXuXH8S/AJXE6i8mAfh45m+0iIfQqxINsw0LeuYq0blEYCG1St9P4gVJC
duVkFzv2Q2LpgJQIccsrPe2EmYLv/Q==
=heV9
-----END PGP SIGNATURE-----

--1olU4M1oI2KwxLhe--
