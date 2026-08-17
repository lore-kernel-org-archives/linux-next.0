Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5C741A938;
	Mon, 17 Aug 2026 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970438; cv=none; b=u+2Oy3wQIMegzps5IJn8cMskzEXn2YBqHXVHZUdRp2SYI9TCjXzGePV6sHNpskXGS8mVZRkdAdX1UW7zqBBo2SOX6P9nccz61SVgMqZbFFVR4bF9INe8UkkdL0wcYQR3aWlGwp/G1E3NNvGwQ1IWjfG8yMJVKUnenrpX19vZjww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970438; c=relaxed/simple;
	bh=XaPPOjNKspbl1mTcQAclG6jJOg3EWMpARUmF4Ktevvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DSWVd9KS305xA2poT5xXF9xyiHB4KrKMz4xoDODfQ9ypoo0p28mJevBBSezhWHe4iJUtG2+ffI8Il7i7IDas6s/vh75lDJwN/ocnY5caGliv4zRdG7cBSoM9FvdpKHmzeL57V5gxg6rkun8fC46KmsHbBlHQn/+wlgwN+YUsrmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HDBkRfNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HDBkRfNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82FFF1F00A3A;
	Mon, 17 Aug 2026 12:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970437;
	bh=Yb9e9k2WB6WN5kZHbVIYBg1PLPBpk5uUgu+sncfRDgA=;
	h=Date:From:To:Cc:Subject;
	b=HDBkRfNcwAoWIAWDjm9DmgMXAdx22UlxjljdtnfocvSwAO1tmLH86AP45pXvum3Y5
	 PYoAym+KOtlWM1/VLfHNoRtNZgasq6iFH8c9sM6PnelZQPG0vGRws/0zGOlnHMp/tp
	 GVQ3M5CpEcVgPRkAYa6VoN8JMg6qSjwns4ygNT9QJ0Aw5s3ghVLHQTUnCX+Y56jf8f
	 OK7T0pcGS9+fT+RI+RBA2zEHz/SB8G9tS3C8ONRWRee5oFYiAM9ynDyR38mxYj//9e
	 0D/W7RW4wOMBHFcMlgTkbOdcTB1c39C2q0qL8gzcr1yMZoQ7Bb/QCSkvLVT1Sethqn
	 eFt+GXGeeW6bw==
Date: Mon, 17 Aug 2026 13:40:29 +0100
From: Mark Brown <broonie@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the input tree
Message-ID: <aoMBPTH3mtDVI62j@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VWvfn/Gy9I48+RcK"
Content-Disposition: inline


--VWvfn/Gy9I48+RcK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ad255410cbfbb ("Input: elan_i2c - optimize update speed for IC Type 0x19.")

is missing a Signed-off-by from its author

--VWvfn/Gy9I48+RcK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqDAT0ACgkQJNaLcl1U
h9DC9Qf+Mps4JdlHy2fYAxvinRb+FzcbEiySFPrCIz8PoKlmw4nYLBdldlrLZBOH
lVXVsiBMiMY0qpNfWuyJcAxqJU7RBhvw9bDzACmn9doCzY3sppqcvzB38NUzeks+
yePLKDW2rpa8Q7JIUZCkpWvwrII21DK5rII0AFRSKwpsA6w70s+7fovxKWeQwM5R
bAt0Dhmcbqsueywhgumbrnwe3yOLwryF8Hng0BdfmVdN3qac5U+TchHzYdQh82N/
SADvpbjbK8vNKtwcbqY+pQwPW1fnOaWcDLbfiDQ96lGXJOs1CdR0S2Y/WKGW3cSD
IcTs6yEQFZG0AAaCazwR1c4gNfuBQw==
=e7sF
-----END PGP SIGNATURE-----

--VWvfn/Gy9I48+RcK--
