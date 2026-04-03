Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45E33B7B80;
	Fri,  3 Apr 2026 11:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775217348; cv=none; b=gPFrkyLwHGubdRN4SnTi2iX+mz8hn5ISxCp77sugOPNVN5u5YsWG7tkeCEW7M+MUj6m6ao00Dl9PO0/zE2emtgz+v9salXgasRHYmlJHDDgsVPS8vpq4fWO70h0fPyTabW62AdfI4QgGJ+gOulrUPKb3AGNE87WrTh44LyCTC1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775217348; c=relaxed/simple;
	bh=wgUIx8wBY/uLAGijNFhfapzxeGiCjyqqqlzv96dK33o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iadqeqd1B98EXW1Uc8PEBHYfSKX37+p7G7PohXHqaevigDvLlBrWTStvH/brUBFN0L2JSB1T0YtWrqtj8A7WXckfm9GtIz5hsZFtrXbQiXUunooOSKCdsCYUznHZfayFrHc2/AzaS/m2DIef/H7FPhougOJAp+Eu9sJv0zjcQiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MChTTqS1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MChTTqS1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09CDC4CEF7;
	Fri,  3 Apr 2026 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775217348;
	bh=wgUIx8wBY/uLAGijNFhfapzxeGiCjyqqqlzv96dK33o=;
	h=Date:From:To:Cc:Subject:From;
	b=MChTTqS1POPc+u/4dTorPXB4Dh11NZs9uGX0UctzAcPc82o3kkOSagEarZM5g1cb5
	 g7DMp5x7UlnjLPEaR8dSCMRfxDTEnHm7vQi4zaeeoCSPB/OrtFRmG7p5dvANw6SIk7
	 lwDz9jg3APUdxIcAbg0LmnbfWxn5DvgwYXxJOJWXS2TxmJDtRTErmv/hXvvBt+2yND
	 qd9q7dcHGn+lF2DEiLdrVustyX4qGosziXzH4vCSnV4/KOduRvHmCdT4KTpHLaXQW7
	 0kLj8nyEQC79hgTPXoXO1PUxBresYkTVIAnrsyD12zTfqDS7BIlgRo/w19U7nxm/kw
	 ltDPijPGypy9Q==
Date: Fri, 3 Apr 2026 12:55:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Corey Minyard <corey@minyard.net>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the ipmi tree
Message-ID: <ac-qwYt2EgJtifKa@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QwQp0gsUnNUyT46I"
Content-Disposition: inline


--QwQp0gsUnNUyT46I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  90478a78b71ff ("ipmi: ssif_bmc: add unit test for state machine")
  005687db316f2 ("ipmi: ssif_bmc: fix missing check for copy_to_user() partial failure")
  e1748349a14d3 ("ipmi: ssif_bmc: cancel response timer on remove")

are missing a Signed-off-by from their authors

--QwQp0gsUnNUyT46I
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnPqsAACgkQJNaLcl1U
h9DoRwf9F4iXB7+AM0nKRxhfKJtylXp4k4Mm6m48d6BP9QDvHToEHSrtkMy+dWhu
1ZIUdZU4YhviRzrXI3SKi7P6x2AcqX0eZ6rY9mh1Hae77ablxEL6NHwm39Sl3/Og
T/vWpxXMFGwolrYl96neTgWaIgcUsC426I3WgyaFs2glDdjz/EGDMbZW+QPA9h+m
2JFj9dxk3RopQZUY/qh2POtUeUbednqabbuncwefjGdbMeidA+b6VrO9JB9BfL9+
ngPu179REIq+dU19Sj9D9f54YDV49V4O29yDogsQdOM2QEseGBLvhlxfXxaZjAsJ
uULhFLSCuA2jPR4LcTVGR0IX/ntkkw==
=3NT2
-----END PGP SIGNATURE-----

--QwQp0gsUnNUyT46I--
