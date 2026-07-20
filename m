Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DA2427F94;
	Mon, 20 Jul 2026 13:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784553601; cv=none; b=Ryb6KIevABfPVVf+2xyIWqNbDap3+9vC9uoz1tpxvkqviXujpk48qOsmgpUYBSQiiPer7rO7DRR/f8TaiaBPFB5XUyFakJWWC5J5xqeIrZRePp7t5bEKshKi9h2SW/t6gbpq4TDinGEi5QWc7bH1l2+7MYcMkHBeGSF+/+/OygY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784553601; c=relaxed/simple;
	bh=mE2L7EiY9tbzPu3nAOPaUdhpVWd9BBPsJ+4icFGX10c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBVSK/91dHmf4oibbeBkbTPw0HAct2zxxooib9an2DsUoeuDbcJSbjz8rZdsYhS22a60+ybHU+kCK3y/Ef8CTspUj2tYrZFvCc8qpIBtemgYzkpfejgTS9sCiU+ONYsFm/1/gkjPbmBGrswlT2wXNby9IuscIkX3Q4A6DE6Upfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jnbnwdvt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jnbnwdvt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0051F00A3A;
	Mon, 20 Jul 2026 13:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784553599;
	bh=n+tFPgxka7Hps1jaWdyFdanVIRMctivYfE2YOlTFiSI=;
	h=Date:From:To:Cc:Subject;
	b=JnbnwdvtP5GI+zzKeJuZAUUkYMQmo9aGi1IMpdvaMqquBXZyPxsBFzuw1eCDZUMv4
	 QTDCJAxnmkrnY8BXw0myeRO+IneNc9gxYOSFC7jCZd5DcHLGTlofkI5Sn43b/T1wRy
	 tteMjE9cX3CbWgmxtb/y5nQB2L67rM2uzUHLPsnkcn3Yjge2EaDQ0EfliDI05HdEOg
	 +IrmuZspllD1ytE/jndYB4bLU0ZrBzPiI7Cpn3Nzqm+BQsnRp530xDWpoEduuYsHQ7
	 IkxCYWIV5KZ6HndnFgH5ThhDxg4SihY1pIjJwket0iZpA0fAjUK8iFdBaFcFhdhSpg
	 mjp/OLkZ1qnsg==
Date: Mon, 20 Jul 2026 14:19:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma tree
Message-ID: <al4gfA_a0m-BNb4v@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Umbue+EgYT5ZZxdk"
Content-Disposition: inline


--Umbue+EgYT5ZZxdk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  9499f8d6e3b8e ("RDMA/mana_ib: Adopt robust udata")
  d83bf998f719d ("RDMA/irdma: Prevent user-triggered null deref on QP create")

are missing a Signed-off-by from their committers

--Umbue+EgYT5ZZxdk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpeIHsACgkQJNaLcl1U
h9Bvbgf/Rg0mLxXJpfdnc6iMVsL/rC3Bnb34rSJ5Y326aZTdhmnm21YlLPiV38co
amwRKq3xgiCUHdvsp9CEvafaC/GN4RpunP5FQjlHsVslmz6AvZGd2rUyeeNG3tF+
I2WeQxobpUUF2/jp6nYeiMOBk05rOcPEvQfVBxOk2l5J3CqFD/G5ZXXXMBFrAX8c
/l9ugjIbXoc+BzEWf6t/BR3LWmTUqtuXnWM2O+TNeXi5e1OmDo2H8MUS95EOu9T3
0PnkFrRAxkyAtWxovPRdgTl8HTWLQmI05OfReSvOZaTfYnSVw/xgyijIlXrKiTX0
kb/JSNkSTVQ6wyUcI8OsEzrzWlv7DQ==
=5o5T
-----END PGP SIGNATURE-----

--Umbue+EgYT5ZZxdk--
