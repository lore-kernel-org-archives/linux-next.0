Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E693B38F251;
	Wed,  3 Jun 2026 07:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471044; cv=none; b=h/bIXjNy1xHnzbkPCriWQoyc9oq6onYrXP4h58SErWsqfs6LlXn6ybTwDzdIyQRftCNW0QUETupvnwj2Q64jRNkklnaxnSPYjPmIoBo9agIswGYExMyKv1ewmgg+OEMe0OUGYR5dqZhk1v6FC8qwl3sbHqAQ9pJefrNjgT8kYPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471044; c=relaxed/simple;
	bh=g/t8LOpXF9MpbDJR5wvQnG/VspxTx9ak17tQ4TPNY2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hoCiCmrkxMVLhJWlbxjkaK7HBs64sZRz9Oof6N8gP1dQ1H7iWnj1us5yVk/MVcUOapwPzsnjYMwj6cyFNz84nAFyOGYaiuNSzHmuyVjaluL7VqqljQlbJWlqzYOYzCmaBEjKyje+E/GWW7YeRFyEOZ6gQdMUYv+tcXu+EnQ7q5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZQzUbGl2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZQzUbGl2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089F81F00898;
	Wed,  3 Jun 2026 07:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471043;
	bh=igAXnWlq9rJjKVSfKoL6WHkm2SGxKHpigRV+r30d85I=;
	h=Date:From:To:Cc:Subject;
	b=ZQzUbGl2QLHOrju+boGlc/wO2l8mgwrtI3lTBhEpVgHYgOXgqY1HGBoGk/dlQsY+h
	 wj07Bha5W6j972LdMT3biZgVSfKFdSczoxf3UxaZ96Xc5P9+XpbwKuIVHyz8pXOmpJ
	 8blzqwF26KlBQlZ9n8CksplVfTIPVZJZm3sk6aSCoKfYCdsv9/tl57i1VHV89eWuiU
	 ZZARoonvEkyNeDUnmgoaVJbK8dMBp3BzKsW6f35EUQSaq3tibJV9MnpslKZEgZE+Z+
	 g3X6PcEdQOaj4I6o4tP/1jo0dJ59AfhbkEZXnPkD9hTMLvzFF031Z+Z9pMiAOpPK6K
	 w/NTE4yddIKJw==
Date: Wed, 3 Jun 2026 08:17:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the iio tree
Message-ID: <ah_VAGsa-divpm26@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R0d11Zr+UUXGmgY1"
Content-Disposition: inline


--R0d11Zr+UUXGmgY1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  e4d6bb000aefe ("iio: adc: ad4080: fix AD4880 chip ID")

is missing a Signed-off-by from its committer

--R0d11Zr+UUXGmgY1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmof1P8ACgkQJNaLcl1U
h9CJUwgAhFVKcgfY0rjpLner9ha0dSHdFBrDV1348RaaByYw4ZJhCoWh1DtANgvq
Y0ubg/8cEYHmcp/PeekREd2JmBbS1nNI9amZck7D/qqxChhsbyj317dZ5sJsKZb3
RelJSYyuWXqayweZtvfvSq+Tr85NcA3AdFIl+VCafbxYaAe1LdXH9uMfjJcGbo4J
pIVWzY1+bBzwqyNtOrLsW/Z3PJjdK40UEILURTP0YeqKKYrvC5ybQdgzR/0wr2/r
KY3VREGWV0APtmgZ2KlO8OQNIjiEfw50/QXzYRQi2oxwtgV/xwUq2eSkvug2axHC
2StN8/22I2BX+NT436C47QK1oli+rA==
=lV8Z
-----END PGP SIGNATURE-----

--R0d11Zr+UUXGmgY1--
