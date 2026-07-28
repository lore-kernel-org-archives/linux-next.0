Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832C2438486;
	Tue, 28 Jul 2026 13:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243750; cv=none; b=fppCJwwoV3aewAUHI+h23PbyLrSebW2lNI17kc6fJp9n6mO9HwJeHpOO2LyhjKEqjHKQiyPJU0gOeanSRuzlrqkT/G+gpdwy9+nur1P2etSIYUC5juYfw2liq9XDavgnXwVW7y5/U27KD7mxl7VAQtX30BDGkg8OS/DitwEpr3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243750; c=relaxed/simple;
	bh=qeU/fP7fkQ/PXQBAzqnmEe6yPwgQIfMLCAvwa8N80q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6jaDQEOClc9KW0ybnEHL3ats6S2DAk0V4bQW+FRFvNohvAvaYxvTjGMncvHhEi9t0FUCKtPeR38FLj77toCZRsTGFc1FY/9PGu4O6ecMZyIfPmX9lIT3aKyjd7xOdanDIn6MgtDfUQmqZJSSjMf7/t7ZbF2Z+NnXwxVZ+POGxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3857yVc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3857yVc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1331F000E9;
	Tue, 28 Jul 2026 13:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243749;
	bh=DdyjpKS3BRfC6F70eB0zaDOjK4ho1YRuSyKMiRMa+sE=;
	h=Date:From:To:Cc:Subject;
	b=a3857yVcuYbjvX/hl3/Bqaqh3V5rEtpIscGLbvZaZbKIn5YvW+6my8cnCy9xec03z
	 yYlhbHQanK9gj8/H+OVF4E5d/vUoX/J5v3HNlOSBcUb58IDjL16EpcBccCAqN6ywgA
	 E6FTdtqT/rP1HekIjSJE1iWvMtGAsQ6oSX54Yi+U1rTyR8w97ZM3w/3gFxXFXtg2B0
	 JuGAyw5w88XK6kGOYHnkCWHHPbSOZK1roAGzB6R6B1NtnNAI+Oos37zcOUBOfKCeiv
	 Oik2MAqQmiUfdI9s+khKQM/J8rvYOF6n+DTynW/IEidMiCat8ItBpbIOTyJ09V6FZD
	 JmW+DUsyUvevw==
Date: Tue, 28 Jul 2026 14:02:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the drm-rust tree
Message-ID: <amioYbY6-oiuFngg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zjzUxhPrKkFZf6To"
Content-Disposition: inline


--zjzUxhPrKkFZf6To
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

--zjzUxhPrKkFZf6To
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpoqGAACgkQJNaLcl1U
h9AGywf+PJ0WM2Y63v8Y0bXzFsI3ddNGwjbMijfn/XQ++1UO2MZ1jQLrrDjUb+cr
pkFCZLPo+amHLDdMm4Y6UaFOOgae/WfPtuYO/xuPTl0pf4+wK5tkLBV4cXZPYXhY
y+b5D/g3cfmoxbAVnq8qqqyTIC9Au4uEXV3bP2a/O7EvRvzf3yq9DBMG1oqo7aX7
vFcZwphnJXJPSNHs74Qz2fZfKB2nOx8dafrSACNB/4U3qXWVQKgydc1E8KwbJOqu
AU87CHXJDJ45cmElft99H19dGfyGRC6uylHyCZTEVi61vCfHxs9VMIKJfEW5/VBV
Ny8ffj3sNKWBZGKxle6B3UmShAvtOg==
=oAqO
-----END PGP SIGNATURE-----

--zjzUxhPrKkFZf6To--
