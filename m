Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53A14334B3;
	Thu, 13 Aug 2026 12:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786623238; cv=none; b=rvNuvftDHkRSzbrPWa56Y3+PbiWN8iT6dFxj0GLZUmkH2UZv8GdkrXOeF2CYkBZTaaP7u+4BGU5n9pWmmmFGxR3w7/PNUbwOP/zUDOz0oQM63+4vZB3Nd0ClE7q/+jnLKRHqfJcaDnpXDV/+0ZROJKdErTHKs4WosrRBKr+us5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786623238; c=relaxed/simple;
	bh=bYTWL6hHBjmHzKklmT9MKiKi5oECvSJQtobr7++oLBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sOkoME3rF21nWk6NDcB6xfwA8odbbJxHbR/GFSBWpf6+s3JU4qlnFwiCcDR7UH1ifMeSJejbJTYv9h5WMaAIqCJ/dRkDPLfXt4oO6M7IJz022rndV/s+icY7gIIscpyh+8Wi9KE4itA7nS9thzp+1hQAmyyhptIulOKRvMYRnd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fxNu4Xe3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fxNu4Xe3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D743B1F000E9;
	Thu, 13 Aug 2026 12:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786623237;
	bh=jx9y8DvVpfqUWWv2Q7h6TUKk68fwF7axMSJku1kKdF8=;
	h=Date:From:To:Cc:Subject;
	b=fxNu4Xe3xnvZNTYL87/jzi6UFaxJhqpu+vEbpHG1rrNjhlQmg8VOYPV3F78//XkQP
	 Uho6aB7RrwUMqQ5DyrtAzLfpUCuhti1+odFntJ1hxTZQzFGARLzD8M847GJ4g9/9Rz
	 575fzja+xE7WzWssdxBJ5rw6xnJdffnAjSr/2AlIv/C4flvcYON3MyRJnMp3wft93R
	 keWzgBE16PHLlWin2oBq9SdUvuQ9WenwXZ5lKCu/lkAJ8dxCsoz6wDs/sPexKkiB8O
	 a/q5dlxWaWqQymEOTa8/5VnURoupz48x+wA71xCp1Z3DC/9ICRej9+hG1JXIR09iF9
	 BjkH/AzH1w1GA==
Date: Thu, 13 Aug 2026 13:13:54 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Unexpected files in the amdgpu tree
Message-ID: <an21AiamV65TgRzQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DPMVTkW0/fkIzXjf"
Content-Disposition: inline


--DPMVTkW0/fkIzXjf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ac3baea883dab ("drm/panel: find_panel_by_fwnode() return a counted reference")

added this unexpected file:

 drivers/gpu/drm/drm_panel.c.orig


--DPMVTkW0/fkIzXjf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp9tQEACgkQJNaLcl1U
h9BU0wf+M13zfWUTBniqRX+s85gu9hP5CIc+EXBB3DTjDOSXc7wKRoyMKoHHYcGB
ADgp7Yzzq7xBaAACaJgNmJbIXMLFrJjOBMXOGh4jwenngfzycaLasjpaCB0O7J+U
S/qTHXFv6dDVUgyj+KhApxZ8i4Ui9fkzXTWW59mkHZmFjINXAL2pQzYNQExGfQHo
WOKeH2UbSTrGQCyNBXfyHwvIg2u+eU2tkLwB4iDwtVyvIFnfpN5qzvz7oD9qMZRA
TgnMeCK+bnbLwbLM6W4TLru4q2/wSQAP7u4AGx/FojXEq+aCFlGBat2M5ET0vyty
hgSU++p/jaPa/F7kuZ18H9kYYmhm1w==
=p6i2
-----END PGP SIGNATURE-----

--DPMVTkW0/fkIzXjf--
