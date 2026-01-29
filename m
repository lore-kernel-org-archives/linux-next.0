Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CC4239E7D;
	Thu, 29 Jan 2026 11:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769685780; cv=none; b=hOmFx2eJ/8oUlJ6S25SJiImvJtPUclrwvhZR9AGrsUbs34n+buWkA2u8h8Ci7lF1duSYHygaVHkp2THMK02dHrnIvEZ2b/rZ9zOgUzRQiseqzm2PXSFb1XcpbkvzwnSjVXabmaBM3qtn0moU3KaYahVTiXZXbk93ROUNfg/TDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769685780; c=relaxed/simple;
	bh=F60f7nwyUr/8RPdTTcLrQJvy62Zb8fo2+A7zGNwI6C8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J0Csog4lgZk2qHqsGV2eAwHTsBu5MFYGPIIq/FtEogf9SO56UX+7u02agA4kAO9ViiaPycsB5oFjACBdFoEpo1eXkRdG1zYTxVH2bAxEBVhfkXFb+3sj0E+mLyhrfNjib3+cIos7WeWX5RyOCGGES2J0SlT1QFjBpLdVyO24g88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WptM7L0J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WptM7L0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BAA6C4CEF7;
	Thu, 29 Jan 2026 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769685780;
	bh=F60f7nwyUr/8RPdTTcLrQJvy62Zb8fo2+A7zGNwI6C8=;
	h=Date:From:To:Cc:Subject:From;
	b=WptM7L0J7AQlumcyuWvunZOkCdU75JbEc4aIFNN3M8fyaOcKx+ZUY3PbU90TqsF+1
	 9U+iIQZmnuxd2OteAVuIfkJXKzy0bn3uG2YCYRqM0d79ACnanwlPnbwXSYWAmbwSRv
	 Et3+HqLLYK7Zbp3rDzDA0EmXGUlrq30QRFDAV75LYJHTIxNIBhY6AZV04zoshYEsQu
	 yZKdeaVMQuoRpQb3tNJfhA/uyanRchcBi3+yjhA78WJ87cBLBYVUAlBCntP63hoLN2
	 e2Paqz2f8lhb6kz1M0GF89gf5Wk9aI2N42/tqhrUU0uKmRGU0PNJV29Gns8NeaHmwr
	 4NTOsrUtIKNjw==
Date: Thu, 29 Jan 2026 11:22:56 +0000
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v tree
Message-ID: <aXtDEPQY8E9Fmsov@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kzDkdyeA73e4uV7X"
Content-Disposition: inline


--kzDkdyeA73e4uV7X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  49d90f9626934 ("riscv: ptrace: return ENODATA for inactive vector extension")

is missing a Signed-off-by from its committer

--kzDkdyeA73e4uV7X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml7Qw8ACgkQJNaLcl1U
h9CqfQf/Q2fE4+6BiNCfRNthHgE/yOsNWIfoJtAkrcjoOVVazhq3sEsRHv4EDst4
QK4bFkoA6p6xUxD7RlfkDM39rZdR3BpQRIzEpMT7EhXpMuta/+Ftv54av06ScpZY
b13naWp1OrUL5kba973pablLjpoAvl36GJf/eVAW9dD3xGXnntp2yIpBKiT5ghEK
Q6+daJjaUoVgMzJQkaU63ZlRqqVZc3yTKJjVUgpFzzgD0p01uJoQa/HMHoYhzobG
iNgm3u8rQPwRXT3SQK2RFVJsO0/iJ1I6A2RB/M3ajJQJ0P7aoCSGh1F5P01lc/8O
CSm0AzSvigpT6x5ZV0/5y+xUR/edgw==
=o9ED
-----END PGP SIGNATURE-----

--kzDkdyeA73e4uV7X--
