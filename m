Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD2525BEF8;
	Fri, 23 Jan 2026 11:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769167691; cv=none; b=ZZ6xAKGsU5GpG8ll1epZNaxjMnBJijyDykLs3qerLMg7eb3KgysVKOZSyOdiPoyJTHf+gZu99sy79UB+vb9ilPKx0zIOfv0/gefM6jF/ambIcwMumEWdjDJEQuBklVGGTuV5K+HS4XgeKZO4LRI/JLfubtsMOcW9B3yvCnh89vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769167691; c=relaxed/simple;
	bh=RxVpmJdCjrivRll4uOmVa64p5tw55xMroactfceMo7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L66uAoEnP2372SvImNWjr5bfsr/OEZblsmGoOK/NV+bczzKz4OTq2ndXgN0n/9TiOOJ12UmYF01gz/VQOR22OZKPzUbIw6AxNzu+1LkRSjsygn9A7fSZ3fEHFC8JngLAJjtYAaT3I1LaP8CQPh3TaFgtJjm2iG0hzC6ltRu1urk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sm6g1PbQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sm6g1PbQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3C4BC4CEF1;
	Fri, 23 Jan 2026 11:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769167690;
	bh=RxVpmJdCjrivRll4uOmVa64p5tw55xMroactfceMo7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sm6g1PbQ5DljY0bPMjPN4oRI4K9n8ug8qjP7niI0PDrMY14AxPuQ+PMrAQMRcB4zM
	 R/iUQlC/vsuVE5dordmcnX9I0nVjYH/keNe6rCSULQk4YeajFN4nO9dTzTxMsLowSf
	 rqdIGDxW8NE1QE3lo6Vc9+vs1lrrexUvejFBoW8Th5/0vB9FaRW8HoD+S+v+/pDkmk
	 fSSMhi9fUQQGia/b5H4/eilUTNTQ/pqfhoxOz/ryw9wf2kk63e/X2MKGq1BrPjd3Qz
	 vNCghBXfbreaQqmn2y4c9G5V1lAhBaJ6oM3kt9Ve29dnoYe421P1j/6lwzeX3x8ofg
	 RdYliR7L4TinA==
Date: Fri, 23 Jan 2026 11:28:07 +0000
From: Mark Brown <broonie@kernel.org>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [next-20260122] Build failure on IBM Power Server
Message-ID: <13c1bea8-c2e9-4b07-a05a-3553bab0b9de@sirena.org.uk>
References: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0YcFpOWC0Adhz3o"
Content-Disposition: inline
In-Reply-To: <43ea0202-891d-4582-980b-5cb557b41114@linux.ibm.com>
X-Cookie: HAIR TONICS, please!!


--l0YcFpOWC0Adhz3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 23, 2026 at 09:45:52AM +0530, Venkat Rao Bagalkote wrote:

> # first bad commit: [a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d] Add
> linux-next specific files for 20260122

This bisection is obviously broken, adding the -next files is clearly
going to have no impact on the build.

--l0YcFpOWC0Adhz3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlzW0YACgkQJNaLcl1U
h9AjKAf8CewPI+S5yQZbxZOrhFrkXWBUf45g8vevgCd7lgXOcyYxDbYhctWVPAw/
Rpb972elYzxpbzXiKUoaYAJNyPcLtUb19QK8i0sbyQt9oe16gT7Op1WANCdw+CD8
6XMj0mBIYVPmpmAadvfo8M41YbKznCEgwLJ779v/EVjVdr37YSpRosH9AMEApjAl
vYRaJlSU0B2xegpA6BW5ihdwchhXFiPYtzNvhckvF6TERiRRsqwrjYUc7aTMJrf5
yAItqr8ZI7amnvNS6NAsaSUJTXCy0cEpFK2S6rIHVw10vTKegkvJLUTAbkGRbIVb
X7IrjLusr/plFNngKls7zaRgS2LXTg==
=HRFD
-----END PGP SIGNATURE-----

--l0YcFpOWC0Adhz3o--
