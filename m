Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A416B2773E5;
	Fri, 13 Mar 2026 16:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418103; cv=none; b=KeSL1gbwY0VIl8IjSOc7FQ087l6V4nnVIpVoeEEmFESuZr1gX2ie8apNkLiQ/Tm/3GGG+uoe4QmOvQqrZXDgephgz32IgTN0RF2yDC4rd9FnpnuMsmTO8isPWZsVUaaLpATRynossCWWn+OOlZlzsua2kj0Qdy4htucfD0n918A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418103; c=relaxed/simple;
	bh=1jKxvmve8GoFKZnVXc8Ewr8O3iUhBhuXrkLMRb0v9A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMlF9ATMQQcvC5riNMsy/wa29/sIIjARBqiy06TOx2bmvQ7XTrCPM0fNlJOCa2ReUK/jYgfi8/FJPDFK4L3EfFJ7b9oSRyEdQen5qwIul3CbMnPrY5OUkwhRZM93XMN/nXwoFAumUMWTpaaq13ozRK8n4LjP3qjY8a1qZ0YgcDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=td/VabR4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="td/VabR4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15C87C19421;
	Fri, 13 Mar 2026 16:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773418103;
	bh=1jKxvmve8GoFKZnVXc8Ewr8O3iUhBhuXrkLMRb0v9A4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=td/VabR4Dbprr7hgUeK2fADGiD4emwkQszmpRfGPjh+FeX8slUdHDZC1uVseL267l
	 PDTCCz7qV0j+lUm7Vhm4bbn+sB/J08SH242Kq++K2SoidKwAh8cut5/3le8EYKPsQf
	 OH6QS4FP4tl7oxiAplzVgyPXaJaDSLDKFynoHHuigREB4zk4y/WSSe/KjfFJ/ErIdE
	 gZ9ywhqji6jFIeTtx+wsItjn4986fXrezKnShH0pnipmPOqFpFAbEDUzZceA2L6k+G
	 T5pjptnzKgKtKjyizfxYsOyZl72+tDTj99qpnAnn+1RgwcNZFnL2f9+DoviHuoF8/u
	 FLh5r7C0e7gSA==
Date: Fri, 13 Mar 2026 16:08:19 +0000
From: Mark Brown <broonie@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Ran Xiaokai <ran.xiaokai@zte.com.cn>,
	linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Fixes tags could use some work in the mm-unstable tree
Message-ID: <202116fe-2cf1-4399-8324-a028efe27064@sirena.org.uk>
References: <bd8f5814-c5c3-4090-bbc5-9005e2052d9a@sirena.org.uk>
 <abQuBNBoT_AIfUV7@kernel.org>
 <20260313090340.2c5654c8d42dbeae576ed5fa@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jmk/MB88suCpher0"
Content-Disposition: inline
In-Reply-To: <20260313090340.2c5654c8d42dbeae576ed5fa@linux-foundation.org>
X-Cookie: Monitor not included.


--jmk/MB88suCpher0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 13, 2026 at 09:03:40AM -0700, Andrew Morton wrote:
> On Fri, 13 Mar 2026 17:32:20 +0200 Mike Rapoport <rppt@kernel.org> wrote:
> > On Fri, Mar 13, 2026 at 12:11:45PM +0000, Mark Brown wrote:

> > >   - No SHA1 recognised

> > Right, sha's in mm-unstable are, well, unstable :(

> > Maybe Andrew's tooling updates those when the patches move to mm-stable...

> I simply remove the hash, but that gets us emails from Mark.

> I actually track the same info in the filename -
> kho-adopt-radix-tree-for-preserved-memory-tracking-fix.patch fixes
> kho-adopt-radix-tree-for-preserved-memory-tracking.patch, so I guess
> it's best for me to just remove the Fixes: line.

I'm guessing that given that it's a fix for a commit in a rebased branch
it'll get squashed down into the patch it was fixing anyway?

--jmk/MB88suCpher0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm0NnIACgkQJNaLcl1U
h9D6hgf+Jut/ImHppEEdzE8nueGPvKFoygcBNAxYOI64ii4a9tuTsRNHNY747OB3
Ka3A15IFNnLD90vR0DhlPCYUo9gvRKQMZmfYc1x9ERqH7pd4fo965Y0EZdffqe3U
cECt7e+bIDqHu640TjbLH8lbmgrYRCSgktrUIVHg53G64G3MJ1Dz2kObyuS1BysR
JFyXn26CqsHSfHfbLRMm8NfNzoWQcAR18k9nmREjW0KGcyL/RVQuKlXikAzSSoYK
IlZGOzDg/V4ogDLjbWnX1dfjUumE5/uWMxscKVKWMwKBdBZofGmaNGWJZDJvQix1
+IO754wTwWsUnUraaPyEhiiF5H/8oQ==
=USjs
-----END PGP SIGNATURE-----

--jmk/MB88suCpher0--
