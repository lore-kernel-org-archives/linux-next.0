Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FB23FAE04;
	Fri, 29 May 2026 14:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066641; cv=none; b=qb6sXG0EUriVpwX4cEnGyTIRvWcsQzEmOCKAAQmzyA5dQ4TO4KhToO/nTwJU0qj7qnevGfUL2zXy5lT4LvWqogvvocYJivnz9c6e5S62Ii6pZRWORi6oSCvnMLVD85NJj2ma9HjNZDYGgkVk5n2ObE3RLCTVcmoc5R6Mz1JA8tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066641; c=relaxed/simple;
	bh=B/hqknTKojX33lS4ob0sH5pWBmjZw7ts4cVDl0vNzD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KgPaQA9FHnYvrW6pi2X7+gc/xtAwk3D/WEyMxZTapHmEQzVJvu6kxmI24dpEuw/eHIsBE7f9JHjq4b4onyM+S2E8tO5Y5h1YTy8yfxvDwX4/9kHUEDpXdQteaoGyE2KtWrRfPXKxYUuztch7XSHAPCLiP2Nbow+13xqSXibBZ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEjDsjt5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEjDsjt5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F07761F0089C;
	Fri, 29 May 2026 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780066640;
	bh=zM5St8lsn+fNW9Dga0CEhrHfyVxNI3MsXPXpCnhr+EQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YEjDsjt5l262NTmV+dnUiYXjY5mCKRfVbN6dqjdXxDVfGm8gbbuFmCJLPLODMgIiG
	 P+IpqltUEsKsacR+rP6qfKfN6l0iNF/sbBfZ0HzvRIhuFMKVaBr2HqLl2qSMay+N9B
	 DolAd4Q8XIiCb/gzugLokM0HTeDtw2SfzLVgrAI3geyWuXc+Lwokrl9xcqpm5Y5jFG
	 HW9Z7F7qXsC6ajt17iILLsPPlA1+9b4bd5ydqwMxw+NNHCfHTbwKqPV4x+wgVjn3Qb
	 NYvZ2cjMULixTIZ7kKZr1+jfMXv1Ipq2UrXUYYMyULXKZRxoxc1Vl07W4QcSZAtn/E
	 wOZKUAAaPlQ6g==
Date: Fri, 29 May 2026 15:57:16 +0100
From: Mark Brown <broonie@kernel.org>
To: Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: linux-next: build failure after merge of the thermal tree
Message-ID: <f61fd8ff-eea2-429b-87ae-68cb53a2eae3@sirena.org.uk>
References: <ahbqBvZF_zZGJyrF@sirena.org.uk>
 <91ccd18f-e941-490f-8e71-62cc50baf1b7@aliel.fr>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uKH7C11gbO3j2ivs"
Content-Disposition: inline
In-Reply-To: <91ccd18f-e941-490f-8e71-62cc50baf1b7@aliel.fr>
X-Cookie: Equal bytes for women.


--uKH7C11gbO3j2ivs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 09:50:24PM +0200, Ronald Claveau wrote:
> On 5/27/26 2:56 PM, Mark Brown wrote:

> > /tmp/next/build/drivers/thermal/amlogic_thermal.c:196:(.text+0x2f4): undefined reference to `meson_sm_get'

> Sorry for the noise on this one.
> I can reproduce it on this commit, it seems it would need to add a
> `#ifdef CONFIG_MESON_SM` and a else stub for those references.

> What is the path to solve this issue ?

That sounds like a perfectly reasonable fix, or a dependency.  I'd send
a patch fixing the issue given that the code is still in the tree,
usually it's either an incremental fix or the original commit will be
dropped and a whole new version sent.

--uKH7C11gbO3j2ivs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZqUsACgkQJNaLcl1U
h9B0GAf+OISFnVgyVcI72UKzyYlag4IJqbv39q9fDKMnHlTA739PzPu68bR4ulaE
BD7C22KiNZ/nvyhFzllFewX/GcNNos0Y8cWpZUm8y1KYF2bR6NLSz+qqGS5mNS7/
0Sph3JDc6rnXf7mz2zq0o5w4Z6sqm5bGUwTFMFm12SQrbj/qAaY0Ite5IGZkpA2k
K4VlbbVVlZ+SesgSJ3qL81IwzEUB8U1ilWhvZRm97pJBfM6u7Lp+bCcS1v4Mm9T7
8mX7RGOmps7lfoEpAF/gpR0FdyIHndkUivafBgYDYigVFMQ0XBvKugj5fZeezmKI
9RZOgaGpVLhM7kzdJSufmKIaNDe/Sw==
=oASH
-----END PGP SIGNATURE-----

--uKH7C11gbO3j2ivs--
