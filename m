Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABFB438030;
	Wed, 15 Jul 2026 17:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784135442; cv=none; b=Xs1BuHBy5K5rPGGihWk67UpaIfLLCma0ZsQwVxE4zQzVMu5Gw58cJWEBtRxgjrfM57gR7CA6cT5vVdCKzsd0yi/+89oE19zxDo1MFkRUdw/BlLsIlhkc3V9rCJJVvRHnzz69xsk80A2EfTT6aZbGEOUiRGQYCtJ//MHMNxxTqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784135442; c=relaxed/simple;
	bh=OTJPDKdzQQjNnaEL0fT+wDX7+fVo4hXQyVX0EuA6fco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1iWWK4WGAU8rNk260EFMG3NxYO1/TvXXbathnVbQwQGcdzdp/kV7e1Y2Oo9l/gk0ZYGXJm4Dg8UGJjCzw/+WxsA2YyO9XKG52wrlnLOnYdhquuFwkyzfCKpvlymUlKBss6TzcXMOis3/cFKp4QTC7BHE7YSILU7bhTlu3JEvYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hrKeM/sg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hrKeM/sg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0091F000E9;
	Wed, 15 Jul 2026 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784135439;
	bh=fYGsvW9hGuxmAflE+jYq8h11jxocAnUQRdJUsUvkIEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hrKeM/sgoRcw2oFYt6sOQHPnATzHBVvX4AW1xsYfrMIF7PjvNqmRyAOU4hCJ3j/kk
	 R1Pubh1xvS+vNZYwtmaS7CBxKwAC6hr/z+0JIW84PWyoNISFGQr/kQAmFin2YvCv5p
	 sxDubx63UzRtnSr2X289lYMBR4AHNYUyGIn1uG9sEqQMmZ1Xf3t0uMi8QsHeYVNkXc
	 CSLkDjYQ+oJEq6I9Oyui7s79NHD2asUMURxZczFDs5STNLh4DCPGiKAw+GsulvdGPJ
	 G1gl81/mcmK24kOOKl8b024IceE53emmoa20KPoGQpJPeG6x/T9dqY3RZlKe2rC3L2
	 WL4l819bw0PWQ==
Date: Wed, 15 Jul 2026 18:10:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the ntfs3 tree
Message-ID: <f6042652-dac0-439a-aa85-6be8655c90ec@sirena.org.uk>
References: <aldqIGRdMoJgNkER@sirena.org.uk>
 <50304fd4-d8af-424c-ae8d-efe31e77c76b@paragon-software.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SqGKrpl5+XWji/Aq"
Content-Disposition: inline
In-Reply-To: <50304fd4-d8af-424c-ae8d-efe31e77c76b@paragon-software.com>
X-Cookie: "Speed is subsittute fo accurancy."


--SqGKrpl5+XWji/Aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 15, 2026 at 06:54:21PM +0200, Konstantin Komarov wrote:
> On 7/15/26 13:08, Mark Brown wrote:

> >    f023839df8010 ("fs/ntfs3: fix out-of-bounds read of INDEX_ROOT in reparse/objid init")

> > is missing a Signed-off-by from its author

> What do you mean by "missing a Signed-off-by from its author"?

> It's signed off here - "Signed-off-by: Weiming Shi <bestswngs@gmail.com>".
> Or did I not include another author of the patch?

We have

  Author:     Weiming Wu <weiming3@asu.edu>

but

  Signed-off-by: Weiming Shi <bestswngs@gmail.com>

Neither name nor email is the same (git show --pretty=fuller), if it's
the same person tooling isn't going to be able to figure that out.

--SqGKrpl5+XWji/Aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpXvwsACgkQJNaLcl1U
h9D9Hgf+NKQCGZTb1mlZwNhWEpyYNFE73ZwkAm35ZVOA/C8rY7tmJ/slR5jh5gtl
THa93hEvMtYDJPP5b/dy8rPFYnyY0QQfpiDG0fElNWIEjrSxwbNFvm9bOPtSklCd
Old+yYplonA3hR2K++YJ3YNubCgSeo+vjtdUdF+QrT+KyswvdgyBmceTLjaDiSuR
l9PcKQlPeoTzyxB0ei6Gt6yyZ8Bb+U2yd4xRSZYV8qDDtT2BrvgyPHnx5jRAcuVg
Kj7CCyI/ipTei9KqV7TA+A1XfZ6PI2l5fTNhfBEPqPmcpt1z2JElqexpz3igeMxe
SeRkmsPpApoAkiEMRsosBhrRYfASCg==
=i3Tt
-----END PGP SIGNATURE-----

--SqGKrpl5+XWji/Aq--
