Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62DE409128;
	Mon, 15 Jun 2026 17:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781543676; cv=none; b=N7MM2aiaVSYEsuV2xeOqPCgaYiR+BskPIKdLtKs8pm60WMYoFoACmdDHypqxHvIIIRZL16HzZz/hCI3lf+i62AvGbWXzhF4x5wHnbQ9D1QgnmqirP61jas4w9hXDhV52Z8JJvANOtZIX2zw79gifj2ykkkpx+f6zp0XR93QgtWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781543676; c=relaxed/simple;
	bh=1SIbSzQohAS+2WAcAC60q6Ql7JHc0Vc63ta4b13R3h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nGV0664OcgN5pmajILnlkMMsGIYGrJ0fnX8Dhw5+LWFvQAeOnzLz42N5OcRIhPuqvKPAAeaNGfpG0bS9TTgC9aBEjlSI0t/pjmXPPF0ROXzUJ77uRk1rGwJzYaknoYfFRtmnzevC1qN/QnsQ4szt6wgZzaZVsgqfFGQCtQWRdCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UGaqnofp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UGaqnofp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794611F000E9;
	Mon, 15 Jun 2026 17:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781543675;
	bh=FdLWMxcnKMMF4g78rbPXNWmw/gnN1BwKMe8G2G70iuE=;
	h=Date:From:To:Cc:Subject;
	b=UGaqnofp1YhtHGqgHamQbRn7a/bYfgndlJOF5bMJujWUOBJQi8W2adjILqKPrldxL
	 yJLehDY6OzxXMml+Ax2CCMvFl6gcG8MkzPlM5rWPXdtojoXJN2RSfLhmLVY2H0bTvj
	 AZurGgRS2FZJtwkGNP3P7dlaKwQlY+Ax+dad3aBNRdgz76Z3ObU1GKWEYD2IU5C4YI
	 Buta+1v0ZpFhLDqGkuSa+Pd6J485AFIMYno2z/+g1hlJ0MHPyfPxsMtI7Pz/NY1NSD
	 1wa07QoFiADMciVv2ACwuBrrBLO79VsSzxZutmcrOrOiy0lrI5I6TPH1vzS2jO0xBK
	 6vMu1tl9/Ofiw==
Date: Mon, 15 Jun 2026 18:14:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status as at v7.1
Message-ID: <2b65e3a6-54cd-41e6-9f42-d7bb1465ea85@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mZXGDXMbSI6zkWJZ"
Content-Disposition: inline
X-Cookie: To stay youthful, stay useful.


--mZXGDXMbSI6zkWJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

As you'd hope everything is fairly quiet as the merge window opens.

Trees being held at old versions:

  slab           	next-20260612 (new today, just a forgotten push)

Trees with signoff problems:

  edac	(missing committer)
  rpmsg	(missing committer)

Non-merge commits relative to Linus' tree: 11633
 12177 files changed, 756925 insertions(+), 233574 deletions(-)

Top trees adding commits to -next:

  1728	drm
  1608	net-next
  916	arm-soc
  394	v4l-dvb
  383	char-misc
  372	sound-asoc
  336	bpf-next
  321	mm-stable
  307	perf
  199	staging

Thanks,
Mark

--mZXGDXMbSI6zkWJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmowMvcACgkQJNaLcl1U
h9Dd9QgAhbIhyjtc6WDREouvxuM5NPeCIcun6PpOmrLAi3bhG53bp9l3sKoPW1MZ
QP6ijLRZxIHXnHMakPSN3ra0n3VqEOFKH/bjbdTb8Iy/gvhozEIDL+iEKEcbOQlF
yFpwXwlqFyEJk6czo43tayU/4yxDuzl2QQD3FBYP6eshyJLlx5DPwFUbRyylShgz
1eiZZAyPrl6cGXGq6IULCoPiuSq6281bZUAATKQCn3oxTaiDAIrN25gbfgNsUwqU
Xgj4HB1lj3HbPC8KuHtEOKyGtXryYd+8E2nGaTs0OMcBSJtzcenWiP2YwEReme4T
D8Z6LGw9CG8fr5IA8/G4ZMJpx/1BWg==
=okEh
-----END PGP SIGNATURE-----

--mZXGDXMbSI6zkWJZ--
