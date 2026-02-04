Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356243876D2;
	Wed,  4 Feb 2026 12:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208941; cv=none; b=glaXWzNys2GFSXaST1f4yPg1SPFqrWKnTEcf14045UOdFQwgtWQfKacqmErGgz52MN34uZFz4LP83na22cdaORbR095VbXAtR5miUvUVUZwEufrfpAxMzorT5fpwuy9pbL5lsfTelZ2N6mgpPQnG12URAdNOAcLTzJBO0QTteKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208941; c=relaxed/simple;
	bh=xGa1il5zolt9Mzta9dr+PxlQYmtTEjS97AgSTf6mHh4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KKCc40Br7DSk+fNM4mqTGJ5TPsZXJxqmQlLS6U0okMcF2XMxnqoDqvO0Zej7T0QMSZPzqkhc7WqwS7AaZdFKFNrybkuiwP2uVgJiu9hanIFnFhsWsHg+55WG/URDIAlTaWgXYBreinxx8fcqUpNgVS1J4ARHYlayAeO6nhOrDPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGkk990M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGkk990M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05723C4CEF7;
	Wed,  4 Feb 2026 12:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770208940;
	bh=xGa1il5zolt9Mzta9dr+PxlQYmtTEjS97AgSTf6mHh4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oGkk990M2dyfo3rnCjixRtqJ05W7ujd/1a1dIi1ZMWnyMTKjpGDgGsPdn8qGL4A2s
	 qKAIk0uVrSegRUIBppGtWs+bQvK/tc+rq0eIc3dLbV5/6olXWz3/Ai3og/27keq1cF
	 h3U86iHc6cEgqqbSmZ/N2LjT+q4oaX8s4/H7rBs40caXLNyApGwDhmBndmyW2+HiLW
	 OS3zIjXKVlSEiAxCxolnLlmCGWnkLrskJkkIqmyNqUCisqE3HDS9KBuft680R29kNH
	 DjjsXmRLU2RWOZaTph59mGa/2PH9VcQUtiqrv28diE4dWBU1Mzrctie0qU8Wky9MsM
	 AXF7rLOJ2Lz5g==
Date: Wed, 4 Feb 2026 12:42:16 +0000
From: Mark Brown <broonie@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aksh Garg <a-garg7@ti.com>, Koichiro Den <den@valinux.co.jp>
Subject: Re: Fixes tags could use some work in the pci tree
Message-ID: <f2485555-d59d-4931-90df-890e0b7cf558@sirena.org.uk>
References: <484d687e-4ce1-442e-b8c1-9299631a7fe1@sirena.org.uk>
 <20260203231352.GA195886@bhelgaas>
 <3232b98d-a091-49be-ab81-28bfb41b148e@sirena.org.uk>
 <imn5t7cmr7wxunaowyknhe3kavvja3uqmjwnr2q2jt4wviyklm@qb75ya7o2tgf>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JWZJOfSK9Rw5GSLP"
Content-Disposition: inline
In-Reply-To: <imn5t7cmr7wxunaowyknhe3kavvja3uqmjwnr2q2jt4wviyklm@qb75ya7o2tgf>
X-Cookie: Are you having fun yet?


--JWZJOfSK9Rw5GSLP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 04, 2026 at 05:54:04PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Feb 04, 2026 at 11:58:05AM +0000, Mark Brown wrote:
> > On Tue, Feb 03, 2026 at 05:13:52PM -0600, Bjorn Helgaas wrote:
> > > [+cc Mani (should be cc'd for all PCI emails like this), Aksh, Koichiro]

> > I've added him as a contact for pci and pci-current, note that -next has
> > a separately maintained list of contacts for each tree so if something
> > changes with who should be emailed please let me know.

> Mark, I'd like to get added to the -next contact list.

Like I say I already added you - the thing about letting me know was for
future updates.

--JWZJOfSK9Rw5GSLP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmDPqcACgkQJNaLcl1U
h9C4gwf/UtlTlEvJCIG9lrzHCtxRxi68PbWhoxfMmGycgyQElGfrreie3oCZ4kL4
ZsqadftLNvs7fUgTcFM5Mb3FAzqfMJcp/dC7He5VtaTgts6+DtLT3FLRtH2ahf9o
408zYGiGXbTPjuxWEMobtoPX/T3smriufXR7vbw4z6/5K7yu75MfCxwoNXd7D0mC
q2cxtA3hQ5haKxuZg5SX+PzeeouAeY71AE6LvbKS6GI02NHUHj/wLsywRGLlnVit
hFll9xDMCaWkAY27Y44oBSoPhK965T9uu71poUkIroa9o322fDHFLrYijnNJsXr1
aweRt5klMlyw3UuCuqIAlYX4aX5gUQ==
=pu2L
-----END PGP SIGNATURE-----

--JWZJOfSK9Rw5GSLP--
