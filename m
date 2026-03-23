Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08852286D5C;
	Mon, 23 Mar 2026 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272307; cv=none; b=Tnb+beGcttOJGkTzkVOsxNK7J6onEJn+vOlXviNCh0uR3miDYIDL9CVS9Ik8hT7p4O9WRwGoTcE2Qzm8eAdbHkpv8S0pJkaqwDyDO6YzUrBoZEdSCyHOcRSGkrCSkVOJoMw/dMZIPeiuKsEeBIVRs+jdj1KM40cqbmSIxK7rXyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272307; c=relaxed/simple;
	bh=ccBtMqdSD8DWGWYF+obMZTuGqGWIKI5uLaYK7IStBiY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P3OvhYlduMA3Kl2Rl0i0hMsyC+9muAHy7dV9nq67qOet+JTmwz+p5LWcDQenQ8ULltjPmOjkYSCFZwfEimIQzl+M3gaZ+BKT2uhM9Od4KLGvWnxkfk/scfJqKmzndpFBEn4lMK5c2FrxVvBM6TQA39oqCZv3R+NpVhgpY1Lz32o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SmDbBxF8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SmDbBxF8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFEF9C2BC9E;
	Mon, 23 Mar 2026 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272306;
	bh=ccBtMqdSD8DWGWYF+obMZTuGqGWIKI5uLaYK7IStBiY=;
	h=Date:From:To:Cc:Subject:From;
	b=SmDbBxF83ze813/euvxHXxFmzACe8L3cgKdDqYozZfFrfzrZdMbNU0wVRndLfg8zx
	 mK3sDORyFebId4wHK/LxXix/hzAw0eqEaq5K8T/BaO5dwrDQB7MhJponiziXeS7aBq
	 LTffmeSxnfoutIVzgpfl8BE2zBOcRuvihw92hxoMLvuevgtVDnuBkWMTWA8WJep+2u
	 tH2mGYzLVa6XREJ3npRPrfirIZjMVpjXUGwUSOJ2Oho9cI37JVGH125wh0pUHqLcq0
	 n4jlOP2CJGEnXR4xf5CAxIRSX+u3plaPusEE5ZBfg6k7i0mc7AR2OxQY5Tqty30A6d
	 g5IB6BbznMSBw==
Date: Mon, 23 Mar 2026 13:25:03 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma-fixes tree
Message-ID: <acE_L80dxY7U0UTB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RPwhXGTzQXbwv1ZT"
Content-Disposition: inline


--RPwhXGTzQXbwv1ZT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  8dc12ab9dc7af ("RDMA/irdma: Harden depth calculation functions")
  0b36485998da1 ("RDMA/irdma: Return EINVAL for invalid arp index error")
  73ec40100be22 ("RDMA/irdma: Fix deadlock during netdev reset with active connections")
  4debbebb0489d ("RDMA/irdma: Remove reset check from irdma_modify_qp_to_err()")
  acf6d75f3abc3 ("RDMA/irdma: Clean up unnecessary dereference of event->cm_node")
  137e3cd83cad1 ("RDMA/irdma: Remove a NOP wait_event() in irdma_modify_qp_roce()")
  74f9af2283812 ("RDMA/irdma: Update ibqp state to error if QP is already in error state")
  5a925c7555d94 ("RDMA/irdma: Initialize free_qp completion before using it")

are missing a Signed-off-by from their committers

--RPwhXGTzQXbwv1ZT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBPy4ACgkQJNaLcl1U
h9Bm3Qf9Ht7MeLiT5OLykbV5a78OOifM/mUVX+HhDAXcQNVWLHikvhFFPffEueMI
WDnbfkhtFop49TSx089o7C1g7xWddd1ppUHNd+yf/R28Wfjhr02frf8CAgML+4OG
Cw03gsVlysIFGcURt75ASIWANE3aYmJShtSJS3FqnMhkAVhK18kr7Is+3MoB5h6j
zaktwTh8HZnba+ViIJcILt44u1aoS9pYimvW7kyynQNMAr6IzyXs4oTVVNmshbkJ
41lNM/DTHzT5OZwc/KyJkdi6DguTMid1qVdjGCD6s3MOrXtIZtIlcEWvYb/1ffjD
ogQjVpgsUyr7ZycXRXJA8c6TDfmdEw==
=tBdK
-----END PGP SIGNATURE-----

--RPwhXGTzQXbwv1ZT--
