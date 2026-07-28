Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4633F394;
	Tue, 28 Jul 2026 17:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785261423; cv=none; b=PUnuC93MMcwjInicVGwmzxxA1uCu/ChEaHK96VN3SoeV8hkyK/wk9eY7pKC5PRkPWDr4vXaodyR19fsnnva99ZAv08JGxoFNzu6OSJ43y0zUpXbQCvBzJ9rfRIllZIgEH8UHpD93RWZAP8bpVyrUYEZAcl1J/yWpioa+B8RMkR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785261423; c=relaxed/simple;
	bh=Nn8fAST4njWsJq1cFxdKqSBFxErSJsqFmVP/G5eribc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCJAs5MrE+bzhwilp/bXWaBFjhin9O8gQ3yLFM69nb/EKjva59d3+GhMw2qDwwDyIQ/22uHOGuqGcourtSCAkPz3V7E01mSrh0jM+JTLaREeA7HV35RK3vcoJI7aLKsCmF61nCrr9M39zYAnEQxMKMRpQCUPb5CjOpyEcJPx52A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DWY6TWOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DWY6TWOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44C5C1F000E9;
	Tue, 28 Jul 2026 17:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785261422;
	bh=Nn8fAST4njWsJq1cFxdKqSBFxErSJsqFmVP/G5eribc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DWY6TWOPeOnUECEuQWaHqC1u3WNqppHHxUw2O512djE2DGtXzfoM537rU4E8JPNte
	 MkxclgrwiIygEDdHTzNT8RxasGGQAobqtsEl+pxDpl97Me9qTdM4MzbXWCTaGYFoN0
	 vGlLqdpVdSWVk79dbVgxLFZSOkVZ3WNJHZlkH7Ns702jalloM+pa7j/O2GfGdSRLhH
	 m3Z9d8+u16VkfxpnLfefZC+BbtTp2waMJnuEfzTXW+DsXLOC30LSfXzCsYwr0AmkoN
	 hIkavM9E6Tnxtt/iMxkt6JgjVtZs6kvuiYTywgecFj2qF7qeEn46NJU2bii8lFdzKQ
	 oefeGTMdjKvKw==
Date: Tue, 28 Jul 2026 18:56:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Muchun Song <songmuchun@bytedance.com>
Subject: Re: linux-next: manual merge of the liveupdate tree with the
 mm-unstable tree
Message-ID: <66fd5867-20ed-49ec-8377-06ee820ba792@sirena.org.uk>
References: <amjYWetl6_WVyumg@sirena.org.uk>
 <amjpLoJbHsqIAqJO@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X0gPGtsKislfreh6"
Content-Disposition: inline
In-Reply-To: <amjpLoJbHsqIAqJO@kernel.org>
X-Cookie: Stop me, before I kill again!


--X0gPGtsKislfreh6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 28, 2026 at 08:38:54PM +0300, Mike Rapoport wrote:
> On Tue, Jul 28, 2026 at 05:27:05PM +0100, Mark Brown wrote:

> > of liveupdate from next-20260727, I'll have another look tomorrow but
> > would really appreciate it if someone could help out here.

> I've got this for merging mm-unstable into liveupdate/next:

Thanks Mike, all being well I'll go with that tomorrow.

--X0gPGtsKislfreh6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpo7WgACgkQJNaLcl1U
h9Cb8wf/XLKqUEqBeB5tF1X57YbI0VnDhw9uIbXVBHjLuoHaYVCc2MNxDCX5cnOf
PE7wDgyKGox0shFgHZk6BqdrY3ae1+eqrIAWuq909PsZBClKfl/zEeWcNf60D957
zdtgjeQM+/0Jm7n5hBl830KZPMjUMlLkV7PIYEZwQp9yuqTXgw7mD2YgJgqXV4eN
x1yLbqmcEz+2+aBnRcLn3HxfM6R4AAXjZAKurb0S1OqzLnTxUQK4XIKx+I2dRdJd
UVIwCUTwnTCW/cJ6hMJpFbh+0MFQfBIlxXcliPOCcXwoxg2uHwrDqTM8jl9pMgy8
i0guiKJKI88P/UIIsd53Q2dXf0CsGA==
=ZZ+a
-----END PGP SIGNATURE-----

--X0gPGtsKislfreh6--
