Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1B7448CFC;
	Wed, 15 Jul 2026 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113711; cv=none; b=tVYTlKLN/14Cr6NZkH0p2QD50e20O8KStaaXXe6jelb0qbH5PiT6JWmmcb42mKXLBcZSReJL73qZwycoIvAdb16vV6ALizZLd4QFkQZtb7beuTKDQI2mPFpdNAJp7FaE7OGfMzrnPbCmIZvJ0jZ9CntPbA9JUMwZanPnCAknjGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113711; c=relaxed/simple;
	bh=xCI90wWWXR5Y7bokipw+YmKYle44YJB8d/9MSHexJEo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lh0pZXy3T3LmVO6c2EZmFW9fjanJBkQnbApgrG137MJQB0VmAklzzUz5extbcXhe4L2/b38+9f9uKwi9Mou3XHoS6eOu+UNyaXLROot0HMxahZRMbdudYfANVQh2fHRXG45Re15wnhXivSZNZvr/nboV3AuZUh9N+1jD58bO1yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSm+aFeE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSm+aFeE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0443A1F000E9;
	Wed, 15 Jul 2026 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784113709;
	bh=P5elXsx6tVxBFLU50vHm+kVLyutZuiPrXAUMuJSXDFA=;
	h=Date:From:To:Cc:Subject;
	b=GSm+aFeEAv+zM3Ns8Lhi0pypnFRIJd3ggTIyZ2ARkIQzxqsmtrOvDFXCprmST9lnm
	 tJbZ5C2+xk0nSsDv8tG7pCwJwDQw8w9d4LS01P9+Z+CPFKXbAv/o+5O7HY8/7/kNqt
	 bOfwwgMerk277cErjJaomGuNnf0Wxgh1A9vJUUf4DY6QS0XboPisruxCwI0WOJIkV4
	 10SlP3iQXTm/rfSocwM2LZGiFNgaDsLbVLwKZmMJDCU/BKVxIvPmQBy4q1QHMCASKe
	 P75lXYqcThwfwQ16Gec7cVjzWPCzhJdUHKtUS5+e7dl7cU6XOFpIUWCSzillBRvDuk
	 ExIO63ep7nQOQ==
Date: Wed, 15 Jul 2026 12:08:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the amdgpu tree
Message-ID: <aldqKkKsg27_UbdL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HiKiPX/YNBFiJwr0"
Content-Disposition: inline


--HiKiPX/YNBFiJwr0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  75d3551f185b9 ("drm/amdkfd: Do not fail process debugfs setup on debugfs errors")

Fixes tag

  Fixes: 325de6bf3328 ("amdkfd: expose pasid of secondary contexts by debugfs")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--HiKiPX/YNBFiJwr0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXaikACgkQJNaLcl1U
h9C7nwf/Wf86li++JhBHHHRD33vvXZN2id0GeqzbFoq7G7+yfu9BIIAQxhjyn4Ro
6IxSB+sXC7OD2sDTj1D0K192aGLMlpPKMU278C4cUQql1udd4WqobvORYscaAl8U
6SXpWReXAkWf5hG1FeQbE5h4XoA4sbicdzJLO//tFc+BqZrXwmhk6XdBO3jHqVR9
0oKI7hMLdsS+HMVIW/baN3vWImCCC6YoKx7s9KRCjLe+MTpq+ejbMOQH80hFv8sC
kgBhbkvS6wWnS8U0fwxB1e2hmKIhE+1uYgL4RioYVbXmXmpZToIf6mgrzFf0W71J
bG73A+NXOvUCw2DYiHRAde3/2aNQTg==
=hd5Y
-----END PGP SIGNATURE-----

--HiKiPX/YNBFiJwr0--
