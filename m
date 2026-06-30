Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5BD6403156;
	Tue, 30 Jun 2026 11:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819854; cv=none; b=ZKnjXWTd+w0tNen/pnCgHMT/XIS/vbhyQxKmkk/akWXWaU0QwuS1RE/SBmN02INwy8DT+uSc23zTetmJnBSr56AFwHnZ+83Xo4Q1Zfv6sVjNfbqYe3p1rZ3D5qh7RvtPT6y17p+FuXTANsb26EHNl3kZePjXoKxwhDETkzLjUSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819854; c=relaxed/simple;
	bh=WKN6UsOnFhu7Lg/N2WJyn+RRyU/aEUWKKScxyH3f4DU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGq8VleH7hiw5Zxzm8fbO38yg8+i7x9yHUdE96xmDx+A8S5Yb35uDSLZO82srd1DJqEv2bbXM6d4yQmB3NnI2mbqt3wwErbffVooNFfQY/t212MwK/Y+MnG6MnBq+hbc9nf6Lcqsopd9N1g4VPRm7lYlAbtOQBHPjDoI/Gv6hX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i1oYhgxT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i1oYhgxT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8688B1F000E9;
	Tue, 30 Jun 2026 11:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782819853;
	bh=WKN6UsOnFhu7Lg/N2WJyn+RRyU/aEUWKKScxyH3f4DU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=i1oYhgxTmlTSrBCX680EbLzzY0UXnX3sVVBe/NdwZNe9MrKQcj+6CB223nAAvv5Ta
	 ZmggG/DZPOjF6k9QQDeZGOMMxZoCUxidS60on5ZfalaptjVPkN3sz572BDGXsxY/jG
	 TG4UcP4bRXjnXgUcKSj0w/Hw6iRasCYEnDyrcU8ZbiNFenFkudRSysTAWxWepcFTtL
	 6zXjehkvrxnF28jiV6p7bVgqIgVdQtRLiTBGE2zqJRwt5BeWNwuXB2tor+DUgAaJyG
	 VPI+qI+1XvmRnLp4FRoeI6ceVN0Z5YhAjgRMyRyC+3++SX1qO8XoIQKhhlKyfXA945
	 xn4i56cVInElg==
Date: Tue, 30 Jun 2026 12:44:10 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
	Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: Re: Missing signoff in the perf tree
Message-ID: <b68f5562-4148-41dc-a169-7d7da3371db6@sirena.org.uk>
References: <akOX2cfUOK1rRbu0@sirena.org.uk>
 <akOrxCUym-LYr-5n@x1>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Dzbc5+JqND2BC2nS"
Content-Disposition: inline
In-Reply-To: <akOrxCUym-LYr-5n@x1>
X-Cookie: Air is water with holes in it.


--Dzbc5+JqND2BC2nS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2026 at 08:43:00AM -0300, Arnaldo Carvalho de Melo wrote:

> Namhyung, take a look, I think you did something that made you become
> the committer but then you didn't S-o-B it, please fix and force push.

That's usually a rebase.

--Dzbc5+JqND2BC2nS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpDrAkACgkQJNaLcl1U
h9DEKggAgo/XIx2vEJmoH/G25AmsGcTscAEEBIzqOTpWmINUTJI+tmElJMe0q+nx
3wTkieUrby4cc/p6dTdlbBPmnoZQP/TCc5y7ZKRgeqS9Eg1HRGWS9KRFmteXR+NS
NIov0a/eBNVcW98oWfnFoIi9z0iRAnqAdRagLmzkv1ch68a5A7dwA0C8xxPhRwgN
kmuGS81ga9y9kKFNP7w/2L12Ll9GMHR6mbAelB2Z2F3Rh7DIkTUq9aAaDv/yXhyK
OraPRemM0ZNsZ2DWQGegQFvsXjaxywltKlMVF2NZCQ18+NjaTHE5pbbkMg+j8bZG
7mL7tCTMDTeIPEuofmKLoNx+ruif7Q==
=gRmR
-----END PGP SIGNATURE-----

--Dzbc5+JqND2BC2nS--
