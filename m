Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE99A937;
	Mon, 16 Feb 2026 15:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771257126; cv=none; b=vGNPpgC1Nztw9sA1im59pX2J0WFb1jBK7ViyR1hsxiWqQdTO126DzxaB3QypgRLLRda/+gttZ0xgrx3iMSMnbr2EGdOarFljxgtsnRdbdsA16e/VkPULzpXzdf3vXT1oDF1/sMm8F79t9uXvWYDwiXj+gP92ynuFcz+WBXqS2JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771257126; c=relaxed/simple;
	bh=iJ98S2cPmV0eLGMz3ZVDhHsDIGjJgLiBkcSBUQxYOAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=awQHQ9mIB+OoWNETPcYT2Z8f9CvIeYAA7q+veIEUv1R7pEcfiXApuRQJMscCKnaZid0mVYrxHml3rj1biwqa/rBKDhvuZ7hUxe2yfYgScb8wxfxFrvOkoxVZZLUBVKk7Q5x92duB4WK3Xh0M5Cr1Owm5PXA6iHOw5tqAhDytXwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y1Xo9ShZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y1Xo9ShZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0799C116C6;
	Mon, 16 Feb 2026 15:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771257126;
	bh=iJ98S2cPmV0eLGMz3ZVDhHsDIGjJgLiBkcSBUQxYOAA=;
	h=Date:From:To:Cc:Subject:From;
	b=Y1Xo9ShZIb30aNKaLQ4bKVX9jVb7TnUPWF0ly7lqHQX2X0Ofx+YBpCTUGRfYnkCip
	 xO4VT0aKR2szRp3iEB5fQfZWcIA41SzxMdrot2ANzgmj4i4qnuWXbE+2q3CJFOnCrt
	 M6hpaZNQNGzASTrp+dxT7bdi92mJ+qs68Eg1owcdRlax+WJ9GrU0Ul5uqxVK7R0Q7e
	 8nNKLRMDYPR8LDrDVBePmqdaSmq6Bm06s5CHvDA09KghlLDkwtfk6uSQYvJVbJ0lps
	 QjehSB4YFdXRg/+l9Jn1c7vt9j+qZF6y5rkGXwxvDPEkL/jfPk/aYPrAUIphUZvfhA
	 0kfTeO/n7lpcw==
Date: Mon, 16 Feb 2026 15:52:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at week one of the v7.0 merge window
Message-ID: <56867107-7db2-4c93-b8f4-f732fc780c35@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0sCAFV9PwG7fzwzm"
Content-Disposition: inline
X-Cookie: Beware the one behind you.


--0sCAFV9PwG7fzwzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Trees being held at old versions:

  mm-nomm-unstable	next-20260213 (trivial -Werror thing from today)

No trees have signoff problems.

Merge summary:

  Non-merge commits (relative to Linus' tree): 2227
  2029 files changed, 83194 insertions(+), 35136 deletions(-)

Top 5 trees adding commits to -next:

  146 ksmbd
  26  ntfs3
  20  vfs-brauner
  14  cifs
  12  ecryptfs
  11  ceph

(this is a slightly jank count which tries to exclude commits already in
parent trees, the first time I tried the top trees were a bunch of DRM
trees which all had the same 1500 commits plus a tiny number of
differences in which didn't seem super useful.)

Thanks,
mark

--0sCAFV9PwG7fzwzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmTPSIACgkQJNaLcl1U
h9Cslwf/ZpQGtmnidl/E4dSHy2XNM7DUWA3SACZG/IYmJFpkUrVuiuLxvEReUEiZ
f+sVuWgQuSO87eTe3mrTScC+uPSB2jXr3GoW/KJnAvig60kUyK3siD2HJA3ex1Nx
a4++sCa5plXlfz9H0aGhSX4MnZ6DS9LJ5QsbhCR6V08RBIW/eWKXIuM9heCuLThw
sAOzkBQcv52WedZZTFjyNHCsVZE7w+MRyFI1vdhFO49t8zsRd5oY+N+RfjYpWr8X
BX3bQJD84ydv4DWF0rhj5BGDBlqyfZXijUQOYsU/a4PuzpQkxP1ydrtgM5832Afy
c0nycCEZDVI8/g3KxJVFMmbTPDClDA==
=2Wb0
-----END PGP SIGNATURE-----

--0sCAFV9PwG7fzwzm--
