Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4DF23C4F3;
	Mon, 18 May 2026 13:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779112194; cv=none; b=gwHxO3qnxiedlOQKBlTHhKZHnYUCpQwm0Hv4/iddi4uIL3L2835vuLTvEloAu/TFvJTN1GN73Be9epEHWtrmy+ZPR8LvygzdSmMsTml0vql//ofXH49UhlQyioLQRSWz2DgwKOZmtF5O6hTU/Zop/5vISixFk77jBACiccZ4XWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779112194; c=relaxed/simple;
	bh=X6GLqLrY021dWhefDafrHaSpklU44Ax+GgvJKLoLftI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY0FvMVhEyUr1M10meuryO28YtaAg210dtUsoFXmuAij7htO0339ZV1JRcIQIo41aEkmL5W0cueeBfEdwtIW7CH7qKdfyQPvX96uFPgQ3O8W4g6osRn/nyrQ8jk4gaqofmxZvpWhhcB54E/QcnoQTIeNFkcVs36B26Icx2tZXGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juiFI72t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juiFI72t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15DF8C2BCB7;
	Mon, 18 May 2026 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779112194;
	bh=X6GLqLrY021dWhefDafrHaSpklU44Ax+GgvJKLoLftI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juiFI72tFUwKain2MA/cec8ULUvdu4hu4iiMEsfXS9tzZXb5QYbaZNM/53/2p+73v
	 WocRCUKSiH1eNh9u/aIhsJONhF6cKZ69AhdTx91S9SCdjhpsXMecpfK9NaOjJdf4x6
	 /NMa/oRSZJMwDEdPUCMEL+PWCvnUzud/Zq9rsqz7Lh8VGXoDhqR2yrOPbpLohytw6L
	 EZlQJhKcs0CEjzwAIiEqL9tiDE/FYUJohayINQLz9i3kSsh1V0+zUo4fmxYiWA0n9S
	 3Gva9MKdPBAGOB4CkRxYRrSFOlByfetG/Uuv8u1/wS6sf88JhIuZy3Y6IPlYCjGH/J
	 3c7LEdwtHErAg==
Date: Mon, 18 May 2026 14:49:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ankur Arora <ankur.a.arora@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: test failure after merge of the mm-nonmm-unstable
 tree
Message-ID: <fabba1ab-ceff-429c-af55-92844b179890@sirena.org.uk>
References: <agr_RxvNtfASfevg@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eew2VM0xP8Pfc8kD"
Content-Disposition: inline
In-Reply-To: <agr_RxvNtfASfevg@sirena.org.uk>
X-Cookie: Brain fried -- Core dumped


--eew2VM0xP8Pfc8kD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 18, 2026 at 01:00:07PM +0100, Mark Brown wrote:

> After merging the mm-nonmm-unstable tree, today's linux-next testing
> (arm64 kunit) failed like this:

> [11:39:24] Failures: smp-cond-load-relaxed-timeout.smp_cond_relaxed_timeout_succeeds

> Note that we are running on an arm64 host with access to KVM so the
> above should be running with KVM rather than being emulated.

> Caused by commit

>    0403c34571d1d (kunit: add tests for smp_cond_load_relaxed_timeout())

> in that it's adding the new test which fails, I didn't investigate the
> quality of the test.  I do note that there's some related functional
> work also from Ankur that's also added by the mm-nonmm-unstable tree but
> didn't investigate that either.

> I have used the version from next-20260506 instead, the code was in
> next-20260508 but I belive Thierry was emulating.

Actually these patches were introduced in next-20260427 so I'll need to
go back to next-20260424 instead, sorry (got confused by the tree
rebasing).  It looks like something in the more recent versions made the
issue more promienent.

--eew2VM0xP8Pfc8kD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoLGP0ACgkQJNaLcl1U
h9Bczwf+Nlb0jzm1GDe5GqUUVltRt8c8Rzetu2heLScR4Q7ZGmB3FX3r2WR7AbAx
+FHf6pHn9R3YqdguUb0Bj0D+4o9yXn/Q5hACp8SHnAmUGu7t5uDXeeYkrjPho0B/
/Igh3NNrj+jdfSJ5V8oOlu02T8GAM8HeFBx8XUhSuX/k5UDj/pmequb40LcthrOT
I5x28HlK1Nwgn4AkCJUFkpetJ/RQlyNkmAgYNt9Pucsc2Ue1nsdWtn4wLWg+iZhY
TwcA0NXaXrRRdA+WSl0fa41yJFJ65jKOKa2uyD+U7yR/dRDifzOayk8uGU6JGT7A
J0i7D/ioHwGQhxiIo20fbxxsuxGbpg==
=ek1X
-----END PGP SIGNATURE-----

--eew2VM0xP8Pfc8kD--
