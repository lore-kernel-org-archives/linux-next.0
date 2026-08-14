Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9F45D1BF;
	Fri, 14 Aug 2026 11:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786707879; cv=none; b=KvMrQcWYiiMdq+zB0ePspPbmm8/s1R2781ZdFDOQT89gu31Py5Q8kPso7/Ks/3WPjZw5vbxEG13YaeU/wBA1jxhbDOUkbCK652cBFT/foiHo36L07bRKfLnim1NBe1/A9SubF+T2PInxxY22vJ318tFJ2H1NNhmEHBfGKJ6QE5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786707879; c=relaxed/simple;
	bh=AaXWUDo0ioNag2Pc/19mxAXG5rGuSnm8C5l/QHKSxgk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZC4wJ2mGGLIaG7xHOkoLZmlR8Hkwucc9DPxpaKfXnAn7iYIqRR1hNODUWChSC3+DrV4MedrYA8GewQacejw/qa1udfB368loFKBc1+R/q6FyVguGiidPmxtkv3LY1OvGjp5LCaoNPNj1yq6qJlI80Y6VLHOpINt0WYcS75ctVw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hBnG/rNt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hBnG/rNt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9ED31F000E9;
	Fri, 14 Aug 2026 11:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786707878;
	bh=tJF7gN2cQKgL7sP09ErjcrsGa2hW98Qv3PlQRtClpns=;
	h=Date:From:To:Cc:Subject;
	b=hBnG/rNtjdPODvGP6JGfvhfUHvj19tPBiLNJULmkp57w/YH+CQkoC1jGNVUWplqK8
	 KkvETNe8JxJA39WwZZSYy9b9FbFGMjN3jzReUIpREQ5MsrAdmjg5Id5U7PQXvEQuod
	 l0REjJMDv/x8vkbklw6TxmaCXNUR78r4icSBI0XgoBmKLP6bc1dDF+gKZT6AxADsWJ
	 o/laT8w+5bJqXPZUCgGATgQ2Nx36lR7B9ljSOAI1qzHTpta8zDJVXW9I165nTs7p+o
	 IWuw78wzu/xZl2karVMFoHb6coSjuslNilOaDikMguTFvZFof6QU9L9RRXASSIzeGt
	 QYJlwK7TRl2jA==
Date: Fri, 14 Aug 2026 12:44:35 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the landlock tree
Message-ID: <an7_o-XBk3fzVimy@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7VFFsC8rxakyeuO1"
Content-Disposition: inline


--7VFFsC8rxakyeuO1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  05b6c1a822ce1 ("selftests/landlock: Add audit test for whiteout object creation")
  583169fb7d973 ("selftests/landlock: Use an actual chardev for MAKE_CHAR audit test")

are missing a Signed-off-by from their committers

--7VFFsC8rxakyeuO1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp+/6IACgkQJNaLcl1U
h9CcMQf/Z9yr16yrJJwN5fmZPrxZlRGUAbWSBOrNDdjz5KCmyt5poHtT6jpvwHQS
Tt5Sue6+z2eXQT6eAeM0L7rdPK+UfEGvnV0CwcGaZDhbXvryMoyzGqrp3febOxbo
38fmTCdFx+nsY8TtCV4kKjOZYvDZw8srrISKMrLF6jFZn0ombCYiAnVKxiKlIw8h
akXPQsyrkl2Fsjt4Gsf4PIhSeQPV8h7OEoDBKD6IEEWTR7gJNxMQyUYCkIILWXQn
nFllJ5DxIo9vTKgxgHrAxRrZS2pTB0bN3KNL2WaSIgta8fSkwLG5Mv9GEYp50A7T
WA8FBL4GuBcOLeXd7CoMJjj+qfh9Tg==
=khB4
-----END PGP SIGNATURE-----

--7VFFsC8rxakyeuO1--
