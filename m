Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53762848BB;
	Tue, 17 Feb 2026 12:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771332709; cv=none; b=MilwjBIPDu0kWb0KRPJuPRlkmqXOsN6+K1o9QXeCnDSgVtGAkmAMTTua914RZNTq5ppsHbojX+gqOrB03XGEdT2C94dK7qUlWwzNSMTpWBrtoRhoDc3luqUOF0cN2KzjTaWfDySiVL4Kr29rWT8QUzmqxFzRfkthhPzjajnlLl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771332709; c=relaxed/simple;
	bh=bVthaQ1wDwJLrCYEiQJ9cXFPkIMqu7dgMwDtfgQLYgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EWjxIt+J2CEC+SYGhKC4VCM89swDozeW3G/aYoG3YrmwVfJDdvcXHa7Cd/HeN4/is7EOeiXI9gaZ3Si1OTPcKz6+upWp4hPP/7hJngkPG1TQBEiv5jU31ycC0ft9HW1o0mtEWRwPHLUzXs+1uqJnXK4wk2+o2BEwdzOdhDl9hsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QnSim2d5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QnSim2d5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F2A2C4CEF7;
	Tue, 17 Feb 2026 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771332709;
	bh=bVthaQ1wDwJLrCYEiQJ9cXFPkIMqu7dgMwDtfgQLYgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QnSim2d5yTwNdCBlDd50ARY9qsJIxkRhds5NKV0ld3GsTvZVIizWTnUDOw5fe29x2
	 nGVxoGCiSdwRCNCUcbITFcItaJ5yDn1TlfxhJjNr56ltcdoVStls4YII6sO8FKSeeQ
	 m203buf5tmxEE3D6TxgqdSpnqJltys1fvCWZu9A8faFQEfFE7z5ZZ4TFuKFzDRKuTW
	 AagS7jkYyff3/UXQIjwP6v6DA40GzBMbvALns8QvHy59dUYbWJrB8b/kjUN7LMdSHX
	 yU4lYUATycEhydLAuR79Qd8uXryIp1pJC+RHZmjYlKrs7ACBMaB7watWOvTWebghRk
	 8/2HwRTXMDahw==
Date: Tue, 17 Feb 2026 12:51:45 +0000
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Namjae Jeon <linkinjeon@kernel.org>,
	Steve French <stfrench@microsoft.com>
Subject: Re: -next status as at week one of the v7.0 merge window
Message-ID: <3dfd5c59-fbb2-42aa-a265-9253ddd3366e@sirena.org.uk>
References: <56867107-7db2-4c93-b8f4-f732fc780c35@sirena.org.uk>
 <9fd209e1-e9f7-446c-98cc-e8f3aa17077b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2t7H3L8VQJYAL2FB"
Content-Disposition: inline
In-Reply-To: <9fd209e1-e9f7-446c-98cc-e8f3aa17077b@kernel.org>
X-Cookie: I'm into SOFTWARE!


--2t7H3L8VQJYAL2FB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2026 at 01:20:48PM +0100, Krzysztof Kozlowski wrote:
> On 16/02/2026 16:52, Mark Brown wrote:

> >   26  ntfs3

> I think this tree was requested to be added just a day before, so might
> have the same problem - lack of wider build exposure.

No, that's a different one - this is the existing ntfs3, the newly
requested tree was ntfs and that wasn't present in yesterday's -next.

--2t7H3L8VQJYAL2FB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUZGAACgkQJNaLcl1U
h9D6ugf/eOJ8Yxo7ekSWxcb3BiyGLmk+uh6iBBEKJww5lGzWrLJXa6EEVTvw7skc
V7di1pAhLDn2vSyKTsI2WAJmyU4xxvMCpSSSy08CNOlhCv9CvGNH1HkbIve+siXG
J5jzPQ8vl1rfpYCRAEiMrkQjhtilZom52Q7VQzd1Ocxw0lfGst4oEcDEuJ7b4+Vn
0EDaHNW9KhHqyPtiKVMImOZxwJMp0qI8/GYI5dNHeLViaqFqH+ouWjU6yDLlPvv9
8IE9JlH4FqzXiv5Ptjuv04aGAFr2eGQFJoca+AQio/alSBwR+K9fxbbclvBCoE+l
jzWAk6xwfXVrNoyHIImvua28JblEtQ==
=vAqp
-----END PGP SIGNATURE-----

--2t7H3L8VQJYAL2FB--
