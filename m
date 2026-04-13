Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D250D30FF30;
	Mon, 13 Apr 2026 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776100114; cv=none; b=OBQiUwGa5X4sPYyCbwry665EvtRh32LpV0rsZxUcpJp++oedN8ejL+7K3EOI1rEvmR2pKOhtceE58gdNDvIwGeGBvWx4F/ZtlJu+NGmJ2AdOHvZGPBOxPhWLcH7SXUI3pAfwWtk1CXijeSyi7+5p6MZ3lvPyszc/ZFFHKt84gm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776100114; c=relaxed/simple;
	bh=BvcToTSrRqoaANQBt78qsnwabO26mJgLje7ZXJ0lrnE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spxFnVQrTxY7C+as9r0yYZbqzUKNR7jvNeM1dsvh/5EI+5tVvg1mJfpReVzv02zRt/awkSWGBoI7UeY5aIpMyqLSZlcEs0dIGkW1T55/RrnxGURu/Q6daNB+fIaVsCjVlvz82OM+qbBqL0NQZs70FL9uz/GdxMH2Cxtu0MdHMxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKYoIuHM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKYoIuHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE2FAC2BCAF;
	Mon, 13 Apr 2026 17:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776100114;
	bh=BvcToTSrRqoaANQBt78qsnwabO26mJgLje7ZXJ0lrnE=;
	h=Date:From:To:Cc:Subject:From;
	b=nKYoIuHMLnBkxiAndfiRYUjCz80/PsH11jnnL47Blt2sFDo+HohfN1hmW4GzrI5ot
	 QgKzF5KpOKT182LocGUGWEAvNFWYxdgzjTH29Ur9YxCNM399D5ed2bPriATpTsnedJ
	 bZDc2nwS4lTWx1QQs44fZHRDRtCel2Zs47coXlosGhQjkVJI1y9m6dloKMkpLmvTJB
	 iT279iUWGwFG+0JlXWtPJv8Wv344/u2VZGz/e1U/WEJmmWxbewGHuUPxyOdrRaeFqV
	 +G+SOHNINfuEwhKJQdYWneQ1zgSm800G7yerexi9wPhl2SG9hgKT/N7HPOcmn48lRj
	 27guWxApZ6TdQ==
Date: Mon, 13 Apr 2026 18:08:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.0
Message-ID: <0571b202-b715-46f9-a46e-47f4f5658f43@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wWbg2gjLuDNPpAK5"
Content-Disposition: inline
X-Cookie: Love thy neighbor, tune thy piano.


--wWbg2gjLuDNPpAK5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

No trees are being held at old versions.

Trees with signoff problems:

  clk	(missing author)
  hid	(missing committer, dual maintainer tree did a rebase)
  qcom	(missing author)
  rpmsg	(missing committer)

The clk and qcom trees both have the same commit in them, cf6e6ac63c62c
("clk: qcom: rpmh: Add support for Nord rpmh clocks").

Non-merge commits relative to Linus' tree: 12528
 11510 files changed, 689278 insertions(+), 232617 deletions(-)

Top trees adding commits to -next:

  1750	drm
  1412	net-next
  1081	arm-soc
  390	tip
  380	char-misc
  369	mm-stable
  253	sound-asoc
  251	v4l-dvb
  241	bpf-next
  208	block

Thanks,
Mark

--wWbg2gjLuDNPpAK5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmndIwoACgkQJNaLcl1U
h9A6jwf/RNZtbjtOtfx5UB+xaMRJMxAi+qbq8FDlMMNdPMoBXRiV6Jb7PlCWn8qL
PvGXzG6nLq9u/OPlcqVB0fyyGF32h9JGYRTSTxKx04TM1mMT8byTCJNku9XIL2Qt
ZyGFNBSNpTISIXRgv0RM5Kjg5mQlGTxR+FwbDgiACS7R0bZM1pNLkgpD9t8Dv+hc
ji0sJxD2DHawTzaxfF8NT62EKhfq1iSvjA1TMLbHrz4Q6RjwFFoURsULWI66rqhs
X2j/xVCXb6CuNZ4WpIj3LZd+S1uNi+x+JTD3tfkev1j2eEoPgXSwuAn1T9D9/LgZ
D+EPVSaDvG2ALg3um+cwyVskMUcZpw==
=4O5u
-----END PGP SIGNATURE-----

--wWbg2gjLuDNPpAK5--
