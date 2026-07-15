Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E5438030;
	Wed, 15 Jul 2026 11:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784113846; cv=none; b=p6CWFu2DzkKT7451q8lNrYdCLAv38/YMB1l0Z/17phSjKDCilAXHzuE1c1ZS1sHEiiVpecALEfS2vjOf4WSVpRqcZCOw1dpyesd4XSfvKQoK5HT/wXuRT9iwhcFUBRRCsxbYnwYMk2hWVmH093F7T0o+ttRkfFyyLNZXS46B+oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784113846; c=relaxed/simple;
	bh=5bw0xvtT9S+LYLuSZU3CC7Z1qqwwmXPZfiujX9U3cOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YJ3YkPZOVvYFSh0SfkTniF/QKGRD2Nc3BxH+Xh/9dgtsZ2hKkVBqQCV7sL9fPpBZic5zVe8hxodEWnD41I6z6k659Lq2rLHbqmQao8OKGk1n6/RWjHxuSLO+g4WXZaH36Jg45vq5enBU15c3snzycz5pzamDRJJHOXo76MqPSys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f480LjhS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f480LjhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CA331F000E9;
	Wed, 15 Jul 2026 11:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784113845;
	bh=cK3MwnBNjofUBjqsB9sbNjafrm07KoBRdLWH5WVQpF0=;
	h=Date:From:To:Cc:Subject;
	b=f480LjhSUqY0sbta9A4cf0BtNvSMt8bkMusTwIPM3xFVGyi/741q1Hn46cDmOscr/
	 bTJdC+9ZKlYTaL0Dp0IAXhHMJ9IjNaG87JZf5J/6WLCpv9F45DpdguOjm8DxsY52KJ
	 GgarVa4ybFG69Y/OTEIK72REZS44rylBvIv0YKMyuwCJLF0EBHKoMgikpcWLDZvWLj
	 ft9K24VCxEDV+6DGhn9PFGmsTheKTueJ3rH6TGx6X7iS8YcFvsw1IzMWZzSD02pSP5
	 1M/KTPHF7kQDnQwA15EJc/zmaEk0RKI/pvwpNJEBfD7MneifnWCX3pXSY0AuXhnKXQ
	 eP34/iGMGajqw==
Date: Wed, 15 Jul 2026 12:10:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	DRM XE List <intel-xe@lists.freedesktop.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-xe tree
Message-ID: <aldqsddPPF4VaFCU@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VKNhRRXc79BXDuXw"
Content-Disposition: inline


--VKNhRRXc79BXDuXw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  3b1f4d5e47b36 ("drm/amd/display: Fix dangling pointer in connector reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--VKNhRRXc79BXDuXw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXarAACgkQJNaLcl1U
h9AyKAf+LUY9g+MrGE0B3sk05UH5SHwWrS9nPp2KNOqPFn7HucwmLrRT8F2SMEkU
+yeNBUQ4gRhhqt0YFVAfkszrmc3YVD06FbsKpTiMXQ7N7wSXFX2gBD+6WKP0jbnw
kwA58x7qwtZ2aV+qD/bkXl46SbKUEPrBKPlbHiaPhowCk0OTudIjcYmg2h6EHhEv
MSRyBG3B2f/LoQMmycru7BlcIkLkCIhbRdJbaxmxK0nFYQSikEqDZc9Hn5NpL9sC
D3l39Cf3n0413x3XGdxQllrN/3NSo5i4/b9XIw8LErWySKVktbmQf+wWG0dEbWQN
AAztBjKbgMiPTKAcHjmyLoPuS9Ewsw==
=V4bN
-----END PGP SIGNATURE-----

--VKNhRRXc79BXDuXw--
