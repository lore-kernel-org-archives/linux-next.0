Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2F12E62D9;
	Mon,  8 Jun 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780916376; cv=none; b=Be0FpD/Q6j7EdevG1TNyk69whbmVTb7LwOQRV02rt32aOlwGzuFL1MSh8x/BEOaqwDsP3vfyRBZ6BC2OZWZzHiQrBAjTskE9JztVENqks6H6E0kPlmbpiMHrzkKcAmyGTfMNqwBQzLYmaUi2bhFMsIBGx1Aq80qUUy8Owuudp1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780916376; c=relaxed/simple;
	bh=HLsMZuwbZIn+CwGkqYYQz4dmKhKaioVsRmfCGimweyA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZgyslM7bdeHTkE4iKC6qgGJN28TKfmfhva1b9wsIxjy46WORWsrDp8NSkxBIGyGLanUvCoH2yBGzezr3K2+6HOupiDEbqJ+F0nbqWKigEiOXe/AOLwxrGjWJFdpXkRQiYKqtAzkqpGwnYpEAAchFYBVH0nuQW0oZC44x7EUGaPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V2/D8O1x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V2/D8O1x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7F51F00893;
	Mon,  8 Jun 2026 10:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780916375;
	bh=0WZzz+zS7s8hwcVy2uUsIx7gf82sKNVuq6reB9EFHWI=;
	h=Date:From:To:Cc:Subject;
	b=V2/D8O1xvpP3/Tu6zIDtuAbX8tcyykoqgdvHu5jfm/iDZmIqb/0eKwbtrlVG6nBzG
	 w1s45MsfowJ6i1JrnQ0Sx1KLkObvNw40aZbq77S7qN+lbjVPCk03gTaDKtT6c87SXB
	 d8oP5Xj7eBLbrG09TiXqWeoVg/2eTVCZzDocqH/kdp5HnHnepxhHDiOeUiYuLmIfE3
	 2Riht21JPhiLow8a2vJqCkdxYmgcn2eiTCOJgGXkIOK1jLUSz1rT4xxJNE7iQPz5sg
	 NHnh0op8o46hKQV0LTH4A0WPltb2weuYhDFGsk6D9JgjO/XXPf0TImjyIqFcMPow4q
	 uTOFlLrl8dFLw==
Date: Mon, 8 Jun 2026 11:59:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul@pwsan.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Missing signoff in the risc-v tree
Message-ID: <aiagk4c2qa44bRog@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QIVpXtO0zFsF8Se+"
Content-Disposition: inline


--QIVpXtO0zFsF8Se+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit

  92d04110e1254 ("riscv: also select ARCH_KEEP_MEMBLOCK if kexec is selected")

is missing a Signed-off-by from its author

--QIVpXtO0zFsF8Se+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmomoJMACgkQJNaLcl1U
h9A5yggAhfcrZJFOWyncTy+ue3MFUz+N3scgbI7xflSbvgzJBZzAZOldEvEjQ3j2
I8xyxyaW1d5foLyfNYok1F37scG9NSPnqd3BTLEmaLT3xkaifDL43nY+Z2V6Upe3
JaI7VTxcJJcLY8VRN31pIWAIWu1xIBxUgaZWfzvg8F/3LswiJcTosCdBg7vfFAi8
PNk82xkMaKziwuvufeXTFtXnRZ38rjZ6cO4s5qq0x4WrOtLKkqrPp7CvQoSCZK1g
5kYVTNbXHMU7LK/X5+0BXiDBU1RViB4rgz4rF5KFb52P0mM8kGGEYZYiyT6DhbOA
v48nyvGasAF6hos5whdsl9o85CI/dA==
=/mWJ
-----END PGP SIGNATURE-----

--QIVpXtO0zFsF8Se+--
