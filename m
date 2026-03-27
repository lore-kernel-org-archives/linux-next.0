Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D01617B418;
	Fri, 27 Mar 2026 16:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774630359; cv=none; b=TnCkBTtq0brEiSaDJqOdBj2xPESVnqR1zaqXJ2R1mR5O5IyFXLX7uhBNXiu2hesbwmfWFqfHnnpysSJXgDj0690JMGY5Be8etrluBKbravUPcJGwuVcFw/a4LiXszWpAhaFXc/A/m55AYaZaAtnxI8HtTvQtGGW+ak4M4bfha2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774630359; c=relaxed/simple;
	bh=4a3u92AwcSaLHMlnrca7Gf29buWAZ6LX7hPi3s1WxDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S+hIrty1QqEbaCfRl1+PxMpv8Gd7pIhsm0lJ/NPfp9pe1a6nMLi1t2Uhmjy86C+nzQOAR7j8u+tzbsYb/FwUtuIoUTmOcCr50vDjBWMorT8CzdiTLS1PaLF6/gjZTdAgKnZm2AhvWKVTKuZhIXjH3U4u9hF6bwarOlubu3rcYE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uA6oVIsp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uA6oVIsp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2FB1C19423;
	Fri, 27 Mar 2026 16:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774630359;
	bh=4a3u92AwcSaLHMlnrca7Gf29buWAZ6LX7hPi3s1WxDE=;
	h=Date:From:To:Cc:Subject:From;
	b=uA6oVIsp/7LmUQjUA5Tm1CeN+/KA0wrKYIWzNHQc4YxS6fNiZN+3wGN0ls+/rybFY
	 WN2HoV8ktRDPywlDbnbvaz6zYtVcU2y4heTbS1lykaKZnDRcg02pOB4gXEYti2DB6u
	 oF5546yzAklvV1uh4RAex4ekbW7cbddjJVzf0FDfsofn1haBOtMRIvUR+8dCnRnb0Q
	 d5k3nCQY4ow6GMGLHbWsnBXCNT2FSKN4Zg+vjBmqgTfllUoGWlCSEhT8Vqe+yuDzBF
	 e+kIdVtfw6Nt+HrseuM2ioIl/AL4c77TZoG3D8bhXmxKvpxhB8Nj/UCFi9vzJRfXIz
	 /NKlWXDqWUveQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 06BB91AC5731; Fri, 27 Mar 2026 16:52:34 +0000 (GMT)
Date: Fri, 27 Mar 2026 16:52:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the iommu tree
Message-ID: <aca10hdkzbvpNGNs@sirena.co.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nRwA9XBRk0g5NmBV"
Content-Disposition: inline


--nRwA9XBRk0g5NmBV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  00a7eef2eef218 ("iommu/riscv: Fix signedness bug")

is missing a Signed-off-by from its committer

--nRwA9XBRk0g5NmBV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnGtdIACgkQJNaLcl1U
h9C2Dwf/X6iRtlMQWFfpLj9qImXBHSBNa1nqByX0nUg8JlCwrfaQfdQK8ODl9MV9
02XWWAnQoda0l6+GbQEq3fLUq1nQreGUsEvq4WDXPr7UcWPJrhOCh0sE+7/xT4eR
tDV9FKMTtvAkD3MlRWFRGw71AZw4CIghaOI+vVr9ZoYv7fUzogIsn4Nbv+h0oKr8
6ghNFer0bihovMR1OMF3skZtg/5p1DeqZfWlDU+/etTNZnY9q3e/Acy0EPjUIzxG
+Z1sf1KITI144ll5shATz0FZGI6oJzeMbhGLOBRRmqhm+T8UYmUXeFlqxi1uho0V
lSacSEckj6wg0v2uB2Lk2nwFF0TUNw==
=oTwz
-----END PGP SIGNATURE-----

--nRwA9XBRk0g5NmBV--
