Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4900145A285;
	Thu, 23 Jul 2026 11:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784804686; cv=none; b=M5KK/3rlX8lBV9iNpWoMd3TLoVSAhVnWKAcLGXLOOnf6NjnNZgRLs0zlLR/LxnUqmrBxzT2MRzsHXX+6NYR8sNG3KeaWNUe3lDL0YfTYv0BmEBLVupJ7//fVaSwOnfYzSlKIQkoJqK+COszR6bOZQ0y7f2gSnDyLmkHeRljnRn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784804686; c=relaxed/simple;
	bh=91QtNE34DTvi7NWkYiaDeQRtDSN5QAoykjLFSfao/bU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CdRj0neRSPOkO/ojNaHxnO7VTHgoh8A588RSx/lUq8uAMBAXQkoYS0LqCutpvcdvl6ZzrM4+ouKj5y9XW+qoQ9E7OYMSYzq0pNJUFnPIvP6fo3XGEELCDgu4Bf8vFNJw9I28tAr6Wu9g1bjrmGOf+UtNiNCFWRbUH2VGNVCLOyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/E599dC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/E599dC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 794491F000E9;
	Thu, 23 Jul 2026 11:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784804684;
	bh=PmYVyxzVdtVR9wVo6I6Z0oAKoBSrM2ZfXD+xx+AXZeo=;
	h=Date:From:To:Cc:Subject;
	b=d/E599dCg6IIX1meuTS7Pm+7KKig99ZxaLujS0qUSfWcHbRuO1PIRLw6KtFiVd1iW
	 hTf+fohASLZrxrZ2BWeU0eu7u88E5k65hSCO6K26/7Z4FTEoDFj1KSGZxGKnbP0qeL
	 34QCdxHr+K2HS5hL+NhEyYlgXmuFUrnPxz6h/uZbMjawFGOjJP5e5YhPAku/IvPNjl
	 ReYK5Lj8Zo3MiLLAr6jAOhC97nCS99jdh84IjNA7qVZQP3fSgZmAtTT1aNkiTHLLYn
	 VXFjKl4d4BDJnUIy6qnCK6e+LpPFcPmW5j8Kq/Jqvz4miJnKk10j6RwGOLs8xTVYQg
	 fGNjhYka5KMnw==
Date: Thu, 23 Jul 2026 12:04:40 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the liveupdate-fixes tree
Message-ID: <amH1SM7JanxoGRSF@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MK7YU8gHmzQHquOo"
Content-Disposition: inline


--MK7YU8gHmzQHquOo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  b44889cbaada8 ("liveupdate: Remember FLB retrieve() status")
  459873adf5e90 ("liveupdate: Reference count outgoing FLB data")

are missing a Signed-off-by from their committers

--MK7YU8gHmzQHquOo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmph9UgACgkQJNaLcl1U
h9BuhAf/SAaxIJSEbYkNYSrsGJObAeQPfHN/T1vK/Sta54LuZm4/0lcvQq/b1z/R
udew3EtAlnyQ5hzLzWkZyunA2FXGvPVH2juKQI2KxofECqNyKcdKaeLAo2lufH3T
UdxSfFBRjvMl5Xc3fOAjtYqnbmh9K2Aey5xex+D5HptUKDT+vPsUvfGkNUf0tGHQ
zmfme3PsO8a5E7JejoCNIBrmMIIjBZ6alwGY5Pyli6+S25SNJ1lhllXhsgxoJ+fj
Qgo+xHW4lz2Wm3DVok4ikmkZV/6ejNcEZDsKuHZNK5oz0Q3sLsGK8qa21lt0YG/A
u9EY/t9t5kVLYvI5yEWaZdWAeEvTag==
=+nKf
-----END PGP SIGNATURE-----

--MK7YU8gHmzQHquOo--
