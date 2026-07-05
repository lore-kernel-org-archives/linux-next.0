Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0560336CDE0;
	Sun,  5 Jul 2026 12:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783254446; cv=none; b=JtKa9as18nOLay8foyAag3tYzZJaJpcib0D6SQBJzRC7hOC/BR28kGev+FjqMrd8eK9upvSFBSUYAmrUliQhNtBWbTD6jLfy0MRoToAPq+TnBQCWmBqyGKebcU39FYt+BvE9ezqFF6Vo68Rzh0UzxwG9lwhxzEvmj+BNTQNVv3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783254446; c=relaxed/simple;
	bh=fw4OaNVkd2WevLM6hNIVPH0qOv6Syigyn1TJoPTJ+4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXlmjq6gYdnhz+TEb4RN5xtXRzOggKa/upal5ePvk3OuSXKcO8mGqSEKnxN+XASm1R5auz8G2crGt45kc6Ep7G6TlGFGK4l1xGEh6XX64TGavMPWx7HgWRlYuLWmrgVpZskk3PYTpU82LUz2wvVceWMdM4xou2olsJsKSfWCm4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GXlJ6xg7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GXlJ6xg7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813571F000E9;
	Sun,  5 Jul 2026 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783254445;
	bh=2CCBwlIeyXu6Us9gfrKmliqzkl3Rc8bvrQU+hPGo+q0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GXlJ6xg7HkBvq8fHtKiz9Qkq2Mwgdn1VACHNm+BXke8RfyyLTXcZN+vSwJv/E/mz+
	 fjf5VDT2TpcVJrK4b8u3H4fhGG6ist744/2p45JuuVoZ0ZHtg+5vvo0yQ+hPm/AWRS
	 tWlz+db5AW3vVVIvKEwLNImIWbsW83aHOIi2SyNB00+MbsW28KIouUBKEtiRKpGfMz
	 vnbkLE4U08k8X3RTRQJM7gfEnVfFyhL0koLqUK8NH/Wz+4/9+Bu9O0fhpz3GGp3ZSX
	 XbD9rAZfvmTEjPLDAb0DUR20p5U2gSs9JKf8a4KgGG7S6dQo8sCgC6DBzLV113ZOut
	 KyfwJQkEBkjlg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 402611AC5AC6; Sun, 05 Jul 2026 13:27:23 +0100 (BST)
Date: Sun, 5 Jul 2026 13:27:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: KUnit failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <akpNqwC2M1MMzR8P@sirena.co.uk>
References: <akfKl6lJlGL6fPG3@sirena.org.uk>
 <992f91e5-a6cc-4b16-8026-74c9d32bc08d@sirena.org.uk>
 <afc8f908-4add-4da8-816c-9a6c06619b18@p183>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HGMp4POG/5ejSZXP"
Content-Disposition: inline
In-Reply-To: <afc8f908-4add-4da8-816c-9a6c06619b18@p183>
X-Cookie: Absence makes the heart grow frantic.


--HGMp4POG/5ejSZXP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jul 04, 2026 at 07:55:40AM +0300, Alexey Dobriyan wrote:
> On Fri, Jul 03, 2026 at 05:39:59PM +0100, Mark Brown wrote:

> > > [14:22:11] [FAILED] cmdline_test_memparse
> > > [14:22:11]     # module: cmdline_kunit

> > bisect tells me it's due to:

> >   e595545005616 (Revert "lib: fix _parse_integer_limit() to handle overflow")

> No, it is due to

> 	commit 9a4580db6e9f83428813f671a79486469684069f
> 	lib: fix memparse() to handle overflow

> memparse should be rewritten with _parse_integer().

Huh, that was my first guess when I looked at the log but I didn't spot
the relevance so wanted to check then it seems the bisect got confused
somehow.

--HGMp4POG/5ejSZXP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpKTaoACgkQJNaLcl1U
h9CboAf/V+Kc2Oa33jWLT7wWK4FCSd5X0ktqnDypXtdTMllsyE3gijuipsZnrXbU
8q4HtXOY3wyx2IuUJhx5ZLmkMtWAOeru2z27Nk2dXQW+pbwkdf54Y7SIRIlOjtXk
zAOYFTdjrQBpC2z0FjqjNDwi3dJXMv9zpagI94e0jby3YwyYtEd3Z307odWabWJo
2W39E4Q6ySRUs30a5Esp31O3uetUrpqvdQYCQzcS3Cr9SlgTAT/hg345lmqyMKiL
/KpEWlnP4FDUMVPFXHgzWhNqn/1tFja7fA/HrCOWZgSlOJiH8pGAHUvxouLRxXyF
ro6551O6aPDi82KIn+Kl3fDea7NDMw==
=WaIl
-----END PGP SIGNATURE-----

--HGMp4POG/5ejSZXP--
