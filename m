Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583EE3D1716;
	Tue, 10 Mar 2026 17:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773163127; cv=none; b=eMmEz87eh/4bhyz6Og3O0UGe2EgXZCHDDbQtQK4EAS/o8aIcm/4AeRzbCEHxtuvKr+HaFe0XrB6faMkDfGfJC3u4rxh7Fo/CmOwWF2ermLBJsXsDTR5Djacp7tlJ6RVhGfLCfLeXqSkZys31JtdlHmdPw8+Wh9JCRIZYQk64B7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773163127; c=relaxed/simple;
	bh=IoHs+wXjCHnPk9b5t1n9Cj8LdtgaDG7codn3B5RSWyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rxPIkCtEvnAA8QUiTC2qiWIlyvUG1fyM4ABsH2H7ju8MrFgaABjboAbIfskhYJRq6Jv1sF5D9rZl/BISNmwO5+WXL6T5rEfUvbiKD8DGCDwoTk9sbafMtkY0A1ia79nn0zECGhZG5naJS+Ueeq38+vNt9/NE5S3AfALQ4PxXYWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C8X3v0Kg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C8X3v0Kg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE2DC19423;
	Tue, 10 Mar 2026 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773163127;
	bh=IoHs+wXjCHnPk9b5t1n9Cj8LdtgaDG7codn3B5RSWyk=;
	h=Date:From:To:Cc:Subject:From;
	b=C8X3v0Kg1iKigKgBRWyafqgUR4qoCI5oSZs9LKFT3FHQWu0jdOqQe1kAjbUlhxqas
	 lRokqd9n3b8toZp5IXSsBEcmBosdW52U63plvz1Ji07q3beb9KsaabJNcW7ZdLceoN
	 wHFzV37TEcOJRoGwt8TO0QldNskDhA003xHdkIE4UVvo/F9O67R62q/w2eI8zONRWt
	 nB/ysDiTxuNrmmOh+LkUlN3PzNhkBsABwxwCNnGowjM5refjQkPUBiInlbnQ5Bpk8x
	 aJBiHo7ffpF8weLORG38A+YUKXKxEjVmOr5EYFKQerxYtaJU629r9WfZUARhVzzU3+
	 0VsDnK+Oyo3/w==
Date: Tue, 10 Mar 2026 17:18:43 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the landlock tree
Message-ID: <abBSc6SqkHp63o6p@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bmxsSte8CK1EB3Lk"
Content-Disposition: inline


--bmxsSte8CK1EB3Lk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  c9e4ca4e3c028 ("landlock: Clean up interrupted thread logic in TSYNC")
  b6172434e6cf3 ("landlock: Serialize TSYNC thread restriction")

are missing a Signed-off-by from their committers

--bmxsSte8CK1EB3Lk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwUnIACgkQJNaLcl1U
h9CcPgf/RbKTIVt21JHKw5wYGe6FXOx4r91avUEqN1+V7VViXzSL9OmSEwgVoST0
ttfoQzgS6YVuLT/bD0l+zWYOXTJBXed5JJb5DYsrr1u1a3p4LbECwyp8guj6bAsw
RmaboXZZN2dFdbBa/fmoJ+oZh+aDRev7vIFvdLhRGQ0/aRzyH6GKop5rFXXBkvED
vYm4vUEXMSL9q0tSPzWuKUH4GtXT2Fwlh2DR4TtvsM2OYE/c4Etl9l6qnBkbCn2I
byFCBUBRJ7r2V9ToFJ+GARGiQVGEoa1QKIuyBnZoPrtrKp8wRB1vKtd/GgLUtxiE
EbqRgqX4+JQfE1LZ1ObnCswXINduKw==
=OAOV
-----END PGP SIGNATURE-----

--bmxsSte8CK1EB3Lk--
