Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938244C041E;
	Thu,  2 Jul 2026 14:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783001083; cv=none; b=QVHMcRHm6zyy19SfBWQ/k4u5X6dircyLwgSQZs5DgOczbTsfbb5J4dPkCRX9q9csu8kE8pd5rwWcPFN/t7Q9v6y0XpwahL9W820T0gRNnC2VJCHyOx89HOVYqt8D4HBth9ioUM75Lt2hs7Z+DfiBH/3/5L2YiFgqP1wfLXpJCH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783001083; c=relaxed/simple;
	bh=fB4gq9Er87G3XlE4OjN+LU3xeL31lKt821xaa6uaalc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K42t7H6q7FScZ/qIsPPcrWOwDzBAc7TtmVLnwSPYys2JgX+Nma+oUL9CLp0h6TURblde/Nx8sD7MPsmtOxCH1byKS/nODS05Dp9R7RYAGKq5JvSJZlHLgJVwvoISTGGgmVp1M40sSzOrB1lUVnNehrsZMkGzmtqanm53Iw2jt74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZelTCdJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZelTCdJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8243E1F00A3A;
	Thu,  2 Jul 2026 14:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783001082;
	bh=JPYn4HTeicD+8xnhOfpZIqpeNStcSexFpxch7EDjFfQ=;
	h=Date:From:To:Cc:Subject;
	b=WZelTCdJYlT/6HAHG2lNW9mBcalrPWZep/T2YeBN2TRzemhY7fdyqqO+1t77GSwj8
	 BjeAxi0VWqpHBW2onsjTyR31CJUFKqZV3YV16YsuWzDAXF/EQhX8y6kV07PmuruvRK
	 ZOmYR65bKAGtX+Y014goiGJdsbDdi7pHJks12qN2vK4cUwRshWG8r1inYoZeZV+5ct
	 BJwclomfEAJkmbU+rCvDsn6PhVhyhj5bvK4qlfwY3EqTMuNMwVy2hQUumgZCWxER5K
	 zEU1Ee4ZQuiJmKR/OyRxCkaOyTea6n88nDPnKn1aE6S9ozeGiGALt57f5SNOfzG/1Q
	 ouy+rlEHUmRPA==
Date: Thu, 2 Jul 2026 15:04:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the amdgpu tree
Message-ID: <akZv9n2Q1kG2pbYl@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XP9n3rOFrlR1d+75"
Content-Disposition: inline


--XP9n3rOFrlR1d+75
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  0aeed866cb938 ("drm/amd/display: Fix dangling pointer in CRTC reset function")

Fixes tag

  Fixes: e7b07ceef2a6 ("drm/amd/display: Merge amdgpu_dm_crtc and dm_crtc_state")

has these problem(s):

  - Subject does not match target commit subject
    Just use
	git log -1 --format='Fixes: %h ("%s")'

--XP9n3rOFrlR1d+75
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpGb/YACgkQJNaLcl1U
h9CC+Qf9Ffk6pxqlBG/mwnbaaNMnoQEO8zvCtpLVsTJoE4p9pTWlBskezWZxk9pf
pcX1HQZi+6YF3E5chyzrBhAthmpfS5ARoeu/kbc4rIiYQgvfCEGGfaRXlJDBbxxX
rt3XwI9Dg1YDEe/Nm71u51s+ASLb+ybhyeNPkp/p0qy+BNtrvfJ4w939EJVlkrOT
6o3JJarO4U1gxe6QwPCgCK2Zw/8Iw11dQ+Tx/VOCUc6ZYCOSM8Gk3CuPEKLoP7HM
sQze/WILHhQ/ciII02TuzEIx1znwgx3I8l0lHt+He+HaxofdP/X7pofcH92Juzhb
1xtv+F+QFVOoNN+yyZYzM97el+XC5w==
=zV48
-----END PGP SIGNATURE-----

--XP9n3rOFrlR1d+75--
