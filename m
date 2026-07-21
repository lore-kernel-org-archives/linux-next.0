Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B182248B3;
	Tue, 21 Jul 2026 11:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784634376; cv=none; b=uGsH/lmgu7kmkZ2oS4rLsmuGLarVoBigeOJaRh2prgMgAEggQzuL7PzZ4ZaF2eCGLTVM6U6oAXtxCgqVUKajVB1IJ9zLl0JYWrlq+RuS39NALrpDL4lZw9SiMEJQDrl0887sSONuN+J5MIq61xKwyHP/EVAuInP0FO1IklVmrXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784634376; c=relaxed/simple;
	bh=l+QUG35roDTyrxfeMEQ1wg9iDumCS+yKF7RYbN4pGtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JozQixkHReDQKVdQj0NISIW+f7/24RC3NWxWUPGoxjAKcb2zlu4q7iXXrUSxpAL24Vf2DnqedPa/wdOX7KLkRLcACSwwbHoUu7DgW4jyP/Zw31fMI4lJWp12UK3a12/3dagPCJcBPlb4KaYCqmsJ8oDkT0dAhmU+CQP3nrHMD0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Es0fllKt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Es0fllKt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5CD1F000E9;
	Tue, 21 Jul 2026 11:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784634375;
	bh=mtZuWSHWLl24wNIoYqvwya9rqxP0WdFl9OcAoayOREc=;
	h=Date:From:To:Cc:Subject;
	b=Es0fllKtNZ733PzaCe3+DmQnD1Fc6O3EkXs2siEkrwyE9IfCPGOM4KMZCQCDZFIUz
	 voBr+c1NW+HVnm1ftjneA2UPB1Dq2SbZb3u8kCSKX18yB2vRw6mUCA1TB0zweOjCr9
	 mEaeHBDedYmpliv08Gwu/w4fhn7DDj6NHNipkvRJBKuCQGpCwXtzzzOKxGy4EGTTTZ
	 pVxjajF/lesLn2WRi06YWEYaqu6+4QTIirYVotj3ITlY0s6inyrv99EAoi4qUkHCAr
	 dVDb4y+410g6qg9eBAPlzeO4fVuPP0lxd1YUQHsjLm7G4t7zNtq1QhCwIqcQgJ1O5a
	 DS8bWXKkZ8XpA==
Date: Tue, 21 Jul 2026 12:46:11 +0100
From: Mark Brown <broonie@kernel.org>
To: Christoffer Dall <cdall@cs.columbia.edu>, Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the kvm-arm-fixes tree
Message-ID: <al9cA4bfywF11OmQ@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="68XSFUe7W5mt6UVZ"
Content-Disposition: inline


--68XSFUe7W5mt6UVZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  6c13643a6f392 ("KVM: arm64: Fix hyp_trace clock disabling")

is missing a Signed-off-by from its committer

--68XSFUe7W5mt6UVZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfXAMACgkQJNaLcl1U
h9DHEwf+NZe55NnL80fV3/VlJau4vFqW2sLT1hfwgpBw0HFy2OJNc5ydA5Xa39po
q8lDddqes/Wyb6Y7dZYsPidGTWdN5j852q9gqEkY4I+pBE//7/qtkI8qdBI9VYJ2
D6Bnpx9dZ3ojWPd2OtInEoHI+eJYNohBegv+GK+C3jFUosMchTGfF+VBLIvHZKRB
yhjafIVQIHTWYZZ69IGzKzqbiEMLw+pYLvHR1BG3WfRhCazzZEo7CUQIALXRctpC
xL3rSAFxI1Baqunjn5TcSiv6j16oMpHzHO+RC59tJ2WnzOLKYkRj4q3YUvBUAydR
2SgC9w4zx6Lg0MEZXJWB2TtmXh/rEA==
=y8CP
-----END PGP SIGNATURE-----

--68XSFUe7W5mt6UVZ--
