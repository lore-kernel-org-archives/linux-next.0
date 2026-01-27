Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A693101BB;
	Tue, 27 Jan 2026 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769515630; cv=none; b=HRRcC+Srw+8n4uAVwsHGc+QfbNuSYDAzBx715CzQG+nXdh8OJowSnbhCjkKvIYqzpggQJzHPnl53e1kUUZcHVgkzKejFMgQqIiPksRd1btXKGxcmAOWjlInAM2vpohoOlBIGzNpbcY1rMjPzEFvlzW2ooPTSUqRGswDle9WKGIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769515630; c=relaxed/simple;
	bh=zWNSl0gxlyLaFJ7bnQl3Q9peRWTjh82rwFu1CXLG8iA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cyWvssQRdT0WVcClEes56MA3hBdSNeVQa6TPoCdf8PNGWAKw+tkMvyn3O7ioa7z/5e2SLxS4aSn19jO7UnUibgTj1KxSrN+5hAauXBupC0r1K6cA4aOZxQrrf7CrjcvcvBmDzGnIEFBiR5+3KzItHyqnEBxfj60q4BcgCxyNV/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVbXcHXb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVbXcHXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B36C116C6;
	Tue, 27 Jan 2026 12:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769515630;
	bh=zWNSl0gxlyLaFJ7bnQl3Q9peRWTjh82rwFu1CXLG8iA=;
	h=Date:From:To:Cc:Subject:From;
	b=HVbXcHXbosU0ROEbve3aHb0dgd2HBB+c5DJ9htXTfogM3Q4SOLT3FPyDzTP1bmJEV
	 3aLJNlV8MaZHPzOwncJu67jhZx2iBzMp2LQDKSpNyXTO/UiVRmQsRJRaTf/Hjoy9Cm
	 1HpBMee9+mjg5gOaaefMdQInAFHyUiHP/NcIqgYy8vcBKdAglJDU0Bmajz2f3tZY53
	 2ApbF3+lCXuUZCy0haJbps9U+IhEB88hVkNIBMnQRijwFvWgUrgOPsISdje2I5Pj+N
	 d6SUWxpB8BrmRQR4MNNTJLOF25fC8oeskWpCD1v+8owe0AbFkOHl0k/AeyJHd/fUOV
	 DWbQSGYdMI1kA==
Date: Tue, 27 Jan 2026 12:07:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the drivers-x86-fixes tree
Message-ID: <aXiqahmtF6LK9hxm@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NhcMottszzwABOmN"
Content-Disposition: inline


--NhcMottszzwABOmN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  128497456756e ("platform/x86: toshiba_haps: Fix memory leaks in add/remove routines")

is missing a Signed-off-by from its committer

--NhcMottszzwABOmN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml4qmkACgkQJNaLcl1U
h9BvHAf/UgGoyoppGcGI15FfMUQ1cDZ/JJLZyhcD8w3Hajnhs+Gj3MsTwk5m/3nI
ys7NpT1/erV7jDerPfzjOzAf3sAbo/2i0vOGIq0tjOBbjcHgPMl93aHIoVgMKXzk
6ivGmdl9xdkSsUA2UKfbMMy+dIr6MO2YNdLbRRI5JOsQh3eSTQlKoJmM9zBLCAT4
2Kz284hMPtb+kKZ6xaaCbYiCjj0ppbBqwLrljiUZy47+cWT1eSHCByqYwLYamQIF
RaB6sAb0CWEVV65jSSCChG6kfX/VUnUTHcVged6AkC3KmvC7c9FR7o1Zbu87NT7X
mMsC5O46F4YCDZOIlNjFnxe2wim0AQ==
=SYWT
-----END PGP SIGNATURE-----

--NhcMottszzwABOmN--
