Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00EB395DA4;
	Mon,  9 Mar 2026 11:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054626; cv=none; b=prqsjBGDTF+OmrLdg9YH6ucP6c5orn63VyHNndkvA5NeCqzMag2TDMrLUrulRt9B7EOeIjqvDSq5xZ1Dt2axMOOCNFVMM1N57iX4AOat12TK9LaPk57vz/5147CEdQf+KjbYstkPLjJDPEriqSPK7jyLSExDYOl60g60nT+XI8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054626; c=relaxed/simple;
	bh=/G3kp6EgkCac9y5/bp9nX73WKLJ4Ze9fEpxM2LGHOZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pM4QE5i89mnMxvhXXQ9MLpj732EOfL5eGgHyo2ILbnUIHIYo3BFTnqcjjVG3qnA7bf5Juwl6edj1BYasTojsCIIfGEIG+Eqc43+GLfnN0bqtbn9qRFkLCn9nVorTHWGKlWRIIn9Un1R/IKW4u7fLNnS4sYsjD1h9iBd2W20/Vkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e/fVbI/G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e/fVbI/G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B423DC2BC87;
	Mon,  9 Mar 2026 11:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773054626;
	bh=/G3kp6EgkCac9y5/bp9nX73WKLJ4Ze9fEpxM2LGHOZY=;
	h=Date:From:To:Cc:Subject:From;
	b=e/fVbI/GHmB4uRSx40LrjCwNrlhn8BjwM7D3vszq73D3qhDZ0DyZ/hchHGBeE7IMu
	 0wdz46dapaLc8jX/b518JDJVA3w2e2tXh6Qsrty9mKfT/ei1mMZ3SwJowTs82NOWl8
	 sO7bk4bIRPP6W6Siz3X2pnY4JX87WuKX5dlpLGiJkqxvZ4/tx8RHdA7lOciE61vn1n
	 6+CgRnJLqPm+Nj/XC2P0A56mYdE3lAnN5ae/o4nwWqtWQ20NWL3Hd5QvRiX6ENM5Z6
	 Kzafh30GA49Ok4JYEeLTAImdZISuzyhZh+Rmm1M1RUOigkqXBArWI9Pg+dTCGg4ZgP
	 hLoawAbH/pzdQ==
Date: Mon, 9 Mar 2026 11:10:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Shawn Guo <shawnguo@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the imx-mxs tree
Message-ID: <aa6qnpEoSaiP4B--@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aAoRLKa6ZTbcUiXc"
Content-Disposition: inline


--aAoRLKa6ZTbcUiXc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  587096ada5204 ("Revert "ARM: dts: imx: move nand related property under nand@0"")

is missing a Signed-off-by from its committer

--aAoRLKa6ZTbcUiXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmuqp4ACgkQJNaLcl1U
h9BGqQf+IRNDxSzFYYPJ03a5n+T74e7LQCsbW5trjHx98yjyWXdE5iG+2VmKZA4n
AwXEKaR3qsC+erZQkDkvqSYxslR4CjxHJ5f17Jp565ln/2Hvyi7mZc6lIh0QvZt7
RJvZ9gKR//mwzrHUckQx7ztHXe/1BsDVOvuzikx2bPJCnTiMn/kt5iBkaM/TGCh+
XT7K68YqOOO1Oq8MJ9M6hgO3DqaJDLa8UISLtRff04Oxihfxu9zzI1loFcGIjome
ys6inI5JQqCaRnXtcTHlnleqFcqEvRCX07xShHYgNSCdC1wTY62j7WS9gokxjtJ4
QlODR/uIx+paqUaKHywIcfNLMOcXlQ==
=JzRo
-----END PGP SIGNATURE-----

--aAoRLKa6ZTbcUiXc--
