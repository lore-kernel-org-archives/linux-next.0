Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935BD257854;
	Wed, 28 Jan 2026 20:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769632354; cv=none; b=MyMosf4j0FvEk7LXoN4YEEDkM90h7NosxLy3p8sW9vD9C9W8r1g5Uo2MQqcZl6MzkaxCdrPAP+CqxparsjtVXpqr3xTEZPNUzDzFBP62gd4Ow61Puh/wbp+BkAoXBkVXg8K4F29/pSRnFGJoAK7OSa98dmoCcdjA9/o7Ikg1Y6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769632354; c=relaxed/simple;
	bh=ScaFbVk6dQO6rputL2y6CmTOCxnxrTt8LIDCJnQeb/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2gJSkBGfIg7AMJcs30DcRhYA1tLQRT8wu8I8YT+Dv0frlLvwu6tmGe8xFzWAKRIGqWA+jvtfmX9flr5gAs+yJ981v/oB9xUJ218Xuw/rZH4Mx1MMHiXM5c8tf1+WIQhXC8hd+cVNm4dHYNsyWcmD3F19MLo0Cs1O9A6GVIu8NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JRFFBM7B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JRFFBM7B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68EC8C4CEF1;
	Wed, 28 Jan 2026 20:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632354;
	bh=ScaFbVk6dQO6rputL2y6CmTOCxnxrTt8LIDCJnQeb/k=;
	h=Date:From:To:Cc:Subject:From;
	b=JRFFBM7BDlzwIaD25lTsuxXx9AT/mS3qQtT/7+Z7Y+eIjQnvtkdhyN6vQsST4aqGg
	 8UXBJLI6m6Q2K/VFXXpgZ6kgZsSS8LfuNVvLy2Iup3TZqVaOqqG/wfxdIiH872Asw4
	 xa6P1XBd8jy/vmmFniVh6w/MgMDUlcSaULP7V4BX9facMpn37MjYrgxuH9L6wNmGVA
	 cxidaytWWgxIncWl50gW8qPc0YEoZqTq4kYzi0XaF3xKUYao0rZuSee92nXcdSo43y
	 iXkBL0GZluUAfU050BdIBxJsOOI+dADZMdlZBMeqXn/c1/wJXQhRvlBr4DWOmD4dcD
	 vUIv27XwOCoWA==
Date: Wed, 28 Jan 2026 20:32:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Alasdair G Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the device-mapper tree
Message-ID: <aXpyXrnoOJI7EkyL@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bXkMWt+mjZs897Jo"
Content-Disposition: inline


--bXkMWt+mjZs897Jo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  218b16992a37e ("dm mpath: make pg_init_delay_msecs settable")

is missing a Signed-off-by from its committer

--bXkMWt+mjZs897Jo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6cl0ACgkQJNaLcl1U
h9DUYwf6AlGZmofDpap7z4WQULpxkUJlqIB3tE90CU8qLNACjhiS817YGFemroTo
yA8iBf6L/tEXVJ79RoLCsJsb677zzveuawtVvj9q6f6y/N+ASGQiIN7HKzt66N/2
sZ7q1YhZhp/U6lBwrJ/sOAeN0kTyAde7n50Q6ILafq5aAt4b/n+kXRVEdhyQNnGW
5jZnIgftwJe7/KKXF5xCXn1VcpgjvGSDIykFVhT3pgLoLGj/PXIX05q/YcjLe2Xc
GX0VQKcp7DI6ktaGaTndA6M0/lDMNRdsW1tt9ycdxZk1GEsGHvl++piP3W37tJaO
ORyGOu0uQRb4Ld4Fz5te5l1XdyUzIQ==
=tsV2
-----END PGP SIGNATURE-----

--bXkMWt+mjZs897Jo--
