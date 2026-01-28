Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB1E32AADA;
	Wed, 28 Jan 2026 20:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769631997; cv=none; b=mpkSilrk2zls03KYaqEPup4WqXfEShcPlzhEwEpUkaSgtg10gmleO+84sHwRqEm83r7u3ZmVdNmjo3E8wxNmmeW8t2puWqipU03WpvA6g8TZrJBR9rVQqTTmvSmmShWKu3Pz1y+3NK9UYxy8eL3T+mZy0/wZ57H7wvw5YsXixqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769631997; c=relaxed/simple;
	bh=55mPlje3DzkTDicAZBLS12jerYqr9DRfWOC3bwIxPWU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UP6jKGwnWfZQesvK/UXfssMUQKTfJKazSKQZ1fMrKvm4iMV4P81ydLuFVbisXiK0Xch7gj+hL1D0sEA3rQenofxI9Wruis1DI2uw8t+b2g6HD5BZ/mWDxlvXePCMG4gpKsfMmLcd/XvHlaEsXsFT0QVpPKKwH+hCLikcB8nJsgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s9EIcIQr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s9EIcIQr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C060CC4CEF1;
	Wed, 28 Jan 2026 20:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769631997;
	bh=55mPlje3DzkTDicAZBLS12jerYqr9DRfWOC3bwIxPWU=;
	h=Date:From:To:Cc:Subject:From;
	b=s9EIcIQrn0677og+uU8FKKIQmv7sixy+gDHH7WPODLdUUIT7I1IiEEF/zsCWF3vqc
	 rlxPk2D7xbkNChmm1YkXtb8gAU4yAz5xI16Xv1yqZq80HReqQX8ft3suwySLWYEgD5
	 qrWn9Mu9IaVfSfpzYu4tq3A+gCmENB3qeEhttJW5emhoOOsHNOhIwhrHuLsiXetGmC
	 D1csvHl0QP4myXIlZLP6hACQALGX7jmF9BUGOrAOoTmJ48sW89KjGOFPDwcIlMlpaa
	 qxr1Qkk/LUC8sKjby5GKr/ClluTT3uwNApajzf+uoKH+exDImBDdn5Jd+nx0DVAi7c
	 7NQyRA3+gNW3A==
Date: Wed, 28 Jan 2026 20:26:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the iommufd-fixes tree
Message-ID: <aXpw-gyz5sBkJcDY@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V7khnmgeC068PLWh"
Content-Disposition: inline


--V7khnmgeC068PLWh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  928f9d3956511 ("iommufd: Initialize batch->kind in batch_clear()")

is missing a Signed-off-by from its committer

--V7khnmgeC068PLWh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6cPkACgkQJNaLcl1U
h9CfTAf/YD8maNBBqRs1gfh+TU/I219JKue38wWzb+eNjThKUeWnM2g4DyurnP8d
JtNgHvxKEK9VQsViapROU2GnDHCYisgFJ8s7vjdDUuSF174l7xPu7ZTeMux7VxzM
ndkhN8pGkrHi/ewOGFOSaer+iukkMAHTIMZAwr4KC0afI3XE8a/SCp6h2KcWUTvw
DuPbKykzwpTOo3Jm8tl0yNV2WlSgkkfIogbtSGmaIL0jHJK5vKzTsNfsinPHlWl3
o+99i7j2WZe898Oo141RgQbaUkVQ5GTfaAML4EXm5goa6fXsjYRhZaCP1KRPrdeR
KyhbFiYe/x2ed0/BrAz+AUpDmNn5KA==
=dg3a
-----END PGP SIGNATURE-----

--V7khnmgeC068PLWh--
