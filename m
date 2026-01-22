Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AC421F03;
	Thu, 22 Jan 2026 11:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080677; cv=none; b=oDzyWL14LGnit1Haxo6YQ9WoC6Y1zOVoOqHz20xrXsT8tOpT2MAgz2oRFLSruogG7TqeDrBVft5xqiqJ5YJKOZ3vFGmuOooCMVAMBuw4RuNpuJlV+cg5+oWZffuRoNDEhcrQ/vEN9RSlhTCQHnFRS3V9oKPx0LT77fgweWZCliU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080677; c=relaxed/simple;
	bh=qA4asE9uferyamMjSE74+jYi6U42Mvn7Dqk4HjNLsCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MIb+57Ewxa3AZG6b9stc3ddQaml3ZzszcSXmvgDDcKb2659sl+O+k3gp98waITtDhQgfaRAVvl5jmVAKvNTkbGXRskyHk0LjlmVt7i5vR2uha+0o5wx8TY6vSZjarfm/iR2crVRrUxVqN9iel93zztgd5CzW3pO7PK6PNpggpoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIAFmhWi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIAFmhWi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA3BC116C6;
	Thu, 22 Jan 2026 11:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769080677;
	bh=qA4asE9uferyamMjSE74+jYi6U42Mvn7Dqk4HjNLsCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oIAFmhWiQAex+/a4SBe+GTy9rDfTzKasKcJ7mfkwYrw3GtmTAFcDgcxeGJ7vMmpDY
	 AFThalX4Xlosh8Sa8oAp9IsKLsM/1aeYVK1xn3IJD+sztyoNFIH/4fEyTdynEDgteM
	 zr6QPYqeoH3Al8JfH8YgiGnV6HBbmR3t3DWPpMSDAYqLlZPGfuD3On5bGEchIX69b4
	 HI6JGHIASwuZhehYpapRA5nYAh2U/hhGNkIt1aAIy/NvRq+B76Vl52PLDxC7cDOVdj
	 DJus0HvOZi+Crg+dOIIvz0AQ0oud3JAVnAwO1VmOZZF14L6DHOMS1cMpuswLFvyVIA
	 M3zhzBDLg2WAg==
Date: Thu, 22 Jan 2026 11:17:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Beata Michalska <beata.michalska@arm.com>,
	Carsten Haitzler <carsten.haitzler@foss.arm.com>,
	Rob Herring <robh@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <7a9be765-82df-42ba-ab7f-8e534822e5dd@sirena.org.uk>
References: <aXEJZ88g0Ng2dIQ4@sirena.org.uk>
 <aXElns7ZpGuZR6ke@google.com>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tpjbJwoQwuyXQlmn"
Content-Disposition: inline
In-Reply-To: <aXElns7ZpGuZR6ke@google.com>
X-Cookie: Don't read everything you believe.


--tpjbJwoQwuyXQlmn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 21, 2026 at 07:14:38PM +0000, Alice Ryhl wrote:

> Note that for this kind of thing you can add `#![allow(warnings)]` to
> the top of a file to silence warnings.

That's not really the sort of thing we apply to -next usually.

--tpjbJwoQwuyXQlmn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlyB18ACgkQJNaLcl1U
h9CueQf8CadlWfj/aTW/frLhncvD5Dh0UlDJt9i4pRu7ukUc5FcKlCnPV+/S7kt3
7mF6BlfmQJYm2HA2M4rSLmJSZ+WdFlEop8QQnrtkEJTolDOOVTGMtUMGCOW8a6sW
RBN30iKuShyTsr3mp1wkaE1eJlqswqWRqB/DQwD3gzGuJ4rZgtX73ifJkCcQ1zSY
0mJJ6L+8f92PkAQuubpgaQDLBaUhzg5hEZy4DjSO3HdULKAvb1js2y6eqcarhFm9
4SmsJP2VOIzEtKV06wabuo49E/W8Fo+hiGpLTj9bnODzrU9MOyXDmGlSvSaD0gTo
ZLnLVmEr99wu0abloGLDXfjsSSBrpw==
=eqIE
-----END PGP SIGNATURE-----

--tpjbJwoQwuyXQlmn--
