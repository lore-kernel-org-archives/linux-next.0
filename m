Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE053FDBF5;
	Tue, 26 May 2026 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803524; cv=none; b=Z+Z0GTxfqOfg0/j/LogCkB4pNSlKcFtpnVs1j6KI+LzpkRJVVYDe5YgbObwXSEy+RxNBVovcP8QAB9e4p4YBXSdwdgeYRsDXzK08kQ1E+oK7LnY0vX26Ldb5rKYvuT52b6LbugOmDH30BmISd3m1JlL5oj8gVnXSHBREjp768kE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803524; c=relaxed/simple;
	bh=+SURL+63uZyTxgEDOPl7ezKT30H2zPE5SkxtMAaob28=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KL260ICFnnx24cP/RfWcz6so2Yxk9mq22HhTgbgtqpNtq+SyGpZevLgdgP82H++vvefnnEfacYjrBNgaS3uY4VOXhvg5Q2xAQCUv2yXPtKZjPFxThFvsfCTwGlyC1Vqh5aHSASjXPs2w2HWOei0Y6CD0zJDAXcleM9oaI/scylE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kQzvkuCO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kQzvkuCO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728131F000E9;
	Tue, 26 May 2026 13:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779803523;
	bh=nfkeaanin6+B5ke/8t6IO+n/hkdLSTwBpmn2/b9fsQU=;
	h=Date:From:To:Cc:Subject;
	b=kQzvkuCOS/DVG01E1vfIiYkEdrcpx4dzlSl2yaErit6q733geJf1LUYtLtAVetHEp
	 ZRXZvGzgkJAKZ2hG2CneNawFifN/9AYMM/Y3MLs6N0lX+09NDPZjCA6Oc4qoR6JRfX
	 O8QuKgVjk/GwqSkbxfLQ7vKpCjVt9PxiyH6dF8Hnuz2bkgMiNT2eiyphtKtUO55dky
	 u/JaECyhAGeY2x9DXgurvDwDd7yDIkd17vI67RdUvigNwf3k+coiSVlP1c6ckkpVRo
	 C2jrWrruOjZP6QI+zq/0F/pdLKnQubpVp9lvivfqLisrLDtV1opOgneJWsdTONHaWr
	 Tfiujo9rGS2IQ==
Date: Tue, 26 May 2026 14:51:59 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the liveupdate-fixes tree
Message-ID: <ahWlf0QXID7R8cvN@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/AGcc6NwrAGno5yg"
Content-Disposition: inline


--/AGcc6NwrAGno5yg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commits

  1809b1ab7f8c9 ("kho: make sure scratch size is always aligned by CMA_MIN_ALIGNMENT_BYTES")
  8a49c102c5576 ("liveupdate: document liveupdate=on")

are missing a Signed-off-by from their committers

--/AGcc6NwrAGno5yg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVpX8ACgkQJNaLcl1U
h9B1PQf9EP73Fz5xf0jqniCI2L0FuS7MypIH/MgnjEDpqEDN+udTHIgkYyKxNny6
vl+jxHqffHKyvFB2lZ8xQyGhi7vmOWlVxnco7Ltzmiu0znP6MnokuHTlN0GAWoWA
r92mUobeazc9HzfXY+xTGoX6n56rQcWknjytyNFgc+P8w6VWmq4W2UYkyrTVnKlp
+qc0IA4x/LF6CozYWf+CHLPOeI5NVjTEhflFldqvktZqCCM/IzEEH4tT1b8P3hGi
qCpJtbB8ntjh51wFNV1lLABNfsrRFgggVGZoTmUgLf22jH1oCb7iZvihKx247lSU
52TffVL1DguOUuy5suAZRTjOidK9wg==
=hvPY
-----END PGP SIGNATURE-----

--/AGcc6NwrAGno5yg--
