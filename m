Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF65459AD1;
	Thu, 23 Jul 2026 11:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804702; cv=none; b=RPFR/M+3qOYp8TXEqGcvVzLHcNMP05bg8HCvlklSXI8mSD3bIiodipAJY3WAjqSCyHMe3Ee9/DnJf1GqB9iKgeyKJqRFGFaJOT4HhbVLGGAoTjc++rD5A+efY/2w+tjDm11GQ4M2ozGb61wgUadVI1fl+6panW+rDj11a0uLt3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804702; c=relaxed/simple;
	bh=laCDx8ZzqreQhPI0blTq4m5716tNVgbdp05Q0flVWMk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PbXp56PjCs23ifkGtm35vx5mhh2IubgpWMUYlCTLgFm6Yir1x8T5/St0cj/Jd/ngkQy6gAvQaI397JuD/XLJ3e6kIIm1iNUblNZF91qvYjI0k494YamhTgkveDP1kkKNKUyZFubdcLDXed/s+eq1g2mbPG3U+aWVB1sOIRO1sgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpBDduOb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpBDduOb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DE31F000E9;
	Thu, 23 Jul 2026 11:04:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784804701;
	bh=suDLuy744R7OH9AEpNKyKprZdYl06Kiw8ou1hf4F25M=;
	h=Date:From:To:Cc:Subject;
	b=SpBDduOb78eBQP2/aLQS7hNYNIy4V5JEv9gq7/jdzLy+Mc/O5/Z1fwbmcHXVDw0Xz
	 qQw394HYdJdL0mr3lIyBuMlqRJhNGF0xUDs3Qx+ZqjNeW2eBgyRr8zxKwq4zl8YZxH
	 ya4KJJbeKifcKSqhrLfKOcE2H6FnOTr1Ybqhbu77x2IhoXaL+8Ypd7OCWU73nvAw2u
	 B2t9ZEU2V8H0ccfQlgR2mL4rvphHET9dr0jOIdk3S9W8Hdan3x3BfuzmRrUg/MNI5Z
	 S3yhXiIHFYlTGQyLqsM4/uDEWHx1WUXtKKLauG8unFNBNLdijGIvDVIfdk4gVVQ+3J
	 FwI/tZSnOxSxw==
Date: Thu, 23 Jul 2026 12:04:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the liveupdate tree
Message-ID: <amH1WQ3v1rapSMkf@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="f8TkNExS/H7aSnVk"
Content-Disposition: inline


--f8TkNExS/H7aSnVk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  b44889cbaada8 ("liveupdate: Remember FLB retrieve() status")
  459873adf5e90 ("liveupdate: Reference count outgoing FLB data")

are missing a Signed-off-by from their committers

--f8TkNExS/H7aSnVk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmph9VgACgkQJNaLcl1U
h9DcZwf/Q6jPa32/tdVpkDIqAwJuifQQxKgt9NsJssElsPlS6oiB1XhUHORYIsLR
LyYYeM5GJn7J5eOpSNKUmznb4JTnKFLwws1Y+8+DsM8cIPuZ5/lLOwuw35umKkbt
sm7bHqQubzLLft33/TJglt+ePox+Oe+z4kIik8OzBaKSBus/k1FL1yEQoV6e0pZO
9yJPuUgMMsKVsXTbfZYE+f4gZa2OebWnz3uaohEGYvwz00PWNyrYzRLCNBKSaWUY
KoPEEECim7QbbXMXTpmEiQOznVjl4ceFRxN5BzVja1TsAOxNOgsJl1l8wkLWTO13
KjpWHqxb54bICJt1R2sfixkGUo/G4g==
=P2+Y
-----END PGP SIGNATURE-----

--f8TkNExS/H7aSnVk--
