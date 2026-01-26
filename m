Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F4F330656;
	Mon, 26 Jan 2026 11:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769426790; cv=none; b=FXFhW/k0PZpGuNBl7mIhpFXIyKOl3DhDRYZOjvoF72fMnxsFF2ILgBr+68rkT5iCFTwOnsCs4qvwQD9sG6lqt4TjOivSm55qfx6Z1xFGuWmYYO5MSkmmEqF8Rf+Rc4hCIqEGhyy5t/YhQsc9/Qq9IfI1ViYhVpLsVv0OAPkDn88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769426790; c=relaxed/simple;
	bh=G0Tn8IAKwWmcOaVOhVqpR1pP4D6WwHsSXEcqKSdu1Io=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCTWt4tO+CI9tn74muGt8pOAWTxM3wlM0rw10SDJ7KPtV/xeTqBNTQ2QW09rjXfqa//LTM9medqETe3hsu75P9rddpbgznq9UMV0yjf6DUWxFkd/1qTskH7mUFZ2wLpVZYnruU+7Ktoh9kxsStZyBg1e50koMmROTax6nsPeFHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B71yz6rB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B71yz6rB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11CDC116C6;
	Mon, 26 Jan 2026 11:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769426789;
	bh=G0Tn8IAKwWmcOaVOhVqpR1pP4D6WwHsSXEcqKSdu1Io=;
	h=Date:From:To:Cc:Subject:From;
	b=B71yz6rBvqfJ6Rdh20F3OAlYlG+mXy1l74YyCzsxDQhHnf78IOH6qGniGntoU+XgO
	 tWzcEDwEL/joWFoh5drO9qKuFdbHCXGWNwrSz8IJNyvrmIAAOvmCWT/N5YTe7qfMrn
	 VYy4xXK5AqDV6hn6/Ofs1t7fvoAW9BNeJMed80jEY2V0IkZU1B5AzuTK04TEDd+Wk+
	 ZGEpDkjjKR5SXEaRGEnGD3aIDigsVfCPGgVQM3lFGpDXeUcwywmEGsbff7d7iaSMCD
	 P5swJIG94cTj1qPax4GdKwiYqUBKU8sGrJzeOhzwAd2qFDBHtEyQ9L2adMscJq+ajp
	 0EvHCpRzmq20w==
Date: Mon, 26 Jan 2026 11:26:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v tree
Message-ID: <aXdPYZ-AyUFw_x2x@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6pIyTOSRyJ9IiKX/"
Content-Disposition: inline


--6pIyTOSRyJ9IiKX/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  f2a6acbb88ce5 ("riscv: ptrace: return ENODATA for inactive vector extension")

is missing a Signed-off-by from its committer

--6pIyTOSRyJ9IiKX/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml3T2EACgkQJNaLcl1U
h9DMCgf/Zhjp/JtUaoCnVGwjPyVM+lHiz5hXT7y8o6ZsKGfLoy3vAx4JTgLOJJrK
BaLmJq7pQGiwj8RGFAMcmcmyJFHBLZCnNlKfyUy449ZO7JuilaAC2P3eI4oxW3EG
GzDd7XArPR1CcBTbTKbbEQfhZf0yi1MuLufxv9CPWHlESrVZwtMgVel3JKBsVLVM
+1IrIwSn1kxCTyXJ2FG0HPF3vX2k9HPbvAfy31d+60bvHOkBUf9KOcuFCM6P1NcF
iJ+XT1DIdOCcoyef6EFB0N5xo6moi4FXISfjykSFcbS3NSS4UQlsGXFYFPnJhXBF
dKwCb/g7Nn7RJ1/opWvnVLPEqIeD7g==
=+NDU
-----END PGP SIGNATURE-----

--6pIyTOSRyJ9IiKX/--
