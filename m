Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C633A3E7BAF;
	Thu, 28 May 2026 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969780; cv=none; b=EdnUtBclTwqv2Jyc4n8JV3vJ4SrHtNSpBXXZOxzMxSV1Ogzbp4Z8xArIXvrJsjWb+WBpuOUpyZAEBmSkw6mgwC6rDdOxZiZZdETyYL751VvP3Y/3YGACPG3+/7lOBLYK7rWzaXaHW+WpYHwf7TrIwIMkbZTPCWo9zkrAwtCsiCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969780; c=relaxed/simple;
	bh=1oWXvL/jvGFAaIqm07VlSSJ5k5T+zFbo8MhuHQK4WCY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0BRM6QQG/aLWgRH7pAvOZ6Ftv/s8Yck3r0Euz5j2KujltQrWXzUi9VC3ahD4vxAIRySDRUhZ0qqQxG8UiLZaX3+ZpFMkBplzviJ7V3QheL9REoIaNJTr5AnqAG31wjdU+SoPDBxh3TmopRf/XcF8kaGIuCTl0Bx7DiBmOPicyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nndCyfHX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nndCyfHX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFE321F000E9;
	Thu, 28 May 2026 12:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779969779;
	bh=cJwKRSvj/jhohhv8ezSNl/kfwKh+RTrH5NHKoENDN3U=;
	h=Date:From:To:Cc:Subject;
	b=nndCyfHX7suZgSXCauJG3/Scieh+VKNGoQyfKHa8QBY1ZjVZCzlRtCU0++e/JRX1Y
	 5jX20tNyc+TB1IBlYfGP6IyMYsbsOdandA9wLq294MKFKJphmhdQP334bML1NGZXtA
	 paYRsWFm2+kUZX8a4en6n3EWcrPI7cJqnsxnEL6OPdZfbjWRiGwB15fGogRskrOwql
	 0vrdSjSxMqDVnv1+RK3D5mhNFoM3NlGwJBbru97uNRkPlIHRdXoPkNDrW976BUQLKo
	 5qhF258XAe1pXWJyQK2FFbPWMuETgM4KSnLj7TZ3bMdJIkpBRI+hBw9SSObqBXprxj
	 ZOkBtsmmk6hSg==
Date: Thu, 28 May 2026 13:02:56 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the mm-unstable tree
Message-ID: <ahgu8F4Z_7vQ8aN4@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5/M9YnlFDcrO1/6E"
Content-Disposition: inline


--5/M9YnlFDcrO1/6E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  03ca3a6a9ee70 ("mm/mglru: consolidate common code for retrieving evictable size")

is missing a Signed-off-by from its author

--5/M9YnlFDcrO1/6E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoYLu8ACgkQJNaLcl1U
h9AO6gf9G6FVQQNxeZerqyA4Raxk6oyECtNeysoU0dkonQ0LYER5o2LP6PV86Xdp
t45D2HO5RAyq3YEHExJrFFCNGBfnrykFis8deeSwLTnUH8u2UujYSdswefl1pklt
iuInmh9rGR5qo9XCL6PFvUSd9dCrlRaK+iZEChqHwOBdGu0kdw2QIoPD/HJUqpvP
lHN0Kb7cSg6mcHiV9umyrI+CD0xJFwXtL+j1chnns6Z0RHFzWZ8DxYYZL1awM4PY
S6BAPu3WjPg7CKoRiFWpn0aAmmelN54IPR4I0bY3NphK/gboEuqJBhjgACHsP5ue
d6FyeF86rFopBsVN5XvpwZ1OXQ7/6Q==
=2gvS
-----END PGP SIGNATURE-----

--5/M9YnlFDcrO1/6E--
