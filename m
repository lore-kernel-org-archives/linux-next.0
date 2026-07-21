Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164622248B3;
	Tue, 21 Jul 2026 11:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634393; cv=none; b=d0OUsXYjP8kYrny9a6WKSwJlbcKCiKwAVmwEUU8Pc4kam/W/nn7QkXE6z5363gLRSGmxMiZGDP+bYru0y0FAL8gk9HyiDMw7HebTI4VDSe9VESi7/0RjrFg/GNvHjzBvtsq6eMMmlFK+WCod471NDs8sOFB47l22O2gjvxD8rJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634393; c=relaxed/simple;
	bh=FJXHBbcACLjMeyQw6IyAhXLKz0X9YwPcgrpLUvVPUHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gYwIeAhgMzrFioYi405A3hzKd+Cf2odh3rqBUu8LoJEzTObTijF0tSiuK/foLT7MWX7EUH1EFivM9o+E5H3Qgwt67qsMEBKJUuxMraEnormYK3RVfkqTBsLQ39r/UlyEjNyOYveWw9XUcUYDzoQ5JDptr0ILO+ldFzsRcxoOUYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ggo6kr75; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ggo6kr75"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79BF11F00A3A;
	Tue, 21 Jul 2026 11:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784634391;
	bh=0wvV4a53mMDMORRPeE+UpXOHgo5YRjaLD4LHFIHgeug=;
	h=Date:From:To:Cc:Subject;
	b=ggo6kr75D3P8gHu6CvnWhCRBTsDIL/uw3Fnih1fjdsJ/qF2GMR2cjsdkpEIzUGZ6u
	 tSiQ8v1cV3+TXLH1mTNgfUfhAz87Ir+sJeVYVCTjTcLSIdloZO4/YXqp0wdlPZvjNx
	 K3qokSVGLBHEDMmLSOwZa3YjzPEJU7yxYTBb2OH3ngyk7j4wy98BrB6hvXd5Kkyvxt
	 85fPD++JgIQy5I7GAfMSinfeXeYEXs+H/Ht8fS/qh9t0AFuCNpu7+9GEzPBcC+jC0M
	 ymc88WA/7rex0y1WILmVDRJnql2Q5I9/V/gifkEfa73CY3MndPFoHfrn3LKY5cLRGR
	 Kui571mFeTejA==
Date: Tue, 21 Jul 2026 12:46:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>,
	Intel Graphics <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Unexpected files in the drm-misc tree
Message-ID: <al9cE1PAYd9jyCfZ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F/qVIg8LOFPH4swv"
Content-Disposition: inline


--F/qVIg8LOFPH4swv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")

added this unexpected file:

 drivers/gpu/drm/drm_panel.c.orig


--F/qVIg8LOFPH4swv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfXBMACgkQJNaLcl1U
h9BGOAf/Qg2e/6NfuC5Q5NIeXYX/dCx3IWB6Ry788nRbqm/WdE2dczfxLwKJSbKg
Ny/f7xpqPDiv6CtNAk0I2UMYQwrFXIwdE+erUVrs29KtQIiNg00rHf7SA6ob3R0t
V2DqtJgKuWi8l7Rn9oWO/PWSLbL+XrktlOMZmTGdlbqaifJENb9CtWKxx8MA2Sn/
k7C1cEAX4at9QjsMeVyh6YPM0uDIJ4lYrNdwwmUl5darRETbX1v28pYEgJuTib6M
ELdvvKnfXQhKIXTm34vuh1nS05mCt/C7k5rEczdFFJ8xZk+UrsQsbRBzTFojUN86
IOhfWOfCxzCJkL6PJIoRSXvQRzNpPg==
=t9Rb
-----END PGP SIGNATURE-----

--F/qVIg8LOFPH4swv--
