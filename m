Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29AD233260D;
	Wed,  8 Apr 2026 17:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775668523; cv=none; b=fxNszeKtzg7kx6+pG7iokmzpXy3RBxR4hkIFkMuGkP+8r8WRkC6Hndq3Lk92ZqQNa/QRmjQgDag44BJ3+4g7LdJnkBxeMFVc48eVgrY4/DU5uATZat47+OIXr4Q2VHhBVPzrW4JRnn1ljD8sULwEuW52jjliSt7xwTddeaXaTKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775668523; c=relaxed/simple;
	bh=KEe3mC0Yxg+aB6F/bPhoWYt4FNbjdiakpwCAfAQK8uU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OQvAh5tqFs1YTNeO8QmkpZwdkIOr5NYBbukTSDzJYgbNY/ZNJ4skPNlTispChQHOZIieOC07E7WgcaxQ2l18qtO5fNajlUVI/xh6C6JmyFqLdANdYrY3zUZiumneKvZ+MVNeZnbXqSZGD5/jGsZIcbZpqturTEyQJOUmH79TC8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJQ8FmzB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJQ8FmzB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3A59C19425;
	Wed,  8 Apr 2026 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775668520;
	bh=KEe3mC0Yxg+aB6F/bPhoWYt4FNbjdiakpwCAfAQK8uU=;
	h=Date:From:To:Cc:Subject:From;
	b=TJQ8FmzBmvhFc2MaBo6REKjfGMsOaTzRqXWGbPWIO/6fC+ULHDfKefj7uEuqx0ZF2
	 HrxEd8Azm36f6RMlJggeeFgaR+DI0rScGRELk7pRebGAwZjSN2gCZdCbj6usp9Lq9F
	 wr9d46uURHK9mmDk9rtwPH1FxanHcMO7GJOefWzeneCBI7wspl2y2XDBGUKb/x0zuR
	 GJXrwJ5SxBfuJN306cDCHzNq+DsKwjICx1MKFR605UoI+mUM+Ixa3dW0GWxvZ6wSMK
	 /O1ZaNo8X21D4pzqaz+6oC/HR6AUqS1wwroMbvBAB6N9i8q0lHXBeEXyK4t97ZIzMx
	 zItLdv7weolxg==
Date: Wed, 8 Apr 2026 18:15:17 +0100
From: Mark Brown <broonie@kernel.org>
To: Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: htmldocs failure in the dma-buf tre
Message-ID: <adaNJaF58PZlvs6K@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6hG/XMKdY0E/izzZ"
Content-Disposition: inline


--6hG/XMKdY0E/izzZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

In today's linux-next I see an error building the dma-buf API
documentation:

/tmp/next/build/Documentation/driver-api/dma-buf:142: ./drivers/dma-buf/dma-buf.c:1355: ERROR: Unexpected indentation. [docutils]

--6hG/XMKdY0E/izzZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnWjSQACgkQJNaLcl1U
h9B+PAf/Vk0TNmoRdO6piWxlWY+boN/yCLZZe9Hv8AG3EvuUit/j5N55pwvZqQhA
Nfx5wNgF67WPZ+/YQrrva7iFxLiA2/ReNTCCn9d7eVxSzIyGUF1y6siF9HqM5KIl
bqNHiMndPAGrM/mNsZoCcW4LmjqH59m8zUvRFYnoKEV/ewgOTuB3I1sU8e68NpWP
pavZgmcEqiSHqLRCfrnn//y/CSg12XVjgguzw2I3VdoyBHyZwKWWif8eYdN0OM8x
zko8nXaPN6nZeSzSr5XjSGcf7mHSQe3FpuxB6AjTjTZ++OA9JINsx99GsppjZ9Xi
RBuzYGLfoBZHH1FgrPkeg+CzYGHLUA==
=7pMy
-----END PGP SIGNATURE-----

--6hG/XMKdY0E/izzZ--
