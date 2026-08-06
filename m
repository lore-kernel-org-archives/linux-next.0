Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E4C46D54C;
	Thu,  6 Aug 2026 14:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786026130; cv=none; b=swqOR0ulF9Djt391mr9jXWXRIrHuL+NuzhS6kTxq8fRWDyZOc5xyXHiE+jIRptY48GIOLpyQaS2x/JTwMc8iVShERdAdkHvtbuJ+SoaV4nJn7JxnchzB8RRPWONYOXjhbiJF6EwhQlbmniGlXALVf+QS2q/OxLkFZ/t747/oJd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786026130; c=relaxed/simple;
	bh=Knf2APEwY8gJ88age+oYqpG8mXGk3ZBEQkxrShUwNDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pcNtrAoW2qGtOiCb6DdnifIqTpe/4uHX4erNyoC2j2C4pYHM02ks/8XZiGJpoTKC1Pah89Ra/gZUbw+iZ2iEs9LEui1Kd6y43kA/NaeJqdYS7ER1K8ucUsJC32ngcPTRVIWYQB4u/j+GtErWnvRs4ASDDy3hN2i3WEiTsfHk6nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T/e7bUj4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T/e7bUj4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91B2D1F000E9;
	Thu,  6 Aug 2026 14:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786026126;
	bh=xIqp+iUn0Lk+VRL8A7taQBs4mTcpwoG8zAl4TFwLE30=;
	h=Date:From:To:Cc:Subject;
	b=T/e7bUj4RHyjHD8vQbFjq3mKmju9uiDAqtYATSW+E2JgEAc/HFks5dq+0/jIwtbXR
	 rr5P9mtPqI4CdLMTj4400ZMIK+UgTzG+NYXQmdImA/gOkfsJ38+JDIi+PkBuQZLswk
	 Yw1ZYrm4XGM4jgw7dVqdnvYP1Q0S4BZ06qEy5d21rJKFr0U/6zsW38JUcrsaJa8HHr
	 nuFPJC4gQiQ9s18NATvBk/i7zMwGX4Bz8scq53QCHkk9H9LKG6qiDiAe9LocOt8vic
	 d3PuzA2RR4yiFEpw2YbDVz9n+9slphuG4JuujdYDUZkx9V7AsdAGCOqhzFXuRvB4Bl
	 L3HlISZelyC6A==
Date: Thu, 6 Aug 2026 15:22:02 +0100
From: Mark Brown <broonie@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the modules tree
Message-ID: <anSYivRW4p13OsDB@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UsRbcFKjY0/8/a0R"
Content-Disposition: inline


--UsRbcFKjY0/8/a0R
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  ca2e2d7b6e758 ("module: validate string table section types")

is missing a Signed-off-by from its committer

--UsRbcFKjY0/8/a0R
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp0mIoACgkQJNaLcl1U
h9Awqgf/fYqlhBBx6dEuER4YEMGmTYGPCdhfWBytiFpS1c6SU2PC05uAFl2vbF3F
H1PExzHBTUYrncVj/wcAZciMC3IvkeVy4oFOz7uhZ9A/9Gn2lutQ5i0JTL0GImeL
S+Ht1Q4vQL789Nph/iT4PJES8tPIwaa1I9l8esVjAJjO20vOCYYX00krvvjBPFgK
nfgXy+bOECsD3Y4JL4oXNbvneGqF9vsp4FWzJrXYQkra+mAZv9iBg4f0Ju5uegLh
Rz79g2rXLxF9DSjwpgypRl/SQJTYXWxwTZB8Thh7NTZYzviR7NjQkXBgUCSBnSIS
Z79hwf8H6vdk4I8fy2GwskTHoTH0zA==
=KvYq
-----END PGP SIGNATURE-----

--UsRbcFKjY0/8/a0R--
