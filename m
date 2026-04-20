Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA7A3D412C;
	Mon, 20 Apr 2026 13:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776692325; cv=none; b=HxK0OSGy+HlTjqHMQrxiMk8HIjOwiNjTCPM2BcmRdJHu7JbNKKFPd0J+rE2mgigFncLohecPbYklmgwEH1D5OdQEGa3poLot51z3igMZKtEcfxyLPFZcquy0YE/oWwb3bNQs8bw/pdybdGyDT0CpJS3kHR2dFnIJ1IWGMV6599w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776692325; c=relaxed/simple;
	bh=DpZTCE7+4GRffujXiinYfGQQGCjrg/ubzohcAu6sVc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HUPEXXg39SMgE2NFFHI5EJYwF+i69x71S5KJvV+/3H7jn3tXD7xWOS6Eg2VntgjwwFRnWvEP4eAa8XmC0kVo6gjknLpB4Ha0hJoORMAkwCff4Qt0oIgNqJbGCv4FLXmxu9CiAFB3vZEpa/tl/au4JfeKwJE039681GQcNOUO7wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IJe+CrMG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IJe+CrMG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15895C19425;
	Mon, 20 Apr 2026 13:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776692324;
	bh=DpZTCE7+4GRffujXiinYfGQQGCjrg/ubzohcAu6sVc4=;
	h=Date:From:To:Cc:Subject:From;
	b=IJe+CrMG9krSV7yMjMpTAANyUgJtkh+MKtuGl3Q43LvHN8mbYY/rfWo8hUpHwQQ+1
	 hIHgwMcqzB6p1kj3qDp6i+0AJPrxRIuvnAyhaBb1dLdZ+rLI49TfPLTKc+9YPZtcYT
	 Tw0nnjVEWRZe/0NN4wzLt2iqZxjMR3l+dYWKZAY+vpySvZlEWtsRk9RbUT0nH2ouxm
	 G/s2jANbijqQToBSXOACVFlMWH6UiQUP+ykH++kcH0uOd2pCFDMrT0azqIFC+2PNAl
	 c6A1ST3PZQdvlAwdOLns5w0cGB2JckGjSzE1wQwPAufLYpzWvSGTBufozdhOgqPQ3C
	 /ydfdN1BxOpyw==
Date: Mon, 20 Apr 2026 14:38:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: -next status half way through the v7.1 merge window
Message-ID: <5ed3fd6a-d9ab-4beb-b562-48871b490d7d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fotBh41Q9Wf7mg9K"
Content-Disposition: inline
X-Cookie: Sales tax applies.


--fotBh41Q9Wf7mg9K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

This week I enabled CLIPPY=1 for the Rust builds, having finally managed
to get a merge to run all the way through with that set.

No trees are held at old versions.

Trees with signoff problems:

  clk		(missing author)
  qcom		(missing author)
  sched-ext	(missing committer)

The clk and qcom trees are the same commit in both trees, sched-ext is
new today.

Non-merge commits relative to Linus' tree: 2086
 2150 files changed, 73598 insertions(+), 37860 deletions(-)

Top trees adding commits to -next:

  405	char-misc
  116	rdma
  106	drivers-x86
  101	input
  98	scsi

Thanks,
Mark

--fotBh41Q9Wf7mg9K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmLGAACgkQJNaLcl1U
h9BTWQf+JvJL6oc/wlg9MDUoJPFfJb+7mQRKCpEVrmn1ujm5PDbuLO+ZuAI53vVK
l+RlBnio0d01H3si7LSAiFE1wMKoJ1LNZE3O/DCRht2QuBHvkiPEAVaEBh34o5z6
KyE2vHJQj9eBfKmQV1P3TYVx355xQuGCyf2vIqSrUjV1tck5ZEBwJlUc9TrxYPq5
dqJ7UHh5B5oYGUy8ZAdxp/b/ymykHfyzKftoYANmmBSv2EhbrDPNx6bmGElkwL2G
VL+Gpn7QMaqPsvShkTqUyOjaNcYhg0dqSLx3+HtB+nh5Ljsgw2GnOsQGHE2//3q8
YcZgAVvTagFDizpudPyiPRH1lcElqQ==
=OmsJ
-----END PGP SIGNATURE-----

--fotBh41Q9Wf7mg9K--
