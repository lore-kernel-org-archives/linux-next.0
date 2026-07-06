Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740A9423773;
	Mon,  6 Jul 2026 18:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783363201; cv=none; b=D1u9eSeK4tIXbgYqwg32gwdx4PoQP3+PGnvCotx5Lg+hl7OL/hMCR02KL26pHb5seiY6FYeTVZH5xe3ebsdIYvUrAkplsJJzXgDZyW8Agzwiz/x1NJPrzsSLJErdZ513g0xlB7gLVyfh5Gr+4EI0X1TSqJxtYllm1LuQwqFkEAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783363201; c=relaxed/simple;
	bh=orMM4fiGtREf68K8nzFB+xuzUYlxVMZdsXGzyRp6CGE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jl+Aezk+1lO41JRyZfozzxyRIykuXVBypITAVfnuvP/tNm2dSuGszFreCI1Fn0jWtXlgWg0MPyhGXre5AoxiF538h/7mZtqgp0YSxjflXyL/pCjt6mceVE0zef9RQUo8Ku2JIb5A/mQcOQYt5s9vy8Hw/IcRXmEmSDUlDzOJt0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rg3fm30C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rg3fm30C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E80461F000E9;
	Mon,  6 Jul 2026 18:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783363200;
	bh=B47Qi9HuWOeCnfWo/xMNvBoW5CQ+tgPS33f6gimT9eg=;
	h=Date:From:To:Cc:Subject;
	b=Rg3fm30CEciOtwYiF0FLzoOo8m0O6rRj1ZViXG/57tKoKapIBqC0tZakOk7HipAwv
	 G6v5Y8ZysKI7H1AXLfW9ByXMcAzajkXC63ktHFR9TdBveRJzQTnwtZeqbOsUyvhkKd
	 h9YFlBTdNs4URJcjXjqiyuEMrKE4e4GPAV6jzhMkh2dYOgfIPaLZxSZTAgW+ZNE+Ai
	 XglmGX61TwgJRon4TisjVvQ39y+jutmMHCrNvVsSp8QTcZF576TkCDTfNvm2Y6GYQu
	 k1nmuhutUUzj7RufTHRJMwvfndHS87tS/G1vvuryKoW8skHqjsdumh3IgwGzNoDZUw
	 Wayfgj0vjsJag==
Date: Mon, 6 Jul 2026 19:39:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.2-rc2
Message-ID: <e3559368-a76e-4bdf-940b-b07b393eba62@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KFm25D3wAu2gm66g"
Content-Disposition: inline
X-Cookie: Did I do an INCORRECT THING??


--KFm25D3wAu2gm66g
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Things are still fairly quiet, we've had a bit of instability as new
things start to flow into -next but nothing too remarkable and other
than the usual DRM cherry picking not much time to start having
conflicts.

Trees being held at old versions:

  ext3           	next-20260703

Trees with signoff problems:

  wireless		(missing committer, new today)

Non-merge commits relative to Linus' tree: 3372
 3537 files changed, 159837 insertions(+), 65637 deletions(-)

Top trees adding commits to -next:

  437	amdgpu
  302	drm-misc
  222	mm-unstable
  196	drm-intel
  112	vfs-brauner
  95	nfsd
  95	drm-xe
  93	net-next
  90	sound-asoc
  87	tip

Thanks,
Mark

--KFm25D3wAu2gm66g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpL9nsACgkQJNaLcl1U
h9CTKAf7B5QdB6L4vg0myIZFDbKgqlfg6ZBztezpxi+lrQgF2e3rg4c+Vkk3ABns
MDnrS7hxeVmeSyxufFZXKpXSiHnSgCPLXV6GXuV2eu4uCZ2ou2yh48SXMI3R1zFh
LTCdlhEI/kvDWOdNRTzLLRc3pMQylNcagJ+NSXsvWr0ZBilsdA75TNGR8/vT3GoD
4p+R5FEEtECe3g5K707IFD7EgRaJ4WDP4QA0QAzLGbNYZpJ5OLqTt1rrQ12M/ESv
KiW3/29UcEsqiXygNtn6LDTa86pppbWvy4NItLij+LZg6IPXh/KhbUeApPYsZiCl
9xLYI4MNwWVNNz4uz5uKiFNHl26xXw==
=6wtI
-----END PGP SIGNATURE-----

--KFm25D3wAu2gm66g--
