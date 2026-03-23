Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EFA1A4F3C;
	Mon, 23 Mar 2026 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774272324; cv=none; b=cA6H/3+1Mov6KKIRLLU+ilp1cHvzqgH0tNUVzTXuAuNPNYOM17Bp4glQ70EGB4ZijWHBHlMELvm7g4z+BAVJZ40hoepnwTgFwMDHMzMzqpJ6IRlOEM1NlC5znaS9UA02mzAJECX+DvGOBg4hH6C2AeAM5ahMkzze+ZJVMPnIaT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774272324; c=relaxed/simple;
	bh=mqePuyV9drmRqq86dagxhVSzYVpw4bgxrm+q0yI3G/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LW+zDL8btNwUVs6/t7DAlGdSsiCyfN55+/n1j/AkskThJon0XLFAOPfWpB6CKzpTPkqPC8spcrqXt9ElIZ3+LjMxlDKDReP254/7WEdgx5+Jd1xYf1CgTVTUVaafvdKIXwdZ32//ymdy1K+ApA+CodveiFifI7HkkbxyUpRKAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqWmDAs1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqWmDAs1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909A3C4CEF7;
	Mon, 23 Mar 2026 13:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272323;
	bh=mqePuyV9drmRqq86dagxhVSzYVpw4bgxrm+q0yI3G/g=;
	h=Date:From:To:Cc:Subject:From;
	b=WqWmDAs1TfH/jnBOiGw+nInLykbfpxlLFmWMqSp5RWqbpZU9re84F9nMLfW8Gtsjn
	 8Lr5vmBBHccFtcVPxg851wJTbWmkXcAMIWaHJR2vMgvP43iNFmSlpCH0+FgarMF8Ow
	 5QKODf04Az/Sybk7DK7J4Mjui+dQzR8eTLSRqfzIL1c2jbK058uyhzaIJTdnNBOTwX
	 tKyfI8d58/CAHnPPfKwM728ug78VVrc0C2wXJsFYmvFYZ/oNujmEwqEwug1GmO0kgo
	 99ZeLuh4noaqhyuMy5y+1GPlFHOhkBgBuhBEps/pi7w8lMvZjoUk8LBj6SoPhFj9nU
	 Ih425P0k6howg==
Date: Mon, 23 Mar 2026 13:25:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leonro@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the rdma tree
Message-ID: <acE_P6P7vp0LmTHT@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LPOslaPeySWBDpqE"
Content-Disposition: inline


--LPOslaPeySWBDpqE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  c50be61e277e1 ("RDMA/irdma: Add support for GEN4 hardware")
  333ad1665dbc4 ("RDMA/irdma: Provide scratch buffers to firmware for internal use")

are missing a Signed-off-by from their committers

--LPOslaPeySWBDpqE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnBPz8ACgkQJNaLcl1U
h9DBZwf/Wat3/K0nnP0z9Y8buQIAw7vnXddS3yL3qE1VvGrcW+WM6/W5IgUeKij/
OhxE9SEyDSlUSEFcKiNCprDsfojf70dzDJ42gC6Ip/BgAZvGHDWQSrcf2jiZQEn9
gMOpEJHITCsD1Q5BcqrW4nvJJfL5l4z7LTUMzU5gBarn7v0ucxDGOQK9r2JYEwaq
SAaRGg7MgxjL6Q3D4RXGYzq6yxjLQXGQilKY1z6n4bGCX0U23tryGrNNRxnFNujP
P87GlNpEmxWuc8YNTHfLG9GLYNNZCJ2T6Hj8UeroTBH24su0INTf6qk7JjKv0+P6
VFs8Y/ZtVjoB971CmdJmPwfQcwwjQw==
=HkK7
-----END PGP SIGNATURE-----

--LPOslaPeySWBDpqE--
