Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCB83F9284;
	Mon, 17 Aug 2026 12:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786969317; cv=none; b=lxIm/dHZOfTFLLsVl4qbBdJqYEkcYq5AbVPjRQBJIQGkxYQA7/taNZaKpWMR6/1mPIMdrQAjbLQmrBiddn0Lxc3yOpK4Iztwu/Uuki+oNETv7ux2Oyf/oydzUuJPCP1q3BeOqWQ6yJDMzuWjKYJrkehoAA7f/79XVeW0Kj3oOoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786969317; c=relaxed/simple;
	bh=z2F6GU+bVArAkRBqujwLbjNI4fEqLE6GVi8m4qXjTME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZmDnLIY6WnB6rAVpsZK8a4Y/KxcYcbzouKAFqMm7C3XMd49g4SWljxlrFruXyEjxKMUvxgM6CBJX7PnffzleXczeTdAibReSHczOonkX2mE9QTnhpx1bWO157E4dcrvVt6I/g7ifoXZaS2I8pDIUgt4pYfa/gT1UH6ymHSD6OD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EjZgxwEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EjZgxwEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FAB71F000E9;
	Mon, 17 Aug 2026 12:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786969316;
	bh=28KwRCtze/OFztSPOPPr+SuEElJovCRxW/qZ5Pclvzc=;
	h=Date:From:To:Cc:Subject;
	b=EjZgxwEpkSPDtg8Zmf6aUdOikC9wt9qeHeK5lJZOK26J3PcbmpKVhLLFh8KaOtbzK
	 i2WQuYeLtzDzrW3hBWB4lHk9b4meXRlnde6IJes1o9lzA1rH102003xEtK4goLxaqi
	 Csvmryy6+JXi6uMBJX4Ts2sVpwoQQ/05DE4A/S2hR9jRBjGaB7rDXF9M5FQ7NbPY+T
	 njy7KUSpzU3WfP+JorzuvhEfAibT0y8+clzyWPppNSdMsH4CnKhp0QVne50AEo+71j
	 zST0I8a+mKZLWFRD8ODpzI03zUc3sBWlJxOw2LDEgrcJqR1uHG3KUZhRLY+6jrzfr4
	 XGPQESa4sEfQQ==
Date: Mon, 17 Aug 2026 13:21:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Trond Myklebust <trondmy@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Fixes tags need work in the nfs tree
Message-ID: <aoL84Ey3klBlc1Lz@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mf7g6ZGulcJv1zit"
Content-Disposition: inline


--mf7g6ZGulcJv1zit
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In commit

  39494a0034ac0 ("nfs: replace atomic bitops sequence with clear_and_wake_up_bit helper")

Fixes tag

  Fixes: d529ef83c355 ("NFS: fix the handling of NFS_INO_INVALID_DATA flag in nfs_

has these problem(s):

  - Subject has leading but no trailing parentheses
  - Subject has leading but no trailing quotes

--mf7g6ZGulcJv1zit
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqC/OAACgkQJNaLcl1U
h9B5MAgAg5YdNFx4kzGRxqm4tnoA+NUj/Yzn8yaB2egTZEMd4q5bNBpeb8LhAjdz
/YlkIkxobK43xVA6dFft+r+Tddn8BWbJJIc31bmErtDzec9hbM45LlWxtkA+HkoB
gvtc4QU2NI82R3ha+s5mRixWyuS1v2/a3B8QQzcQx1wNxAwHY6gaVGNXFp2Ak+D4
0ooyAEFpSd9Eiv+gUTQTZwyzjPysFjkO8D6wLUYwpNXurEqjOVk4VAosAM0treuN
QsFIrYNyOfm3cc7tsgABmd+TPW0A5U8B5R/1BEQ5R4j00UnXhAk59zxVilEjYSu+
F6OiAIFzc+4u0jpha23VCzsXJqi7MA==
=dP0o
-----END PGP SIGNATURE-----

--mf7g6ZGulcJv1zit--
