Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512993AB262;
	Tue,  9 Jun 2026 15:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781018737; cv=none; b=anDcQ7Y+CKUQO2KVd85NEL1D7kBWjVEC1H7fBcXE5hqED9p0p6cwqCieaV3Ty63UwPPNyQ6OOp0APrQmPs3k/lzh+EZARDG7u/cz+acWiIlZdySVa+nkLcSLjOiUo+uWbLp568ra5P6v1X++k23rlHek2VHNuwWnKyHKAB6JB/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781018737; c=relaxed/simple;
	bh=+0JiuXo0sAQ4waneRyv2+K1ZtfJLplEFlMM3TrRzinU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=laQiFj/1XtImKXo2Wp1FfWs0nTJzj66aOlRfBssPHMT4mUcATNbELSenXUwepC9BEy+TQVRXo8jZNNxwwMx/n3fNiSBYTEEr4XZKu6uPT1ncfCLxLmo1QB/Qi0B9VRnnRbKCbONYnOsK7vPKe+bLNPndvKqwQNeTsIYoORE5VCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EmfzoZnI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EmfzoZnI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E281F00893;
	Tue,  9 Jun 2026 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781018736;
	bh=LANEYfNcW9Eb5ffXaiTe7PCToTKwGS+9C9LDMA9aqVU=;
	h=Date:From:To:Cc:Subject;
	b=EmfzoZnIge4ve731ZN83H80+lNW/Niggcr0a4/JcB9w93jfBwOVtFzLV6+BLVsY9Z
	 rscDiB4nRw2ectLc2c5p1p5YFpdZFLtVh7ImkGawnFliw/rwtoTS7woUv/eKD/XKM3
	 FFX8eqnLP6dq20ZknOQBdZvWkQVS1noiWmrlsu8F+mxIkgi4WEE5uPMp+dcA7EpNjh
	 uEekckrbGwiS/RJtXCEx2FcB9Wzk5guf5GucUrE4MI2H6/vu1tQYFsUo9ou5vm4D9+
	 hE7Gbl8y6/gvFO+v7OM36dDuk9wb7mXK02Wpw2/aig/4fIMpQ9pP26mJHiaKLgpkVK
	 4cciFh/plycgw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id CB1AC1AC56AE; Tue, 09 Jun 2026 16:25:33 +0100 (BST)
Date: Tue, 9 Jun 2026 16:25:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Wolfram Sang <wsa@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: duplicate commits in the i2c tree
Message-ID: <aigwbaQTkSzXbOBT@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XEIrxeHYkT3BnAWj"
Content-Disposition: inline


--XEIrxeHYkT3BnAWj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

The following commits are also in the i2c-host-fixes tree as different commits
(but the same patches):

  07d5fb537928aa ("i2c: core: fix adapter debugfs creation")
  158efa411c5711 ("i2c: core: fix adapter probe deferral loop")
  2295d2bb101faa ("i2c: core: fix NULL-deref on adapter registration failure")
  3c7e164344e5bc ("i2c: core: fix hang on adapter registration failure")
  3e2041ea586ae3 ("i2c: core: disable runtime PM on adapter registration failure")
  8ce19524e4cc24 ("i2c: core: fix irq domain leak on adapter registration failure")
  b1a58ed9eab146 ("i2c: core: fix adapter deregistration race")
  ba14d7cf2fe728 ("i2c: core: fix adapter registration race")

--XEIrxeHYkT3BnAWj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmooMG0ACgkQJNaLcl1U
h9DkcAf+JicV2mxKtDCyDFSZMDzE6g9kdhRhKx7fiCOzkR9SoFqV/lvwAIT021lU
0YWLxHSCmm2g4g5EXIUnVOxH6aNcxKztOj9VNazCouXhTv19sR9/owTfxE0TzSVn
UJXEhQkLx1vd4oEq4lHfO3Mtp5nvpkAtLuWFoH8Km+iNNo6+vDP/26GgxByUfnGx
51GHP5POmDKMR27rSUHZjmTOHIcqU2YSwoDOztYER970/AlEDi3W061jX/pKr5xi
DzaIAzuOjwSPJH8iU/qJsgpyU1D3b67BxLDM3uidJ8qIIxc25Wkml+BWOCsq+uER
N+MSvll5uyQbubMQDj3sOoxur6GEYQ==
=RPEf
-----END PGP SIGNATURE-----

--XEIrxeHYkT3BnAWj--
