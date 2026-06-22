Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EEB379C2B;
	Mon, 22 Jun 2026 12:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782130031; cv=none; b=RCBSIijqaqo7XP1SUxa10iLnTxd75zMHoI9UjgcJN3sWEGFmO6PWVuH4Qhv+Kee9ZvMQUf0MJjbczrZpa8sRwYqQELBcdBNIyVqk6JV/FEp+BLepcCP9PtnRhXcrOUNeKd82COgFxVrgS2s0LvTEzM+m/Mw0gRg5ukvQ2kE5TDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782130031; c=relaxed/simple;
	bh=hVZnA45i7Uw1BDEo+P/NOOxEBKeJFxjeHD+BuUxwTNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q64+hDgPXbU2gaCRQxVWYJmruebsF79X/apTJdt0NSieDkRuxE+hlPjeOtTWvdnJpcIrTJlWJtXagq8bvNdlMudcwHiAVItzKis5NojbUpY8IrPlRI/sNXHcD2DBFumQ4LD48HERuj1EClBF3T9Vxo/01uxWrMcqENrYc93kJjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MfzyBK6/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MfzyBK6/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DA31F000E9;
	Mon, 22 Jun 2026 12:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782130030;
	bh=I0AOM3x5Y23hwXanzvBjsZo9xGlnapuKN46bqJeBAJM=;
	h=Date:From:To:Cc:Subject;
	b=MfzyBK6/gfxinQIVTwZCL+/JtvBqUk0OKJb1r2iWxpF2k8zID99yuyOV1nJULQx02
	 fF9JVMYsI+A5u0jIDI/qoSUxH4f4jXbdfU1zm407F1jW2bSNCZzoB45YMPicUdK2oh
	 GICD7aSqFEW5lnS0q1KXj6zSoWQXMSMJjptTJv8z4eGsm8Qe7QKjyuWIKmJq/vinTk
	 dPy2XBC8Q3IT64p0239X1j+ekxfytIJAdjzZCE9IlquFe0Ffayahh6wS3VxF9BTgj3
	 0RQXSCHQEpYckTvB3R4qhBgRQhVvPmxawISJc6fybS6PODHf2LgJalbbmYB+lBkiRk
	 bwkimYTsqkdzQ==
Date: Mon, 22 Jun 2026 13:07:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status half way through the v7.2 merge window
Message-ID: <23ecfa76-98f0-46a2-9826-5925661dfb6d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xs8B4O9t6vssgI+b"
Content-Disposition: inline
X-Cookie: Now I am depressed ...


--xs8B4O9t6vssgI+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Everything seems very smooth at the minute, we're not even seeing many
conflicts moving around due to things being merged into your tree in a
different order to that they're merged in -next.

No trees are held at old versions, though we do still have the perf
build failure in your tree.

Trees with signoff problems:

  edac	(missing committer)
  erofs	(missing committer)

The erofs issue is new today, I got a mail saying it was already fixed.
edac is supposed to be fixed on the way to your tree.

Non-merge commits relative to Linus' tree: 3121
 2993 files changed, 147532 insertions(+), 59819 deletions(-)

Top trees adding commits to -next:

  383	char-misc
  364	perf
  199	staging
  193	amdgpu
  168	pci
  131	usb
  118	mm-stable
  115	drivers-x86
  87	phy-next
  83	net

Thanks,
Mark

--xs8B4O9t6vssgI+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmo5JWkACgkQJNaLcl1U
h9B7Twf/czGQP3giqL4bjogS6dIkwY91g1untLNXJivG7B5OYUBECFmGgJnWCa65
8/IJJNn7pNAddqsn8nTJrHjTpiT6xTuRfic7Nx06N6/IuqCS3xgU0qUkiXd7XdMy
hs+3YH2QqwcpZXCMkfLsOwWXauKoTmZ4IN9HldEYUkHfNETGZ38zaJ8k+7vDG9Fr
TgiFFmhbh3b46phi9yA0O6Llegacgr6jhsnQ/C3vnQ2kkhR08SZgElFLpWfSQqmd
3V8rKaX/cG2esVGSecyujuJCMkVd5z06qrU3LFvtO0Byf1PYMHc4Z1L518VcTNMc
bNA0e53PW44NLMoQ7RYV6yssDgZ/vA==
=Js4f
-----END PGP SIGNATURE-----

--xs8B4O9t6vssgI+b--
