Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C6734DCE2;
	Mon, 23 Feb 2026 23:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771889340; cv=none; b=Qux4bI42cSYrBMlCozKLlN+RGmIYh+tl1S9LjpJ9eFlxO2+rxwKKgEqXmFWaWLEscYNG3rE6EmXxYEwSGAfKk9gqVvFgOzcsTCUzOW6tNBHk3gnvXVrC4XAyZhbUUT7P3hjQnUMc6VVwZJCROOiHEvi28OlmaCIFdmECClfxt8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771889340; c=relaxed/simple;
	bh=r8sQb+R/fIgqNtDpyroYai+UmRQb+VPYhKMEv47GZjk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lN1NdYeVhevAiMptPnuKyi7lZSCFFeBpFeobVnNhaODezcDK+rVPNjFNKzOFJF7Ig8a7luiLJgFfjkqcowRulHI17tRAmrB539cgkbOn6g1eeYVfQIsbZSVwF6xsXDzrc0ZFqyIVnhlgwUYv4ZN0nje13CVtnmrhkURlikuhkY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8VIozk4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8VIozk4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D147AC116C6;
	Mon, 23 Feb 2026 23:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771889340;
	bh=r8sQb+R/fIgqNtDpyroYai+UmRQb+VPYhKMEv47GZjk=;
	h=Date:From:To:Cc:Subject:From;
	b=J8VIozk4D53ngycVrroFaootqNQBiZoOZJxZWWYHwJ6izaxGp0KjhiXOatblN6RQL
	 JfNnMrEyGP20D7jCjV/Ewuq3J8xCSSa3ylu8kSWTkNmmwKhJOTF9xBi0aqfzD/MnRM
	 +LF3CLmMaRmC15IsS3h4RVgghHZa5UbU8iLI28qcdKDFtuOaijwl+wJ/B5yi3U6Mb0
	 RcwAdIXSiFrik1PaSBvPuiX8b7ZyiTFpXyqH3i+iJFOs0SsU5Fi0SWa4fVbuZTB3o/
	 ioWpIlkzjHzJPUS0DlsJSOgkeK5tM9Xg2LFJs2Fvi/+nVND1aBohLv5NK04QTnwPqn
	 0+inBe8kIyt3g==
Date: Mon, 23 Feb 2026 23:28:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.0-rc1
Message-ID: <03d45826-236a-4b8a-b441-957c3fd09249@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7xHjI4i6zAaMu2bl"
Content-Disposition: inline
X-Cookie: My LESLIE GORE record is BROKEN ...


--7xHjI4i6zAaMu2bl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

I added some counts for trees with commits that didn't make it in during
the merge window at the bottom.

Trees being held at old versions:

  drm-misc      next-20260220

Trees with signoff problems:

  hid	(missing author)
  mmc	(missing committer)

Non-merge commits relative to Linus' tree: 885
 828 files changed, 18023 insertions(+), 9574 deletions(-)

Top trees adding commits to -next:

  145	drm-xe
  144	drm-intel
  70	mmc
  50	stm32
  23	mm-nonmm-unstable

Top trees with commits in next at the start of the merge window that
didn't get merged:

  79	drm-xe
  63	mmc
  61	mm-unstable
  50	stm32
  27	fbdev
  22	pmdomain
  20	loongarch
  17	mm-nonmm-unstable
  17	exfat
  16	broadcom
  11	risc-v
  11	hid

The mm trees are due to rebasing, the script just checked for commits
being present in mainline rather than patch IDs.  Further down the list
we also see a few fixes trees that didn't make it:

  4	riscv-soc-fixes
  3	drm-misc-fixes
  1	rtc-fixes
  1	riscv-dt-fixes
  1	i2c-host-fixes

Thanks,
Mark

--7xHjI4i6zAaMu2bl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmc4rgACgkQJNaLcl1U
h9Dx5Qf/QMBaDELysYSjjjzhMlbpA7rzQw2EsEDbr5JNruXSGM2eZPu97nXmnaD0
4kiLfyE+jLkzwR1E+phO+iNA3mBTwQT0pr8ATrOEx8kWY2AhPhQMGx/TslVx4e9f
6Y7wVukz9nXMTDB6Fdpmj51KZdRyVvWXik/qIGU2ROXLoHuWejWeiNFR4Fvqx52r
UhRfnHakufOomj5H3hk1PVYKOwPStQ21a2eVca/OqB+GbhnIrUBJBLsZg20/L9lr
2pyXTAxbbZkdSePH49qqjj52FUw9IgXNolaEYRfptXuklWMxvdX1YaK1dpeKchin
0XAh0Gj4c+egOCo2C+B6zRUhBrTHrw==
=qWHP
-----END PGP SIGNATURE-----

--7xHjI4i6zAaMu2bl--
