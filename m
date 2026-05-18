Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42D93E51E9;
	Mon, 18 May 2026 08:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092625; cv=none; b=FdUVGNOyjZt8v35iRipEDJ6WeO/WpReA4uTeKLXfkG8E0thkkbLOLdIha1BTqGqiO4KUK6XTNxwrgrSooZd3oSQNqdq6q9j5aaHodUt/eIrXrXOiMX+F95sFrm1CM6KDw/tmiHnxA6W4G7G3d2h4VrAkSjXnt1cuNwL2daMj/ZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092625; c=relaxed/simple;
	bh=gWCza02ml5fsmMMsXhOJdi7FQMe9guVgkQwttWdyBrY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ptpS2KlYMDMYUuhzEkZVJ1zgy1NkrAk9DXrzrGq/XbPEcqRloZx++kp+9hjywS8F+qLLCKlFY19/A0kvjfaEKSmVX3/ejbQX6kEKVumXbYGnQ+hnRCma17y7UDNn475maUezGkqBFo8lzQJzzNJaymcZ8udKB/vD6vI04S3hHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LlxEvfFT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LlxEvfFT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49530C2BCF5;
	Mon, 18 May 2026 08:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779092625;
	bh=gWCza02ml5fsmMMsXhOJdi7FQMe9guVgkQwttWdyBrY=;
	h=Date:From:To:Cc:Subject:From;
	b=LlxEvfFTL5NuxVKEdaZ6RBl/K7jYFRtakuzb5PQrgO0+BHlQ26nBXjxa9B7SOj3YN
	 pItOWjYpPojoBGkmCiDYGYux2gi9e0TifHyEtSQO32cGa7q7ctxaTlMcCDumCOSVnx
	 NcUUhMeHz8vHQFM6gFrSMY692CZ5pXJUEPu5hJVVDp6v9sPGfPZ97HOcjvz/1RkSUm
	 r+ThG7PiWQe5CqJwdMwDfIln5zeb6TT9H+KnIKzZz67Di9qdBIlMndbK9Azh0BhsUR
	 SZEavsxBIY8mn2Amgv1nWX81rI4RUoDdzt1COT/C/3Vd4OVSY2E982qhpVbPRTHTA+
	 NKCWaIkZhVLBg==
Date: Mon, 18 May 2026 09:23:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma tree
Message-ID: <agrMjVEsjWmsCsdx@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HkOq8gpjbmvczQPZ"
Content-Disposition: inline


--HkOq8gpjbmvczQPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  531553a3929fe ("IB/mlx5: Fix transport-domain rollback and initialize lb mutex earlier")

is missing a Signed-off-by from its committer

--HkOq8gpjbmvczQPZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoKzIwACgkQJNaLcl1U
h9BU2Qf/Sp0aLsiNzvqJtSB0tUKTgSd5P9lhqCTdADoEpJDu1dfc1YsNp72EVp6Y
svVH9xqqLmVJjsLJTON2Fl278CfqgmbJPDRG/mn5iHZYXrNy+a30Gm3LECXwlLi+
1OWJMo35dErsKF0TM11TLjjv6dxGJP+BCNApDAFIjC7WxGC6HEiozx7xZ8kDFkFH
OyrMN9GUhKE0Ag+dPbhLNpe0i20MMTbzyuhqYJHF0kLWe4x4TiPD42VWpoOZ7zve
ykkO6DVFT9RjbRxmVmEEJkPHR4lYLubZKdSozn9DPcMSGUtJUBPPCG7AYDBsZFC3
nw4WaiKAp3creJRLuNvn3R2qvAh/cA==
=tJac
-----END PGP SIGNATURE-----

--HkOq8gpjbmvczQPZ--
