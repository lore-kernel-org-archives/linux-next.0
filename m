Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475663A35AA;
	Wed, 21 Jan 2026 11:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768993916; cv=none; b=U/pLP4hsk3zSjV84mqhgsvg7nSeGyY2blwQu4k4QFIp6QaODfPDdfSHL2uC/HutPbM2IyxWRy9QP23pf5V+OKDO3Gk/v6J9GZjhLrVff5K6HQKA8Ijfk9yvmhwUbngqkqn2blznjpvN9BTa1Mdzp/hxrkZtBM7MXN4d/kTgYJWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768993916; c=relaxed/simple;
	bh=9VudwIupjnwW0DRRjtWHZ8714uQ7sMoSshYo89AJXqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YeMGB54c427qc/1Hrlwn+nA+fh2BE7oXoQrI7d0uXseNjy/P8CmMjqKyG2oJBPOqyxDtfEjPQ3lT0ezFsvUw6M6Qxb9fgr4Mw96FQrFtDP1YcQ60h1crKVgQ/advureA+xJEcn12gze2uKOC77lh7imMGmBiN+ECAfR6szdrI6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=el6Kmyms; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="el6Kmyms"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0244EC116D0;
	Wed, 21 Jan 2026 11:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768993915;
	bh=9VudwIupjnwW0DRRjtWHZ8714uQ7sMoSshYo89AJXqw=;
	h=Date:From:To:Cc:Subject:From;
	b=el6KmymsIcx1hK/Dvj8uU3/69yRTsNiFTtAQsrNGfr4v7YRKdZ87sOh5pdzPeNbvG
	 PKYBpPDes70hU7iPvfg8uo3nNF8bfuE1aSP1ky4HO3WPT+vnu1T458WEG4ANsLWGpx
	 f2s7Pe3fwoQQWfN/8UPoFdaw8FXD4VBS0tLGQufOfkqNC7bsdB45NcBGHpgl4Y/y6h
	 OsQQMwc5HXX0HKxDCGU/8GQHoKiiGsHeIgsn0nVVU44FDLB3LrcRsm2JJtowxfOetu
	 hh1DjQYBhOi7wAG+/tQGkeKsmqxYNEsigDC+8evE7v7hTpkeAScfUVzgHT7czC8a/d
	 Nc374kkAYJa5w==
Date: Wed, 21 Jan 2026 11:11:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Fixes tag needs some work in the mm-unstable tree
Message-ID: <1dcdcd6f-781c-4152-996b-6d33f15ed135@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OAkdXLz+x1Pr7ZBL"
Content-Disposition: inline
X-Cookie: Eschew obfuscation.


--OAkdXLz+x1Pr7ZBL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3a006d3ab2b2e ("mm: fix uffd-wp bit loss when batching file folio unmapping")

Fixes tag

  Fixes: 8798e255b5ec ("mm: rmap: support batched unmapping for file large folios")

has these problem(s):

  - Target SHA1 does not exist

--OAkdXLz+x1Pr7ZBL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlwtHcACgkQJNaLcl1U
h9BRawf/QCugAjFkNm0yJLTkvA6X0qIH7eKkeeObGpfNeEoxTaD5TzZ56PY5qUuD
rLpTry3KpjxUbHXeTfn008Xdzk7BRvtqTQHD9spZelLmo6he16jdlbeIdXhfufFH
04J9YPkH1ZvPQVT8J3hliOqeM83mKwogaKfdCAbRjXr+RxezdukgDRIcwBErUOu5
rFMgSFOmjbAnK5fPaL8B0Vh/ilB2jZTutnB+nkYcsfwakb6dGkPRtge9LiMQY5g+
wooXdzhAzcbA1mToduk5L3FCTpyp9pPASR62ujCaJjzkP7lRc9VDjMLZUq9lngBA
gdKSQizNyXdINaYxyINXymVDmNzN5w==
=hQp5
-----END PGP SIGNATURE-----

--OAkdXLz+x1Pr7ZBL--
